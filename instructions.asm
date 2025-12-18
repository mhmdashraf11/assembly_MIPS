#adding intgers
.data
num1: .word 1
num2: .word 2
msg: .asciiz "sum= "
subMsg: .asciiz "sub= "
newLine: .asciiz "\n"
.text 
lw $t1,num1
lw $t2,num2
#1.perform adding 1+2 and put it in $t0
add $t0,$t1,$t2
#2.printin msg
li $v0,4
la $a0,msg
syscall 
#3.printing sum
move $a0,$t0 # move it to $a0 to perform printing
li $v0,1 #load syscall
syscall #perform printing

# Load values into registers
lw $t1, num1 # Load 1 into $t1
lw $t2, num2 # Load 2 into $t2
# Subtract integers
sub $t0, $t1, $t2 # $t0 = $t1 - $t2 (1 - 2 = -1)
#printing new line
li $v0,4
la $a0,newLine
syscall 
#2.printin msg
li $v0,4
la $a0,subMsg
syscall 
#printing sub
move $a0,$t0 # move it to $a0 to perform printing
li $v0,1 #load syscall
syscall #perform printing

