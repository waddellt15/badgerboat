/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: GPSd.cpp                                        */
/*    DATE:                                                 */
/************************************************************/
 
#include <iterator>
#include "MBUtils.h"
#include "ACTable.h"
#include "GPSd.h"
#include "MOOS/libMOOSGeodesy/MOOSGeodesy.h"
#include <iostream>
#include "libgpsmm.h"
#include <thread>
#include <ctime>
#include <chrono>
#include <cmath>
 
using namespace std;
using namespace std::chrono;
 
//---------------------------------------------------------
// Constructor
 
GPSd::GPSd() {
    p_gpsd_receiver   = NULL;
    m_gpsd_host       = "localhost";
    m_gpsd_port       = DEFAULT_GPSD_PORT;
    p_gpsdata        = NULL;
    //m_buf.str()       = "";
    m_json_output     = "";
    m_mag_model       = "emm2015";
    m_gps_mode        = 0;
    m_gps_alt         = 0;
    m_gps_lon         = 0;
    m_gps_alt         = 0;
    m_gps_spd         = 0;
    m_gps_trk         = 0;
    m_ny = 0;
    m_nx = 0;
}
 
//---------------------------------------------------------
// Destructor
 
GPSd::~GPSd()
{
    if (p_gpsd_receiver) delete p_gpsd_receiver;
    if (p_gpsdata) delete p_gpsdata;
}
 
//---------------------------------------------------------
// Procedure: OnNewMail
 
bool GPSd::OnNewMail(MOOSMSG_LIST &NewMail)
{
  AppCastingMOOSApp::OnNewMail(NewMail);
 
  MOOSMSG_LIST::iterator p;
  for(p=NewMail.begin(); p!=NewMail.end(); p++) {
    CMOOSMsg &msg = *p;
    string key    = msg.GetKey();
    if(key != "APPCAST_REQ") {// handled by AppCastingMOOSApp
       reportRunWarning("Unhandled Mail: " + key);
     }
   }
 
   return(true);
}
 
//---------------------------------------------------------
// Procedure: OnConnectToServer
 
bool GPSd::OnConnectToServer()
{
   registerVariables();
   return(true);
}
 
 
bool GPSd::Iterate()
{
  AppCastingMOOSApp::Iterate();
  GeodesySetup(); 
#if GPSD_API_MAJOR_VERSION >= 5
 
      gps_data_t *p_gpsdata = p_gpsd_receiver->read();
#else
    gps_data_t *p_gpsdata = p_gpsd_receiver->poll();
#endif
  p_gpsdata = p_gpsd_receiver->read(); 

  //m_buf << p_gpsd_receiver->data();     // grab the data buffer
  //cerr << "**********************************************************" << endl;
  //cerr << "Got buffer: " << endl;
  //cerr << "**********************************************************" << endl;
  //cerr << m_buf.str() << endl;
  //cerr << p_gpsd_receiver->data() << endl;
  //cerr << "**********************************************************" << endl;
  if ((p_gpsdata != NULL) && (p_gpsdata->set))  {
    m_gps_mode                = p_gpsdata->fix.mode;
    m_gps_lat                 = p_gpsdata->fix.latitude;
    m_gps_lon                 = p_gpsdata->fix.longitude;
    m_gps_alt                 = p_gpsdata->fix.altitude;
    m_gps_spd                 = p_gpsdata->fix.speed;
    m_gps_head                = p_gpsdata->fix.track;
//Used for conversion from earth to local
  convertLL = m_geodesy.LatLong2LocalUTM(m_gps_lat,m_gps_lon,m_ny,m_nx);
  if (!convertLL) {
    reportConfigWarning("could not convert variables");
    return false; }
//  
    Notify("zGeo_X", 		m_nx);
    Notify("zGeo_Y", 		m_ny);
    Notify("GPSD_Mode",      m_gps_mode);
    Notify("NAV_HEADING",      m_gps_head);
    Notify("NAV_LAT",  m_gps_lat);
    Notify("NAV_LONG",  m_gps_lon);
    Notify("GPSD_elevation",  m_gps_alt);
    Notify("NAV_SPEED",      m_gps_spd); 
    Notify("NAV_X",          m_nx);
    Notify("NAV_Y",          m_ny);
    m_json_output = p_gpsd_receiver->data();
    Notify("GPSD_json", m_json_output);
  }
 
  p_gpsd_receiver->clear_fix();
 
  AppCastingMOOSApp::PostReport();
  return(true);
}
 
//---------------------------------------------------------
// Procedure: OnStartUp()
//            happens before connection is open
 
bool GPSd::OnStartUp()
{
  gps_data_t *resp  = NULL;
  AppCastingMOOSApp::OnStartUp();
 
  STRING_LIST sParams;
  m_MissionReader.EnableVerbatimQuoting(false);
  if(!m_MissionReader.GetConfiguration(GetAppName(), sParams))
    reportConfigWarning("No config block found for " + GetAppName());
 
  STRING_LIST::iterator p;
  for(p=sParams.begin(); p!=sParams.end(); p++) {
    string orig  = *p;
    string line  = *p;
    string param = toupper(biteStringX(line, '='));
    string value = line;
    bool handled = false;
    if (param == "HOST") {
      this->m_gpsd_host = value;
      handled = true;
    } else if (param == "PORT") {
      this->m_gpsd_port = value;
      handled = true;
    } else if (param == "MAG_MODEL") {
      this->m_mag_model = value;
      handled = true;
    }
    if(!handled)
      reportUnhandledConfigWarning(orig);
 
  }
#if GPSD_API_MAJOR_VERSION >= 5
    p_gpsd_receiver = new gpsmm(m_gpsd_host.c_str(), m_gpsd_port.c_str());
      resp = p_gpsd_receiver->stream(WATCH_ENABLE);
#elif GPSD_API_MAJOR_VERSION == 4
    p_gpsd_receiver = new gpsmm();
      p_gpsd_receiver->open(m_gpsd_host.c_str(), m_gpsd_port.c_str());
      resp = p_gpsd_receiver->stream(WATCH_ENABLE);
#else
    p_gpsd_receiver = new gpsmm();
    resp = p_gpsd_receiver->open(m_gpsd_host.c_str(), m_gpsd_port.c_str());
    p_gpsd_receiver->query("w\n");
#endif
 
  registerVariables();
  return(true);
}
 
//---------------------------------------------------------
// Procedure: registerVariables
 
void GPSd::registerVariables()
{
  AppCastingMOOSApp::RegisterVariables();
  // Register("FOOBAR", 0);
}



//------------------------------------------------------------
// Procedure: buildReport()
 
bool GPSd::buildReport()
{
  m_msgs << "============================================ \n";
  m_msgs << "File: GPSd.cpp                               \n";
  m_msgs << "============================================ \n";
 
  ACTable actab(6);
  actab << "Mode | Lat | Lon | Alt | Speed | Heading";
  actab.addHeaderLines();
  actab << to_string(m_gps_mode);
  actab << to_string(m_gps_lat);
  actab << to_string(m_gps_lon);
  actab << to_string(m_gps_alt);
  actab << to_string(m_gps_spd);
  actab << to_string(m_gps_head);
  m_msgs << actab.getFormattedString() << endl;
  m_msgs << "============================================ \n";
  m_msgs << "Geodesy: " << GeodesySetup() << endl;
  m_msgs << "NAV_X: " << m_ny << endl;
  m_msgs << "NAV_Y: " << m_nx << endl;
  m_msgs << "JSON: " << m_json_output;
  m_msgs << "============================================ \n";
  m_msgs << "DATA: " << p_gpsdata << endl;
 
  return(true);
}

bool GPSd::GeodesySetup()
{
  double dLatOrigin = 0.0;
  double dLonOrigin = 0.0;
  bool geoOK = m_MissionReader.GetValue("LatOrigin", dLatOrigin);
  if (!geoOK) {
    reportConfigWarning("Latitude origin missing in MOOS file. Could not configure geodesy.");
    return false; }
  else {
    geoOK = m_MissionReader.GetValue("LongOrigin", dLonOrigin);
    if (!geoOK) {
      reportConfigWarning("Longitude origin missing in MOOS file. Could not configure geodesy.");
      return false; } }
  geoOK = m_geodesy.Initialise(dLatOrigin, dLonOrigin);
  if (!geoOK) {
    reportConfigWarning("Could not initialize geodesy with given origin.");
    return false; }
  return true;
}


