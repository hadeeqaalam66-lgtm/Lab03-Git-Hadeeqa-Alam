main:
addi x10, x0, 12 #a value
addi x11, x0, 12 #b value
jal x1, sum # go to sum function
addi x11, x10, 0 # store the result in x11
li x10, 1 # set x10 to 1 for ecall
ecall
j exit
sum:
    add x10, x11, x10 # add a and b, store in x10
    jalr x0, 0(x1) # return to caller
exit: