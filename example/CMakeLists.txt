cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)

project(cmake-gtest-example VERSION 0.2)
include("../add-gtest.cmake")
include_directories(.)
add_gtest(cmake-gtest-test "test.1.gtest.h" "test.2.gtest.h")

