/**
 * @file lib_cpp.h
 * @author Jochem Arends
 */

#ifndef LIB_CPP_H
#define LIB_CPP_H

#include <cstdint>

namespace cpp {
    /**
     * Vector Addition.
     * Adds two vectors of single-precision floating point numbers.
     *
     * @param vec1 The 1st source operand.
     * @param vec2 The 2nd source operand.
     * @param len The amount of elements each vector holds.
     * @param res The destination operand.
     */
    void addf32(const float* vec1, const float* vec2, std::uint64_t len, float* res);

    /**
     * Dot Product.
     * Calculates the dot product for two vectors of single-precision floating point numbers.
     *
     * @param vec1 The 1st source operand.
     * @param vec2 The 2nd source operand.
     * @param len The amount of element each vector holds.
     */
    float dotf32(const float* vec1, const float* vec2, std::uint64_t len);

    /** To Upper.
     * Converts a sequence of ASCII characters to upper case.
     *
     * @param str A pointer to the sequence of characters to convert.
     * @param len The length of the sequence.
     */
    void to_upper(char* str, std::uint64_t len);
}

#endif

