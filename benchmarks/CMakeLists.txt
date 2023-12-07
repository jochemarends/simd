add_executable(benchmarks main.cpp)

target_compile_features(benchmarks PRIVATE cxx_std_20)

find_package(benchmark REQUIRED)

target_link_libraries(benchmarks PRIVATE benchmark::benchmark lib_avx lib_cpp)
