add_library(lib_avx STATIC)

target_sources(lib_avx PRIVATE src/dotf32.S src/addf32.S)

target_include_directories(lib_avx PUBLIC inc)

target_compile_options(lib_avx PRIVATE -Werror -Wall -Wextra -pedantic)
