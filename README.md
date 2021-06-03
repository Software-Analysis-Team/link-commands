# JSON Compilation Database Format Specification

This document describes a format for specifying how to replay single link commands independently of the build system.

## Background
Currently, there is [compilation database format](https://clang.llvm.org/docs/JSONCompilationDatabase.html), which specified by Clang. Compilation commands are actively used for syntax analysis of code, 
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
Using of link database is providing more information for advance software analysis.
More examples:

1) Unit testing tools which use code analysis need to understand which function is called in order to get correct test result.
2) IDEs need it to understand which file to go when you click "Go to definition" on a function call.

## Format
### Version 0.0.1

A link database is a JSON file, which consist of an array of “command objects”, where each command object specifies one way a target and first element is a version of format instead of link's command. 
The contracts for each field in the command object are:

* **command**: The link command executed. The field contains all the flags and files needed to create a target or library. As result of executing all commands, it's a full-build project.
* **directory** The working directory of the link's command. All paths specified in the command or file fields must be either absolute or relative to this directory.
* **files** An array which described all the object files, dynamic and static libraries needed for linking.
* **arguments** The link command executed as list of strings. Either arguments or command is required.
* **output** The name of the output created by this linking step. This field is optional. It can be used to distinguish different processing modes of the same input.

Using link commands from file can give 3 different types of output:  
* executable file 
* static library
* dynamic library

Example:

```
[   
    {
      "version": 0.0.1
    },
	{
	  "command" : "/usr/bin/ar qc libcmstd.a CMakeFiles/cmstd.dir/cm/bits/fs_path.cxx.o CMakeFiles/cmstd.dir/cm/bits/string_view.cxx.o",
      "directory" : "/home/myuser/exampleProject/build/Utilities/std",
	  "files" : 
	  [
	      "/home/myuser/exampleProject/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/fs_path.cxx.o", 
	      "/home/myuser/exampleProject/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/string_view.cxx.o"
	  ]
	},
	{
	  "command" : "/usr/bin/cc  -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common -Wundef CMakeFiles/pseudonl_purify.dir/ret0.c.o -o purify",
      "directory" : "/home/myuser/exampleProject/build/Tests/CMakeLib/PseudoMemcheck/NoLog",
	  "files" : 
	  [
          "/home/myuser/exampleProject/build/Tests/CMakeLib/PseudoMemcheck/NoLog/CMakeFiles/pseudonl_purify.dir/ret0.c.o"
	  ]
	},
	...
]
```

This example demonstrates command ***ar*** to create ***dynamic library libcmstd.a*** and ***cc*** command to create ***purify target***  

Note: we decided to filter cmake commands and ranlib commands.
Example filtered commands:
1) CMake command for deleting library
```
[   
    ...
	{
	  "command" : "/usr/local/bin/cmake -E rm -f CMakeFiles/library.dir/lib.a",
      "directory" : "/home/myuser/exampleProject/build/Utilities/std",
	  "files" : 
	  [
	      "/home/myuser/exampleProject/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/file1.cxx.o", 
	      "/home/myuser/exampleProject/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/file2.cxx.o"
	  ]
	},
	...
]
```
2) [CMake lwyu static checker](https://blog.kitware.com/static-checks-with-cmake-cdash-iwyu-clang-tidy-lwyu-cpplint-and-cppcheck/)
```
[
    ...
    {
        "command": "/usr/local/bin/cmake -E __run_co_compile --lwyu=some_target",
        "directory": "/home/myuser/exampleProject/build",
        "files":
        [
            "/home/myuser/exampleProject/build/Utilities/std/CMakeFiles/cmstd.dir/cm/bits/file3.c.o"
        ]
    },
    ...
]
```
3) [ranlib command](https://man7.org/linux/man-pages/man1/ranlib.1.html)
```
[   
    ...
	{
	  "command" : "/usr/bin/ranlib library.a",
      "directory" : "/home/myuser/exampleProject/build",
	  "files" : []
	},
	...
]
```
