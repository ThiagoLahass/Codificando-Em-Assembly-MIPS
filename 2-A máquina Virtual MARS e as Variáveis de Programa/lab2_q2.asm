.data
	var1: .word 0x55 	# var1 is a word (32 bit) with the initial value 0x55
	var2: .word 0xaa	# var2 is a word (32 bit) with the initial value 0xaa
	var3: .word 0x1 	# var3 is a word (32 bit) with the initial value 0x01
	var4: .word 0x2		# var4 is a word (32 bit) with the initial value 0x02
	
	primeiro: .byte 't'	# primeiro is a byte (8 bit) with the initial value 't'
	ultimo: .byte 'l'	# primeiro is a byte (8 bit) with the initial value 'l'
	
.text
	# var1 = var4
	# var2 = var3
	# var3 = var2
	# var4 = var1

	lw $t0, var1	#carrega o valor de var1 para o reg $t0
	lw $t1, var2	#carrega o valor de var2 para o reg $t1
	lw $t2, var3	#carrega o valor de var3 para o reg $t2
	lw $t3, var4	#carrega o valor de var4 para o reg $t3
	
	sw $t3, var1	#carrega o valor de $t3 (var4) para var1
	sw $t2, var2	#carrega o valor de $t2 (var3) para var2
	sw $t1, var3	#carrega o valor de $t1 (var2) para var3
	sw $t0, var4	#carrega o valor de $t0 (var1) para var4
	
	li $v0, 1 		# system call for print_int
	lw $a0, var1 		# carregar o valor de var1 para o res $a0
	syscall			#chamada de sistema para realizar o print
	lw $a0, var2 		# carregar o valor de var2 para o res $a0
	syscall			#chamada de sistema para realizar o print
	lw $a0, var3 		# carregar o valor de var3 para o res $a0
	syscall			#chamada de sistema para realizar o print
	lw $a0, var4 		# carregar o valor de var4 para o res $a0
	syscall			#chamada de sistema para realizar o print
	
	li $v0, 4 		# system call for print_str
	la $a0, primeiro 	# carregar o valor de var4 para o res $a0
	syscall			#chamada de sistema para realizar o print
	
