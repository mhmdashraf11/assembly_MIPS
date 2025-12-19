#branching pseudo-instructions
#b label = j label => jump without condition
#blt $t0,$t1, label => branch if less than
#ble => branch if less than or equal
#bge => branch if greater than or equal
#bnez => branch if not equal zero
#beq => branch if equal zero
#bgt => branch if greater than


#General Structure of a While Loop in MIPS
loop_start:
# Evaluate condition
# If condition is false, branch to loop_end
# Loop body
j loop_start # Jump back to the start of the loop
loop_end:
# Continue program