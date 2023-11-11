# CS 2640.01
# November 10, 2023
# Given a user input x and y variable, Output the value of x to the power of y

.data

xInputPrompt: .asciiz "Please enter a number for 'x': "
yInputPrompt: .asciiz "Please enter a number for 'y': "
result: .asciiz "'x' to the power of 'y' is: "

.text
	li $v0, 4
	la $a0, xInputPrompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	add $t3, $s0, $zero
	
	li $v0, 4
	la $a0, yInputPrompt
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	addi $t0, $zero, 1
	
loop: 
	beq $t0, $s1, end
	
	mult $s0, $t3
	
	mflo $t1
	mfhi $t2
	add $s0, $t1, $t2
	
	addi $t0, $t0, 1

	j loop
	
end:

	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall

	li $v0, 10
	syscall