# Install script for directory: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/GeographicLib" TYPE FILE FILES
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Accumulator.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/AlbersEqualArea.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/AzimuthalEquidistant.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/CassiniSoldner.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/CircularEngine.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Constants.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/DMS.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Ellipsoid.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/EllipticFunction.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GARS.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GeoCoords.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Geocentric.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Geodesic.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GeodesicExact.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GeodesicLine.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GeodesicLineExact.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Geohash.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Geoid.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Georef.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Gnomonic.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GravityCircle.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/GravityModel.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/LambertConformalConic.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/LocalCartesian.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/MGRS.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/MagneticCircle.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/MagneticModel.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Math.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/NearestNeighbor.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/NormalGravity.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/OSGB.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/PolarStereographic.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/PolygonArea.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Rhumb.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/SphericalEngine.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/SphericalHarmonic.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/SphericalHarmonic1.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/SphericalHarmonic2.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/TransverseMercator.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/TransverseMercatorExact.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/UTMUPS.hpp"
    "/home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/include/GeographicLib/Utility.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/GeographicLib" TYPE FILE FILES "/home/badgerboat/moos/moos-ivp/build/GeographicLib/include/GeographicLib/Config.h")
endif()

