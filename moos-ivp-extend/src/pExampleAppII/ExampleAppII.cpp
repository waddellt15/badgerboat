/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: ExampleAppII.cpp                                        */
/*    DATE:                                                 */
/************************************************************/

#include <list>
#include <iterator>
#include "MBUtils.h"
#include "ExampleAppII.h"

using namespace std;

//---------------------------------------------------------
// Constructor

ExampleAppII::ExampleAppII()
{
}

//---------------------------------------------------------
// Destructor

ExampleAppII::~ExampleAppII()
{
}

//---------------------------------------------------------
// Procedure: OnNewMail

bool ExampleAppII::OnNewMail(MOOSMSG_LIST &NewMail)
{
   MOOSMSG_LIST::iterator p;
   
   for(p=NewMail.begin(); p!=NewMail.end(); p++) {
      CMOOSMsg &msg = *p;
      std::string key = msg->GetKey();
      
      if(key == "VAR_A")
      {
        // do VAR_A stuff
      }
      else if(key == "VAR_B")
      {
        // do VAR_B stuff
      }
   }
	
   return(true);
}

//---------------------------------------------------------
// Procedure: OnConnectToServer

bool ExampleAppII::OnConnectToServer()
{
   RegisterVariables();
   return(true);
}

//---------------------------------------------------------
// Procedure: Iterate()

bool ExampleAppII::Iterate()
{
   // happens AppTick times per second
	
   return(true);
}

//---------------------------------------------------------
// Procedure: OnStartUp()
// happens before connection is open

bool ExampleAppII::OnStartUp()
{
  list<string> sParams;                                                                                         
  if(m_MissionReader.GetConfiguration(GetAppName(), sParams)) {         
    list<string>::iterator p;                                           
    for(p=sParams.begin(); p!=sParams.end(); p++) {                 
      string original_line = *p;                                    
      string line = *p;                                    
      string param = stripBlankEnds(toupper(biteString(line, '=')));  
      string value = stripBlankEnds(line);
                                                           
      if(param == "FOO") {                                      
        //handled                                               
      }                                                             
      else if(param == "BAR") {                                  
        //handled                                     
      }                            
    }
  } 

  RegisterVariables();	
  return(true);
}

//---------------------------------------------------------
// Procedure: RegisterVariables

void ExampleAppII::RegisterVariables()
{
  // Register("FOOBAR", 0);
}

