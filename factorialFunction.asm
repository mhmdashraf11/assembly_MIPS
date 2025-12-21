.data 
	prompt: .asciiz "Enter a number: "
	resultMsg: .asciiz "Factorial is "
	newLine: .asciiz "\n"

.text
	main:
		#prompt input
		li $v0,4
		la $a0,prompt
		syscall
		#get input
		li $v0,5
		syscall
		move $a0,$v0
		
		#call function
		jal factorial
		move $t0,$v0 
		#print new line
		li $v0,4
		la $a0,newLine
		syscall
		#print result msg
		li $v0,4
		la $a0,resultMsg
		syscall
		#print actual result
		li $v0,1
		move $a0,$t0
		syscall
		#exit
		li $v0,10
		syscall
		
	factorial:
		li $v0,1 #intial result
		li $t1,1 #initialize counter
		loop_start:  
			blt $a0,$t1,end_loop #if n < counter end the loop
			mul $v0,$v0,$t1 #else result = result*counter
			addi $t1,$t1,1	#counter++
			j loop_start	#check the condition again
		end_loop:
			jr $ra  #jump register