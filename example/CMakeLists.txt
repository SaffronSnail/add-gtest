cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)

project(cmake-gtest-example VERSION 0.2)
include("../add-gtest.cmake")
include_directories(.)
download_gtest()
write_gtest_main("test.1.gtest.h" "test.2.gtest.h")
add_executable(cmake-gtest-test-executable "${CMAKE_BINARY_DIR}/generated_code/main.cpp")
target_link_libraries(cmake-gtest-test-executable gtest_main)

