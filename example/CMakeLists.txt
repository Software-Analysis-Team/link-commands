cmake_minimum_required(VERSION 3.16)
SET(CMAKE_EXPORT_LINK_COMMANDS ON)
include(CMakePrintHelpers)
project(example)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 14)

add_compile_options(-Wall -Werror -Wextra -pedantic)
add_link_options(-Wl)

add_library(say-a
        c.cpp
        a1.cpp)

add_library(say-c
        a.cpp)

add_executable(maina maina.cpp)
add_executable(mainb mainb.cpp b.cpp)
target_link_libraries(maina PRIVATE say-c say-a)