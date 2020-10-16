/***************************************************************/
/*  NAME: Taylor Waddell                                           */
/*  ORGN: Dept of Mechanical Eng / CSAIL, MIT Cambridge MA     */
/*  FILE: dThrust_Info.cpp                                        */
/*  DATE: Dec 2014                                             */
/***************************************************************/


#include <cstdlib>
#include <iostream>
#include "dThrust_Info.h"
#include "ColorParse.h"
#include "ReleaseInfo.h"

using namespace std;

void showSynopsis()
{
  blk("SYNOPSIS:                                                       ");
  blk("------------------------------------                            ");
  blk("     RUDDER-THRUST MODE                                         ");
  blk("       receives DEISRED_RUDDER and DESIRED_THRUST then    ");
  blk("       calculates motor thrust for the left and right motors to ");
  blk("       send to the front seat.                                  ");
  blk("  thrust to each motor is capped by  ");
  blk("   the MAX_THRUST value in the mision file.                     ");
}

void showHelpAndExit()
{
  blk("                                                                ");
  blu("=============================================================== ");
  blu("Usage: dThrust file.moos [OPTIONS]                                ");
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
  blu("dThrust INTERFACE                                                      ");
  blu("=====================================================================");
  blk("                                                                     ");
  showSynopsis();
  blk("                                                                     ");
  blk("SUBSCRIPTIONS:                                                       ");
  blk("------------------------------------                                 ");
  blk("                                                                     ");
  grn("  // When DIRECT_THRUST==false (rudder-thrust mode):                 ");
  blk("  DESIRED_THRUST   double Percent thrust                             ");
  blk("  DESIRED_RUDDER   double Rudder angle                               ");
  blk("                                                                     ");
  blk("PUBLICATIONS:                                                        ");
  blk("------------------------------------                                 ");
  blk("  M200_THRUST_L        double Thrust to frontseat for left motor     ");
  blk("  M200_THRUST_R        double Thrust to frontseat for right motor    ");
  blk("                                                                     ");
  exit(0);
}

