.globl addf32

.data
.float 3.3
.align 32
mask:
.fill 8, 4, 0x00000000
.fill 8, 4, 0x80000000
.text
addf32:
# calculating mask.
    movq    %rdx, %r8
    andq    $7, %r8
    leaq    mask(%rip), %rax
    vmovdqu (%rax, %r8, 4), %ymm0
# performing operation on last element
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
