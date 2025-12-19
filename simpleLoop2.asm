.data 
sum:   .word 0
i:     .word 1      # i = 1
limit: .word 5

.text
main:
lw $t0,sum
lw $t1,i
lw $t2,limit

loop_start:
bgt $t1,$t2,end_loop   # if i > limit → exit
add $t0,$t0,$t1        # sum += i
addi $t1,$t1,1         # i++
j loop_start

end_loop:
sw $t0,sum

li $v0,1
lw $a0,sum
syscall

li $v0,10
syscall
