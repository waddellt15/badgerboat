/*
Header file for the remote device conneting with pMOOSSerial.
Contains Protocal info and serial wrapper class.
Include in MOOS App as well as remote device (Arduino, etc.)

USAGE:
    
*/

#ifndef MOOS_SERIAL_H
#define MOOS_SERIAL_H

#include <moos_serial_hal.h>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <fcntl.h>
#include <errno.h>

#if defined(linux) || defined(unix) || defined(__linux__) || defined(__unix__)
#include "HAL\linux.h"
#elif defined(WIN32) || defined(_WIN32) || defined(__WIN32__)
#include "HAL\win.h" //Likely wont be used (or even written)
#elif defined(ADUINO)
#endif


namespace MOOSSerial
{
using std::string;
using std::vector;

class MOOSVar
{
public:
    MOOSVar() {}
    MOOSVar(string name, string type, string sval = "", double dval = 0.0)
    {
        this->name = name;
        this->type = type;
        this->sval = sval;
        this->dval = dval;
    }
    ~MOOSVar() {}

    string name;
    string type;
    string sval;
    double dval;
};

class SerialMOOS
{
public:
#ifdef unix
    SerialMOOS(bool isMOOS, string port, int baud);
#elif ARDUINO
    SerialMOOS(int port, int baud);
#elif WIN_32
    SerialMOOS();
#endif

    ~SerialMOOS();

    // update()
    // Read messages from serial buffer to inbox, send messages in the outbox queue.
    // Must be called periodically.
    void update() {}
    // Defined at end of this file in system-specific functions


    // addPublished()
    // Add message name and type to list of variables to be sent
    void addPublished(string name, string type)
    {
        MOOSVar msg = MOOSVar(name, type);
        published_vars.push_back(msg);
    }

    // addSubscribed()
    // Add message name and type to list of variables to be recieved
    void addSubscribed(string name, string type)
    {
        MOOSVar msg = MOOSVar(name, type);
        subscribed_vars.push_back(msg);
    }

    // Initial communication with other device. Peripheral tells MOOS what it wants to send/recieve,
    // MOOS needs to know what the peripheral recieves so it can register
    vector<string> setup() {}

    // add message to the outbox queue
    bool push(string name, string type, string sval = "", double dval = 0.0)
    {
        MOOSVar msg = MOOSVar(name, type, sval, dval);
        outbox.push_back(msg);
    }
    // get messages of name in from the inbox
    bool retrieve(string name)
    {
    }

private:
    // Encoding characters
    const char MSG_SEPARATOR = ';';
    const char FIELD_SEPARATOR = ':';
    const char ESCAPE_CHAR = '+';
    // Special operation key-characters
    const char SETUP_CHAR = 'S';
    // Terminator (End Of Data)
    const char EOD = 'T';

    char SPECIAL_CHARS[6] = {MSG_SEPARATOR, FIELD_SEPARATOR, ESCAPE_CHAR, SETUP_CHAR, EOD};

    // for keeping track of names and types
    vector<MOOSVar> published_vars;
    vector<MOOSVar> subscribed_vars;
    // actual sent/recieved data
    vector<MOOSVar> inbox;
    vector<MOOSVar> outbox;

    string encode(MOOSVar in) {}
    void decode(string in) {}
};
} // namespace MOOSSerial

#endif