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

# Utility rule file for htmlman.

# Include the progress variables for this target.
include GeographicLib/man/CMakeFiles/htmlman.dir/progress.make

GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/CartConvert.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/ConicProj.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/GeodesicProj.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/GeoConvert.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/GeodSolve.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/GeoidEval.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/Gravity.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/MagneticField.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/Planimeter.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/RhumbSolve.1.html
GeographicLib/man/CMakeFiles/htmlman: GeographicLib/man/TransverseMercatorProj.1.html
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building html versions of the man pages"

GeographicLib/man/CartConvert.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/CartConvert.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building html version of man page for CartConvert"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'CartConvert(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/CartConvert.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > CartConvert.1.html && cp CartConvert.1.html ../doc/html-stage/

GeographicLib/man/ConicProj.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/ConicProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building html version of man page for ConicProj"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'ConicProj(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/ConicProj.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > ConicProj.1.html && cp ConicProj.1.html ../doc/html-stage/

GeographicLib/man/GeodesicProj.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodesicProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building html version of man page for GeodesicProj"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'GeodesicProj(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodesicProj.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > GeodesicProj.1.html && cp GeodesicProj.1.html ../doc/html-stage/

GeographicLib/man/GeoConvert.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoConvert.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building html version of man page for GeoConvert"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'GeoConvert(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoConvert.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > GeoConvert.1.html && cp GeoConvert.1.html ../doc/html-stage/

GeographicLib/man/GeodSolve.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodSolve.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building html version of man page for GeodSolve"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'GeodSolve(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeodSolve.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > GeodSolve.1.html && cp GeodSolve.1.html ../doc/html-stage/

GeographicLib/man/GeoidEval.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoidEval.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building html version of man page for GeoidEval"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'GeoidEval(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/GeoidEval.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > GeoidEval.1.html && cp GeoidEval.1.html ../doc/html-stage/

GeographicLib/man/Gravity.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Gravity.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building html version of man page for Gravity"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'Gravity(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Gravity.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > Gravity.1.html && cp Gravity.1.html ../doc/html-stage/

GeographicLib/man/MagneticField.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/MagneticField.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building html version of man page for MagneticField"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'MagneticField(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/MagneticField.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > MagneticField.1.html && cp MagneticField.1.html ../doc/html-stage/

GeographicLib/man/Planimeter.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Planimeter.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building html version of man page for Planimeter"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'Planimeter(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/Planimeter.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > Planimeter.1.html && cp Planimeter.1.html ../doc/html-stage/

GeographicLib/man/RhumbSolve.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/RhumbSolve.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building html version of man page for RhumbSolve"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'RhumbSolve(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/RhumbSolve.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > RhumbSolve.1.html && cp RhumbSolve.1.html ../doc/html-stage/

GeographicLib/man/TransverseMercatorProj.1.html: /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/TransverseMercatorProj.pod
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/badgerboat/moos/moos-ivp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building html version of man page for TransverseMercatorProj"
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && pod2html --title 'TransverseMercatorProj(1)' --noindex /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man/TransverseMercatorProj.pod | sed -e 's%<head>%<head><link href="http://search.cpan.org/s/style.css" rel="stylesheet" type="text/css">%' -e 's%<code>\([^<>]*\)(\(.\))</code>%<a href="\1.\2.html">&</a>%'g > TransverseMercatorProj.1.html && cp TransverseMercatorProj.1.html ../doc/html-stage/

htmlman: GeographicLib/man/CMakeFiles/htmlman
htmlman: GeographicLib/man/CartConvert.1.html
htmlman: GeographicLib/man/ConicProj.1.html
htmlman: GeographicLib/man/GeodesicProj.1.html
htmlman: GeographicLib/man/GeoConvert.1.html
htmlman: GeographicLib/man/GeodSolve.1.html
htmlman: GeographicLib/man/GeoidEval.1.html
htmlman: GeographicLib/man/Gravity.1.html
htmlman: GeographicLib/man/MagneticField.1.html
htmlman: GeographicLib/man/Planimeter.1.html
htmlman: GeographicLib/man/RhumbSolve.1.html
htmlman: GeographicLib/man/TransverseMercatorProj.1.html
htmlman: GeographicLib/man/CMakeFiles/htmlman.dir/build.make

.PHONY : htmlman

# Rule to build all files generated by this target.
GeographicLib/man/CMakeFiles/htmlman.dir/build: htmlman

.PHONY : GeographicLib/man/CMakeFiles/htmlman.dir/build

GeographicLib/man/CMakeFiles/htmlman.dir/clean:
	cd /home/badgerboat/moos/moos-ivp/build/GeographicLib/man && $(CMAKE_COMMAND) -P CMakeFiles/htmlman.dir/cmake_clean.cmake
.PHONY : GeographicLib/man/CMakeFiles/htmlman.dir/clean

GeographicLib/man/CMakeFiles/htmlman.dir/depend:
	cd /home/badgerboat/moos/moos-ivp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/badgerboat/moos/moos-ivp/ivp/src /home/badgerboat/moos/moos-ivp/ivp/src/GeographicLib/man /home/badgerboat/moos/moos-ivp/build /home/badgerboat/moos/moos-ivp/build/GeographicLib/man /home/badgerboat/moos/moos-ivp/build/GeographicLib/man/CMakeFiles/htmlman.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : GeographicLib/man/CMakeFiles/htmlman.dir/depend
