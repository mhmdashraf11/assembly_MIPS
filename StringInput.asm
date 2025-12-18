.data
buffer: .space 50 # Allocate space for the string (50 bytes)
prompt: .asciiz "Enter a string: “
.text
# Print the prompt
li $v0, 4 # Syscall code for print_string
la $a0, prompt # Load the address of the prompt
syscall # Perform the syscall
# Get the string input
li $v0, 8 # Syscall code for reading a string
la $a0, buffer # Load the address of the buffer
li $a1, 50 # Set the maximum length of the input
syscall # Perform the syscall
#Use $a0 to provide the buffer address and $a1 for the maximum input length.