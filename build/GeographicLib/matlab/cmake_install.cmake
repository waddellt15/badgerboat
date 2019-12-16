# Install script for directory: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab

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
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/matlab/geographiclib" TYPE FILE FILES
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/Contents.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/cassini_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/cassini_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/defaultellipsoid.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/ecc2flat.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/eqdazim_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/eqdazim_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/flat2ecc.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/gedistance.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/gedoc.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geocent_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geocent_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geodarea.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geoddistance.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geoddoc.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geodreckon.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geographiclib_test.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geoid_height.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/geoid_load.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/gereckon.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/gnomonic_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/gnomonic_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/loccart_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/loccart_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/mgrs_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/mgrs_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/polarst_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/polarst_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/projdoc.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/tranmerc_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/tranmerc_inv.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/utmups_fwd.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/utmups_inv.m"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/matlab/geographiclib/private" TYPE FILE FILES
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/A1m1f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/A2m1f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/A3coeff.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/A3f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/AngDiff.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/AngNormalize.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/AngRound.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C1f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C1pf.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C2f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C3coeff.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C3f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C4coeff.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/C4f.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/G4coeff.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/GeoRotation.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/LatFix.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/SinCosSeries.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/atan2dx.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/cbrtx.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/copysignx.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/cvmgt.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/eatanhe.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/geoid_file.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/geoid_load_file.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/norm2.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/remx.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/sincosdx.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/sumx.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/swap.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/tauf.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib/private/taupf.m"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/matlab/geographiclib-legacy" TYPE FILE FILES
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/Contents.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/geocentricforward.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/geocentricreverse.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/geodesicdirect.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/geodesicinverse.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/geodesicline.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/geoidheight.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/localcartesianforward.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/localcartesianreverse.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/mgrsforward.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/mgrsreverse.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/polygonarea.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/utmupsforward.m"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/matlab/geographiclib-legacy/utmupsreverse.m"
    )
endif()

