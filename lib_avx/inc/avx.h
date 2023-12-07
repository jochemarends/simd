#ifndef AVX_H
#define AVX_H

#include <cstdint>

using f32 = float;
using f64 = double;
using i32 = std::int32_t;
using i64 = std::int32_t;
using u64 = std::uint64_t;

namespace avx {
    extern "C" f32 dotf32(const f32* vec1, const f32* vec2, u64 len);
    extern "C" void addf32(const f32* vec1, const f32* vec2, u64 len, f32* res);
    extern "C" void matmulf32(const f32* mat1, u64 rows1, u64 cols1, const f32* mat2, u64 cols2, f32* res);
}

#endif
