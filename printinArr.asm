# Array printing using loop
# 1. Initialization:
# la $t0, arr      -> Load the base address of the array
# lw $t1, size     -> Load the size of the array into a register
# li $t2, 0        -> Initialize the index (i) to 0

# 2. Condition Check:
# bge $t2, $t1, loop_end
# Compare the index with the array size
# If i >= size, exit the loop

# 3. Accessing Array Elements:
# Calculate the address of the current element using:
# address = base_address + (index * element_size)
# Multiply the index by 4 (size of one word)
# Add the result to the base address of the array
.data
arr: .word 10, 20, 30, 40, 50   # Integer array
size: .word 5                  # Number of elements in the array
newline: .asciiz "\n"           # New line character

.text
main:
    la $t0, arr        # Load base address of the array into $t0
    lw $t1, size       # Load the value of size (number of elements)
    li $t2, 0          # Initialize index i = 0

loop_start:
    bge $t2, $t1, loop_end   # If i >= size, exit the loop

    # Calculate address of arr[i]
    sll $t3, $t2, 2           # t3 = i * 4 (word size)
    add $t4, $t0, $t3         # t4 = address of arr[i]

    # Print arr[i]
    lw $a0, 0($t4)            # Load arr[i] into $a0
    li $v0, 1                 # Syscall code for print integer
    syscall

    # Print newline
    li $v0, 4                 # Syscall code for print string
    la $a0, newline            # Load address of newline
    syscall

    addi $t2, $t2, 1          # i++
    j loop_start               # Repeat the loop

loop_end:
    li $v0, 10                # Exit program
    syscall
