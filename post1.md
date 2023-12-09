## Introduction to SIMD
### Table of Contents
1. What is SIMD?
2. SIMD for x86 processors
3. Registers and data types
4. Some instructions
5. Example program

### What is SIMD?
SIMD (Same Instruction Multiple Data) is technique where a CPU performs an operation on multiple operands concurrently. SIMD can reduce the number of instructions needed to perform a certain task and make algorithms faster. SIMD is widely used in many programming domains such as graphics programming and image processing. 

### SIMD extensions for the x86 Processors
The x86 processor architecture has various SIMD extensions. I will only focus on the AVX extensions, AVX2, and FMA extensions in this blog post series. AVX instruction can operate on 256-bit wide registers, these are named `ymm0`-`ymm15`. The lower 128-bit of these registers are aliased to `xmm0`-`xmm1`.

### SIMD Registers
In addition to the regular registers available on the x86 architecture, processors that implement the AVX extensions provide sixteen 256-bit wide registers named `ymm0`-`ymm15`. The lower 128 bits of these registers are aliased to `xmm0`-`xmm15`. These registers can be used to perform operations on scalar or packed data. The registers `xmm0`-`xmm15` can hold four 32-bit values and the registers `ymm0`-`ymm15` can hold eight 32-bit values.

### Scalar Data
Most AVX instructions operate on scalar or packed data. A single-precision floating point number can be moved using the `vmovss` instruction and `vmovsd` can be used for moving double-precision floating point numbers. The following program swaps the contents at the `a` and `b` labels using four `vmovsd` instruction.
```asm
.data
a: .double 320.0
b: .double 200.0
.text
swap:
    vmovsd  a(%rip), %xmm0
    vmovsd  b(%rip), %xmm1
    vmovsd  %xmm1, a(%rip)
    vmovsd  %xmm0, b(%rip)
```
The AVX instruction set provides several instruction for performing arithmetic operations on scalar data. The `vaddss` instruction adds two single-precision floating point values together. It requires three operands, two source operands and one destination operand. Just like `vmovss` by swapping the last letter of the mnemonic to a `d` we get the double-precision variant of this instruction. A lot more arithmetic instruction are available, for example: `vsubss` for subtracting, `vmulss` for multiplying and `vdivss` for dividing. The following program calculates the area of a circle using AVX instructions.
```asm
.data
pi: .float 3.14
radius: .float 5.2
area: .float ?
.text
    vmovss  radius(%rip), %xmm0     # load the radius
    vaddss  %xmm0, %xmm0, %xmm0     # square the radius
    vmulss  pi(%rip), %xmm0, %xmm0  # multiply by pi
    vmovss  %xmm0, area(%rip)       # write the result to memory
```
### Packed Data
We can also perform operations on packed data. In each 128-bit register, four 32-bit or two 64-bit values can be stored. In each 256-bit register, eight 32-bit or four 64-bit values can be stored. The `vmovaps` can be used to move aligned packed single-precision floating point values into one of these registers. Data is aligned when it starts at an address that is a multiple of a given number. When moving packed data from or to a 128-bit register the address of the source operand needs to be a 16-byte aligned address. When moving packed data from or to a 256-bit register the address of the memory operand needs to be a 32-byte aligned address. When its uncertain whether data is aligned, `vmovups` should be used to move unaligned packed single-precision floating point values.
Just like with scalar data, AVX also provides instruction 
We can operate on packed data in order to ...
In order to move packed single-precision floating point values, the `vmovps` instruction can be used. In order to move packed single-precision floating point values, the `vmovps` instruction can be used.
```asm
.data
.numbers: .float 1.0, 2.0, 3.0, 4.0
.text
```

```asm
.data
.align 32
max: .float 255.0
rgba: .float 255.0, 200.0, 15.0, 1.0 
inv: .fill 4, 4, ?
.text
    vbroadcastss max(%rip), %xmm0
    vsubps  %xmm0, %(xmm0
vmov

### Masking

