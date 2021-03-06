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
include GeographicLib/tools/CMakeFiles/GeoConvert.dir/depend.make

# Include the progress variables for this target.
include GeographicLib/tools/CMakeFiles/GeoConvert.dir/progress.make

# Include the compile flags for this target's objects.
include GeographicLib/tools/CMakeFiles/GeoConvert.dir/flags.make

GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o: GeographicLib/tools/CMakeFiles/GeoConvert.dir/flags.make
GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/tools/GeoConvert.cpp
GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o: GeographicLib/man/GeoConvert.usage
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/tools/GeoConvert.cpp

GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GeoConvert.dir/GeoConvert.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/tools/GeoConvert.cpp > CMakeFiles/GeoConvert.dir/GeoConvert.cpp.i

GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GeoConvert.dir/GeoConvert.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/tools/GeoConvert.cpp -o CMakeFiles/GeoConvert.dir/GeoConvert.cpp.s

GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.requires:

.PHONY : GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.requires

GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.provides: GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.requires
	$(MAKE) -f GeographicLib/tools/CMakeFiles/GeoConvert.dir/build.make GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.provides.build
.PHONY : GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.provides

GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.provides.build: GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o


# Object files for target GeoConvert
GeoConvert_OBJECTS = \
"CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o"

# External object files for target GeoConvert
GeoConvert_EXTERNAL_OBJECTS =

/home/badgerboat/moos/moos-ivp/bin/GeoConvert: GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o
/home/badgerboat/moos/moos-ivp/bin/GeoConvert: GeographicLib/tools/CMakeFiles/GeoConvert.dir/build.make
/home/badgerboat/moos/moos-ivp/bin/GeoConvert: /home/badgerboat/moos/moos-ivp/lib/libGeographic.so.19.0.0
/home/badgerboat/moos/moos-ivp/bin/GeoConvert: GeographicLib/tools/CMakeFiles/GeoConvert.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/badgerboat/moos/moos-ivp/bin/GeoConvert"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/GeoConvert.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
GeographicLib/tools/CMakeFiles/GeoConvert.dir/build: /home/badgerboat/moos/moos-ivp/bin/GeoConvert

.PHONY : GeographicLib/tools/CMakeFiles/GeoConvert.dir/build

GeographicLib/tools/CMakeFiles/GeoConvert.dir/requires: GeographicLib/tools/CMakeFiles/GeoConvert.dir/GeoConvert.cpp.o.requires

.PHONY : GeographicLib/tools/CMakeFiles/GeoConvert.dir/requires

GeographicLib/tools/CMakeFiles/GeoConvert.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools && $(CMAKE_COMMAND) -P CMakeFiles/GeoConvert.dir/cmake_clean.cmake
.PHONY : GeographicLib/tools/CMakeFiles/GeoConvert.dir/clean

GeographicLib/tools/CMakeFiles/GeoConvert.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/tools /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools /home/badgerboat/moos/moos-ivp/build/GeographicLib/tools/CMakeFiles/GeoConvert.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : GeographicLib/tools/CMakeFiles/GeoConvert.dir/depend

