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
include lib_gpsParser/CMakeFiles/gpsParser.dir/depend.make

# Include the progress variables for this target.
include lib_gpsParser/CMakeFiles/gpsParser.dir/progress.make

# Include the compile flags for this target's objects.
include lib_gpsParser/CMakeFiles/gpsParser.dir/flags.make

lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o: lib_gpsParser/CMakeFiles/gpsParser.dir/flags.make
lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/lib_gpsParser/gpsParser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/lib_gpsParser && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gpsParser.dir/gpsParser.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/lib_gpsParser/gpsParser.cpp

lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpsParser.dir/gpsParser.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/lib_gpsParser && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/lib_gpsParser/gpsParser.cpp > CMakeFiles/gpsParser.dir/gpsParser.cpp.i

lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpsParser.dir/gpsParser.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/lib_gpsParser && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/lib_gpsParser/gpsParser.cpp -o CMakeFiles/gpsParser.dir/gpsParser.cpp.s

lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.requires:

.PHONY : lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.requires

lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.provides: lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.requires
	$(MAKE) -f lib_gpsParser/CMakeFiles/gpsParser.dir/build.make lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.provides.build
.PHONY : lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.provides

lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.provides.build: lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o


# Object files for target gpsParser
gpsParser_OBJECTS = \
"CMakeFiles/gpsParser.dir/gpsParser.cpp.o"

# External object files for target gpsParser
gpsParser_EXTERNAL_OBJECTS =

/home/badgerboat/moos/moos-ivp/lib/libgpsParser.a: lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o
/home/badgerboat/moos/moos-ivp/lib/libgpsParser.a: lib_gpsParser/CMakeFiles/gpsParser.dir/build.make
/home/badgerboat/moos/moos-ivp/lib/libgpsParser.a: lib_gpsParser/CMakeFiles/gpsParser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library /home/badgerboat/moos/moos-ivp/lib/libgpsParser.a"
	cd /home/badgerboat/moos/moos-ivp/build/lib_gpsParser && $(CMAKE_COMMAND) -P CMakeFiles/gpsParser.dir/cmake_clean_target.cmake
	cd /home/badgerboat/moos/moos-ivp/build/lib_gpsParser && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gpsParser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib_gpsParser/CMakeFiles/gpsParser.dir/build: /home/badgerboat/moos/moos-ivp/lib/libgpsParser.a

.PHONY : lib_gpsParser/CMakeFiles/gpsParser.dir/build

lib_gpsParser/CMakeFiles/gpsParser.dir/requires: lib_gpsParser/CMakeFiles/gpsParser.dir/gpsParser.cpp.o.requires

.PHONY : lib_gpsParser/CMakeFiles/gpsParser.dir/requires

lib_gpsParser/CMakeFiles/gpsParser.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/lib_gpsParser && $(CMAKE_COMMAND) -P CMakeFiles/gpsParser.dir/cmake_clean.cmake
.PHONY : lib_gpsParser/CMakeFiles/gpsParser.dir/clean

lib_gpsParser/CMakeFiles/gpsParser.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/lib_gpsParser /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/lib_gpsParser /home/badgerboat/moos/moos-ivp/build/lib_gpsParser/CMakeFiles/gpsParser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib_gpsParser/CMakeFiles/gpsParser.dir/depend

