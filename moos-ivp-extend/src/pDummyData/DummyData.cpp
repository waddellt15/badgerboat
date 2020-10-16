/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: DummyData.cpp                            */
/*    DATE:                                                 */
/************************************************************/

#include "DummyData.h"
#include <iostream>
#include <stdio.h>
#include <thread>
#include <ctime>
#include <chrono>
#include <cmath>


//---------------------------------------------------------
// Constructor
DummyData::DummyData() {}

//---------------------------------------------------------
// Destructor
DummyData::~DummyData() {}
//---------------------------------------------------------
// Procedure: OnStartUp()
bool DummyData::OnStartUp()
{
  AppCastingMOOSApp::OnStartUp();

  // No params to use curently but keeping this template here in case
/*
  STRING_LIST sParams;
  m_MissionReader.EnableVerbatimQuoting(false);

  if (!m_MissionReader.GetConfiguration(GetAppName(), sParams))
  {
    reportConfigWarning("No config block found for " + GetAppName());
  }

  STRING_LIST::iterator p;
  for (p = sParams.begin(); p != sParams.end(); p++)
  {
    std::string orig = *p;
    std::string line = *p;
    std::string param = toupper(biteStringX(line, '='));
    std::string value = line;
    bool handled = false;

    if (param == "BatchSize")
    {
      this->batchSize = std::stoi(value);
      handled = true;
    }

    if (!handled)
    {
      reportUnhandledConfigWarning(orig);
    }
  }
*/
  registerVariables();
  return true;
}

//---------------------------------------------------------
// Procedure: OnConnectToServer
bool DummyData::OnConnectToServer()
{
  registerVariables();
  return true;
}

//---------------------------------------------------------
// Procedure: OnNewMail
bool DummyData::OnNewMail(MOOSMSG_LIST &newMail)
{
  AppCastingMOOSApp::OnNewMail(newMail);
  return true;
}

//---------------------------------------------------------
// Procedure: Iterate
bool DummyData::Iterate()
{
  AppCastingMOOSApp::Iterate();

  Notify("ROS_POINT", "r=1.0,theta=0.0,label=1");
  Notify("NAV_X", 0.0);
  Notify("NAV_Y", 0.0);
  Notify("NAV_HEADING", 0.0);

  return true;
}

//---------------------------------------------------------
// Procedure: registerVariables
void DummyData::registerVariables(){}

//------------------------------------------------------------
// Procedure: buildReport()

bool DummyData::buildReport()
{
  m_msgs << "============================================ \n";
  m_msgs << "File: DummyData.cpp                  \n";
  m_msgs << "============================================ \n";
  m_msgs << "Publishing:                                  \n";
  m_msgs << "  ROS_POINT: r=1.0,theta=0.0,label=1         \n";
  m_msgs << "  NAV_X: 0.0                                 \n";
  m_msgs << "  NAV_Y: 0.0                                 \n";
  m_msgs << "  NAV_HEADING: 0.0                           \n";
  m_msgs << "============================================ \n";

  return true;
}