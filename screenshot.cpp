#include <cstdint>

namespace cpp {
    void addf32(const float* vec1, const float* vec2, std::uint64_t len, float* res);
    float dotf32(const float* vec1, const float* vec2, std::uint64_t len);
}

namespace avx {
    extern "C" void addf32(const float* vec1, const float* vec2, std::uint64_t len, float* res);
    extern "C" float dotf32(const float* vec1, const float* vec2, std::uint64_t len);
}