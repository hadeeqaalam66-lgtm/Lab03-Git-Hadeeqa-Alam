addi x10, x0, 10
addi x11, x0, 20
addi x12, x0, 5
addi x13, x0, 2
addi x20, x0, 0

addi x2,x0, 0x100
sw x10, 0(x2)
sw x11, 4(x2)
sw x12, 8(x2)
sw x13, 12(x2)

jal x1, leaf_example
ecall
j exit

leaf_example:
    lw x18, 0(x2)
    lw x19, 4(x2)
    add x20,x18, x19 #g+h
    lw x18, 8(x2)
    lw x19, 12(x2)
    add x19, x18,x19 #i+j
    sub x20,x20,x19
       
    jalr x0, 0(x1)
exit: