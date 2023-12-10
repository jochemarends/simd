/**
 * @file lib_avx.h
 * @author Jochem Arends
 */

#ifndef LIB_AVX_H
#define LIB_AVX_H

#include <cstdint>

namespace avx {
    /**
     * Vector Addition.
     * Adds two vectors of single-precision floating point numbers.
     *
     * @param vec1 The 1st source operand.
     * @param vec2 The 2nd source operand.
     * @param len The amount of elements each vector holds.
     * @param res The destination operand.
     */
    extern "C" void addf32(const float* vec1, const float* vec2, std::uint64_t len, float* res);

    /**
     * Dot Product.
     * Calculates the dot product for two vectors of single-precision floating point numbers.
     *
     * @param vec1 The 1st source operand.
     * @param vec2 The 2nd source operand.
     * @param len The amount of element each vector holds.
     */
    extern "C" float dotf32(const float* vec1, const float* vec2, std::uint64_t len);

    /** To Upper.
     * Converts a sequence of ASCII characters to upper case.
     *
     * @param str A pointer to the sequence of characters to convert.
     * @param len The length of the sequence.
     */
     extern "C" void to_upper(char* str, std::uint64_t len);
}

#endif
