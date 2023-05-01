.data
	a: .word 0
	b: .word 0
	c: .word 0
	d: .word 0
	
.text
main:	li $v0, 5 		# sistem call to read_int
	syscall
	add $t0, $v0, $zero	# $t0 = $v0
	sw $t0, a		# a = $t0
	
	li $v0, 5 		# sistem call to read_int
	syscall
	add $t1, $v0, $zero	# $t1 = $v0
	sw $t1, b		# b = $t1
	
	divu $t0, $t1 		# hi,lo = $t0 / $t1
	mflo $t2		# $t2 = lo
	mfhi $t3		# $t3 = hi
	sw $t2, c		# c = $t2
	sw $t3, d		# d = $t3
	
	li $v0, 1		#sistem call to print_int
	
	lw $a0, d
	syscall

	lw $a0, c
	syscall
	
	
	la $ra, main
	jr $ra
	
