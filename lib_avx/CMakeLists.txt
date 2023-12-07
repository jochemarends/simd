add_library(lib STATIC)

target_sources(lib PRIVATE src/dotf32.S src/addf32.S src/matmulf32.S)

target_include_directories(lib PUBLIC inc)

target_compile_options(lib PRIVATE -Werror -Wall -Wextra -pedantic)
