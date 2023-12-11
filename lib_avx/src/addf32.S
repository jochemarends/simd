.globl addf32

.data
.align 32
mask:
.fill 8, 4, 0x00000000
.fill 8, 4, 0x80000000
.text
addf32:
    movq    %rdx, %r8
    andq    $7, %r8
    leaq    mask(%rip), %rax
    vmovdqu (%rax, %r8, 4), %ymm0
    vmaskmovps -32(%rdi, %rdx, 4), %ymm0, %ymm1
    vmaskmovps -32(%rsi, %rdx, 4), %ymm0, %ymm2
    vaddps  %ymm1, %ymm2, %ymm2
    vmaskmovps %ymm2, %ymm0, -32(%rcx, %rdx, 4)
    subq    %r8, %rdx
    jz      done
loop:
    vmovups -32(%rdi, %rdx, 4), %ymm0
    vaddps  -32(%rsi, %rdx, 4), %ymm0, %ymm1
    vmovups %ymm1, -32(%rcx, %rdx, 4)
    subq    $8, %rdx
    jnz     loop
done:
    vzeroupper
    ret

_addf32:
    jmp     scalar_test
scalar_loop:
    vmovss  -4(%rdi, %rdx, 4), %xmm0
    vaddss  -4(%rsi, %rdx, 4), %xmm0, %xmm1
    vmovss  %xmm1, -4(%rcx, %rdx, 4)
    subq    $1, %rdx
scalar_test:
    andq    $7, %rdx
    jnz     scalar_loop
    testq   %rdx, %rdx
    jz      done
float8_loop:
    vmovups -32(%rdi, %rdx, 4), %ymm0
    vaddps  -32(%rsi, %rdx, 4), %ymm0, %ymm1
    vmovups %ymm1, -32(%rcx, %rdx, 4)
    subq    $8, %rdx
    jnz     float8_loop
_done:
    vzeroupper
    ret
