.data
	a: .word 0
	b: .word 0
	c: .word 0
	
.text
main:	li $v0, 5 		# sistem call to read_int
	syscall
	add $t0, $v0, $zero	# $t0 = $v0
	sw $t0, a		# a = $t0
	
	li $v0, 5 		# sistem call to read_int
	syscall
	add $t1, $v0, $zero	# $t1 = $v0
	sw $t1, b		# b = $t1
	
	add $t2, $t0, $t1 	# $t2 = $t0 + $t1
	sw $t2, c
	
	li $v0, 1		#sistem call to print_int
	lw $a0, c
	syscall
	
	la $ra, main
	jr $ra
	