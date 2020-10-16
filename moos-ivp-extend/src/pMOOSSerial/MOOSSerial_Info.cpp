#include <cstdlib>
#include <iostream>
#include "ColorParse.h"
#include "ReleaseInfo.h"

//----------------------------------------------------------------
// Procedure: showSynopsis
void showSynopsis(){}


//----------------------------------------------------------------
// Procedure: showHelpAndExit
void showHelpAndExit(){
  blk("                                                                ");
  blu("=============================================================== ");
  blu("Usage: pMOOSSerial file.moos [OPTIONS]                   ");
  blu("=============================================================== ");
  blk("                                                                ");
  showSynopsis();
  blk("                                                                ");
  blk("Options:                                                        ");
  mag("  --alias","=<ProcessName>                                      ");
  blk("      Launch pMOOSSerial with the given process name     ");
  blk("      rather than pMOOSSerial.                           ");
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
void showExampleConfigAndExit(){
  blk("                                                                ");
  blu("=============================================================== ");
  blu("pMOOSSerial Example MOOS Configuration                   ");
  blu("=============================================================== ");
  blk("                                                                ");
  blk("ProcessConfig = pObstacleConverter                              ");
  blk("{                                                               ");
  blk("  AppTick   = 4                                                 ");
  blk("  CommsTick = 1                                                 ");
  blk("                                                                ");
  blk("}                                                               ");
  blk("                                                                ");
  exit(0);
}


//----------------------------------------------------------------
// Procedure: showInterfaceAndExit
void showInterfaceAndExit(){

    exit(0);
}


//----------------------------------------------------------------
// Procedure: showReleaseInfoAndExit

void showReleaseInfoAndExit(){
  showReleaseInfo("pMOOSSerial", "gpl");
  exit(0);
}