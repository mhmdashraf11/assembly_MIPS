.data  # to declare vars in memory
num: .word 42 #.word for int
msg: .asciiz "hello" #.asciiz is null terminated string
newLine: .asciiz "\n" 
.text # the code
#print 42
li $v0,1 # load immediate to the system call number (always in $v0)
lw $a0,num # load word or int that you want to print or to do the system call in,in $a0
syscall  # perform
#new line
li $v0,4
la $a0,newLine
syscall 
# print hello
li $v0,4
la $a0,msg
syscall

# system calls
#printing          Reading
#1 => int	   5
#2 => float	   6
#4 => double	   7
#5 => string	   8
#11 => char        12
#	 exit => 10
