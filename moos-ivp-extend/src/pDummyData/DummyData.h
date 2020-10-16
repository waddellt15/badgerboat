/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: DummyData.h                                          */
/*    DATE: December 29th, 1963                             */
/************************************************************/

#ifndef DUMMYDATA_H
#define DUMMYDATA_H

#include "MOOS/libMOOS/Thirdparty/AppCasting/AppCastingMOOSApp.h"
#include "MOOS/libMOOS/MOOSLib.h"
#include "MOOS/libMOOSGeodesy/MOOSGeodesy.h"
#include "MBUtils.h"
#include <string>
#include <chrono>
#include <sstream>
#include <map>



class DummyDatatest; // forward declaration so we can declare the test harness as a friend

class DummyData : public AppCastingMOOSApp
{
    friend DummyDatatest;

public:
    DummyData();
    ~DummyData();

protected: // Standard MOOSApp functions to overload
    bool OnNewMail(MOOSMSG_LIST &NewMail);
    bool Iterate();
    bool OnConnectToServer();
    bool OnStartUp();
    // Standard AppCastingMOOSApp function to overload
    bool buildReport();
    void registerVariables();

};

#endif
