file(WRITE main.cpp "int main(int argc, char **argv)\n{\n  ::testing::InitGoogleTest(&argc, argv);\n  return RUN_ALL_TESTS();\n}\n")

