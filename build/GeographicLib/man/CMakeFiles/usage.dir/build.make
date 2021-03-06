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

# Utility rule file for usage.

# Include the progress variables for this target.
include GeographicLib/man/CMakeFiles/usage.dir/progress.make

GeographicLib/man/CMakeFiles/usage: GeographicLib/man/CartConvert.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/ConicProj.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/GeodesicProj.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/GeoConvert.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/GeodSolve.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/GeoidEval.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/Gravity.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/MagneticField.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/Planimeter.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/RhumbSolve.usage
GeographicLib/man/CMakeFiles/usage: GeographicLib/man/TransverseMercatorProj.usage
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Converting the man pages to online usage"

GeographicLib/man/CartConvert.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/CartConvert.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building usage code for CartConvert"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/CartConvert.pod 1.50 > CartConvert.usage

GeographicLib/man/ConicProj.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/ConicProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building usage code for ConicProj"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/ConicProj.pod 1.50 > ConicProj.usage

GeographicLib/man/GeodesicProj.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodesicProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building usage code for GeodesicProj"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodesicProj.pod 1.50 > GeodesicProj.usage

GeographicLib/man/GeoConvert.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoConvert.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building usage code for GeoConvert"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoConvert.pod 1.50 > GeoConvert.usage

GeographicLib/man/GeodSolve.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodSolve.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building usage code for GeodSolve"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodSolve.pod 1.50 > GeodSolve.usage

GeographicLib/man/GeoidEval.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoidEval.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building usage code for GeoidEval"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoidEval.pod 1.50 > GeoidEval.usage

GeographicLib/man/Gravity.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Gravity.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building usage code for Gravity"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Gravity.pod 1.50 > Gravity.usage

GeographicLib/man/MagneticField.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/MagneticField.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building usage code for MagneticField"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/MagneticField.pod 1.50 > MagneticField.usage

GeographicLib/man/Planimeter.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Planimeter.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building usage code for Planimeter"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Planimeter.pod 1.50 > Planimeter.usage

GeographicLib/man/RhumbSolve.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/RhumbSolve.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building usage code for RhumbSolve"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/RhumbSolve.pod 1.50 > RhumbSolve.usage

GeographicLib/man/TransverseMercatorProj.usage: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/TransverseMercatorProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building usage code for TransverseMercatorProj"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/makeusage.sh /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/TransverseMercatorProj.pod 1.50 > TransverseMercatorProj.usage

usage: GeographicLib/man/CMakeFiles/usage
usage: GeographicLib/man/CartConvert.usage
usage: GeographicLib/man/ConicProj.usage
usage: GeographicLib/man/GeodesicProj.usage
usage: GeographicLib/man/GeoConvert.usage
usage: GeographicLib/man/GeodSolve.usage
usage: GeographicLib/man/GeoidEval.usage
usage: GeographicLib/man/Gravity.usage
usage: GeographicLib/man/MagneticField.usage
usage: GeographicLib/man/Planimeter.usage
usage: GeographicLib/man/RhumbSolve.usage
usage: GeographicLib/man/TransverseMercatorProj.usage
usage: GeographicLib/man/CMakeFiles/usage.dir/build.make

.PHONY : usage

# Rule to build all files generated by this target.
GeographicLib/man/CMakeFiles/usage.dir/build: usage

.PHONY : GeographicLib/man/CMakeFiles/usage.dir/build

GeographicLib/man/CMakeFiles/usage.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && $(CMAKE_COMMAND) -P CMakeFiles/usage.dir/cmake_clean.cmake
.PHONY : GeographicLib/man/CMakeFiles/usage.dir/clean

GeographicLib/man/CMakeFiles/usage.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/GeographicLib/man /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/CMakeFiles/usage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : GeographicLib/man/CMakeFiles/usage.dir/depend

