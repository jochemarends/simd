#include <benchmark/benchmark.h>
#include <random>
#include <algorithm>
#include <lib_avx.h>
#include <lib_cpp.h>

struct fixture : public benchmark::Fixture {
public:
    void SetUp(const ::benchmark::State& state) override {
        std::random_device device{};
        std::mt19937 engine{device()};
        std::uniform_real_distribution<float> distribution(0.0f, 100.0f);

        auto random = [&]() {
            return distribution(engine);
        };

        std::generate_n(vec1, len, random);
        std::generate_n(vec2, len, random);
        std::generate_n(vec3, len, random);
    }

    static constexpr std::uint64_t len{8};
    float vec1[len];
    float vec2[len];
    float vec3[len];
};

BENCHMARK_F(fixture, avx_addf32)(benchmark::State& state) {
    for (auto _ : state) {
        avx::addf32(vec1, vec2, len, vec3);
    }
}

BENCHMARK_F(fixture, cpp_addf32)(benchmark::State& state) {
    for (auto _ : state) {
        cpp::addf32(vec1, vec2, len, vec3);
    }
}

BENCHMARK_F(fixture, avx_dotf32)(benchmark::State& state) {
    for (auto _ : state) {
        auto res = avx::dotf32(vec1, vec2, len);
        benchmark::DoNotOptimize(res);
    }
}

BENCHMARK_F(fixture, cpp_dotf32)(benchmark::State& state) {
    for (auto _ : state) {
        auto res = cpp::dotf32(vec1, vec2, len);
        benchmark::DoNotOptimize(res);
    }
}

BENCHMARK_MAIN();
