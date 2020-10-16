/***************************************************************/
/*  NAME: Alon Yaari                                           */
/*  ORGN: Dept of Mechanical Eng / CSAIL, MIT Cambridge MA     */
/*  FILE: M200.cpp                                             */
/*  DATE: Dec 2014                                             */
/***************************************************************/

#include <algorithm>    // Needed for replace
#include <cstring>      // Needed for memset and errno, strerror
#include "MBUtils.h"
#include "AngleUtils.h"
#include "dThrust.h"
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>
#include <stdlib.h>



using namespace std;

// Procedure: clamp()
//   Purpose: Clamps the value of v between minv and maxv
double clamp(double v, double minv, double maxv)
{
    return min(maxv,max(minv, v));
}

dfThrust::dfThrust()
{
  // MOOS file parameters
  m_dMaxRudder            = MAX_RUDDER;
  m_dMaxThrust            = MAX_THRUST;
  m_bPublish_Thrust       = false;
  m_heading_offset        = 0.0;

  // Staleness
  m_bOKtoReportStale      = false;
  m_stale_detections      = 0;
  m_stale_threshold       = 1.5; // seconds
  m_stale_mode            = false;
  m_timestamp_des_L       = 0.0;
  m_timestamp_des_R       = 0.0;
  m_timestamp_des_rudder  = MOOSTime() + 10.0;
  m_timestamp_des_thrust  = MOOSTime() + 10.0;







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
bool dfThrust::OnDisconnectFromServer(){
	return true;
}

bool dfThrust::OnNewMail(MOOSMSG_LIST &NewMail)
{
  AppCastingMOOSApp::OnNewMail(NewMail);
  MOOSMSG_LIST::iterator p;
  for (p=NewMail.begin(); p!=NewMail.end(); ++p) {
      CMOOSMsg &rMsg  = *p;
      string key      = rMsg.GetKey();
      double dVal     = rMsg.GetDouble();
      string sVal     = rMsg.GetString();

      if (key == "IVPHELM_ALLSTOP") {
        sVal          = toupper(sVal);
        m_ivpAllstop  = (sVal != "CLEAR"); }
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
          m_timestamp_des_rudder = MOOSTime(); }
  }
  return true;
}

void dfThrust::RegisterForMOOSMessages()
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

bool dfThrust::OnStartUp()
{
  AppCastingMOOSApp::OnStartUp();
  STRING_LIST sParams;
  if (!m_MissionReader.GetConfiguration(GetAppName(), sParams))
    reportConfigWarning("No config block found for " + GetAppName());  
  STRING_LIST::iterator p;
  for (p = sParams.begin(); p != sParams.end(); p++) {
    string orig  = *p;
    string line  = *p;
    string param = tolower(biteStringX(line, '='));
    string value = line;
    
    bool handled = false;
         if (param == "heading_offset")   handled = SetParam_HEADING_OFFSET(value);
    else if (param == "publish_raw")      handled = SetParam_PUBLISH_RAW(value);
    else if (param == "direct_thrust")    handled = SetParam_DIRECT_THRUST_MODE(value);
    else if (param == "max_rudder")       handled = SetParam_MAX_RUDDER(value);
    else if (param == "max_thrust")       handled = SetParam_MAX_THRUST(value);
    else if (param == "publish_thrust")   handled = SetParam_PUBLISH_THRUST(value);
    if (!handled)
      reportUnhandledConfigWarning(orig); }
    fd = open("/dev/arduino", O_RDWR | O_NOCTTY | O_NDELAY);
    struct termios tty;
    tcgetattr(fd,&tty);
    tty.c_cflag &= ~PARENB;
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag &= CS8;
    tty.c_cflag &= ~CRTSCTS;
    tty.c_iflag &= ~(IXON|IXOFF|IXANY);
    cfsetispeed(&tty,B115200);
    tcsetattr(fd,TCSANOW,&tty);
    //close(fd);
  // OnStartup() must always return true
  //    - Or else it will quit during launch and appCast info will be unavailable
  return true;

}




bool dfThrust::OnConnectToServer()
{
  RegisterForMOOSMessages();
  return true;
}

bool dfThrust::Iterate()
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
  ThrustRudderToLR();
  m_Comms.Notify("dThrust_THRUST_L", m_des_L);
  m_Comms.Notify("dThrust_THRUST_R", m_des_R); 
    //Writing values to serial port
  char buffer[30];
  memset(buffer,0,30);
  snprintf(buffer, 30,"%.1f_%.1f&",m_des_L,m_des_R);
  write(fd,buffer,sizeof(buffer));
  m_stale_mode = stale_input;
    //char work[] = "-10.0_-10.0&";
    //while(1){
    //write(fd,work,sizeof(work));
    //}

  AppCastingMOOSApp::PostReport();
  return true;
}

  //----------------------------------------------------
  // Procedure: StaleModeCheck()
  //   Returns: true if the relevant input IS stale
  //            false if NOT stale
  bool dfThrust::StaleModeCheck()
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

      double gapRudder = curr_time - m_timestamp_des_rudder;
      double gapThrust = curr_time - m_timestamp_des_thrust;
      stale_input = (gapRudder > m_stale_threshold || gapThrust > m_stale_threshold);

  if (stale_input) {
    m_des_L       = 0.0;
    m_des_R       = 0.0;
    m_des_rudder  = 0.0;
    m_des_thrust  = 0.0; }
  return stale_input;
}



bool dfThrust::ThrustRudderToLR()
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



bool dfThrust::SetParam_HEADING_OFFSET(string sVal)
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



bool dfThrust::SetParam_MAX_RUDDER(std::string sVal)
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

bool dfThrust::SetParam_MAX_THRUST(std::string sVal)
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

bool dfThrust::SetParam_DIRECT_THRUST_MODE(std::string sVal)
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

bool dfThrust::SetParam_PUBLISH_RAW(std::string sVal)
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

bool dfThrust::handleSetThrustMode(bool setDirectThrustMode)
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

bool dfThrust::SetParam_PUBLISH_THRUST(std::string sVal)
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






void dfThrust::PublishHeading(double dHeading)
{
  dHeading += m_heading_offset;
  dHeading = angle360(dHeading);
  //Notify(m_pubNameHeading, dHeading);
}






bool dfThrust::buildReport()
{

  
  // Format doubles ahead of time
  string sOffset = doubleToString(m_heading_offset, 1);
  string sMaxRud = doubleToString(m_dMaxRudder, 1);
  string sMaxThr = doubleToString(m_dMaxThrust, 1);
  string sReqL   = doubleToString(m_des_L, 1);
  string sReqR   = doubleToString(m_des_R, 1);
  string sReqRud = doubleToString(m_des_rudder, 1);
  string sReqThr = doubleToString(m_des_thrust, 1);
  string sCommL  = doubleToString(m_commanded_L, 1);
  string sCommR  = doubleToString(m_commanded_R, 1);

  m_msgs <<   "   Magnetic offset:             " << sOffset << endl;
  m_msgs <<   "   Maximum rudder:          +/- " << sMaxRud << endl;
  m_msgs <<   "   Maximum thrust:          +/- " << sMaxThr << "%" << endl;
  m_msgs <<   "   Command mode:                ";
  m_msgs << endl;



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
    m_msgs << endl; 
  m_msgs << endl;

  m_msgs << "Status:" << endl;

  if (m_ivpAllstop) {
    m_msgs << "   --- IVPHELM ALLSTOP ENGAGED ---" << endl; }

  if (m_stale_mode) {
  m_msgs << "   --- STALE MODE ENGAGED. Motors stopped. ---" << endl;
  m_msgs << "   Stale mode will disengage when motor commands are received." << endl; }
  else
  m_msgs <<   "   Requested rudder, thrust:    " << sReqRud << ", " << sReqThr << endl;
  m_msgs <<   "   Commanded to motors L, R:    " << sCommL << ", " << sCommR << endl;
  m_msgs << "   Requested L, R:              " << sReqL << ", " << sReqR << endl;

  if (m_bDirect_thrust) {
    m_msgs << "   DESIRED_THRUST_L count:      " << m_des_count_L << endl;
    m_msgs << "   DESIRED_THRUST_R count:      " << m_des_count_R << endl; }
  else {
    m_msgs << "   DESIRED_THRUST count:        " << m_des_count_thrust << endl;
    m_msgs << "   DESIRED_RUDDER count:        " << m_des_count_rudder << endl; }

  m_msgs << endl;



  return true;
}




