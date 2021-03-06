# Install script for directory: /home/badgerboat/moos/moos-ivp/ivp/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/bin" TYPE DIRECTORY PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "/home/badgerboat/moos/moos-ivp/bin/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE DIRECTORY FILES "/home/badgerboat/moos/moos-ivp/lib/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/include" TYPE DIRECTORY FILES "/home/badgerboat/moos/moos-ivp/include/" FILES_MATCHING REGEX ".*\\.h")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/badgerboat/moos/moos-ivp/build/lib_behaviors/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_behaviors-marine/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_behaviors-colregs/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_bhvutil/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_genutil/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_geometry/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_helmivp/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ivpbuild/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ivpcore/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ivpsolve/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_logic/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_encounters/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_apputil/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_contacts/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ufield/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ufld_hazards/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_logutils/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_mbutil/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_manifest/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_henrik_anneal/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_SimpleSerial/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_gpsParser/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_NMEAParse/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_clearpath/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ipfview/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_marineview/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_zaicview/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/lib_ucommand/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_aloggrep/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogscan/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogcd/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogpare/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogeplot/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogrm/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogiter/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogcat/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogclip/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_aloghelm/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_nsplug/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_pickpos/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_manifest_test/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pEchoVar/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pEvalLoiter/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pHelmIvP/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pMarinePID/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pBasicContactMgr/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pDeadManPost/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pNodeReporter/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pObstacleMgr/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pFrontEstimate/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldMessageHandler/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldNodeBroker/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uHelmScope/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uTimerScript/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uProcessWatch/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uMemWatch/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uLoadWatch/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uTermCommand/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uXMS/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uMAC/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uPokeDB/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uQueryDB/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pHostInfo/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/iSay/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pDifferentialThrust/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pGPSd/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogsplit/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogsort/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogcheck/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogtest/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_gen_hazards/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_gen_obstacles/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_bhv2graphviz/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pXRelay/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldCollisionDetect/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldLoiterAssign/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldPathCheck/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldShoreBroker/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldScope/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldNodeComms/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldBeaconRangeSensor/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldContactRangeSensor/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldObstacleSim/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldHazardSensor/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldHazardMgr/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldHazardMetric/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldGenericSensor/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldWrapDetect/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pSearchGrid/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uSimMarine/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pFrontGridRender/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pGradeFrontEstimate/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFldCTDSensor/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_ffview/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_geoview/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_alogview/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_zaic_hleq/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_zaic_vect/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_zaic_hdg/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_zaic_spd/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/app_zaic_peak/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/pMarineViewer/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uFunctionVis/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uMACView/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uPlotViewer/cmake_install.cmake")
  include("/home/badgerboat/moos/moos-ivp/build/uCommand/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/badgerboat/moos/moos-ivp/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
