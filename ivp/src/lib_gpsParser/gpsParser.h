/*
 * gpsParser.h
 *
 *  Created on: Oct 28, 2014
 *      Author: Alon Yaari
 */

#ifndef GPSPARSER_H_
#define GPSPARSER_H_

#include <map>
#include <deque>
#include "MOOS/libMOOS/MOOSLib.h"
#include "MOOS/libMOOSGeodesy/MOOSGeodesy.h"

#define KNOTS2METERSperSEC 0.51444444

enum VALUE_STATUS { STATUS_INVALID,  // record does not have valid data stored in it
                    STATUS_VALID,    // valid record but not triggered yet
                    STATUS_READY,    // valid record ready to be published
                    STATUS_SENT };   // valid record already published

class gpsValueToPublish {
public:

    // Invalid data when created with this constructor because values are set to blank/null
    gpsValueToPublish()
        {
            m_status   = STATUS_INVALID;
            m_key      = "";
            m_isDouble = false;
            m_dVal     = 0.0;
            m_sVal     = "";
        };

    // Valid data when created with this constructor because values are passed into the declaration
    gpsValueToPublish(bool isD, double d, std::string str, std::string key)
        {
            m_status   = STATUS_VALID;
            m_key      = key;
            m_isDouble = isD;
            m_dVal     = d;
            m_sVal     = str;
        };
    ~gpsValueToPublish() {};
    friend bool operator==(const gpsValueToPublish g1, const gpsValueToPublish g2)
        {
          // NOTE: Compares everything except for m_status
          bool b = (g1.m_key == g2.m_key);
          b &= (g1.m_isDouble == g2.m_isDouble);
          if (g1.m_isDouble)
            b &= (g1.m_dVal == g2.m_dVal);
          else
            b &= (g1.m_sVal == g2.m_sVal);
          return b;
        };
    friend bool operator!=(const gpsValueToPublish g1, const gpsValueToPublish g2)
        {
          return !(g1 == g2);
        };
    unsigned int     m_status;
    std::string      m_key;
    bool             m_isDouble;
    double           m_dVal;
    std::string      m_sVal;
};



/*
Key          type Pub by       Pub When                 Description

LATITUDE       dbl GPGGA, GPRMC Always                   Latitude in decimal degrees
LONGITUDE      dbl GPGGA, GPRMC Always                   Longitude in decimal degrees
X              dbl GPGGA, GPRMC Always                   Longitude translated to meters on the x-axis of the local grid
Y              dbl GPGGA, GPRMC Always                   Latitude translated to meters on the y-axis of the local grid
UTC            dbl GPGGA, GPRMC (m_pub_utc)              UTC time in seconds (including fractional if available) since GPS epoch
QUALITY        str GPGGA        On value change          "0" = no fix, "1" non-differential fix, "2" differential fix, "6" = estimated fix
SAT            dbl GPGGA        On value change          Number of satellites used to determine fix
HDOP           dbl GPGGA        (m_pub_hdop)             Horizontal dilution of precision in meters, 0.5 to 99.9
HPE            dbl GPRME        (m_pub_hpe)              Horizontal position error estimate, 0.0 to 999.99 meters
YAW            dbl GPHDT        (m_pub_yaw)              Degrees clockwise from true north that vehicle bow is pointing toward
SPEED          dbl GPRMC        Always                   Speed over ground in meters per second
MAGVAR         dbl GPRMC        On value change          Degrees from true north (+ is clockwise) of magnetic variation from true north
NMEA_TEXT      str GPTXT        On value change          Passthrough of any text message output by GPS in GPSTXT sentence
ROLL           dbl PASHR        (m_pub_pitch_roll)       Angle of roll, -90.0 to 90.0, 0.0 = level
PITCH          dbl PASHR        (m_pub_pitch_roll)       Angle of pitch, -90.0 to 90.0, 0.0 = level
HEADING_GPRMC  dbl GPRMC        m_heading_source == HEADING_SOURCE_GPRMC Deg. cw from true N in direction of travel, per GPRMC
HEADING_PASHR  dbl PASHR        m_heading_source == HEADING_SOURCE_PASHR Deg. cw from true N in direction of travel, per PASHR

#UNHANDLED     dbl Bad keys     (m_bReportUnhandledNMEA) Number of sentences that could not be parsed due to unfamiliar nmea key
#BAD_SENTENCES dbl All          Always                   Number of sentences with familiar nmea key but failed parsing for some reason
#GPGGA         dbl GPGGA        Number of GPGGA messages successfully parsed to date
#GPHDT         dbl GPHDT        Number of GPHDT messages successfully parsed to date
#GPRMC         dbl GPRMC        Number of GPRMC messages successfully parsed to date
#GPRME         dbl GPRME        Number of GPRME messages successfully parsed to date
#GPTXT         dbl GPTXT        Number of GPRME messages successfully parsed to date
#PASHR         dbl PASHR        Number of PASHR messages successfully parsed to date

*/


class gpsParser {

public:
                      gpsParser(CMOOSGeodesy* geo, std::string triggerKey, bool reportUnhandledNMEA);
                      ~gpsParser() {}
    bool              NMEASentenceIngest(std::string nmea);

    void              SetSwapPitchAndRoll(bool bShouldSwap);
    void              SetHeadingOffset(double offset) { m_headingOffset = offset; }
    void              SetPublish_raw(bool b)          { m_pub_raw = b; }
    void              SetPublish_hdop(bool b)         { m_pub_hdop = b; }
    void              SetPublish_yaw(bool b)          { m_pub_yaw = b; }
    void              SetPublish_utc(bool b)          { m_pub_utc = b; }
    void              SetPublish_hpe(bool b)          { m_pub_hpe = b; }
    void              SetPublish_pitch_roll(bool b)   { m_pub_pitch_roll = b; }

    std::string       GetNextErrorString();
    void              ClearErrorStrings()             { m_errorStrings.clear(); }
    std::vector<gpsValueToPublish> GetDataToPublish();
    unsigned int      MessagesAvailable()             { return m_readyCount; }
    unsigned int      TotalNumBadSentences()          { return m_totalBadSentences; }
    unsigned int      TotalUnhandledSentences()       { return m_totalUnhandled; }
    unsigned int      ErrorsAvailable()               { return (unsigned int) m_errorStrings.size(); }


private:

    void    CheckIfTriggered(std::string nmeaKey);
    bool    AddToPublishQueue(double dVal,      std::string sMsgName);
    bool    AddToPublishQueue(std::string sVal, std::string sMsgName);
    bool    AddToPublishQueue(gpsValueToPublish gVal);

    // GPGGA
    //      UTC         double  Universal time in seconds since start of epoch
    //      LATITUDE    double  Latitude in signed decimal degrees
    //      LONGITUDE   double  Longitude in signed decimal degrees
    //      X           double  X in meters on the MOOS geodesy grid
    //      Y           double  Y in meters on the MOOS geodesy grid
    //      QUALITY     char    NMEA GPS quality char,0=No fix, 1=Non-diff, 2=Diff, 6=estimated
    //      SAT         double  Number of satellites used to attain the fix
    //      HDOP        double  Horizontal dilution of precision, used for estimating fix error
    bool    HandleGPGGA(std::string nmea);

    // GPHDT or HEHDT (Hemisphere GPS - specific)
    //      YAW         double  Degrees clockwise from true north that bow points toward
    //                          NOTE: This is NOT heading, which is direction of travel
    bool    HandleGPHDT(std::string nmea);

    // GPRMC
    //      UTC         double  Universal time in seconds since start of epoch
    //      LATITUDE    double  Latitude in signed decimal degrees
    //      LONGITUDE   double  Longitude in signed decimal degrees
    //      X           double  X in meters on the MOOS geodesy grid
    //      Y           double  Y in meters on the MOOS geodesy grid
    //      SPEED       double  Groundspeed reported by the GPS in meters per second
    //      MAGVAR      double  Magnetic variation at current lat/lon in signed decimal degrees
    bool    HandleGPRMC(std::string nmea);

    // GPRME
    //      HPE         double  Estimated horizontal position error in meters
    bool    HandleGPRME(std::string nmea);

    // GPTXT
    //      Not yet implemented
    bool    HandleGPTXT(std::string nmea);

    // PASHR (Hemisphere GPS - specific)
    //      HEADING     double  Degrees clockwise from true north describing direction of travel
    //                          NOTE: This is NOT yaw, which is direction bow points to
    //      PITCH       double  Degrees of pitch in decimal degrees
    //      ROLL        double  Degrees of roll in decimal degrees
    bool    HandlePASHR(std::string nmea);

    bool    SetParam_TYPE(std::string sVal);
    bool    SetParam_SHOW_CEP(std::string sVal);
    bool    SetParam_PREFIX(std::string sVal);
    bool    SetParam_PORT(std::string sVal);
    bool    SetParam_BAUDRATE(std::string sVal);
    bool    SetParam_TRIGGER_MSG(std::string sVal);
    bool    SetParam_PUBLISH_HEADING(std::string sVal);
    bool    SetParam_REPORT_NMEA(std::string sVal);
    bool    SetParam_HEADING_OFFSET(std::string sVal);
    bool    SetParam_SWITCH_PITCH_ROLL(std::string sVal);

    double  DMS2DecDeg(double dfVal);

    // Triggering
    std::string   m_triggerKey;
    unsigned int  m_readyCount;

    bool          m_bReportUnhandledNMEA;
    bool          m_pub_raw;
    bool          m_pub_hdop;
    bool          m_pub_yaw;
    bool          m_pub_utc;
    bool          m_pub_hpe;
    bool          m_pub_pitch_roll;
    std::string   m_last_quality;
    std::string   m_last_nmea_text;
    double        m_last_sat;
    double        m_last_magvar;

    unsigned int  m_totalBadSentences;
    unsigned int  m_totalUnhandled;
    unsigned int  m_totalGPGGA;
    unsigned int  m_totalGPHDT;
    unsigned int  m_totalGPRMC;
    unsigned int  m_totalGPRME;
    unsigned int  m_totalGPTXT;
    unsigned int  m_totalPASHR;

    double        m_headingOffset;
    std::string   m_rollStoreName;
    std::string   m_pitchStoreName;

    CMOOSGeodesy* m_geo;
    std::deque<std::string>                    m_errorStrings;
    std::map<std::string, gpsValueToPublish>   m_publishQ;
};






#endif














//
