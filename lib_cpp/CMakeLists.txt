add_library(lib_cpp STATIC)

target_sources(lib_cpp PRIVATE src/math.cpp)

target_include_directories(lib_cpp PUBLIC inc)

target_compile_options(lib_cpp PRIVATE -Werror -Wall -Wextra -pedantic)
