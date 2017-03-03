This project allows users to add tests that utilize the gtest framework with the following command:

```cmake
add_gtest(TEST_NAME ...)
```

Where TEST_NAME is the name of the binary that will be produced and the rest of the arguments are files which contain gtest definitions (eg, TEST(TestCategory TestName) { ... }). The main file is auto-generated, and googletest is automatically downloaded and built (Crascit's DownloadProject module is to thank for that particular piece of funcitonality).

This project differs from [DownloadProject](https://github.com/Crascit/DownloadProject) because it provides more functionality specific to googletest at the cost of flexibility; DownloadProject is generalized to download anything, while add_gtest provides additional automation for gtest users.

This project differs from [FindGTest](https://cmake.org/cmake/help/v3.0/module/FindGTest.html<Paste>) because FindGTest searches your computer for a pre-built version of googletest while this project downloads googletest and seamlessly integrates it with the users's build (again, credit to Crascit)

