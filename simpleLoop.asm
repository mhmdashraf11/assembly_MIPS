#branching
#beq $rs, $rt, label => branch if equal
#bne $rs, $rt, label => branch if not equal
#slt $rd, $rs, $rt => set on less than, rd = 1 if true

#if (a == b)
#{
#c = 1;
#}
#else
#{
#c = 0;
#}

.data
a: .word 5
b: .word 5
c: .word 0

.text
main:
lw $t0,a #load the int (a) to reg $t0
lw $t1,b
beq $t0,$t1,equal #branch if equal and jump to the label equal

li $t2,0 #else load 0
sw $t2,c # assign the value to the memory
j print #jump to label print

equal:
li $t2,1 #if the condition is true, assign 1 to the register $t2
sw $t2,c #set the value to the memory 

print:
lw $a0,c #load the value from memory
li $v0,1 # set the systemcall
syscall
#exit the program
li $v0,10
syscall
