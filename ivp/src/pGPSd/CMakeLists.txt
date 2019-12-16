#--------------------------------------------------------
# The CMakeLists.txt for:                       pGPSd
# Author(s):                              
#--------------------------------------------------------

CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

SET(SRC
  GPSd.cpp
  GPSd_Info.cpp
  main.cpp
)

ADD_EXECUTABLE(pGPSd ${SRC})

TARGET_LINK_LIBRARIES(pGPSd
  ${MOOS_LIBRARIES}
  ${MOOSGeodesy_LIBRARIES}
  mbutil
  apputil
  m
  pthread
  gps)

