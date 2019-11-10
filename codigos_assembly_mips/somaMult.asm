# CÓDIGO C - somaMult.c

.data
	cte: 	.float 1.34       # cte para multiplicar dentro da funcao soma
	comp:	.float 6.5        # Comparador do if
	x:	.float
	y:	.float
	res:	.float
	c:	.float 100.0f
	hf:	.float 0.5f
	msg1: 	.asciiz "Informe o primeiro numero: "
	msg2: 	.asciiz "Informe o segundo numero: "
	msge:   .asciiz "Resultado descartado!\n"
	msgt:	.asciiz "Soma: "
	msgn:	.asciiz "\n"
	
.text

main:
	## float x, y;
	lwc1 $f1, x	# Carrega o valor de x
	lwc1 $f2, y	# Carrega o valor de y
	
	## float res;
	lwc1 $f3, res	# Carrega o valor de res
	
	## printf("Informe o primeiro numero: ");
	li $v0, 4      # servico print string
	la $a0, msg1   # string a ser impressa em $a0 argumento
	syscall	
	
	## scanf("%f", &x);
	li $v0, 6	# servico read float, retorno em $f0
	syscall
	movf.s $f1, $f0	# $f1 contem o primeiro valor
	
	## printf("Informe o segundo numero: ");
	li $v0, 4      # servico print string
	la $a0, msg2   # string a ser impressa em $a0 argumento
	syscall	
		
	## scanf("%f", &y);
	li $v0, 6	# servico read float, retorno em $f0
	syscall
	movf.s $f2, $f0	# $f1 contem o segundo valor
		
	## res = soma(x,y);
	mfc1 $a0, $f1 # Passa $f1 (x) como argumento
	mfc1 $a1, $f2 # Passa $f1 (y) como argumento
	jal soma      # Chama a funcao
	mtc1 $v1, $f3 # Guarda valor retornado em $f3 (res) do argumento de retorno $v1

	## if (res > 6.5) THEN
	lwc1 $f8, comp   # Carrega comparador
	c.lt.s $f8,$f3   # $f3 (res) > $f8 (6.5)
	mfc1 $a0, $f3    # Passa $f3 (res) como argumento $a0 para branch caso ocorra
	bc1t then        # THEN

	## else
	### printf("Resultado descartado!\n");
	li $v0, 4      # servico print string
	la $a0, msge   # string a ser impressa em $a0 argumento
	syscall		
		
	# Finalizar o programa
	li $v0,10 # chamada de sistema para encerrar o programa 
	syscall

then:
	### arredondamento
	mtc1 $a0, $f0      # Passa do $a0 para $f0 para operacoes com float
	#### Carrega auxiliares     
	lwc1 $f6, c
	lwc1 $f7, hf
	#### Aplica formula de round 2 casas - $f0 = (int)(x*100.0+0.5)/100.0
	mul.s $f0,$f0,$f6  #multiplica por 100.0
	add.s $f0,$f0,$f7  #adiciona por 0.5
	cvt.w.s $f0,$f0    #cast para int
	cvt.s.w $f0,$f0    #cast de volta para float
	div.s $f12,$f0,$f6  #divide por 100 ($f12 contem resultado arredondado para print)
	
	### printf("Soma: %.2f\n", res);
	#### "Soma: 
	li $v0, 4      # servico print string
	la $a0, msgt   # string a ser impressa em $a0 argumento
	syscall		
	#### Arredondado
	# Print float, argumento em $f12
	li $v0,2
	syscall
	#### \n
	li $v0, 4      # servico print string
	la $a0, msgn   # string a ser impressa em $a0 argumento
	syscall

	### Finalizar o programa
	li $v0,10 # chamada de sistema para encerrar o programa 
	syscall

soma:
	mtc1 $a0, $f5       # Passa $a0 para float address $f5 (a)
	mtc1 $a1, $f6	    # Passa $a0 para float address $f6 (b)
	lwc1 $f7, cte       # Carrega valor cte 1.34
	add.s $f5,$f5,$f6   # (a+b) guardado em (a)
	mul.s $f5,$f5,$f7   # (a+b)*1.34 guardado em (a)
	mfc1 $v1, $f5       # Passa $f5 float address para $v1, argumento de retorno
	jr $ra              # Volta para a main
