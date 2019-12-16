# Configuration file for MOOS library.

# Pick up the auto-generated file which knows how to add the imported library
# targets for the libraries that MOOS exports.
set(exports_file "${CMAKE_CURRENT_LIST_DIR}/MOOSTargets.cmake")
include(${exports_file})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MOOS DEFAULT_MSG exports_file)

#include(CMakeFindDependencyMacro)   #mikerb comment this out
set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)
#find_dependency(Threads REQUIRED)  #mikerb switch
find_package(Threads REQUIRED)

# Support existing projects that expect to find MOOS_LIBRARIES and
# MOOS_INCLUDE_DIRS variables.
# MOOS_INCLUDE_DIRS is no longer needed, as CMake brings
# in necessary include dirs automatically through the 'MOOS::MOOS' target.
set(MOOS_LIBRARIES MOOS::MOOS)
set(MOOS_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include")
