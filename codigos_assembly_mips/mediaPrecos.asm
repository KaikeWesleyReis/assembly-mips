# CÓDIGO C - mediaPrecos.c

.data
cout1: .asciiz "Informe o preco do produto "
cout2: .asciiz ": "
cout3: .asciiz "Preco medio dos produtos: "
preco: .float 0.0
produto: .word 0
qtd: .word 10
divisor: .float 10.0
conversor: .float 100.0

.text 

lwc1 $f2, preco
la $t3, produto
lw $t3, 0($t3)
la $t2, qtd
lw $t2, 0($t2)
lwc1 $f8, divisor
lwc1 $f9, conversor

LOOP:
#imprimir msg
li $v0, 4
la $a0, cout1
syscall
#imprimir id do produto
li $v0,1 
move $a0, $t3
syscall
#imprimir ponto e virgula
li $v0, 4
la $a0, cout2
syscall
#ler o preço 
li $v0, 6 
syscall
movf.s $f1, $f0
#somar preços
add.s $f2, $f2, $f1
#condiçao do loop
add $t3, $t3, 1
bne $t3, $t2, LOOP
#sair do loop
j MEDIA

MEDIA:
div.s $f5, $f2, $f8 #media
mul.s  $f5, $f5, $f9 #dupla precisao
cvt.w.s $f5, $f5
cvt.s.w $f5, $f5
div.s $f5, $f5, $f9
#imprimir msg
li $v0, 4
la $a0, cout3
syscall
#imprimir valor
li $v0, 2
movf.s $f12, $f5
syscall
#finalizar
li $v0, 10
syscall


