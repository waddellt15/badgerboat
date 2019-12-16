#--------------------------------------------------------
# The CMakeLists.txt for:                      iM200
# Author(s):                              Alon Yaari
#--------------------------------------------------------

# Set System Specific Libraries
if (${WIN32})
  # Windows Libraries
  SET(SYSTEM_LIBS
     wsock32 )
else (${WIN32})
  # Linux and Apple Libraries
  SET(SYSTEM_LIBS
      m
      pthread )
endif (${WIN32})

FILE(GLOB SRC *.cpp)

ADD_EXECUTABLE(iM200 ${SRC})
   
TARGET_LINK_LIBRARIES(iM200
   ${MOOSGeodesy_LIBRARIES}
   ${MOOS_LIBRARIES}
   gpsParser
   NMEAParse
   geometry
   mbutil
   ${SYSTEM_LIBS} )
