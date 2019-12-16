/***************************************************************/
/*  NAME: Alon Yaari                                           */
/*  ORGN: Dept of Mechanical Eng / CSAIL, MIT Cambridge MA     */
/*  FILE: main.cpp  (for iM200)                                */
/*  DATE: Dec 2014                                             */
/***************************************************************/

#include <string>
#include "M200.h"
#include "M200_Info.h"
#include "MBUtils.h"

using namespace std;

int main(int argc, char *argv[])
{
  string mission_file;
  string run_command = argv[0];

  for (int i = 1; i < argc; i++) {
    string argi = argv[i];
    if ((argi == "-e") || (argi == "--example") || (argi == "-example"))
      showExampleConfigAndExit();
    else if ((argi == "-h") || (argi == "--help") || (argi=="-help"))
      showHelpAndExit();
    else if ((argi == "-i") || (argi == "--interface"))
      showInterfaceAndExit();
    else if (strEnds(argi, ".moos") || strEnds(argi, ".moos++"))
      mission_file = argv[i];
    else if (strBegins(argi, "--alias="))
      run_command = argi.substr(8);
    else if (i == 2)
      run_command = argi; }

  if (mission_file == "")
    showHelpAndExit();

   iM200 m200;
   m200.Run(run_command.c_str(),mission_file.c_str());

  return 0;
}

