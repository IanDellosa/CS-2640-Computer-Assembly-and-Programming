# November 6, 2023
# Write a program that traverses an array and prints the elements

.data
message: .asciiz "The values in the array are:\n"
list: .word 1, 2, 3, 4, 5
newLine: .asciiz "\n"

.text
main:
	li $v0, 4
	la $a0, message
	syscall

	la $s0, list
	move $t1, $zero
loop:
	lw $t0, 0($s0)
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	beq $t1, 4, end
	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop
	
end:

	li $v0, 10
	syscall
