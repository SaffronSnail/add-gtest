The goal of this project is to be able to be able to define a project with googletests like this:

```cmake
project(project_name)
add_gtest(test_name "test_file_0" "test_file_1" "test_file_2")
```

You can see how far we've gotten by looking at the CMakeLists.txt in the 'example' folder.

This project differs from [DownloadProject](https://github.com/Crascit/DownloadProject) because it provides functionality more specific to googletest (code from DownloadProject was used to assist the creation of this module)

This project differs from [FindGTest](https://cmake.org/cmake/help/v3.0/module/FindGTest.html<Paste>) because FindGTest searches your computer for a pre-built version of googletest while this project downloads googletest and seamlessly integrates it with the users's build (credit for that functionality to Crascit' DownloadProject, referenced above

