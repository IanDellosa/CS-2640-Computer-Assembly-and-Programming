# CS 2640.01
# October 22, 2023
# Write a program that takes two numbers from
# a user, and outputs those numbers.

.data
prompt1: .asciiz "Please input the first number: " 
prompt2: .asciiz "Please input the second number: "
Input1: .asciiz "The First Number was: "
Input2: .asciiz ", The Second Number was: "
added: .asciiz "\nThe two numbers added are: "
subbed: .asciiz "\nThe two numbers subtracted are: "
multiplied: .asciiz "\nThe two numbers multiplied are: "
divided: .asciiz "\nThe two numbers divided are: "
remainder: .asciiz " Remainder "
areEqual: .asciiz "\nUser inputs are the same"
areInequal: .asciiz "\nUser inputs are different"

.text
main:
# Task 1
	# First Input
	li $v0, 4
	la $a0, prompt1
	syscall

	li $v0, 5
	syscall
	move $s0, $v0
	
	#Second Input
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	# Print Inputs
	li $v0, 4
	la $a0, Input1
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, Input2
	syscall
	li $v0, 1
	la $a0, ($s1)
	syscall
	
# Task 2

	# Add
	add $t0, $s0, $s1
	li $v0, 4
	la $a0, added
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall

	# Sub
	sub $t0, $s0, $s1
	li $v0, 4
	la $a0, subbed
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	# Mult
	mult $s0, $s1
	li $v0, 4
	la $a0, multiplied
	syscall
	
	mflo $t0
	mfhi $t1
	add $t2, $t0, $t1
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	# Div
	div $s0, $s1
	li $v0, 4
	la $a0, divided
	syscall
	
	mflo $t0
	mfhi $t1
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, remainder
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
		
# Task 3
	beq $s0, $s1, equal
	bne $s0, $s1, inequal
		
equal:
	li $v0, 4
	la $a0, areEqual	
	syscall
	
	j exit
inequal:
	li $v0, 4
	la $a0, areInequal
	syscall
	
	j exit
exit:
	#Create an exit program syscall
	li $v0, 10
	syscall
