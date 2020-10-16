#--------------------------------------------------------
# The CMakeLists.txt for:                      dThrust
# Author(s):                              Taylor Waddell
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

ADD_EXECUTABLE(dThrust ${SRC})
find_package(PythonLibs REQUIRED)
include_directories(${PYTHON_INCLUDE_DIRS})   
TARGET_LINK_LIBRARIES(dThrust
   ${MOOS_LIBRARIES}
   ${PYTHON_LIBRARIES}
   geometry
   mbutil
   ${SYSTEM_LIBS} )
