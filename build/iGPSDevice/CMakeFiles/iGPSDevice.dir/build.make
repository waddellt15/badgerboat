# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/badgerboat/moos/moos-ivp/ivp/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/badgerboat/moos/moos-ivp/build

# Include any dependencies generated for this target.
include iGPSDevice/CMakeFiles/iGPSDevice.dir/depend.make

# Include the progress variables for this target.
include iGPSDevice/CMakeFiles/iGPSDevice.dir/progress.make

# Include the compile flags for this target's objects.
include iGPSDevice/CMakeFiles/iGPSDevice.dir/flags.make

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o: iGPSDevice/CMakeFiles/iGPSDevice.dir/flags.make
iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDevice.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDevice.cpp

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDevice.cpp > CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.i

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDevice.cpp -o CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.s

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.requires:

.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.requires

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.provides: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.requires
	$(MAKE) -f iGPSDevice/CMakeFiles/iGPSDevice.dir/build.make iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.provides.build
.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.provides

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.provides.build: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o


iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o: iGPSDevice/CMakeFiles/iGPSDevice.dir/flags.make
iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDeviceInfo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDeviceInfo.cpp

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDeviceInfo.cpp > CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.i

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/GPSDeviceInfo.cpp -o CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.s

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.requires:

.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.requires

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.provides: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.requires
	$(MAKE) -f iGPSDevice/CMakeFiles/iGPSDevice.dir/build.make iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.provides.build
.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.provides

iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.provides.build: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o


iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o: iGPSDevice/CMakeFiles/iGPSDevice.dir/flags.make
iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/iGPSDeviceMain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/iGPSDeviceMain.cpp

iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/iGPSDeviceMain.cpp > CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.i

iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice/iGPSDeviceMain.cpp -o CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.s

iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.requires:

.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.requires

iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.provides: iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.requires
	$(MAKE) -f iGPSDevice/CMakeFiles/iGPSDevice.dir/build.make iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.provides.build
.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.provides

iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.provides.build: iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o


# Object files for target iGPSDevice
iGPSDevice_OBJECTS = \
"CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o" \
"CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o" \
"CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o"

# External object files for target iGPSDevice
iGPSDevice_EXTERNAL_OBJECTS =

/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: iGPSDevice/CMakeFiles/iGPSDevice.dir/build.make
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: MOOS/MOOSCore/lib/libMOOS.a
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: MOOS/MOOSGeodesy/lib/libMOOSGeodesy.so
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: /home/badgerboat/moos/moos-ivp/lib/libgpsParser.a
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: /home/badgerboat/moos/moos-ivp/lib/libSimpleSerial.a
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: /home/badgerboat/moos/moos-ivp/lib/libmbutil.a
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: /home/badgerboat/moos/moos-ivp/lib/libNMEAParse.a
/home/badgerboat/moos/moos-ivp/bin/iGPSDevice: iGPSDevice/CMakeFiles/iGPSDevice.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable /home/badgerboat/moos/moos-ivp/bin/iGPSDevice"
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/iGPSDevice.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
iGPSDevice/CMakeFiles/iGPSDevice.dir/build: /home/badgerboat/moos/moos-ivp/bin/iGPSDevice

.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/build

iGPSDevice/CMakeFiles/iGPSDevice.dir/requires: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDevice.cpp.o.requires
iGPSDevice/CMakeFiles/iGPSDevice.dir/requires: iGPSDevice/CMakeFiles/iGPSDevice.dir/GPSDeviceInfo.cpp.o.requires
iGPSDevice/CMakeFiles/iGPSDevice.dir/requires: iGPSDevice/CMakeFiles/iGPSDevice.dir/iGPSDeviceMain.cpp.o.requires

.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/requires

iGPSDevice/CMakeFiles/iGPSDevice.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/iGPSDevice && $(CMAKE_COMMAND) -P CMakeFiles/iGPSDevice.dir/cmake_clean.cmake
.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/clean

iGPSDevice/CMakeFiles/iGPSDevice.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/iGPSDevice /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/iGPSDevice /home/badgerboat/moos/moos-ivp/build/iGPSDevice/CMakeFiles/iGPSDevice.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : iGPSDevice/CMakeFiles/iGPSDevice.dir/depend

