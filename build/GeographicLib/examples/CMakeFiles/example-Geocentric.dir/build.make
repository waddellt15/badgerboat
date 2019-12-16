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
include GeographicLib/examples/CMakeFiles/example-Geocentric.dir/depend.make

# Include the progress variables for this target.
include GeographicLib/examples/CMakeFiles/example-Geocentric.dir/progress.make

# Include the compile flags for this target's objects.
include GeographicLib/examples/CMakeFiles/example-Geocentric.dir/flags.make

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/flags.make
GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/examples/example-Geocentric.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/examples/example-Geocentric.cpp

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/examples/example-Geocentric.cpp > CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.i

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/examples/example-Geocentric.cpp -o CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.s

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.requires:

.PHONY : GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.requires

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.provides: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.requires
	$(MAKE) -f GeographicLib/examples/CMakeFiles/example-Geocentric.dir/build.make GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.provides.build
.PHONY : GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.provides

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.provides.build: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o


# Object files for target example-Geocentric
example__Geocentric_OBJECTS = \
"CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o"

# External object files for target example-Geocentric
example__Geocentric_EXTERNAL_OBJECTS =

/home/badgerboat/moos/moos-ivp/bin/example-Geocentric: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o
/home/badgerboat/moos/moos-ivp/bin/example-Geocentric: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/build.make
/home/badgerboat/moos/moos-ivp/bin/example-Geocentric: /home/badgerboat/moos/moos-ivp/lib/libGeographic.so.19.0.0
/home/badgerboat/moos/moos-ivp/bin/example-Geocentric: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/badgerboat/moos/moos-ivp/bin/example-Geocentric"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example-Geocentric.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
GeographicLib/examples/CMakeFiles/example-Geocentric.dir/build: /home/badgerboat/moos/moos-ivp/bin/example-Geocentric

.PHONY : GeographicLib/examples/CMakeFiles/example-Geocentric.dir/build

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/requires: GeographicLib/examples/CMakeFiles/example-Geocentric.dir/example-Geocentric.cpp.o.requires

.PHONY : GeographicLib/examples/CMakeFiles/example-Geocentric.dir/requires

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples && $(CMAKE_COMMAND) -P CMakeFiles/example-Geocentric.dir/cmake_clean.cmake
.PHONY : GeographicLib/examples/CMakeFiles/example-Geocentric.dir/clean

GeographicLib/examples/CMakeFiles/example-Geocentric.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/examples /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples /home/badgerboat/moos/moos-ivp/build/GeographicLib/examples/CMakeFiles/example-Geocentric.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : GeographicLib/examples/CMakeFiles/example-Geocentric.dir/depend

