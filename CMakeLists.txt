cmake_minimum_required(VERSION 3.17)
project(snake)

set(CMAKE_CXX_STANDARD 20)

set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall --std=c++11 -O3 -fPIC" )
set( CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -Wall -O3 -fPIC" )

add_executable(snake main.cpp)

add_library(lava SHARED IMPORTED)
set_target_properties(lava PROPERTIES IMPORTED_LOCATION ${CMAKE_BINARY_DIR}/liblava.so)
target_link_libraries(snake lava)