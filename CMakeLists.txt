cmake_minimum_required(VERSION 3.22)

project(simd CXX ASM)

add_executable(simd main.cpp)

add_subdirectory(lib)

add_subdirectory(benchmarks)

target_link_libraries(simd PRIVATE lib)

