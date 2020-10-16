#--------------------------------------------------------
# The CMakeLists.txt for:                       pGPSd
# Author(s):                              
#--------------------------------------------------------

CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

SET(SRC
  MOOSSerial.cpp
  MOOSSerial_Info.cpp
  main.cpp
)

ADD_EXECUTABLE(pMOOSSerial ${SRC})

TARGET_LINK_LIBRARIES(pMOOSSerial
  ${MOOS_LIBRARIES}
  ${MOOSGeodesy_LIBRARIES}
  ${MOOSIVP_LIBRARIES}
  mbutil
  apputil
  m
  pthread
  )

