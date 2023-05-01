.data

.text
	# atribuindo ints para os reg. $s0 - $s4
	addi $s0, $zero, 10 	# f
	addi $s1, $zero, 5	# g
	addi $s2, $zero, 2	# h
	addi $s3, $zero, 4	# i
	addi $s4, $zero, 4	# j


	#Fazer o if/else
	#	if( i == j)
	#		f = g + h;
	#	else
	#		f = g - h;

	bne $s3, $s4, Else	# Vai para label 'Else' se i != j
	# Se "Entrou" aqui é por que i($s3) = j($s4)
	add $s0, $s1, $s2	# f = g + h (ignorado se i != j)
	j Exit			# Vai para 'Exit', ou seja, sai do if/else

Else:	sub $s0, $s1, $s2	# f = g - h (ignorado se i = j)

Exit:
	add  $a0, $s0, $zero	# coloca o valor de f ($s0) no reg $a0 (reg. usado para saida do syscall)
	addi $v0, $zero, 1	# codigo do servico de chamada para imprimir int ( 1 )
	syscall			# chamada ao sistema
