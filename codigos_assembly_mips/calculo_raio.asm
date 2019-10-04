# ALUNOS - KAIKE WESLEY REIS & PHILIPE QUADROS
# CÓDIGO C - calculo_raio.c

# Declaracao de dados
.data
	PI:	.float	3.14159		# constante PI
	area:	.float
	raio:	.float
	c:	.float 100.0f
	hf:	.float 0.5f
	msg1: 	.asciiz "Digite o valor do raio do circulo, e ENTER\n"
	msg2: 	.asciiz "Raio digitado e' "
	msg3: 	.asciiz "Area do circulo com raio "
	msg4: 	.asciiz "\n"
	msg5: 	.asciiz " e' "
	
.text

main:
	## float raio; // declaracao
	lwc1 $f1, raio
	
	## printf("Digite o valor do raio do circulo, e ENTER\n");
	li $v0, 4      # servico print string
	la $a0, msg1   # string a ser impressa em $a0
	syscall
	
	## scanf("%f", &raio); // exemplos: 1.23 12.3e-1
	li $v0, 6	# servico read float, retorno em $f0
	syscall
	movf.s $f1, $f0	# $f1 contem agora o raio
	
	## printf("Raio digitado e' %12.2f\n", raio);
	# part (1/3) -  printf("Raio digitado e' ...
	li $v0, 4      # servico print string
	la $a0, msg2   # string a ser impressa em $a0
	syscall
	# part (2/3) - Round $f2 - raio arredondado para print
	# Gera copia de $f1 em $f0 para este ser arredondado
	movf.s $f0, $f1
	# Carrega auxiliares     
	lwc1 $f3, c
	lwc1 $f4, hf
	# Aplica formula $f0 = (int)(x*100.0+0.5)/100.0
	mul.s $f0,$f0,$f3  #multiplica por 100.0
	add.s $f0,$f0,$f4  #adiciona por 0.5
	cvt.w.s $f0,$f0    #cast para int
	cvt.s.w $f0,$f0    #cast de volta para float
	div.s $f12,$f0,$f3  #divide por 100 ($f12 holds the result)
	# Print float, argumento em $f12
	li $v0,2
	syscall		
	# part (3/3) -  printf(...\n")
	li $v0, 4      # servico print string
	la $a0, msg4   # string a ser impressa em $a0
	syscall

	# AreaCirc(raio) salvo em $f3
	mfc1 $a0, $f1 # Passa $f1 do raio como argumento para funcao em $a0
	jal AreaCirc  # Chama a funcao
	
	## printf("Area do circulo com raio %f e' %f\n", raio, AreaCirc(raio)); // chamada da funcao
	# part (1/5) -  printf("Area do circulo com raio ...
  	li $v0, 4   # servico print string
  	la $a0, msg3
  	syscall
  	# part (2/5) - ...%f... (raio $f1)
 	movf.s $f12, $f1 # para printar $f1 move para $f12
	li $v0,2         # Print float, argumento em $f12
	syscall	
	
  	# part (3/5) - ... e' ...
  	li $v0, 4   # servico print string
  	la $a0, msg5
  	syscall  
  	# part (4/5) - 	 ...%f... (AreaCirc(raio) $v1)
 	# AreaCirc(raio) calculo
	mfc1 $a0, $f1  # Passa $f1 do raio como argumento para funcao em $a0
	jal AreaCirc   # Chama a funcao
	mtc1 $v1, $f12 # Passa do $v1 para $f12 para print de float
	li $v0,2         # Print float, argumento em $f12
	syscall		 	
  	# part (5/5) - ...n\")
  	li $v0, 4   # servico print string
  	la $a0, msg4
  	syscall
  	    	
	# Finalizar o programa.
	li	$v0,10		# chamada de sistema para encerrar o programa 
	syscall	
 

AreaCirc:
	# area = PI*R*R = PI*$a0*a0
	## float area; // variavel so' existe dentro da funcao, local
	lwc1 $f9, area     # Carrega area
	lwc1 $f3, PI	   # Carrega o valor de PI
	
	## area = PI*R*R = PI*$a0*a0
	mtc1 $a0, $f4      # Passa do $a0 para $f4 para operacoes com float logo $f4 eh R
	mul.s $f3,$f3,$f4  # PI*R e salva onde PI estava
	mul.s $f9,$f3,$f4  # PI*R*R e salva onde PI*R estava
	mfc1 $v1, $f9      # Passa $f3 (resultado) float para registrador de retorno $v0
	jr $ra		   # retorna para o programa principal




