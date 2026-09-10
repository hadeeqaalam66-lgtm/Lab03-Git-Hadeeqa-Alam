main:
    addi x2, x0, 0x100 #memory base address for array v
    addi x5, x0, 20
    sw   x5, 0(x2)       #setting  v[0] = 20
    addi x5, x0, 10
    
    sw   x5, 8(x2)         # v[1] = 10
    addi x10, x2, 0         # x10 as base address of v
    addi x11, x0, 0        #  x11 = index k = 0

    jal  x1, swap

    addi x10, x0, 10       #Program exit
    ecall

swap:
    slli x6, x11, 3        # Shiftin left logical by 3 (k * 8)
    add  x6, x10, x6        # storing address 
    lw   x5, 0(x6)       # temp = v[k]
    lw   x7, 8(x6)        # x7 = v[k+1]
    sw   x7, 0(x6)         # v[k] = v[k+1]
    sw   x5, 8(x6)         #v[k+1] = temp
    jalr x0, 0(x1)