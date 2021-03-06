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
CMAKE_SOURCE_DIR = /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore

# Include any dependencies generated for this target.
include Core/MOOSDB/CMakeFiles/MOOSDB.dir/depend.make

# Include the progress variables for this target.
include Core/MOOSDB/CMakeFiles/MOOSDB.dir/progress.make

# Include the compile flags for this target's objects.
include Core/MOOSDB/CMakeFiles/MOOSDB.dir/flags.make

Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o: Core/MOOSDB/CMakeFiles/MOOSDB.dir/flags.make
Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o: /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore/Core/MOOSDB/MOOSDBMain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o -c /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore/Core/MOOSDB/MOOSDBMain.cpp

Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore/Core/MOOSDB/MOOSDBMain.cpp > CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.i

Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore/Core/MOOSDB/MOOSDBMain.cpp -o CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.s

Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.requires:

.PHONY : Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.requires

Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.provides: Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.requires
	$(MAKE) -f Core/MOOSDB/CMakeFiles/MOOSDB.dir/build.make Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.provides.build
.PHONY : Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.provides

Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.provides.build: Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o


# Object files for target MOOSDB
MOOSDB_OBJECTS = \
"CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o"

# External object files for target MOOSDB
MOOSDB_EXTERNAL_OBJECTS =

/home/badgerboat/moos/moos-ivp/bin/MOOSDB: Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o
/home/badgerboat/moos/moos-ivp/bin/MOOSDB: Core/MOOSDB/CMakeFiles/MOOSDB.dir/build.make
/home/badgerboat/moos/moos-ivp/bin/MOOSDB: lib/libMOOS.a
/home/badgerboat/moos/moos-ivp/bin/MOOSDB: Core/MOOSDB/CMakeFiles/MOOSDB.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/badgerboat/moos/moos-ivp/bin/MOOSDB"
	cd /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MOOSDB.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Core/MOOSDB/CMakeFiles/MOOSDB.dir/build: /home/badgerboat/moos/moos-ivp/bin/MOOSDB

.PHONY : Core/MOOSDB/CMakeFiles/MOOSDB.dir/build

Core/MOOSDB/CMakeFiles/MOOSDB.dir/requires: Core/MOOSDB/CMakeFiles/MOOSDB.dir/MOOSDBMain.cpp.o.requires

.PHONY : Core/MOOSDB/CMakeFiles/MOOSDB.dir/requires

Core/MOOSDB/CMakeFiles/MOOSDB.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB && $(CMAKE_COMMAND) -P CMakeFiles/MOOSDB.dir/cmake_clean.cmake
.PHONY : Core/MOOSDB/CMakeFiles/MOOSDB.dir/clean

Core/MOOSDB/CMakeFiles/MOOSDB.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore /home/badgerboat/moos/moos-ivp/MOOS/MOOSCore/Core/MOOSDB /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB /home/badgerboat/moos/moos-ivp/build/MOOS/MOOSCore/Core/MOOSDB/CMakeFiles/MOOSDB.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Core/MOOSDB/CMakeFiles/MOOSDB.dir/depend

