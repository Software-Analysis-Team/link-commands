# JSON Compilation Database Format Specification

This document describes a format for specifying how to replay single link commands independently of the build system.

## Background

Like compilation commands, link commands are needed for code analysis, for example, look into simple C/C++ code:  
`a.cpp:`
```
int f(int a) {
  return g(a);
}
```
`x.cpp:`
```
int g(int a) {
  return a + 1;
}
```
`y.cpp:`
```
int g(int a) {
  return a - 1;
}
```
A tool may need to know which function is actually called, but this information is only available at linking step as soon as there may be several functions with same name in different units.  
More example:

1) Unit testing tools which use code analysis need to understand which function is called in order to get correct test result.
2) IDEs need it to understand which file to go when you click "Go to definition" on a function call.

In addition, it is possible to extract link commands from build systems without executing the program.
## Supported Systems

Currently CMake (since X.Y.Z) supports generation of link databases for Unix Makefile builds (Ninja builds in the works) with the option CMAKE_EXPORT_LINK_COMMANDS.

There is no an alternative to intercept link calls with a other tool.

## Format
A link database is a JSON file, which consist of an array of “command objects”, where each command object specifies one way a translation unit is linked in the project. The file format is exactly the same as for the compilation commands with minor changes:

1) Instead of a single source С/С++ file, an array which described all the object files, dynamic and static libraries needed for linking
2) Swapped the order of the fields directory and command  
Example:

```
[
	{
	  "command": "/usr/bin/ar qc libcmstd.a CMakeFiles/cmstd.dir/cm/bits/fs_path.cxx.o CMakeFiles/cmstd.dir/cm/bits/string_view.cxx.o",
          "directory": "/home/myuser/cmake/build/Utilities/std",
	  "files": [	   "/home/myuser/cmake/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/fs_path.cxx.o",	    "/home/myuser/cmake/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/string_view.cxx.o"
	  ]
	},
	{
	  "command": "/usr/bin/cc  -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common -Wundef CMakeFiles/pseudonl_purify.dir/ret0.c.o -o purify",
          "directory": "/home/myuser/cmake/build/Tests/CMakeLib/PseudoMemcheck/NoLog",
	  "files": [
"/home/myuser/cmake/build/Tests/CMakeLib/PseudoMemcheck/NoLog/CMakeFiles/pseudonl_purify.dir/ret0.c.o"
	  ]
	},
	...
]
```

## Build System Integration
The convention is to name the file link_commands.json and put it at the top of the build directory.

