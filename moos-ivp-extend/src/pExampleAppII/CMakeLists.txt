#--------------------------------------------------------
# The CMakeLists.txt for:                       pExampleAppII
# Author(s):                              
#--------------------------------------------------------

FILE(GLOB SRC *.cpp)

ADD_EXECUTABLE(pExampleAppII ${SRC})

TARGET_LINK_LIBRARIES(pExampleAppII
   ${MOOS_LIBRARIES}
   mbutil
   m
   pthread)

