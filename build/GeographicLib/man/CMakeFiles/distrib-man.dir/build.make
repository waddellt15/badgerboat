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

# Utility rule file for distrib-man.

# Include the progress variables for this target.
include GeographicLib/man/CMakeFiles/distrib-man.dir/progress.make

distrib-man: GeographicLib/man/CMakeFiles/distrib-man.dir/build.make
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Installing man documentation page in source tree"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && for f in /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/CartConvert.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/ConicProj.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeodesicProj.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeoConvert.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeodSolve.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeoidEval.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/Gravity.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/MagneticField.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/Planimeter.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/RhumbSolve.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/TransverseMercatorProj.1 /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/CartConvert.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/ConicProj.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeodesicProj.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeoConvert.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeodSolve.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeoidEval.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/Gravity.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/MagneticField.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/Planimeter.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/RhumbSolve.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/TransverseMercatorProj.usage /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/CartConvert.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/ConicProj.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeodesicProj.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeoConvert.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeodSolve.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/GeoidEval.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/Gravity.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/MagneticField.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/Planimeter.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/RhumbSolve.1.html /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/TransverseMercatorProj.1.html; do install -C -m 644 $$f /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man; done
.PHONY : distrib-man

# Rule to build all files generated by this target.
GeographicLib/man/CMakeFiles/distrib-man.dir/build: distrib-man

.PHONY : GeographicLib/man/CMakeFiles/distrib-man.dir/build

GeographicLib/man/CMakeFiles/distrib-man.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && $(CMAKE_COMMAND) -P CMakeFiles/distrib-man.dir/cmake_clean.cmake
.PHONY : GeographicLib/man/CMakeFiles/distrib-man.dir/clean

GeographicLib/man/CMakeFiles/distrib-man.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/GeographicLib/man /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/CMakeFiles/distrib-man.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : GeographicLib/man/CMakeFiles/distrib-man.dir/depend

