.data
	jTable: .word L0,L1,L2,L3      #definicao da tabela de desvio
	
.text
	# switch( k ) {
	#	case 0 : f = i + j; break;
	#	case 1 : f = g + h; break;
	#	case 2 : f = g - h; break;
	#	case 3 : f = i - j; break;
	#	default : f = 100;
	# }
	
	# carregar valores para f, g, h, i, j, k em $s0 - $s5
	addi $v0, $zero, 5 	# codigo do servico de chamada para ler int ( 5 ) - read_int
	syscall
	add $s0, $zero, $v0	# salva o valor no reg. $s0 ( f )
	
	addi $v0, $zero, 5 	# codigo do servico de chamada para ler int ( 5 ) - read_int
	syscall
	add  $s1, $zero, $v0	# salva o valor no reg. $s1 ( g )
	
	addi $v0, $zero, 5 	# codigo do servico de chamada para ler int ( 5 ) - read_int
	syscall
	add  $s2, $zero, $v0	# salva o valor no reg. $s2 ( h )
	
	addi $v0, $zero, 5 	# codigo do servico de chamada para ler int ( 5 ) - read_int
	syscall
	add  $s3, $zero, $v0	# salva o valor no reg. $s3 ( i )
	
	addi $v0, $zero, 5 	# codigo do servico de chamada para ler int ( 5 ) - read_int
	syscall
	add  $s4, $zero, $v0	# salva o valor no reg. $s4 ( j )
	
Read_k:	addi $v0, $zero, 5 	# codigo do servico de chamada para ler int ( 5 ) - read_int
	syscall
	add  $s5, $zero, $v0	# salva o valor no reg. $s5 ( k )
	
	
	# Verificar se o valor de k esta no intervalo dos case, isto é, se 0 <= k < 4
	slt $t0, $s5, $zero 	# $t0 = 1 se k ($s5) < 0, se nao $t0 = 0
	bne $t0, $zero, Default # Vai para Default se k < 0 ($t0 = 1)
	slti $t0, $s5, 4	# $t0 = 1 se k ($s5) < 4 , se nao $t1 = 0
	beq $t0, $zero, Default  # Vai para Default se k >= 4 ($t0 = 0)
	
	# Calcular endereco da tabela de Labels
	sll $t0, $s5, 2 	# $t0 = k ($s5) * 2^2 = 4 * k
				# Transforma num Bytes p/ num de Words para realizar o deslocamento correto na tabela de Labels
	la  $t3, jTable         # $t3 = endereco base da tabela de desvio
	add $t0, $t0, $t3	# Endereco da Label a ser executada
	lw  $t1, 0($t0)		# $t1 é onde está o label desejado
	jr $t1			# Desvia com base no conteudo de $t1
		
	# Cases:
L0:	add $s0, $s3, $s4	# f = i + j
	j Exit
	
L1: 	add $s0, $s1, $s2	# f = g + h
	j Exit
	
L2:	sub $s0, $s1, $s2	# f = g - h
	j Exit
	
L3:	sub $s0, $s3, $s4	# f = i - j
	j Exit
	
Default: addi $s0, $zero, 100 	# f = 100
 	
Exit:	add  $a0, $s0, $zero	# coloca o valor de f ($s0) no reg $a0 (reg. usado para saida do syscall)
	addi $v0, $zero, 1	# codigo do servico de chamada para imprimir int ( 1 )
	syscall			# chamada ao sistema
	
	j Read_k
	
	
	
	