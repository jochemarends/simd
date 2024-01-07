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
