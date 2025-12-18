#multiply & division
#mul save in single register  32bits only
#mul $rd, $rs, $rt

.data
num1: .word 1
num2: .word 2
msg: .asciiz "mul= "
newLine: .asciiz "\n"

.text 
# load nums and perform mul
lw $t1,num1
lw $t2,num2
mul $t0,$t1,$t2


#print msg
li $v0,4
la $a0,msg
syscall

# print mul
move $a0,$t0
li $v0,1
syscall

#mult 2registrs most significant hi, least significant lo
#mult $t1, $t2 # Multiply $t1 and $t2, result in HI and LO
#mflo $t0 # Move the lower 32 bits of the product to $t0
#mfhi $t1 # Move the upper 32 bits of the product to $t1

#printing new line
li $v0,4
la $a0,newLine
syscall 
#print msg
li $v0,4
la $a0,msg
syscall
#multiply using sll(shift left logic)
sll $t0,$t2,3 #2*2^3
move $a0,$t0
li $v0,1
syscall



#div
div $t2,$t1
mflo $t3 # Move quotient to $t3 (should be 2)
mfhi $t4 # Move remainder to $t4 (should be 1)

#divu for unsigned 