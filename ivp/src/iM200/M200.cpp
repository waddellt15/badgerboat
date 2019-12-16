/***************************************************************/
/*  NAME: Alon Yaari                                           */
/*  ORGN: Dept of Mechanical Eng / CSAIL, MIT Cambridge MA     */
/*  FILE: M200.cpp                                             */
/*  DATE: Dec 2014                                             */
/***************************************************************/

#include <algorithm>    // Needed for replace
#include <cstring>      // Needed for memset and errno, strerror
#include <sys/socket.h> // Needed for the socket functions
#include <netdb.h>      // Needed for the socket functions
#include "MBUtils.h"
#include "AngleUtils.h"
#include "M200.h"

using namespace std;

// Procedure: clamp()
//   Purpose: Clamps the value of v between minv and maxv
double clamp(double v, double minv, double maxv)
{
    return min(maxv,max(minv, v));
}

iM200::iM200()
{
  // MOOS file parameters
  m_prefix                = "NAV";
  m_dMaxRudder            = MAX_RUDDER;
  m_dMaxThrust            = MAX_THRUST;
  m_bDirect_thrust        = false;
  m_bPubRawFromFront      = false;
  m_bPublish_Thrust       = false;
  m_heading_offset        = 0.0;
  m_IP                    = "localhost";
  m_Port                  = "29500";
  m_PortNum               = -1;

  // Staleness
  m_bOKtoReportStale      = false;
  m_stale_detections      = 0;
  m_stale_threshold       = 1.5; // seconds
  m_stale_mode            = false;
  m_timestamp_des_L       = 0.0;
  m_timestamp_des_R       = 0.0;
  m_timestamp_des_rudder  = MOOSTime() + 10.0;
  m_timestamp_des_thrust  = MOOSTime() + 10.0;

  // Publish names
  m_pubNameX              = "X";
  m_pubNameY              = "Y";
  m_pubNameLat            = "LAT";
  m_pubNameLon            = "LONG";
  m_pubNameHeading        = "HEADING";
  m_pubNameSpeed          = "SPEED";

  // IP connection details
  m_host_info.ai_family   = AF_UNSPEC;    // IP version not specified. Can be both.
  m_host_info.ai_socktype = SOCK_STREAM;  // Use SOCK_STREAM for TCP or SOCK_DGRAM for UDP.
  m_bValidIPConn          = false;
  m_socketfd              = 0.0;
  m_strInBuff             = "";

  //    The man page of getaddrinfo() states:
  //        "All the other fields in the structure pointed to by hints must
  //        contain either 0 or a null pointer, as appropriate." When a
  //        struct is created in C++, it will be given a block of memory.
  //        This memory is not necessarily empty. Therefore we use the
  //        memset function to make sure all fields are NULL. "
  memset(&m_host_info, 0, sizeof m_host_info);

  // GPS parsing details
  m_pub_utc               = false;                // When true, publish UTC time
  m_pub_hpe               = false;                // When true, publish horiz position of error
  m_pub_hdop              = false;                // When true, publish HDOP
  m_pub_yaw               = false;                // When true, publish yaw
  m_pub_raw               = false;                // When true, publish raw GPS sentences
  m_pub_pitch_roll        = false;                // When true, publish pitch and roll
  m_swap_pitch_roll       = false;                // When true, swap pitch and roll values
  m_trigger_key           = "GPRMC";              // Always triggered by GPRMC message
  m_gps_heading_source    = HEADING_SOURCE_NONE;  // Heading is handled outside of GPS messages

  // Clearpath details not related to GPS
  m_batt_voltage          = 0.0;

  // Appcast details
  m_msgs_to_front         = 0;                    // Number of messages sent to front seat
  m_msgs_from_front       = 0;                    // Number of messages rcvd from front seat
  m_rpt_unhandled_gps     = false;                // When true, appcast unhandled nmea sentences
  m_why_not_valid         = "";

  // Motor related
  m_commanded_L           = 0.0;                  // Value that was last commanded to L motor
  m_commanded_R           = 0.0;                  // Value that was last commanded to R motor
  m_des_thrust            = 0.0;                  // Last requested desired thrust
  m_des_rudder            = 0.0;                  // Last requested desired rudder
  m_des_L                 = 0.0;                  // Last requested desired thrust to L motor
  m_des_R                 = 0.0;                  // Last requested desired thrust to R motor
  m_des_count_L           = 0;
  m_des_count_R           = 0;
  m_des_count_thrust      = 0;
  m_des_count_rudder      = 0;
  m_ivpAllstop            = true;
}

bool iM200::OnNewMail(MOOSMSG_LIST &NewMail)
{
  AppCastingMOOSApp::OnNewMail(NewMail);

  double curr_time = MOOSTime();
  MOOSMSG_LIST::iterator p;
  for (p=NewMail.begin(); p!=NewMail.end(); ++p) {
      CMOOSMsg &rMsg  = *p;
      string key      = rMsg.GetKey();
      double dVal     = rMsg.GetDouble();
      string sVal     = rMsg.GetString();

      if (key == "IVPHELM_ALLSTOP") {
        sVal          = toupper(sVal);
        m_ivpAllstop  = (sVal != "CLEAR"); }

      // Pay attention to desired direct thrust only when in direct thrust mode
      if (m_bDirect_thrust) {
        m_des_thrust = 0.0;
        m_des_rudder = 0.0;
        if (key == "DESIRED_THRUST_L") {
          if (dVal > 0.0) {
            m_des_count_L ++;
            m_bOKtoReportStale = true; }
          m_des_L = dVal;
          m_timestamp_des_L = MOOSTime(); }
        else if (key == "DESIRED_THRUST_R") {
          if (dVal > 0.0) {
            m_des_count_R++;
            m_bOKtoReportStale = true; }
          m_des_R = dVal;
          m_timestamp_des_R = MOOSTime(); } }

      // Pay attention to desired rudder/thrust only when NOT in direct thrust mode
      else {
        m_des_L = 0.0;
        m_des_R = 0.0;
        if (key == "DESIRED_THRUST") {
          if (dVal > 0.0) {
            m_des_count_thrust++;
            m_bOKtoReportStale = true; }
          m_des_thrust = dVal;
          m_timestamp_des_thrust = MOOSTime(); }
        else if (key == "DESIRED_RUDDER") {
          if (dVal > 0.0) {
            m_des_count_rudder++;
            m_bOKtoReportStale = true; }
          m_des_rudder = dVal;
          m_timestamp_des_rudder = MOOSTime(); } }

      if (key == "THRUST_MODE_DIFFERENTIAL") {
        bool bMode = (tolower(sVal) == "true");
        handleSetThrustMode(bMode); } }
  return true;
}

void iM200::RegisterForMOOSMessages()
{
  AppCastingMOOSApp::RegisterVariables();
  Register("DESIRED_THRUST_L",         0.0);
  Register("DESIRED_THRUST_R",         0.0);
  Register("DESIRED_THRUST",           0.0);
  Register("DESIRED_RUDDER",           0.0);
  Register("DIRECT_THRUST_MODE",       0.0);
  Register("THRUST_MODE_DIFFERENTIAL", 0.0);
  Register("IVPHELM_ALLSTOP",          0.0);
}

bool iM200::OnStartUp()
{
  AppCastingMOOSApp::OnStartUp();
  
  STRING_LIST sParams;
  if (!m_MissionReader.GetConfiguration(GetAppName(), sParams))
    reportConfigWarning("No config block found for " + GetAppName());
  bool goodParams = true;
  STRING_LIST::iterator p;
  for (p = sParams.begin(); p != sParams.end(); p++) {
    string orig  = *p;
    string line  = *p;
    string param = tolower(biteStringX(line, '='));
    string value = line;
    
    bool handled = false;
    if      (param == "ip_address")       handled = SetParam_IP_ADDRESS(value);
    else if (param == "port_number")      handled = SetParam_PORT_NUMBER(value);
    else if (param == "heading_offset")   handled = SetParam_HEADING_OFFSET(value);
    else if (param == "publish_raw")      handled = SetParam_PUBLISH_RAW(value);
    else if (param == "direct_thrust")    handled = SetParam_DIRECT_THRUST_MODE(value);
    else if (param == "gps_prefix")       handled = SetParam_PREFIX(value);
    else if (param == "max_rudder")       handled = SetParam_MAX_RUDDER(value);
    else if (param == "max_thrust")       handled = SetParam_MAX_THRUST(value);
    else if (param == "publish_thrust")   handled = SetParam_PUBLISH_THRUST(value);
    if (!handled)
      reportUnhandledConfigWarning(orig); }

  SetPublishNames();
  ParserSetup();
  if (!GeodesySetup()) {
    m_bValidIPConn = false;
    m_why_not_valid = "Origin improperly defined in mission file."; }


  // OnStartup() must always return true
  //    - Or else it will quit during launch and appCast info will be unavailable
  return true;

}

bool iM200::ParserSetup()
{
  m_parser = new gpsParser(&m_geodesy, m_trigger_key, false);
  m_parser->SetSwapPitchAndRoll(m_swap_pitch_roll);
  m_parser->SetHeadingOffset(m_heading_offset);
  m_parser->SetPublish_raw(m_pub_raw);
  m_parser->SetPublish_hdop(m_pub_hdop);
  m_parser->SetPublish_yaw(m_pub_yaw);
  m_parser->SetPublish_utc(m_pub_utc);
  m_parser->SetPublish_hpe(m_pub_hpe);
  m_parser->SetPublish_pitch_roll(m_pub_pitch_roll);
  return true;
}

bool iM200::GeodesySetup()
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

bool iM200::OnConnectToServer()
{
  RegisterForMOOSMessages();
  return true;
}

bool iM200::Iterate()
{
  AppCastingMOOSApp::Iterate();
  
  // Check for staleness of input from payload community
  bool stale_input = StaleModeCheck();

  // Case where we transition from un-stale to stale mode
  if (!m_ivpAllstop && m_bOKtoReportStale) {
    bool transitioned_to_stale = false;
    if (stale_input && !m_stale_mode) {
      m_stale_detections++;
      transitioned_to_stale = true;
      reportRunWarning("Stale Command Input Detected"); }
    if (!stale_input && !m_stale_mode)
        retractRunWarning("Stale Command Input Detected");

  // Case where we transition from stale to un-stale mode
  if (!stale_input && m_stale_mode)
    retractRunWarning("Stale Command Input Detected"); }

  m_stale_mode = stale_input;

  // Part 4: Send info to front seat
  if (m_bValidIPConn) {
    bool send_ok = Send();
    if (send_ok)
      m_msgs_to_front++;
    else
      reportRunWarning("Failure sending commands to vehicle."); }

    // Receive any pending messages
    Receive();



  AppCastingMOOSApp::PostReport();
  return true;
}

  //----------------------------------------------------
  // Procedure: StaleModeCheck()
  //   Returns: true if the relevant input IS stale
  //            false if NOT stale
  bool iM200::StaleModeCheck()
  {
    // Stale mode not relevant when IvpHelm commands all-stop
    if (m_ivpAllstop)
      return false;

    // OK to report stale only after receipt of the first DESIRED_* command
    //    Until then, don't report that anything is stale
    //    This means system can start up and can sit forever without reporting stale
    if (!m_bOKtoReportStale)
      return false;

    double curr_time = MOOSTime();
    bool stale_input = false;

    //    - If time gap is too large then values are stale
    //    - If desired values never reported then gap will be too large

    // Handle the Direct Thrust case
    if (m_bDirect_thrust) {
      double gapL = curr_time - m_timestamp_des_L;
      double gapR = curr_time - m_timestamp_des_R;
      stale_input = (gapL > m_stale_threshold || gapR > m_stale_threshold); }

    // Handle the rudder-thrust mode
    else {
      double gapRudder = curr_time - m_timestamp_des_rudder;
      double gapThrust = curr_time - m_timestamp_des_thrust;
      stale_input = (gapRudder > m_stale_threshold || gapThrust > m_stale_threshold); }

  if (stale_input) {
    m_des_L       = 0.0;
    m_des_R       = 0.0;
    m_des_rudder  = 0.0;
    m_des_thrust  = 0.0; }
  return stale_input;
}




bool iM200::ThrustRudderToLR()
{
  // 1. Constrain Values
  //      DESIRED_RUDDER value to MAX_RUDDER
  //          - Anything more extreme than +/-50.0 is turn-in-place
  //      DESIRED_THRUST value to MAX_THRUST
  //          - Anything greater than +/-100.0% makes no sense
  double desiredRudder = clamp (m_des_rudder, (-1.0 * m_dMaxRudder), m_dMaxRudder);
  double desiredThrust = clamp (m_des_thrust, (-1.0 * MAX_THRUST), MAX_THRUST);

  // 2. Calculate turn
  //      - ADD rudder to left thrust
  //      - SUBTRACT rudder from right thrust
  double percentLeft  = desiredThrust + desiredRudder;
  double percentRight = desiredThrust - desiredRudder;

  // 3. Map desired thrust values to motor bounds
  //      - Range of DESIRED_THRUST: [-MAX_THRUST, MAX_THRUST]
  //      -          ...map to...
  //      - Range of valid thrust values: [-m_MaxThrustValue, m_MaxThrustValue]
  double fwdOrRevL   = (percentLeft  > 0.0) ? 1.0 : -1.0;
  double fwdOrRevR   = (percentRight > 0.0) ? 1.0 : -1.0;
  double pctThrustL  = fabs(percentLeft)  / MAX_THRUST;
  double pctThrustR  = fabs(percentRight) / MAX_THRUST;
  double mappedLeft  = pctThrustL * m_dMaxThrust * fwdOrRevL;
  double mappedRight = pctThrustR * m_dMaxThrust * fwdOrRevR;

  // 4. Offset using the progressive offsets
  //      - Based on the original DESIRED_THRUST value
  //      - Add offsets from left side motor
//  char cOffset = 'x';
//  if (m_thrustCommanded < 10)         { mappedLeft += m_Offset_LT10;          cOffset = '0'; }
//  else if (m_thrustCommanded < 20.0)  { mappedLeft += m_Offset_GTE10_LT20;    cOffset = '1'; }
//  else if (m_thrustCommanded < 30.0)  { mappedLeft += m_Offset_GTE20_LT30;    cOffset = '2'; }
//  else if (m_thrustCommanded < 40.0)  { mappedLeft += m_Offset_GTE30_LT40;    cOffset = '3'; }
//  else if (m_thrustCommanded < 50.0)  { mappedLeft += m_Offset_GTE40_LT50;    cOffset = '4'; }
//  else if (m_thrustCommanded < 60.0)  { mappedLeft += m_Offset_GTE50_LT60;    cOffset = '5'; }
//  else if (m_thrustCommanded < 70.0)  { mappedLeft += m_Offset_GTE60_LT70;    cOffset = '6'; }
//  else if (m_thrustCommanded < 80.0)  { mappedLeft += m_Offset_GTE70_LT80;    cOffset = '7'; }
//  else if (m_thrustCommanded < 90.0)  { mappedLeft += m_Offset_GTE80_LT90;    cOffset = '8'; }
//  else                                { mappedLeft += m_Offset_GTE90;         cOffset = '9'; }

  // 5. Deal with overages
  //      - Any value over m_MaxThrustValue gets subtracted from both sides equally
  //      - Constrain to [-m_MaxThrustValue, m_MaxThrustValue]
  double maxThrustNeg = -1.0 * m_dMaxThrust;
  if (mappedLeft  > m_dMaxThrust)
    mappedRight -= (mappedLeft  - m_dMaxThrust);
  if (mappedLeft  < maxThrustNeg)
    mappedRight -= (mappedLeft  + m_dMaxThrust);
  if (mappedRight > m_dMaxThrust)
    mappedLeft  -= (mappedRight - m_dMaxThrust);
  if (mappedRight < maxThrustNeg)
    mappedLeft  -= (mappedRight + m_dMaxThrust);

  m_des_L  = clamp (mappedLeft,  (-1.0 * m_dMaxThrust), m_dMaxThrust);
  m_des_R  = clamp (mappedRight, (-1.0 * m_dMaxThrust), m_dMaxThrust);
  return true;
}

bool iM200::SetParam_IP_ADDRESS(string sVal)
{
  stringstream ssMsg;
  sVal = removeWhite(sVal);
  if (sVal.empty()) {
    ssMsg << "Invalid IP address [" << sVal << "]. Cannot connect to vehicle.";
    reportConfigWarning(ssMsg.str());
    m_why_not_valid = "IP address improperly defined in mission file.";
    return false; }
  m_IP = sVal;
  return true;
}

bool iM200::SetParam_PORT_NUMBER(string sVal)
{
  stringstream ssMsg;
  sVal = removeWhite(sVal);
  bool bGood = isNumber(sVal);
  if (bGood) {
    m_PortNum = (int) strtod(sVal.c_str(), 0);
    if (m_PortNum < 0 || m_PortNum > 65335) {
      m_PortNum = -1;
      bGood = false; } }
  if (!bGood) {
    ssMsg << "Invalid IP port number [" << sVal << "], expecting number in domain [0, 65335]. Cannot connect to vehicle.";
    reportConfigWarning(ssMsg.str());
    m_why_not_valid = "IP port improperly defined in mission file.";
    return false; }
  m_Port = sVal;
  return true;
}

bool iM200::SetParam_HEADING_OFFSET(string sVal)
{
  stringstream ssMsg;
  if (!isNumber(sVal))
    ssMsg << "Param HEADING_OFFSET must be a number in range [0.0, 180.0). Defaulting to 0.0.";
  else
    m_heading_offset = strtod(sVal.c_str(), 0);
  if (m_heading_offset < 0.0 || m_heading_offset >= 180.0) {
    ssMsg << "Param HEADING_OFFSET cannot be " << m_dMaxRudder << ". Must be in range [0.0, 180.0). Defaulting to 0.0.";
    m_heading_offset = 0.0; }
  string msg = ssMsg.str();
  if (!msg.empty())
    reportConfigWarning(msg);
  return true;
}

bool iM200::SetParam_PREFIX(std::string sVal)
{
  // TODO: Check sVal for legal MOOS message name characters

  // m_prefix gets cleaned up (case, underscore) in SetPublishNames()
  m_prefix = toupper(sVal);
  return true;
}

bool iM200::SetParam_MAX_RUDDER(std::string sVal)
{
  stringstream ssMsg;
  if (!isNumber(sVal))
    ssMsg << "Param MAX_RUDDER must be a number in range (0.0, 180.0]. Defaulting to " << MAX_THRUST << ".";
  else
    m_dMaxRudder = strtod(sVal.c_str(), 0);
  if (m_dMaxRudder <= 0.0 || m_dMaxRudder > 180.0) {
    ssMsg << "Param MAX_RUDDER cannot be " << m_dMaxRudder << ". Must be in range (0.0, 180.0]. Defaulting to " << MAX_RUDDER << ".";
    m_dMaxRudder = MAX_RUDDER; }
  string msg = ssMsg.str();
  if (!msg.empty())
    reportConfigWarning(msg);
  return true;
}

bool iM200::SetParam_MAX_THRUST(std::string sVal)
{
  stringstream ssMsg;
  if (!isNumber(sVal))
    ssMsg << "Param MAX_THRUST must be a number in range (0.0, 100.0]. Defaulting to " << MAX_THRUST << ".";
  else
    m_dMaxThrust = strtod(sVal.c_str(), 0);
  if (m_dMaxThrust <= 0.0 || m_dMaxThrust > 100.0) {
    ssMsg << "Param MAX_THRUST cannot be " << m_dMaxRudder << ". Must be in range (0.0, 100.0]. Defaulting to " << MAX_THRUST << ".";
    m_dMaxThrust = MAX_THRUST; }
  string msg = ssMsg.str();
  if (!msg.empty())
    reportConfigWarning(msg);
  return true;
}

bool iM200::SetParam_DIRECT_THRUST_MODE(std::string sVal)
{
  sVal = removeWhite(sVal);
  if (sVal.empty())
    sVal = "blank";
  stringstream ssMsg;
  sVal = tolower(sVal);
  if (sVal == "true" || sVal == "false")
    handleSetThrustMode(sVal == "true");
  else {
    ssMsg << "Param DIRECT_THRUST_MODE cannot be " << sVal << ". It must be TRUE or FALSE. Defaulting to FALSE.";
    handleSetThrustMode(false); }
  string msg = ssMsg.str();
  if (!msg.empty())
    reportConfigWarning(msg);
  return true;
}

bool iM200::SetParam_PUBLISH_RAW(std::string sVal)
{
  sVal = removeWhite(sVal);
  if (sVal.empty())
    sVal = "blank";
  stringstream ssMsg;
  sVal = tolower(sVal);
  if (sVal == "true" || sVal == "false")
    m_bPubRawFromFront = (sVal == "true");
  else {
    ssMsg << "Param PUBLISH_RAW cannot be " << sVal << ". It must be TRUE or FALSE. Defaulting to FALSE.";
    m_bPubRawFromFront = false; }
  string msg = ssMsg.str();
  if (!msg.empty())
    reportConfigWarning(msg);
  return true;
}

bool iM200::handleSetThrustMode(bool setDirectThrustMode)
{
  m_bDirect_thrust = setDirectThrustMode;
  string strThrustMode = "";
  if (setDirectThrustMode)
    strThrustMode = "Direct thrust mode engaged.";
  else
    strThrustMode = "Rudder/thrust mode engaged.";
  reportEvent(strThrustMode);
  return true;
}

bool iM200::SetParam_PUBLISH_THRUST(std::string sVal)
{
  sVal = removeWhite(sVal);
  if (sVal.empty())
    sVal = "blank";
  stringstream ssMsg;
  sVal = tolower(sVal);
  if (sVal == "true" || sVal == "false")
    m_bPublish_Thrust = (sVal == "true");
  else {
    ssMsg << "Param PUBLISH_THRUST cannot be " << sVal << ". It must be TRUE or FALSE. Defaulting to FALSE.";
    m_bPubRawFromFront = false; }
  string msg = ssMsg.str();
  if (!msg.empty())
    reportConfigWarning(msg);
  return true;
}

bool iM200::SetPublishNames()
{
  m_prefix = toupper(m_prefix);
  size_t strLen = m_prefix.length();
  if (strLen > 0 && m_prefix.at(strLen - 1) != '_')
      m_prefix += "_";
  m_pubNameX       = m_prefix + m_pubNameX;
  m_pubNameY       = m_prefix + m_pubNameY;
  m_pubNameLat     = m_prefix + m_pubNameLat;
  m_pubNameLon     = m_prefix + m_pubNameLon;
  m_pubNameHeading = m_prefix + m_pubNameHeading;
  m_pubNameSpeed   = m_prefix + m_pubNameSpeed;
  return true;
}

bool iM200::OpenConnectionTCP(string addr, string port)
{
  // Used to check for valid IP address
  //    Removed it because it prevents /etc/hosts file aliases
//  if (!isValidIPAddress(addr) || !isNumber(port)) {
//    reportRunWarning("Invalid IP and/or port.");
//    m_why_not_valid = "IP and/or port not properly defined in mission file.";
//    return false; }


  // Now fill the linked list of host_info struct with the connection info
  server = gethostbyname(m_IP.c_str());
  if (server == NULL) {
    string warning = "Error with gethostbyname(): ";
    warning += hstrerror(h_errno);
    warning += addr + "] Port [" + port + "] .";
    reportEvent(warning);
    m_bValidIPConn = false; }
  else
    m_bValidIPConn = true;

  bzero((char*) &serv_addr, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  bcopy((char*) server->h_addr, &serv_addr.sin_addr.s_addr, server->h_length);
  serv_addr.sin_port = htons(m_PortNum);

/*
  int status = getaddrinfo(addr.c_str(), port.c_str(), &m_host_info, &m_host_IL);
  // 0 = success, otherwise failure
  if (status == NULL) {
    string event = "Success in server/port naming: ";
    warning += addr + "] Port [" + port + "]. ";
    reportEvent(event);
    m_bValidIPConn = true; }
  else {
    string warning = "Error in server/port naming: IP [";
    warning += addr + "] Port [" + port + "]. ";
    warning += gai_strerror(status);
    reportRunWarning(warning);
    m_bValidIPConn = false; }
    */
  return m_bValidIPConn;

  return true;
}

bool iM200::OpenSocket()
{
  //m_socketfd = socket(m_host_IL->ai_family, m_host_IL->ai_socktype, m_host_IL->ai_protocol);
  m_socketfd = socket(AF_INET, SOCK_STREAM, 0);

  // errno (/usr/include/sys/errno.h)
  //    - declared as a result of including sys/socket.h
  //    - is an integer that refers to various OS errors.
  //    - if socket() returns an error (return value == -1), then errno is set.
  //    - Convert int value to a human readable explanation with strerror()
  int tmp = errno;
  if (m_socketfd == -1) {
    string warning = "TCP socket open error: ";
    warning += strerror(tmp);
    reportRunWarning(warning);
    m_why_not_valid = "TCP socket to front seat could not be opened. " + warning;
    return false; }
  stringstream socketReturn;
  socketReturn << "Socket open. (" << m_socketfd << ")";
  reportEvent(socketReturn.str());
  return true;
}

bool iM200::Connect()
{
//  int status = connect(m_socketfd, m_host_IL->ai_addr, m_host_IL->ai_addrlen);
  int status = connect(m_socketfd, (struct sockaddr*) &serv_addr, sizeof(serv_addr));

  // See OpenSocket() for an explanation of errno
  int tmp = errno;
  if (status == -1) {
    string warning = "TCP socket connect error: ";
    warning += strerror(tmp);
    reportRunWarning(warning);
    m_why_not_valid = "TCP socket to front seat did not connect. " + warning;
    return false; }

  stringstream statusStr;
  statusStr << "Connection open. (" << status << ")";
    reportEvent(statusStr.str());
  return true;
}

bool iM200::Send()
{
  // Rudder/Thrust mode:
  //    need to convert m_des_rudder and m_des_thrust to m_des_L and m_des_R
  if (!m_bDirect_thrust)
    ThrustRudderToLR();
  
  if (m_bPublish_Thrust) {
    m_Comms.Notify("M200_THRUST_L", m_des_L);
    m_Comms.Notify("M200_THRUST_R", m_des_R); }

  string message = "$";
  m_commanded_L = m_des_L;
  m_commanded_R = m_des_R;
  message += "PYDIR,";
  message += doubleToString(m_des_L);
  message += ",";
  message += doubleToString(m_des_R);
  message += "*\r\n";

  ssize_t bytes_sent;
  int len = strlen(message.c_str());

  //TODO: try{} block in case we send when server end is disconnected
  bytes_sent = send(m_socketfd, message.c_str(), len, 0);

  // See OpenSocket() for an explanation of errno
  int tmp = errno;
  if (bytes_sent == -1) {
    m_sLastMsgToFront = "";
    string warning = "TCP send error: ";
    warning += strerror(tmp);
    reportRunWarning(warning);
    m_why_not_valid = "Error sending data to front seat via TCP. " + warning;
    return false; }

  m_sLastMsgToFront = message;
  return true;
}

bool iM200::Receive()
{
  // Objective is to parse out NMEA strings from the incoming data
  ssize_t numBytes;
  char incoming[MAX_IN_BYTES];
  numBytes = recv(this->m_socketfd, incoming, MAX_IN_BYTES, 0);

  // See OpenSocket() for an explanation of errno
   int tmp = errno;
   if (numBytes == -1) {
     string warning = "TCP Receive error: ";
     warning += strerror(tmp);
     reportRunWarning(warning);
     m_why_not_valid = "Error receiving data from front seat via TCP. " + warning;
     return false; }

  if (numBytes == 0)
    return false;
  
  string incomingStr(incoming, numBytes);
  m_strInBuff += incomingStr;

  // Everything before the first $ is tossed; we're missing the beginning of that NMEA message
  // If no $ in the message then there isn't anything to parse and everything can be thrown away
  size_t startNMEA = m_strInBuff.find('$');
  if (startNMEA == string::npos) {
    m_strInBuff = "";
    return true; }
  if (startNMEA > 0)
    m_strInBuff = m_strInBuff.substr(startNMEA);

  // Replace '\r' with '\n' so we're only dealing with single-char line ends
  replace( m_strInBuff.begin(), m_strInBuff.end(), '\r', '\n' );
  size_t posReturn = m_strInBuff.find('\r');

  // Parse string into a vector of lines based on 'n'
  vector<string> lines = parseString(m_strInBuff, "\n");
  if (lines.size() < 1)
    return true;
  
  // If the last item is not a full sentence, keep it for next time
  string last = lines[lines.size() - 1];
  unsigned int lastSize = last.size();
  if (last.size() < 4 || last.at(lastSize - 3) != '*')
    m_strInBuff = last;
  else
    m_strInBuff = "";
  
  // Visit each string item in the vector and deal with it
  for (unsigned int i = 0; i < lines.size(); i++) {
    string line = lines[i];
    if (!line.empty())
      cout << "+++ RAW LINE: [" << line << "]" <<endl;
      if (NMEAChecksumIsValid(line)) {
        DealWithNMEA(line); } }
  return true;
}


void iM200::PublishHeading(double dHeading)
{
  if (dHeading == BAD_DOUBLE)
    return;
  dHeading += m_heading_offset;
  dHeading = angle360(dHeading);
  Notify(m_pubNameHeading, dHeading);
}

bool iM200::DealWithNMEA(string nmea)
{
  cout << "+++ NMEA in: " << nmea << endl;

  if (nmea.empty() || nmea.at(0) != '$' || !NMEAChecksumIsValid(nmea))
    return false;
  if (m_bPubRawFromFront)
    Notify("M200_RAW_NMEA", nmea);

  // Grab just the key of the NMEA sentence
  vector<string> parts = parseString(nmea, ',');
  string nmeaHeader = parts[0];

  // Clearpath-specific sentences
  if      (nmeaHeader == "$CPIMU")  return ParseUnknownNMEA(nmea);
  else if (nmeaHeader == "$CPNVG")  return ParseCPNVG(nmea);        // Heading from front seat
  else if (nmeaHeader == "$CPNVR")  return ParseUnknownNMEA(nmea);  // ParseCPNVR(nmea)
  else if (nmeaHeader == "$CPRBS")  return ParseCPRBS(nmea);        // Battery voltage from front seat
  else if (nmeaHeader == "$CPRCM")  return ParseUnknownNMEA(nmea);  // ParseCPRCM(nmea);

  // GPS sentences
  else if (nmeaHeader == "$GPGGA")  return m_parser->NMEASentenceIngest(nmea);
  else if (nmeaHeader == "$GPGSA")  return ParseUnknownNMEA(nmea); // ParseGPGSA(nmea);
  else if (nmeaHeader == "$GPGST")  return m_parser->NMEASentenceIngest(nmea);
  else if (nmeaHeader == "$GPGSV")  return ParseUnknownNMEA(nmea); // ParseGPGSV(nmea);
  else if (nmeaHeader == "$GPRMC")  return m_parser->NMEASentenceIngest(nmea);
  else if (nmeaHeader == "$GPRME")  return m_parser->NMEASentenceIngest(nmea);
  else if (nmeaHeader == "$GPVTG")  return ParseUnknownNMEA(nmea); // ParseGPVTG(nmea);
  else                              return ParseUnknownNMEA(nmea);

  m_msgs_from_front++;
  return true;
}

//----------------------------------------------------
// Procedure: ParseCPNVG()
//      Note: CPNVG: Navigation Update
bool iM200::ParseCPNVG(string nmea)
{
  CPNVGnmea cpnvg;
  cpnvg.ParseSentenceIntoData(nmea, true);
  if (!cpnvg.CriticalDataAreValid()) {
    reportRunWarning("Could not parse CPNVG message: " + nmea);
    return false; }
  double dHeading = BAD_DOUBLE;
  if (cpnvg.Get_headingTrueN(dHeading))
      PublishHeading(dHeading);
  return true;
}

//----------------------------------------------------
// Procedure: ParseCPRBS
//      Note: CPRBS: Battery voltage
bool iM200::ParseCPRBS(string nmea)
{
  CPRBSnmea cprbs;
  cprbs.ParseSentenceIntoData(nmea, true);
  if (!cprbs.CriticalDataAreValid()) {
    reportRunWarning("Could not parse CPRBS message: " + nmea);
    return false; }
  if (cprbs.Get_battStackVoltage(m_batt_voltage))
    Notify("M200_BATT_VOLTAGE", m_batt_voltage);
  return true;
}

//----------------------------------------------------
// Procedure: ParseCPRCM
//      Note: CPRCM: Raw Compass Data
bool iM200::ParseCPRCM(string nmea)
{
  // TODO: Handle parsing of CPRCM message
  nmea += "";     // Dummy line so IDE won't complain that nmea is unused in this function
  return true;
}

bool iM200::NMEAChecksumIsValid(string nmea)
{
  unsigned char xCheckSum = 0;
  string sToCheck;
  MOOSChomp(nmea,"$");
  sToCheck = MOOSChomp(nmea,"*");
  string sRxCheckSum = nmea;

  //now calculate what we think check sum should be...
  string::iterator p;
  for (p = sToCheck.begin(); p != sToCheck.end(); p++)
    xCheckSum^=*p;
  ostringstream os;
  os.flags(ios::hex);
  os << (int) xCheckSum;
  string sExpected = os.str();

  if (sExpected.length() < 2)
    sExpected = "0" + sExpected;

  bool result = MOOSStrCmp(sExpected,sRxCheckSum);

  return(result);
}

bool iM200::ParseUnknownNMEA(std::string nmea)
{
  // TODO: Fill in some functionality for parsing unknown NMEA sentences
  nmea += "";     // Dummy line so IDE won't complain that nmea is unused in this function
  return true;
}

bool iM200::buildReport()
{
  if (!m_bValidIPConn) {
    m_msgs << "No communications with front seat." << endl;
    return true; }
  
  // Format doubles ahead of time
  string sOffset = doubleToString(m_heading_offset, 1);
  string sMaxRud = doubleToString(m_dMaxRudder, 1);
  string sMaxThr = doubleToString(m_dMaxThrust, 1);
  string sBattV  = doubleToString(m_batt_voltage, 1);
  string sReqL   = doubleToString(m_des_L, 1);
  string sReqR   = doubleToString(m_des_R, 1);
  string sReqRud = doubleToString(m_des_rudder, 1);
  string sReqThr = doubleToString(m_des_thrust, 1);
  string sCommL  = doubleToString(m_commanded_L, 1);
  string sCommR  = doubleToString(m_commanded_R, 1);

  m_msgs <<   "Configuration: " << endl;
  m_msgs <<   "   IP address:port:             " << m_IP << ":" << m_Port << endl;
  m_msgs <<   "   Magnetic offset:             " << sOffset << endl;
  if (m_bPubRawFromFront)
    m_msgs << "   Publishing raw messages from front seat: ON" << endl;
  m_msgs <<   "   Maximum rudder:          +/- " << sMaxRud << endl;
  m_msgs <<   "   Maximum thrust:          +/- " << sMaxThr << "%" << endl;
  m_msgs <<   "   Prefix for nav publications: " << m_prefix << endl;
  m_msgs <<   "   Command mode:                ";
  if (m_bDirect_thrust)
    m_msgs << "direct-thrust" << endl;
  else
    m_msgs << "rudder-thrust" << endl;
  m_msgs << endl;

  if (!m_bDirect_thrust) {

    // Thrust and rudder dynamic bars

    //                                    1             1                   1
    //                  1122334455667788990             0987654321 1234567890
    //                050505050505050505050             000000000000000000000

    //                          11111111112                       11111111112
    //                012345678901234567890             012345678901234567890
    m_msgs <<  "  STOP                     FULL        L          C          R" << endl;

    int desRudder = (int) (m_des_rudder + 0.5);
    int desThrust = (int) (m_des_thrust + 0.5);

    char cThrust[] = "                     ";
    int pos = (int) m_des_thrust / 5;
    if (pos < 0)                  pos = 0;
    if (pos > 20)                 pos = 20;
    for (int i = 0; i < pos; i++)
      cThrust[i] = '-';
    cThrust[pos] = '|';

    char cRudder[] = "          ^          ";
    pos = 10 + (desRudder / 2);
    if (pos < 0)                  pos = 0;
    if (pos > 20)                 pos = 20;
    cRudder[pos] = '|';

    m_msgs << "     [" << cThrust << "] ";
    m_msgs << (desThrust < 100 ? " " : "") << (desThrust < 10  ? " " : "") << desThrust;
    m_msgs << "%      [" << cRudder << "] ";
    m_msgs << (desRudder < 100 ? " " : "") << (desRudder < 10  ? " " : "") << desRudder << "%" << endl;

    m_msgs << "         DESIRED_THRUST                     DESIRED_RUDDER" << endl;
    m_msgs << endl; }

  m_msgs <<   "Info from front seat:" << endl;
  m_msgs <<   "   Front seat battery voltage:  " << sBattV << endl;
  m_msgs << endl;

  m_msgs << "Status:" << endl;

  if (m_ivpAllstop) {
    m_msgs << "   --- IVPHELM ALLSTOP ENGAGED ---" << endl; }

  if (m_stale_mode) {
  m_msgs << "   --- STALE MODE ENGAGED. Motors stopped. ---" << endl;
  m_msgs << "   Stale mode will disengage when motor commands are received." << endl; }
  if (m_bDirect_thrust)
  m_msgs << "   Requested L, R:              " << sReqL << ", " << sReqR << endl;
  else
  m_msgs <<   "   Requested rudder, thrust:    " << sReqRud << ", " << sReqThr << endl;
  m_msgs <<   "   Commanded to motors L, R:    " << sCommL << ", " << sCommR << endl;
  m_msgs <<   "   Messages from front seat:    " << m_msgs_from_front << endl;
  m_msgs <<   "   Messages to front seat:      " << m_msgs_to_front << endl;
  m_msgs <<   "   Last message sent to front:  " << m_sLastMsgToFront << endl;

  if (m_bDirect_thrust) {
    m_msgs << "   DESIRED_THRUST_L count:      " << m_des_count_L << endl;
    m_msgs << "   DESIRED_THRUST_R count:      " << m_des_count_R << endl; }
  else {
    m_msgs << "   DESIRED_THRUST count:        " << m_des_count_thrust << endl;
    m_msgs << "   DESIRED_RUDDER count:        " << m_des_count_rudder << endl; }

  m_msgs << endl;

  m_msgs <<   "Front Seat GPS Details: " << endl;
  if (m_counters.size() == 0)
  m_msgs << "   No GPS sentences have been parsed." << endl;
  else {
  std::map<std::string, unsigned int>::iterator it = m_counters.begin();
  for (;it != m_counters.end(); it++)
  m_msgs << "   " << it->first << ":  " << it->second << endl; }

  // Retrieve GPS error messages (if any)
  while (m_parser->ErrorsAvailable())
  m_msgs << m_parser->GetNextErrorString() << endl;

  return true;
}




// ATTIC

/*
bool iM200::SetParam_HEADING_SOURCE(string sVal)
{
  if (sVal.empty()) {
    m_heading_source = "NAV_UPDATE";
    string msg = "Config param HEADING_SOURCE is blank. ";
    msg += "Defaulting to 'NAV_UPDATE'.";
    reportConfigWarning(msg);
    return false;
  }

  m_heading_source = sVal;
  MOOSToUpper(m_heading_source);
  string findSrc = HEADING_OPTIONS;
  size_t found = findSrc.find(m_heading_source);
  if (found == string::npos) {
    string warning = "In mission file, HEADING_SOURCE must be one of: ";
    warning += HEADING_OPTIONS;
    reportConfigWarning(warning);
    return false;
  }
  return true;
}

bool iM200::SetParam_HEADING_MSG_NAME(string sVal)
{
  if (sVal.empty()) {
    string msg = "Config parameter HEADING_MSG_NAME is blank, defaulting to";
    reportConfigWarning(msg + m_heading_msg_name);
    return true; }

  // Enforce that MOOS variables should not contain white space
  if (strContainsWhite(sVal)) {
    reportConfigWarning("heading_msg_name param should not contain wht space");
    return false; }

  m_heading_msg_name = sVal;
  return true;
}

bool iM200::SendHeartBeat()
{
  // Part 1: Build the PYSTS Status message
  string message = "$";
  message += "PYSTS,";
  message += doubleToString(MOOSTime(),2);
  message += ",1,,";
  message += "*\r\n";

  // Part 2: Try to send the message, check if it succeeded
  ssize_t bytes_sent;
  int len = strlen(message.c_str());
  bytes_sent = send(socketfd, message.c_str(), len, 0);

  bool send_ok = true;
  if (bytes_sent == -1)     // -1 == error
    send_ok = false;

  // Part 3: Perhaps report the message for debugging to MOOSDB
  if (m_post_raw_msgs) {
    string debug_msg = message;
    if (!send_ok)
      debug_msg = "FAILED " + message;
    Notify("M200_RAW_SEND", debug_msg);
  }

  // Part 4: Add the message, result to appcasting events
  string event = "Sending: " + message;
  if (!send_ok)
    event = "Sending(F): " + message;
  reportEvent(event);

  return(send_ok);
}

//----------------------------------------------------
// Procedure: ParseGPRMC
//      Note: GPRMC: Raw GPS message containing heading, other details
bool iM200::ParseGPRMC(string nmea)
{
  if (m_heading_source != "RAW_GPS")
    return true;

  GPRMCnmea gprmc;
  gprmc.ParseSentenceIntoData(nmea, true);

  if (!gprmc.CriticalDataAreValid()) {
    reportRunWarning("Could not parse GPRMC message: " + nmea);
    return false;
  }

  double dHeading = BAD_DOUBLE;
  if (gprmc.Get_headingTrueN(dHeading))
    PublishHeading(dHeading);

  return true;
}





*/

















//
