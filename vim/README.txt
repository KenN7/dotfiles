## NOTES when installing and uing:

# For vim and nvim autocompletion using YCM:
If using CMake, add -DCMAKE_EXPORT_COMPILE_COMMANDS=ON when configuring 
(or add set( CMAKE_EXPORT_COMPILE_COMMANDS ON ) to CMakeLists.txt) 
and copy or symlink the generated database to the root of your project.
