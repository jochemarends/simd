#include <math_cpp.h>

namespace cpp {
    void addf32(const float* vec1, const float* vec2, std::uint64_t len, float* res) {
        for (std::uint64_t idx{}; idx < len; ++idx) {
            res[idx] = vec1[idx] + vec2[idx];
        }
    }

    float dotf32(const float* vec1, const float* vec2, std::uint64_t len) {
        float sum{};
        for (std::uint64_t idx{}; idx < len; ++idx) {
            sum += vec1[idx] * vec2[idx];
        }
        return sum;
    }
}

