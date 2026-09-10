main:
    addi x10, x0, 10 #g
    addi x11, x0, 20 #h
    addi x12, x0, 5 #i
    addi x13, x0, 2 #j

    jal x1, leaf_example
    addi x11, x10, 0    # Copy result (23) into x11 (a1)
    addi x10, x0, 1 # set x10 to 1 for ecall
    ecall
    j exit

    leaf_example:
        addi x2,x2, -12 # sp
        sw x18, 0(x2) # store g
        sw x19, 4(x2) # store h
        sw x20, 8(x2) # store f
        add x18, x10, x11 # g+h
        add x19, x12, x13 # i+j
        sub x20, x18, x19 #f = (g+h)-(i-j)
        add x10, x20, x0 # store f in x10
        # restore registers
        lw x18, 0(x2)
        lw x19, 4(x2)
        lw x20, 8(x2)
        
        addi x2,x2, 12 # sp       
        jalr x0, 0(x1)
    exit:
    end:
        j end

        