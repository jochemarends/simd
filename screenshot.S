addq    %rax, %rbx

.data
.align 32
.vec1
.text
vaddss  %xmm0, %xmm1, %xmm2
vsubsd  %ymm0, %ymm1, %ymm2
vmulss  %ymm0, %ymm1, %ymm2
vaddss
vsubss
vmulss

.data
.align 16
vec1: .float 1.0, 2.0, 3.0, 4.0
vec2: .float 2.0, 7.0, 0.5, 4.3
result: .fill 4, 4, 0.0
.text
scalef32:
    vmovaps vector(%rip), %xmm0
    vbroadcastss scalar(%rip), %xmm1
    vmulps  %xmm1, %xmm0, %xmm0
    vmovups %xmm0, result(%rip)