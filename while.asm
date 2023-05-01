.data

.text
	# while( i < k ){
	#	i += 1;
	# }

	addi $s0, $zero, 0	# i
	addi $s1, $zero, 5	# k
	
Loop:	slt $t0, $s0, $s1	# $t0 = 1 se i($s0) < k($s1), se nao $t0 = 0
	beq $t0, $zero, Exit	# se $t0 = 0 entao i >= j, ou seja, devemos sair do loop
	addi $s0, $s0, 1	# i += 1
	j Loop			# voltar para o inicio do loop

Exit:	add $a0, $s0, $zero	# coloca o valor de f ($s0) no reg $a0 (reg. usado para saida do syscall)
	addi $v0, $zero, 1	# codigo do servico de chamada para imprimir int ( 1 )
	syscall			# chamada ao sistema