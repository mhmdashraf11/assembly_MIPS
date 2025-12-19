.data
n: .word 0 #user input
result: .word 1
msg: .asciiz "Enter a number to calculate its factorial: "
newLine: .asciiz "\n"
msg2: .asciiz "Factorial: "
.text
	#printing the msg
	la $a0,msg
	li $v0,4
	syscall 
	#getting user input
	li $v0,5
	syscall
	sw $v0,n #update n value
	#init counter
	li $t0,1
	#get the data
	lw $t1,n
	lw $t2,result
loop:
	#if n < counter end the loop
	blt $t1,$t0,endLoop
	mul $t2,$t2,$t0
	addi $t0,$t0,1
	j loop
endLoop:
	sw $t2,result #store
	#print msg2
	li $v0,4
	la $a0,msg2
	syscall
	#print
	li $v0,1
	lw $a0,result
	syscall
	
	li $v0,10
	syscall
	
	