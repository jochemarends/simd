/**
 * @file math_cpp.h
 * @author Jochem Arends
 */

#ifndef MATH_CPP_H
#define MATH_AVX_H

#include <cstdint>

namespace cpp {
    /**
     * Vector Addition.
     * Adds two vectors of single-precisions floating point numbers.
     *
     * @param vec1 The 1st source operand.
     * @param vec2 The 2nd source operand.
     * @param len The amount of elements each vector holds.
     * @param res The destination operand.
     */
    void addf32(const float* vec1, const float* vec2, std::uint64_t len, float* res);

    /**
     * Dot Product.
     * Calculates the dot product for two vector of single-precision floating point numbers.
     *
     * @param vec1 The 1st source operand.
     * @param vec2 The 2nd source operand.
     * @param len The amount of element each vector holds.
     */
    float dotf32(const float* vec1, const float* vec2, std::uint64_t len);
}

#endif

