### CALCULO DO FATORIAL EM PONTO FLUTUANTE ###
.data
	msg1: .asciiz "Insira um número inteiro: "
	msg2: .asciiz "ERRO: Tente novamente com um número inteiro positivo\n"
	newLine: .byte '\n'

.text
main:	li $v0, 4	# print_str
	la $a0, msg1
	syscall
	
	li $v0, 5	# read_int
	syscall
	
	slt $t0, $v0, $zero	# $t0 = 1 se $v0 < 0, else $t0 = 0
	bne $t0, $zero, erro	# go to erro if $t0 != 0
	beq $v0, $zero, zero	# tratar caso 0! = 1
	
	
	add $a0, $v0, $zero
	mtc1 $v0, $f0
	cvt.s.w $f0, $f0
	
	addi $t0, $zero, 1
	mtc1 $t0, $f1
	cvt.s.w $f1, $f1	# criando um float com valor 1
	
	jal FactorialSingle
	
	# tratamewnto caso de 0!
zero:	mov.s $f0, $f1
	jal FactorialSingle
	
exit:	li $v0, 2		# print_float
	add.s $f12, $f0, $f15
	syscall
	
	li $v0, 4	# print_str
	la $a0, newLine
	syscall
	
	li $v0, 1	# print_int
	cvt.w.s $f20, $f0
	mfc1 $t0, $f20
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4	# print_str
	la $a0, newLine
	syscall
	
	la $ra, main	# load main adress
	jr $ra		# jump to main
	
erro:	li $v0, 4	# print_str
	la $a0, msg2	# salve the string adress
	syscall
	la $ra, main	# load main adress
	jr $ra		# jump to main


FactorialSingle:
	cvt.w.s $f10, $f0
	mfc1 $t5, $f10
	beq $t5, $zero, exit
	
	add.s $f2, $f0, $f15	# $f2 = $f0 + 0
p1:	
	sub.s $f2, $f2, $f1
	
	cvt.w.s $f10, $f2
	mfc1 $t5, $f10
	beq $t5, $zero, exit
	
	mul.s $f0, $f0, $f2	# $f0 = $f0 * $f2
	
	j p1
	
	
	
	
	
	
	
	
	
	
	
	
