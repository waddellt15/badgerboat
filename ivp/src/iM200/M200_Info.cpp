/***************************************************************/
/*  NAME: Alon Yaari                                           */
/*  ORGN: Dept of Mechanical Eng / CSAIL, MIT Cambridge MA     */
/*  FILE: M200_Info.cpp                                        */
/*  DATE: Dec 2014                                             */
/***************************************************************/


#include <cstdlib>
#include <iostream>
#include "M200_Info.h"
#include "ColorParse.h"
#include "ReleaseInfo.h"

using namespace std;

void showSynopsis()
{
  blk("SYNOPSIS:                                                       ");
  blk("------------------------------------                            ");
  blk("  Connects with Clearpath Robotics Kingfisher M200 via a TCP    ");
  blk("  port. Receives NMEA-style status messages from the vehicle    ");
  blk("  and manages sending NMEA-style commands to the vehicle.       ");
  blk("                                                                ");
  blk("  NMEA SENTENCES FROM THE VEHICLE                               ");
  blk("  iM200 parses incoming messages for battery voltage and GPS.   ");
  blk("                                                                ");
  blk("  NMEA SENTENCES TO THE VEHICLE                                 ");
  blk("  The only sentences sent to the vehicle are to thrust commands.");
  blk("  The M200 is actuated via differential drive. Values for       ");
  blk("  left-side-thrust and right-side-thrust are send via an NMEA   ");
  blk("  sentence. iM200 has two thrust modes:                         ");
  blk("     DIRECT-THRUST MODE                                         ");
  blk("       iM200 receives DIRECT_THRUST_L and DIRECT_THRUST_R. These");
  blk("       values are passed through to the front seat.             ");
  blk("     RUDDER-THRUST MODE                                         ");
  blk("       iM200 receives DEISRED_RUDDER and DESIRED_THRUST then    ");
  blk("       calculates motor thrust for the left and right motors to ");
  blk("       send to the front seat.                                  ");
  blk("   Note that in either mode, thrust to each motor is capped by  ");
  blk("   the MAX_THRUST value in the mision file.                     ");
}

void showHelpAndExit()
{
  blk("                                                                ");
  blu("=============================================================== ");
  blu("Usage: iM200 file.moos [OPTIONS]                                ");
  blu("=============================================================== ");
  blk("                                                                ");
  showSynopsis();
  blk("                                                                ");
  blk("Options:                                                        ");
  mag("  --example, -e                                                 ");
  blk("      Display example MOOS configuration block.                 ");
  mag("  --help, -h                                                    ");
  blk("      Display this help message.                                ");
  mag("  --interface, -i                                               ");
  blk("      Display MOOS publications and subscriptions.              ");
  blk("                                                                ");
  blk("Note: If argv[2] does not otherwise match a known option,       ");
  blk("      then it will be interpreted as a run alias. This is       ");
  blk("      to support pAntler launching conventions.                 ");
  blk("                                                                ");
  exit(0);
}

void showExampleConfigAndExit()
{
  blk("                                                                ");
  blu("================================================================");
  blu("iM200 Example MOOS Configuration                                ");
  blu("================================================================");
  blk("                                                                ");
  blk("ProcessConfig = iM200");
  blk("{");
  blk("  AppTick        = 10");
  blk("  CommsTick      = 10");
  blk("");
  blk("  PORT_NUMBER    = 29500");
  blk("  IP_ADDRESS     = localhost // Default is 'localhost'");
  blk("  GPS_PREFIX     = NAV_      // Prepended to GPS position messages.");
  blk("  DIRECT_THRUST  = false     // Default is false.        ");
  blk("                             // When true, vehicle is in direct-thrust mode.");
  blk("                             // When false, vehicle is in rudder-thrust mode.");
  blk("  HEADING_OFFSET = 0.0       // Offset to add to published heading ");
  blk("  PUBLISH_RAW    = false     // When true, publish all messages from");
  blk("                             // front seat to M200_RAW_NMEA");
  blk("  MAX_RUDDER     = 50.0      // Rudder value will be capped to this, +/-");
  blk("  MAX_THRUST     = 100.0     // Thrust value to each motor will be");
  blk("                             // capped to this value, +/-");
  blk("  PUBLISH_THRUST = false     // When true, publishes M200_THRUST_L and _R");
  blk("}");
  blk("                                                                ");
  exit(0);
}

void showInterfaceAndExit()
{
  blk("                                                                     ");
  blu("=====================================================================");
  blu("iM200 INTERFACE                                                      ");
  blu("=====================================================================");
  blk("                                                                     ");
  showSynopsis();
  blk("                                                                     ");
  blk("SUBSCRIPTIONS:                                                       ");
  blk("------------------------------------                                 ");
  blk("                                                                     ");
  grn("  // When DIRECT_THRUST==true (direct-thrust mode):                  ");
  blk("  DESIRED_THRUST_L double Value to be commanded to left-side motor   ");
  blk("  DESIRED_THRUST_R double Value to be commanded to right-side motor  ");
  grn("  // When DIRECT_THRUST==false (rudder-thrust mode):                 ");
  blk("  DESIRED_THRUST   double Percent thrust                             ");
  blk("  DESIRED_RUDDER   double Rudder angle                               ");
  blk("                                                                     ");
  blk("PUBLICATIONS:                                                        ");
  blk("------------------------------------                                 ");
  blk("  [gps_prefix]_X       double Current X position on the local grid   ");
  blk("  [gps_prefix]_Y       double Current Y position on the local grid   ");
  blk("  [gps_prefix]_LAT     double Current latitude                       ");
  blk("  [gps_prefix]_LONG    double Current longitude                      ");
  blk("  [gps_prefix]_SPEED   double 0 or positive number; speed in m/s     ");
  blk("  [gps_prefix]_HEADING double [0, 360) Vehicle heading from true N,  ");
  blk("                              offset by HEADING_OFFSET               ");
  blk("  NAV_HEADING          double Vehicle heading in degrees from N      ");
  blk("  NMEA_MSG             double Sentences from the GPS                 ");
  blk("  M200_BATT_VOLTAGE    double Battery voltage from front seat        ");
  blk("  M200_RAW_NMEA        string All front seat sentences, published    ");
  blk("                              only when PUBLISH_RAW is true.         ");
  blk("  M200_THRUST_L        double Thrust to frontseat for left motor     ");
  blk("  M200_THRUST_R        double Thrust to frontseat for right motor    ");
  blk("                                                                     ");
  exit(0);
}

