# JSON Compilation Database Format Specification

This document describes a format for specifying how to replay single link commands independently of the build system.

## Background
Currently, there is compilation database, which specified by [Clang](https://clang.llvm.org/docs/JSONCompilationDatabase.html). Compilation commands are actively used for syntax analysis of code, 
but there are cases, when the compilation commands cannot provide all the necessary information, for example, look into simple C/C++ code:  
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
Using of links database is providing advanced software analysis.
More examples:

1) Unit testing tools which use code analysis need to understand which function is called in order to get correct test result.
2) IDEs need it to understand which file to go when you click "Go to definition" on a function call.

## Supported Systems

Currently CMake (since X.Y.Z) supports generation of link databases for Unix Makefile builds (Ninja builds in the works) with the option CMAKE_EXPORT_LINK_COMMANDS.

There is no an alternative to intercept link calls with a other tool.

## Format
### Version 1.0.0
Currently, there is no standard for the format of linking commands, so we providing version of format.

A link database is a JSON file, which consist of an array of “command objects”, where each command object specifies one way a target or library.
The contracts for each field in the command object are:

* **command**: The link command executed. The field contains all the flags and files needed to create a target or library. As result of executing all commands, it's a full-build project.
* **directory** The working directory of the link's command. All paths specified in the command or file fields must be either absolute or relative to this directory.
* **files** An array which described all the object files, dynamic and static libraries needed for linking
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
