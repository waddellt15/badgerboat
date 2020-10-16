#ifndef MOOSSERIAL_H
#define MOOSSERIAL_H

#include "MOOS/libMOOS/Thirdparty/AppCasting/AppCastingMOOSApp.h"

class moosserialtest;

class MOOSSerial : public AppCastingMOOSApp {
    friend moosserialtest;

    public:
        MOOSSerial();
        ~MOOSSerial();

    protected:
        bool OnNewMail(MOOSMSG_LIST &NewMail);
        bool Iterate();
        bool OnConnectToServer();
        bool OnStartUp();
        // Standard AppCastingMOOSApp function to overload
        bool buildReport();
        void registerVariables();

};

#endif