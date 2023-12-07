.globl matmulf32

# TODO: first make it work with only the first element
# TODO: add loops
# TODO: test and benchmark

.data
.align 32
mask:
.fill 8, 4, 0x00000000
.fill 8, 4, 0x80000000

.text
matmulf32:
    movq    %rcx, %r10
    andq    $7, %r10
    leaq    mask(%rip), %rax
    vmovdqu (%rax, %r8, 4), %ymm0

    vxorps  %ymm2, %ymm2, %ymm2
    vmaskmovps (%rcx), %ymm0, %ymm1
    vbroadcastss (%rdi), %ymm0
    vfmadd231ps %ymm0, %ymm1, %ymm2

    vmovups  %ymm2, (%r9)
    ret