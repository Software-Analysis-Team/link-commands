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
include CMakeFiles/say-c.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/say-c.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/say-c.dir/flags.make

CMakeFiles/say-c.dir/a.cpp.o: CMakeFiles/say-c.dir/flags.make
CMakeFiles/say-c.dir/a.cpp.o: ../a.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/say-c.dir/a.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/say-c.dir/a.cpp.o -c /Users/gmirzazyanov/Documents/research/example/a.cpp

CMakeFiles/say-c.dir/a.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/say-c.dir/a.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gmirzazyanov/Documents/research/example/a.cpp > CMakeFiles/say-c.dir/a.cpp.i

CMakeFiles/say-c.dir/a.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/say-c.dir/a.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gmirzazyanov/Documents/research/example/a.cpp -o CMakeFiles/say-c.dir/a.cpp.s

# Object files for target say-c
say__c_OBJECTS = \
"CMakeFiles/say-c.dir/a.cpp.o"

# External object files for target say-c
say__c_EXTERNAL_OBJECTS =

libsay-c.a: CMakeFiles/say-c.dir/a.cpp.o
libsay-c.a: CMakeFiles/say-c.dir/build.make
libsay-c.a: CMakeFiles/say-c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libsay-c.a"
	$(CMAKE_COMMAND) -P CMakeFiles/say-c.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/say-c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/say-c.dir/build: libsay-c.a

.PHONY : CMakeFiles/say-c.dir/build

CMakeFiles/say-c.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/say-c.dir/cmake_clean.cmake
.PHONY : CMakeFiles/say-c.dir/clean

CMakeFiles/say-c.dir/depend:
	cd /Users/gmirzazyanov/Documents/research/example/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gmirzazyanov/Documents/research/example /Users/gmirzazyanov/Documents/research/example /Users/gmirzazyanov/Documents/research/example/cmake-build-debug /Users/gmirzazyanov/Documents/research/example/cmake-build-debug /Users/gmirzazyanov/Documents/research/example/cmake-build-debug/CMakeFiles/say-c.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/say-c.dir/depend
