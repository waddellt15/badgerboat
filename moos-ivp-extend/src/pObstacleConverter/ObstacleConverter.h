/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: ObstacleConverter.h                                          */
/*    DATE: December 29th, 1963                             */
/************************************************************/

#ifndef OBSTCONV_HEADER
#define OBSTCONV_HEADER

#include "MOOS/libMOOS/Thirdparty/AppCasting/AppCastingMOOSApp.h"
#include "MOOS/libMOOS/MOOSLib.h"
#include "MOOS/libMOOSGeodesy/MOOSGeodesy.h"
#include "MBUtils.h"
#include "AngleUtils.h"
#include <string>
#include <chrono>
#include <sstream>
#include <map>
#define _USE_MATH_DEFINES
#include <math.h>

class obstacleconvertertest; // forward declaration so we can declare the test harness as a friend

class ObstacleConverter : public AppCastingMOOSApp
{
    friend obstacleconvertertest;

public:
    ObstacleConverter();
    ~ObstacleConverter();

protected: // Standard MOOSApp functions to overload
    bool OnNewMail(MOOSMSG_LIST &NewMail);
    bool Iterate();
    bool OnConnectToServer();
    bool OnStartUp();
    // Standard AppCastingMOOSApp function to overload
    bool buildReport();
    void registerVariables();

    // Configuration Variables
    int batchSize;
    std::string varIn;
    std::string varOut;

    // State Variables
    std::vector<std::string> points;
    struct Pose
    {
        double x;
        double y;
        double head;
    };
    Pose boatPose;
    struct RadPoint
    {
        double r;
        double theta;
        int label;
    };

    // Helper Function to process incoming points
    std::string handleNewPoint(std::string point_in)
    {
        RadPoint pt = stringToPoint(point_in);

        double beta = pt.theta + boatPose.head + (M_PI / 2.0);
        double sb = sin(beta);
        double cb = cos(beta);

        double x_g = boatPose.x + (pt.r * cb);
        double y_g = boatPose.y + (pt.r * sb);

        std::string out = "x="+std::to_string(x_g)+","+"y="+std::to_string(y_g)+","+"label="+std::to_string(pt.label);
        return out;
    }

    // Helper Function to convert string to point
    RadPoint stringToPoint(std::string in)
    {
        std::vector<std::string> slist = parseString(in, ',');
        RadPoint out;
        for (int i = 0; i < slist.size(); i++)
        {
            std::string param = biteStringX(slist[i], '=');
            std::string value = slist[i];

            if (param == "r" || param == "R")
            {
                out.r = std::stod(value);
            }
            else if (param == "theta")
            {
                out.theta = std::stod(value);
            }
            else if (param == "label" || param == "key")
            {
                out.label = std::stod(value);
            }
        }
        return out;
    }
};

#endif
