/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: ExampleAppIIMain.cpp                                    */
/*    DATE:                                                 */
/************************************************************/

#include <string>
#include "ExampleAppII.h"

using namespace std;

int main(int argc, char *argv[])
{
  // default parameters file
  string sMissionFile = "ExampleAppII.moos";
        
  //under what name shoud the application register with the MOOSDB?
  string sMOOSName = "pExampleAppII";
  
  switch(argc)
    {
    case 3:
      //command line says don't register with default name              
      sMOOSName = argv[2];
    case 2:
      //command line says don't use default config file
      sMissionFile = argv[1];
    }
  
  //make an application
  ExampleAppII ExampleAppIIApp;

  //run it
  ExampleAppIIApp.Run(sMOOSName.c_str(), sMissionFile.c_str());
  
  return(0);
}

