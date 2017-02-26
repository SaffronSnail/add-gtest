cmake_minimum_required(VERSION 3.0.2)

function(write_gtest_main)
  foreach (file ${ARGN})
    set(CONTENTS "${CONTENTS}#include \"${file}\"\n")
  endforeach()
  set(CONTENTS "${CONTENTS}\n\n#include \"gtest/gtest.h\"\n\nint main(int argc, char **argv)\n{\n  ::testing::InitGoogleTest(&argc, argv)\;\n  return RUN_ALL_TESTS()\;\n}\n")
  file(WRITE ${CMAKE_BINARY_DIR}/generated_code/main.cpp ${CONTENTS})
endfunction(write_gtest_main)
