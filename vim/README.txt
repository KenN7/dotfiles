## NOTES when installing and uing:

# You need python-neovim for a lot of things

# ctags required for tagbar

# For vim and nvim autocompletion using YCM:
If using CMake, add -DCMAKE_EXPORT_COMPILE_COMMANDS=ON when configuring 
(or add set( CMAKE_EXPORT_COMPILE_COMMANDS ON ) to CMakeLists.txt) 
and copy or symlink the generated database to the root of your project.

# For fuzzy search with fzf:
Install ripgrep to get :Rg command to check inside of files
