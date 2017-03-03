cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)

project(cmake-gtest-example VERSION 0.3)
include("../add-gtest.cmake")
add_gtest(cmake-gtest-test "./test.1.gtest.h" "./test.2.gtest.h")

