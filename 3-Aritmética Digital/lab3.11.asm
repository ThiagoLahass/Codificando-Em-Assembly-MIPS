.data
	newLine: .byte '\n'
	
	Zero.s : 	.float  0
	PlusInf.s : 	.float  0
	MinusInf.s : 	.float  0
	PlusNaN.s: 	.float  0
	MinusNan.s: 	.float  0
	
	Zero.d : 	.double 0
	PlusInf.d : 	.double 0
	MinusInf.d : 	.double 0
	PlusNaN.d: 	.double 0
	MinusNan.d: 	.double 0
	

.text
	# FLOAT
	
	#Zero
	li $v0,2		# load 2 in $v0 to call print_float
	ori $t0, $zero, 0	# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin ), Zero
	mtc1 $t0, $f0		# move $t0 to $f0
	mov.s $f12, $f0		# move $f0 to $f12 to print_float
	syscall			# call system
	
	li $v0, 4		# load 4 in $v0 to call print_string
	la $a0, newLine		# load the newLine adress to print the string '\n'
	syscall 		# call system
	
	
	#Plus Infinty
	li $v0,2
	ori $t0, $zero, 2139095040	# $t0 = $zero or 2139095040 ( 01111111100000000000000000000000 bin ), Plus Infinty
	mtc1 $t0, $f1			# move $t0 to $f1
	mov.s $f12, $f1			# move the value in $f1 to $f12
	syscall
	
	li $v0, 4		
	la $a0, newLine		
	syscall 		
	
	
	#Minus Infinty
	li $v0,2
	ori $t0, $zero, 4286578688	# $t0 = $zero or 2139095040 ( 11111111100000000000000000000000 bin ), Minus Infinty
	mtc1 $t0, $f2			# move $t0 to $f2
	mov.s $f12, $f2			# move the value in $f2 to $f12
	syscall
			
	li $v0, 4		
	la $a0, newLine		
	syscall 		
	
	
	#PlusNaN
	li $v0,2
	ori $t0, $zero, 2146959360	# $t0 = $zero or 2146959360 ( 01111111111110000000000000000000 bin ), NaN
	mtc1 $t0, $f3			# move $t0 to $f3
	mov.s $f12, $f3			# move the value in $f3 to $f12
	syscall
			
	li $v0, 4		
	la $a0, newLine		
	syscall
	
	
	#MinusNaN
	li $v0,2
	ori $t0, $zero, 4294443008	# $t0 = $zero or 4294443008 ( 11111111111110000000000000000000 bin ), MinusNaN
	mtc1 $t0, $f4			# move $t0 to $f4
	mov.s $f12, $f4			# move the value in $f4 to $f12
	syscall
			
	li $v0, 4		
	la $a0, newLine		
	syscall
	
	
	#Maior numero possivel
	li $v0,2
	ori $t0, $zero 2139095039	# $t0 = $zero or 2139095039 ( 01111111011111111111111111111111 bin ), Maior num
	mtc1 $t0, $f5			# move $t0 to $f5
	mov.s $f12, $f5			# move the value in $f5 to $f12
	syscall
	
	li $v0, 4		
	la $a0, newLine		
	syscall
	
	
	# DOUBLE
	
	#Zero
	li $v0,3		# load 3 in $v0 to call print_double
	ori $t0, $zero, 0	# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin ), Zero
	ori $t1, $zero, 0	# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin )
	
	mtc1 $t1, $f6		# move $t1 to $f6	( 32 bits mais significativos do double )
	mtc1 $t0, $f7		# move $t0 to $f7	( 32 bits menos significativos do double )
	mov.d $f12, $f6		# move double $f6 to $f12 to print_double
	syscall			# call system
	
	li $v0, 4		# load 4 in $v0 to call print_string
	la $a0, newLine		# load the newLine adress to print the string '\n'
	syscall 		# call system
	
	
	#Plus Infinty
	li $v0,3			# load 3 in $v0 to call print_double
	ori $t1, $zero, 0x7FF00000	# $t0 = $zero or 7FF00000 ( 01111111111100000000000000000000 bin ), Plus Infinity
	ori $t0, $zero, 0		# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin )
	
	mtc1 $t0, $f8		# move $t1 to $f8	( 32 bits mais significativos do double )
	mtc1 $t1, $f9		# move $t0 to $f9	( 32 bits menos significativos do double )
	mov.d $f12, $f8		# move double $f8 to $f12 to print_double
	syscall			# call system
	
	li $v0, 4		# load 4 in $v0 to call print_string
	la $a0, newLine		# load the newLine adress to print the string '\n'
	syscall 		# call system
	
	
	#Minus Infinty
	li $v0,3			# load 3 in $v0 to call print_double
	ori $t1, $zero, 0xFFF00000	# $t0 = $zero or FFF00000 ( 11111111111100000000000000000000 bin ), Minus Infinity
	ori $t0, $zero, 0		# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin )
	
	mtc1 $t0, $f10		# move $t1 to $f10	( 32 bits mais significativos do double )
	mtc1 $t1, $f11		# move $t0 to $f11	( 32 bits menos significativos do double )
	mov.d $f12, $f10	# move double $f8 to $f12 to print_double
	syscall			# call system
	
	li $v0, 4		# load 4 in $v0 to call print_string
	la $a0, newLine		# load the newLine adress to print the string '\n'
	syscall 		# call system
	
	
	#PlusNaN
	li $v0,3			# load 3 in $v0 to call print_double
	ori $t1, $zero, 0x7FF80000	# $t0 = $zero or 7FF80000 ( 01111111111110000000000000000000 bin ), PlusNaN
	ori $t0, $zero, 0		# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin )
	
	mtc1 $t0, $f14		# move $t1 to $f14	( 32 bits mais significativos do double )
	mtc1 $t1, $f15		# move $t0 to $f15	( 32 bits menos significativos do double )
	mov.d $f12, $f14	# move double $14 to $f12 to print_double
	syscall			# call system
	
	li $v0, 4		# load 4 in $v0 to call print_string
	la $a0, newLine		# load the newLine adress to print the string '\n'
	syscall 		# call system
	
	
	#MinusNaN
	li $v0,3			# load 3 in $v0 to call print_double
	ori $t1, $zero, 0xFFF80000	# $t0 = $zero or FFF80000 ( 11111111111110000000000000000000 bin ), MinusNaN
	ori $t0, $zero, 0		# $t0 = $zero or 0 ( 00000000000000000000000000000000 bin )
	
	mtc1 $t0, $f16		# move $t1 to $f16	( 32 bits mais significativos do double )
	mtc1 $t1, $f17		# move $t0 to $f17	( 32 bits menos significativos do double )
	mov.d $f12, $f16	# move double $16 to $f12 to print_double
	syscall			# call system
	
	li $v0, 4		# load 4 in $v0 to call print_string
	la $a0, newLine		# load the newLine adress to print the string '\n'
	syscall 		# call system