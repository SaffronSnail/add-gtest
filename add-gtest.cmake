cmake_minimum_required(VERSION 3.0.2)

function(download_gtest)
  # Download and unpack googletest
  configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
  execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
                  RESULT_VARIABLE result
                  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download
  )
  
  if (result)
    message(FATAL_ERROR "CMake step for googletest failed: ${result}")
  endif()
  
  execute_process(COMMAND ${CMAKE_COMMAND} --build .
                  RESULT_VARIABLE result
                  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download
  )
  if(result)
    message(FATAL_ERROR "Build step for googletest failed: ${result}")
  endif()
  
  # Prevent overriding the parent project's compiler/linker settings on Windows
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  
  # Add googletest directly to our build. This defines the gtest and gtest_main
  # targets
  add_subdirectory(${CMAKE_BINARY_DIR}/googletest-src
                   ${CMAKE_BINARY_DIR}/googletest-build
  )
endfunction(download_gtest)

function(write_gtest_main)
  # begin the main file by including all of the given files
  foreach (file ${ARGN})
    set(CONTENTS "${CONTENTS}#include \"${file}\"\n")
  endforeach()

  # append the boilerplate code
  set(CONTENTS "${CONTENTS}\n\n#include \"gtest/gtest.h\"\n\nint main(int argc,\
  char **argv)\n{\n  ::testing::InitGoogleTest(&argc, argv)\;\n\
  return RUN_ALL_TESTS()\;\n}\n")

  # write the file
  file(WRITE ${CMAKE_BINARY_DIR}/generated_code/main.cpp ${CONTENTS})
endfunction(write_gtest_main)

function(add_gtest test_target)
  # make sure that gtest has been fetched and added to the project
  download_gtest()
  # generate the main file so we can produce an executable
  write_gtest_main(${ARGN})
  # add the target to the project and cofnigure it
  add_executable(${test_target}-executable "${CMAKE_BINARY_DIR}/generated_code/main.cpp")
  target_link_libraries(${test_target}-executable gtest_main)
endfunction(add_gtest)

