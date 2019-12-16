/****************************************************************/
/*   NAME:                                              */
/*   ORGN: MIT Cambridge MA                                     */
/*   FILE: GPSd_Info.cpp                               */
/*   DATE: Dec 29th 1963                                        */
/****************************************************************/

#include <cstdlib>
#include <iostream>
#include "GPSd_Info.h"
#include "ColorParse.h"
#include "ReleaseInfo.h"

using namespace std;

//----------------------------------------------------------------
// Procedure: showSynopsis

void showSynopsis()
{
  blk("SYNOPSIS:                                                       ");
  blk("------------------------------------                            ");
  blk("  The pGPSd application is used for interfacing a gpsd instance ");
  blk(" to a MOOS community. It pulls out the position, speed, mode,   ");
  blk(" and altitude as well as the JSON sentences transmitted by the  ");
  blk(" gpsd service. These sentences may include AIS transmissions if ");
  blk(" a proper receiver has been attached to the host and configured.");
  blk("                                                                ");
}

//----------------------------------------------------------------
// Procedure: showHelpAndExit

void showHelpAndExit()
{
  blk("                                                                ");
  blu("=============================================================== ");
  blu("Usage: pGPSd file.moos [OPTIONS]                   ");
  blu("=============================================================== ");
  blk("                                                                ");
  showSynopsis();
  blk("                                                                ");
  blk("Options:                                                        ");
  mag("  --alias","=<ProcessName>                                      ");
  blk("      Launch pGPSd with the given process name         ");
  blk("      rather than pGPSd.                           ");
  mag("  --example, -e                                                 ");
  blk("      Display example MOOS configuration block.                 ");
  mag("  --help, -h                                                    ");
  blk("      Display this help message.                                ");
  mag("  --interface, -i                                               ");
  blk("      Display MOOS publications and subscriptions.              ");
  mag("  --version,-v                                                  ");
  blk("      Display the release version of pGPSd.        ");
  blk("                                                                ");
  blk("Note: If argv[2] does not otherwise match a known option,       ");
  blk("      then it will be interpreted as a run alias. This is       ");
  blk("      to support pAntler launching conventions.                 ");
  blk("                                                                ");
  exit(0);
}

//----------------------------------------------------------------
// Procedure: showExampleConfigAndExit

void showExampleConfigAndExit()
{
  blk("                                                                ");
  blu("=============================================================== ");
  blu("pGPSd Example MOOS Configuration                   ");
  blu("=============================================================== ");
  blk("                                                                ");
  blk("ProcessConfig = pGPSd                              ");
  blk("{                                                               ");
  blk("  AppTick   = 4                                                 ");
  blk("  CommsTick = 1                                                 ");
  blk("  host = localhost                                              ");
  blk("  mag_model = emm2015                                           ");
  blk("  declination_update = 600                                      ");
  blk("  port = 2947                                                   ");
  blk("                                                                ");
  blk("}                                                               ");
  blk("                                                                ");
  exit(0);
}


//----------------------------------------------------------------
// Procedure: showInterfaceAndExit

void showInterfaceAndExit()
{
  blk("                                                                ");
  blu("=============================================================== ");
  blu("pGPSd INTERFACE                                    ");
  blu("=============================================================== ");
  blk("                                                                ");
  showSynopsis();
  blk("                                                                ");
  blk("SUBSCRIPTIONS:                                                  ");
  blk("------------------------------------                            ");
  blk("  pGPSd does not subscribe to any variables                     ");
  blk("                                                                ");
  blk("PUBLICATIONS:                                                   ");
  blk("------------------------------------                            ");
  blk("                                                                ");
  blk("  GPSD_json -- A STRING that contains a JSON array of all gpsd  ");
  blk("               packets received since last iteration.           ");
  blk("  GPSD_mode -- A DOUBLE containing the current GPS fix mode.    ");
  blk("  GPSD_latitude -- A DOUBLE containing the latitude in decimal  ");
  blk("                   degrees.                                     ");
  blk("  GPSD_longitude -- A DOUBLE containing the longitude in decimal");
  blk("                    degrees.                                    ");
  blk("  GPSD_elevation -- A DOUBLE containing the elevation in meters ");
  blk("                    above MSL.                                  "); 
  blk("  GPSD_speed -- A DOUBLE containing the speed over ground in    ");
  blk("                meters per second.                              ");
  blk("  GPSD_track -- A DOUBLE containing the course over ground in   ");
  blk("                degrees clockwise from true north.              ");
  blk("  GPSD_declination -- A DOUBLE containing the magnetic          ");
  blk("                      declination, in degrees from true.        "); 
  blk("                                                                ");
  exit(0);
}

//----------------------------------------------------------------
// Procedure: showReleaseInfoAndExit

void showReleaseInfoAndExit()
{
  showReleaseInfo("pGPSd", "gpl");
  exit(0);
}

