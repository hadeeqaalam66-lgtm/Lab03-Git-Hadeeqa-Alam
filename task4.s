main:
    li x10, 0x100  
    li x11, 0x200  #destination address
    jal x1, Strcpy  # call Strcpy & save return address in x1
    j exit

Strcpy:
    addi sp, sp, -8 # allocate space on stack
    sw x19, 0(sp)       # 
    add x19, x0, x0 # loop index i = 0
    Loop:
        add x7, x11, x19 #address of y[i]
        lb x6, 0(x7)   # Loading byte
        add x5, x10, x19 
        sb x6, 0(x5) # Store byte from x6 into x[i]
        addi x19, x19, 1  #  i=i+1
        bne x6, x0, Loop  #checks if c != '\0'
    lw x19, 0(sp)    #restores x19
    addi sp, sp, 8
    jalr x0, 0(x1)
exit:
end:
    j end

    