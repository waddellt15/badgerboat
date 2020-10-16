/************************************************************/
/*    NAME:                                               */
/*    ORGN: MIT                                             */
/*    FILE: ExampleAppII.h                                          */
/*    DATE:                                                 */
/************************************************************/

#ifndef ExampleAppII_HEADER
#define ExampleAppII_HEADER

#include "MOOS/libMOOS/MOOSLib.h"

class ExampleAppII : public CMOOSApp
{
 public:
  ExampleAppII();
  virtual ~ExampleAppII();

  bool OnNewMail(MOOSMSG_LIST &NewMail);
  bool Iterate();
  bool OnConnectToServer();
  bool OnStartUp();
  void RegisterVariables();

protected:
  // insert local vars here
};

#endif 
