addi x10, x0, 20  #v[k]
addi x11, x0, 10 #v[k+1]
addi x5, x0, 0 #temp

addi x2, x0, 0x100 #sp

sw x10, 0(x2)
sw x11, 4(x2)
jal x1, swap
ecall
j exit

swap:
    lw x5, 0(x2)
    lw x10, 4(x2)
    add x11, x5, x0
    
    jalr x0, 0(x1)
exit: