/***************************************************************/
/*  NAME: Alon Yaari                                           */
/*  ORGN: Dept of Mechanical Eng / CSAIL, MIT Cambridge MA     */
/*  FILE: M200.h                                               */
/*  DATE: Dec 2014                                             */
/***************************************************************/

#ifndef I_M200_H
#define I_M200_H

#include <sys/socket.h>
#include <string>
#include <netdb.h>
#include "MOOS/libMOOS/Thirdparty/AppCasting/AppCastingMOOSApp.h"
#include "MOOS/libMOOSGeodesy/MOOSGeodesy.h"
#include "CPNVGnmea.h"
//#include "CPRCMnmea.h"
#include "CPRBSnmea.h"

// Include and enum to support GPS parsing
#include "gpsParser.h"
enum HeadingSource { HEADING_SOURCE_NONE,
                     HEADING_SOURCE_GPRMC,
                     HEADING_SOURCE_COMPASS,
                     HEADING_SOURCE_PASHR };


#define MAX_RUDDER      50.0
#define MAX_THRUST     100.0
#define MAX_IN_BYTES  1000
#define MAX_BUFF     10000

class iM200 : public AppCastingMOOSApp {

public:
        iM200();
        ~iM200() {};
  bool  OnNewMail(MOOSMSG_LIST &NewMail);
  bool  Iterate();
  bool  OnConnectToServer();
  bool  OnStartUp();
  bool  buildReport();

protected:
  void  RegisterForMOOSMessages();
  bool  ThrustRudderToLR();
  bool  ParserSetup();

  // Handle Config Params
  bool    SetParam_IP_ADDRESS(std::string sVal);          // m_IP
  bool    SetParam_PORT_NUMBER(std::string sVal);         // m_Port
  bool    SetParam_HEADING_OFFSET(std::string sVal);      // m_heading_offset
  bool    SetParam_PUBLISH_RAW(std::string sVal);         // m_bPubRawFromFront
  bool    SetParam_MAX_RUDDER(std::string sVal);          // m_dMaxRudder
  bool    SetParam_MAX_THRUST(std::string sVal);          // m_dMaxThrust
  bool    SetParam_PREFIX(std::string sVal);              // m_prefix
  bool    SetParam_DIRECT_THRUST_MODE(std::string sVal);  // m_bDirect_thrust
  bool    SetParam_PUBLISH_THRUST(std::string sVal);      // m_bPublish_thrust

  bool    handleSetThrustMode(bool setDirectThrustMode);
  bool    SetPublishNames();
  bool    GeodesySetup();

  // Handle Sockets I/O
  bool  OpenConnectionTCP(std::string addr, std::string port);
  bool  OpenSocket();
  bool  Connect();
  bool  Send();
  bool  Receive();

  // NMEA Processing
  bool  DealWithNMEA(std::string nmea);
  bool  ParseCPNVG(std::string nmea);
  bool  ParseCPRCM(std::string nmea);
  bool  ParseGPRMC(std::string nmea);
  bool  ParseCPRBS(std::string nmea);
  bool  NMEAChecksumIsValid(std::string nmea);
  bool  ParseUnknownNMEA(std::string nmea);

  bool  StaleModeCheck();
  void  HandleOneMessage(gpsValueToPublish gVal);
  void  PublishMessage(gpsValueToPublish gVal);
  void  PublishHeading(double dHeading);
//  bool  staleModeCheck();

  // MOOS file parameters
  std::string       m_prefix;           // PREFIX             Prefix to prepend to _X, _Y, _HEADING, and _SPEED
  double            m_dMaxRudder;       // MAX_RUDDER         Maximum rudder angle that will be attempted
  double            m_dMaxThrust;       // MAX_THRUST         Maximum thrust allowed
  bool              m_bDirect_thrust;   // DIRECT_THRUST_MODE When true, pass L and R thrust direct to motors
  bool              m_bPubRawFromFront; // PUBLISH_RAW        When true, publish all raw messages from front seat
  bool              m_bPublish_Thrust;  // PUBLISH_THRUST     When true, publishes M200_THRUST_L and _R
  double            m_heading_offset;   // HEADING_OFFSET     Offset heading by this amount before publishing it
  std::string       m_IP;               // IP_ADDRESS         Address of front seat
  std::string       m_Port;             // PORT_NUMBER        IP port number of front seat
  int               m_PortNum;

  // Publish names
  std::string       m_pubNameX;
  std::string       m_pubNameY;
  std::string       m_pubNameLat;
  std::string       m_pubNameLon;
  std::string       m_pubNameHeading;
  std::string       m_pubNameSpeed;

  // IP connection details
  struct addrinfo   m_host_info;        // struct getaddrinfo() fills up with data
  struct addrinfo*  m_host_IL;          // Pointer to the linked list of host_info
  bool              m_bValidIPConn;     // True when valid IP connection
  int               m_socketfd;         // The socket descriptor
  std::string       m_strInBuff;        // buffer for incoming data

  // GPS parsing details
  gpsParser*        m_parser;           // Parser object
  CMOOSGeodesy      m_geodesy;          // MOOS Geodesy object
  bool              m_pub_utc;          // When true, publish UTC time
  bool              m_pub_hpe;          // When true, publish horiz position of error
  bool              m_pub_hdop;         // When true, publish HDOP
  bool              m_pub_yaw;          // When true, publish yaw
  bool              m_pub_raw;          // When true, publish raw GPS sentences
  bool              m_pub_pitch_roll;   // When true, publish pitch and roll
  bool              m_swap_pitch_roll;  // When true, swap pitch and roll values
  std::string       m_trigger_key;      // Publish values when triggered by this NMEA message
  unsigned short    m_gps_heading_source;   // Publish heading from this source

  // Clearpath details not related to GPS
  double            m_batt_voltage;     // Last voltage reading published by front seat
  
  // Appcast details
  std::string       m_why_not_valid;    // Explanation of why app isn't doing anything
  unsigned int      m_msgs_to_front;    // Number of messages sent to front seat
  unsigned int      m_msgs_from_front;  // Number of messages rcvd from front seat
  bool              m_rpt_unhandled_gps; // When true, appcast unhandled nmea sentences
  std::string       m_sLastMsgToFront;  // String holding last message posted to front seat

  // Stale mode
  bool          m_bOKtoReportStale;
  double        m_stale_threshold;
  unsigned int  m_stale_detections;
  bool          m_stale_mode;
  double        m_timestamp_des_L;
  double        m_timestamp_des_R;
  double        m_timestamp_des_rudder;
  double        m_timestamp_des_thrust;

  // Motor related
  double        m_commanded_L;
  double        m_commanded_R;
  double        m_des_thrust;
  double        m_des_rudder;
  double        m_des_L;
  double        m_des_R;
  int           m_des_count_L;
  int           m_des_count_R;
  int           m_des_count_thrust;
  int           m_des_count_rudder;
  bool          m_ivpAllstop;

  struct hostent* server;
  struct sockaddr_in serv_addr;

  // Stores number of messages processed, keyed on NMEA sentence name
  std::map<std::string, unsigned int>   m_counters;
};

#endif
