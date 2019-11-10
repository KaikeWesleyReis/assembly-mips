# CÓDIGO C - soma.c

.data

cout1: .asciiz  "Informe o numero 1: "
cout2: .asciiz  "Informe o numero 2: "
cout3: .asciiz "Resultado: "

.text 

#pegar o n1
li $v0,4
la $a0, cout1
syscall 
li $v0,5
syscall 
move $t1, $v0

#pegar o n2
li $v0,4
la $a0, cout2
syscall
li $v0,5
syscall
move $t2, $v0

#soma
add $t3, $t1, $t2

#imprimir resultado
li $v0,4
la $a0, cout3
syscall
li $v0,1
move $a0, $t3
syscall

#finalizar programa
li $v0,10
syscall 

