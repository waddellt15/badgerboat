#--------------------------------------------------------
# The CMakeLists.txt for:                       pGPSd
# Author(s):                              
#--------------------------------------------------------

CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

SET(SRC
  ObstacleConverter.cpp
  ObstacleConverter_Info.cpp
  main.cpp
)

ADD_EXECUTABLE(pObstacleConverter ${SRC})

TARGET_LINK_LIBRARIES(pObstacleConverter
  ${MOOS_LIBRARIES}
  ${MOOSGeodesy_LIBRARIES}
  ${MOOSIVP_LIBRARIES}
  mbutil
  apputil
  m
  pthread
  )

