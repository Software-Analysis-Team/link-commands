# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Users/gmirzazyanov/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/211.6693.114/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/gmirzazyanov/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/211.6693.114/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/gmirzazyanov/Documents/research/example

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/gmirzazyanov/Documents/research/example/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/mainb.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mainb.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mainb.dir/flags.make

CMakeFiles/mainb.dir/mainb.cpp.o: CMakeFiles/mainb.dir/flags.make
CMakeFiles/mainb.dir/mainb.cpp.o: ../mainb.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mainb.dir/mainb.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mainb.dir/mainb.cpp.o -c /Users/gmirzazyanov/Documents/research/example/mainb.cpp

CMakeFiles/mainb.dir/mainb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mainb.dir/mainb.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gmirzazyanov/Documents/research/example/mainb.cpp > CMakeFiles/mainb.dir/mainb.cpp.i

CMakeFiles/mainb.dir/mainb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mainb.dir/mainb.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gmirzazyanov/Documents/research/example/mainb.cpp -o CMakeFiles/mainb.dir/mainb.cpp.s

CMakeFiles/mainb.dir/b.cpp.o: CMakeFiles/mainb.dir/flags.make
CMakeFiles/mainb.dir/b.cpp.o: ../b.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mainb.dir/b.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mainb.dir/b.cpp.o -c /Users/gmirzazyanov/Documents/research/example/b.cpp

CMakeFiles/mainb.dir/b.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mainb.dir/b.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gmirzazyanov/Documents/research/example/b.cpp > CMakeFiles/mainb.dir/b.cpp.i

CMakeFiles/mainb.dir/b.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mainb.dir/b.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gmirzazyanov/Documents/research/example/b.cpp -o CMakeFiles/mainb.dir/b.cpp.s

# Object files for target mainb
mainb_OBJECTS = \
"CMakeFiles/mainb.dir/mainb.cpp.o" \
"CMakeFiles/mainb.dir/b.cpp.o"

# External object files for target mainb
mainb_EXTERNAL_OBJECTS =

mainb: CMakeFiles/mainb.dir/mainb.cpp.o
mainb: CMakeFiles/mainb.dir/b.cpp.o
mainb: CMakeFiles/mainb.dir/build.make
mainb: CMakeFiles/mainb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable mainb"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mainb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mainb.dir/build: mainb

.PHONY : CMakeFiles/mainb.dir/build

CMakeFiles/mainb.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mainb.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mainb.dir/clean

CMakeFiles/mainb.dir/depend:
	cd /Users/gmirzazyanov/Documents/research/example/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gmirzazyanov/Documents/research/example /Users/gmirzazyanov/Documents/research/example /Users/gmirzazyanov/Documents/research/example/cmake-build-debug /Users/gmirzazyanov/Documents/research/example/cmake-build-debug /Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles/mainb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mainb.dir/depend
