/***************************************************************/
/*  NAME: Taylor Waddell                                       */
/*  ORGN: Me                                                   */
/*  FILE: dThrust.h                                            */
/*  DATE: Dec 2014                                             */
/***************************************************************/

#ifndef dThrust_H
#define dThrust_H

#include <string>
#include <netdb.h>
#include "MOOS/libMOOS/Thirdparty/AppCasting/AppCastingMOOSApp.h"
#include "MOOS/libMOOSGeodesy/MOOSGeodesy.h"
#include <stdio.h>
#include <string.h>


#define MAX_RUDDER      50.0
#define MAX_THRUST     100.0
#define MAX_IN_BYTES  1000
#define MAX_BUFF     10000

class dfThrust : public AppCastingMOOSApp {

public:
        dfThrust();
        ~dfThrust() {};
  bool  OnNewMail(MOOSMSG_LIST &NewMail);
  bool  Iterate();
  bool  OnDisconnectFromServer();
  bool  OnConnectToServer();
  bool  OnStartUp();
  bool  buildReport();
int fd;

protected:
  void  RegisterForMOOSMessages();
  bool  ThrustRudderToLR();

  // Handle Config Params
  bool    SetParam_HEADING_OFFSET(std::string sVal);      // m_heading_offset
  bool    SetParam_PUBLISH_RAW(std::string sVal);         // m_bPubRawFromFront
  bool    SetParam_MAX_RUDDER(std::string sVal);          // m_dMaxRudder
  bool    SetParam_MAX_THRUST(std::string sVal);          // m_dMaxThrust
  bool    SetParam_DIRECT_THRUST_MODE(std::string sVal);  // m_bDirect_thrust
  bool    SetParam_PUBLISH_THRUST(std::string sVal);      // m_bPublish_thrust
  void  PublishHeading(double dHeading);
  bool    handleSetThrustMode(bool setDirectThrustMode);




  bool  StaleModeCheck();
//  bool  staleModeCheck();

  double            m_dMaxRudder;       // MAX_RUDDER         Maximum rudder angle that will be attempted
  double            m_dMaxThrust;       // MAX_THRUST         Maximum thrust allowed
  bool              m_bDirect_thrust;   // DIRECT_THRUST_MODE When true, pass L and R thrust direct to motors
  bool              m_bPubRawFromFront; // PUBLISH_RAW        When true, publish all raw messages from front seat
  bool              m_bPublish_Thrust;  // PUBLISH_THRUST     When true, publishes M200_THRUST_L and _R
  double            m_heading_offset;   // HEADING_OFFSET     Offset heading by this amount before publishing it
  std::string       m_pubNameHeading;






  
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



  // Stores number of messages processed, keyed on NMEA sentence name
  std::map<std::string, unsigned int>   m_counters;
};

#endif
