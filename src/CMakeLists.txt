set(EXECUTABLE snake)

set(HEADER_FILES main.cpp)

set(SOURCE_FILES main.cpp)

add_executable(${EXECUTABLE} ${SOURCE_FILES})

set(LIB_LAVA lava)
add_library(${LIB_LAVA} SHARED IMPORTED)
set_target_properties(${LIB_LAVA} PROPERTIES IMPORTED_LOCATION ${CMAKE_BINARY_DIR}/build/lib/liblava.so)
target_link_libraries(${EXECUTABLE} ${LIB_LAVA})
