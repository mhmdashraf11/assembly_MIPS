.data
input: .word 0 # Reserve memory to store the integer input
input_float: .float 0.0 
newLine: .asciiz "\n"
.text
li $v0, 5 # Syscall code for reading an integer
syscall # Perform the syscall
#sw $v0, input # Store the input in memory
move $a0,$v0
li $v0,1
syscall 

#printing new line
li $v0,4
la $a0,newLine
syscall 

li $v0, 6 # Syscall code for reading a float
syscall # Perform the syscall
swc1 $f0, input_float # Store the float input in memory
lwc1 $f12,input_float  #lw cannot be used here and also $a0
li $v0,2
syscall