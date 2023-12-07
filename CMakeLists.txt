cmake_minimum_required(VERSION 3.22)

project(simd CXX ASM)

add_subdirectory(lib_avx)

add_subdirectory(lib_cpp)

add_subdirectory(benchmarks)
