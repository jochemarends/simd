.globl dotf32

.data
.align 32
mask:
.fill 8, 4, 0x00000000
.fill 8, 4, 0x80000000

.text
dotf32:
    movq    %rdx, %rcx
    andq    $7, %rcx
    leaq    mask(%rip), %rax
    vmovdqu (%rax, %rcx, 4), %ymm2
    vmaskmovps -32(%rdi, %rdx, 4), %ymm2, %ymm0
    vmaskmovps -32(%rsi, %rdx, 4), %ymm2, %ymm1
    vdpps   $0xFF, %ymm1, %ymm0, %ymm0
    vextractf128 $1, %ymm0, %xmm1
    vaddss  %xmm1, %xmm0, %xmm0
    subq    %rcx, %rdx
    jz      done
loop:
    vmovups -32(%rdi, %rdx, 4), %ymm1
    vdpps   $0xFF, -32(%rsi, %rdx, 4), %ymm1, %ymm1
    vaddps  %ymm1, %ymm0, %ymm0
    vextractf128 $1, %ymm0, %xmm1
    vaddss  %xmm1, %xmm0, %xmm0
    subq    $8, %rdx
    jnz     loop
done:
    ret

matmulf32:
    movq    %rdx, %rcx
    andq    $3, %rcx
    leaq    mask(%rip), %rax
    vmovdqu (%rax, %rcx, 4), %xmm2

    vbroadcastss (%rdi, %r10, 4), %xmm0
    vmaskmovps (%rcx, %r11, 4), %xmm2, %xmm1
    vfmadd231ps %xmm1, %xmm0, %xmm0

    vmaskmovps %xmm0, %xmm2, (%rax)


matmulf32_row_loop:

matmulf32_col_loop:
matmulf32_col_test:
matmulf32_row_test:
    xorq    %r10, %r10 # reset the row index of mat1
    xorq    %r11, %r11 # reset the col index of mat2
    subq    $1, %rsi
    jnz     matmulf32_row_loop

matmulf32_done:

    subq    $1, %r10
    jnz      matmulf32_row_loop
