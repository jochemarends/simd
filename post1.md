## Introduction to SIMD
### Table of Contents
1. What is SIMD?
2. SIMD for x86 processors
3. Registers and data types
4. Some instructions
5. Example program

### What is SIMD?
SIMD (Same Instruction Multiple Data) is technique where a CPU performs an operation on multiple operands concurrently. SIMD is widely used in many programming domains such as graphics programming and image processing. 

### SIMD extensions for the x86 Processors
The x86 processor architecture has various SIMD extensions. I will only focus on the AVX, AVX2, and FMA extensions in this blog post series. AVX instruction can operate on 256-bit wide registers, these are named `ymm0`-`ymm15`. The lower 128-bit of these registers are aliased to `xmm0`-`xmm1`.

### SIMD Registers
In addition to the regular registers available on the `x86_64` architecture, processors that implements the AVX extension provide sixteen 256-bit wide registers named `ymm0`-`ymm15`. The lower 128 bits of these registers can be accessed by `xmm0`-`xmm15`. AVX and AVX2 can operate on both packed and scalar dat with packed data.

## Moving Data
Most AVX instructions operate on scalar or packed data. A single-precision floating point number can be moved using the `vmovss` instruciton. A double-precision floating point instruction can be moved around using the `vmovsd` instruction.

Suppose we want to perform addition between two arrays of single-precision floating point numbers. We can write a function that makes use of SIMD instruction in order to speed up this operation.
```cpp
extern "C" void addf32(const f32* vec1, const f32* vec2, u64 len; f32* res);
```
The parameters `vec1`, `vec2`, `len`, and `res` are passed through the registers`rdi`, `rsi`, `rdx`, and `rcx` respectively.
```asm
.globl addf32
addf32:
    xorq    %rax, %rax
    jmp     packed_test
packed_loop:
    vmovups (%rdi, %rax, 4), %ymm0
    vaddps  (%rsi, %rax, 4), %ymm0, %ymm0
    vmovups %ymm0, (%rcx, %rax, 4)
    addq    $8, %rax
    subq    $8, %rdx
packed_test:
    cmpq    $8, %rdx
    jae     packed_loop
    jmp     scalar_test
scalar_loop:
    vmovuss (%rdi, %rax, 4), %xmm0
    vaddss  (%rsi, %rax, 4), %xmm0, %xmm0
    vmovuss %xmm0, (%rcx, %rax, 4)
    addq    $1, %rax
    subq    $1, %rdx
scalar_test:
    orq     %rdx, %rdx
    jnz     scalar_loop
    ret
```
The first instruction of this procedure makes sure that the contents of the `rax` register is zero. This is because `rax` will be used for indexing. After that the program will jump to the `packed_test` label where will be checked whether the source operands contain eight more elements. If this is the case, a packed addition will be performed. Else, the scalar.

###

### Masking