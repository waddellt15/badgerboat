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
include uTermCommand/CMakeFiles/uTermCommand.dir/depend.make

# Include the progress variables for this target.
include uTermCommand/CMakeFiles/uTermCommand.dir/progress.make

# Include the compile flags for this target's objects.
include uTermCommand/CMakeFiles/uTermCommand.dir/flags.make

uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o: uTermCommand/CMakeFiles/uTermCommand.dir/flags.make
uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/uTermCommand.dir/main.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/main.cpp

uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uTermCommand.dir/main.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/main.cpp > CMakeFiles/uTermCommand.dir/main.cpp.i

uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uTermCommand.dir/main.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/main.cpp -o CMakeFiles/uTermCommand.dir/main.cpp.s

uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.requires:

.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.requires

uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.provides: uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.requires
	$(MAKE) -f uTermCommand/CMakeFiles/uTermCommand.dir/build.make uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.provides.build
.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.provides

uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.provides.build: uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o


uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o: uTermCommand/CMakeFiles/uTermCommand.dir/flags.make
uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/uTermCommand.dir/TermCommand.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand.cpp

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uTermCommand.dir/TermCommand.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand.cpp > CMakeFiles/uTermCommand.dir/TermCommand.cpp.i

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uTermCommand.dir/TermCommand.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand.cpp -o CMakeFiles/uTermCommand.dir/TermCommand.cpp.s

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.requires:

.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.requires

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.provides: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.requires
	$(MAKE) -f uTermCommand/CMakeFiles/uTermCommand.dir/build.make uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.provides.build
.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.provides

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.provides.build: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o


uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o: uTermCommand/CMakeFiles/uTermCommand.dir/flags.make
uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o: /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand_Info.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o -c /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand_Info.cpp

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.i"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand_Info.cpp > CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.i

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.s"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand/TermCommand_Info.cpp -o CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.s

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.requires:

.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.requires

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.provides: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.requires
	$(MAKE) -f uTermCommand/CMakeFiles/uTermCommand.dir/build.make uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.provides.build
.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.provides

uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.provides.build: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o


# Object files for target uTermCommand
uTermCommand_OBJECTS = \
"CMakeFiles/uTermCommand.dir/main.cpp.o" \
"CMakeFiles/uTermCommand.dir/TermCommand.cpp.o" \
"CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o"

# External object files for target uTermCommand
uTermCommand_EXTERNAL_OBJECTS =

/home/badgerboat/moos/moos-ivp/bin/uTermCommand: uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: uTermCommand/CMakeFiles/uTermCommand.dir/build.make
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: MOOS/MOOSCore/lib/libMOOS.a
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: /home/badgerboat/moos/moos-ivp/lib/libmbutil.a
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: /home/badgerboat/moos/moos-ivp/lib/libgenutil.a
/home/badgerboat/moos/moos-ivp/bin/uTermCommand: uTermCommand/CMakeFiles/uTermCommand.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable /home/badgerboat/moos/moos-ivp/bin/uTermCommand"
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/uTermCommand.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
uTermCommand/CMakeFiles/uTermCommand.dir/build: /home/badgerboat/moos/moos-ivp/bin/uTermCommand

.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/build

uTermCommand/CMakeFiles/uTermCommand.dir/requires: uTermCommand/CMakeFiles/uTermCommand.dir/main.cpp.o.requires
uTermCommand/CMakeFiles/uTermCommand.dir/requires: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand.cpp.o.requires
uTermCommand/CMakeFiles/uTermCommand.dir/requires: uTermCommand/CMakeFiles/uTermCommand.dir/TermCommand_Info.cpp.o.requires

.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/requires

uTermCommand/CMakeFiles/uTermCommand.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/uTermCommand && $(CMAKE_COMMAND) -P CMakeFiles/uTermCommand.dir/cmake_clean.cmake
.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/clean

uTermCommand/CMakeFiles/uTermCommand.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/uTermCommand /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/uTermCommand /home/badgerboat/moos/moos-ivp/build/uTermCommand/CMakeFiles/uTermCommand.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : uTermCommand/CMakeFiles/uTermCommand.dir/depend

