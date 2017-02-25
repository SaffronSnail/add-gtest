cmake_minimum_required(VERSION 3.0.2)

function(write_gtest_main FILENAME CONTENTS)
  file(WRITE ${FILENAME} ${CONTENTS})
endfunction(write_gtest_main)

write_gtest_main(main.cpp "int main(int argc, char **argv)\n{\n  ::testing::InitGoogleTest(&argc, argv);\n  return RUN_ALL_TESTS();\n}\n")

