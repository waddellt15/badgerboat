#--------------------------------------------------------
# The CMakeLists.txt for:                       pGPSd
# Author(s):                              
#--------------------------------------------------------

CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

SET(SRC
  DummyData.cpp
  DummyData_Info.cpp
  main.cpp
)

ADD_EXECUTABLE(pDummyData ${SRC})

TARGET_LINK_LIBRARIES(pDummyData
  ${MOOS_LIBRARIES}
  ${MOOSGeodesy_LIBRARIES}
  ${MOOSIVP_LIBRARIES}
  mbutil
  apputil
  m
  pthread
  )

