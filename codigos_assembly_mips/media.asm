# CÓDIGO C - media.c

.data

nota1: .float
nota2: .float
nota3: .float
media: .float
divi: .float 3.0
comp: .float 7.0
conversor: .float 100.00
cout1: .asciiz "Informe a primeira nota: "
cout2: .asciiz "Informe a segunda nota: "
cout3: .asciiz "Informe a terceira nota: "
cout4: .asciiz "Media: "
aprov: .asciiz " - Aluno aprovado! Parabens! "
reprov: .asciiz " - Aluno reprovado! Estude mais! "

.text

#pegar nota1
li $v0,4
la $a0, cout1
syscall
li $v0,6
syscall
movf.s $f1, $f0

#pegar nota2
li $v0,4
la $a0, cout2
syscall
li $v0,6
syscall
movf.s $f2, $f0

#pegar nota3
li $v0,4
la $a0, cout3
syscall
li $v0,6
syscall
movf.s $f3, $f0

#somar notas
add.s $f4, $f1, $f2
add.s $f4, $f4, $f3
#fator de divisão e conversao
lwc1 $f5, divi
lwc1 $f9, conversor
#calcular media, converter
div.s $f6, $f4, $f5
mul.s  $f6, $f6, $f9 #dupla precisao
cvt.w.s $f6, $f6
cvt.s.w $f6, $f6
div.s $f6, $f6, $f9

#comparador p aprovação
lwc1 $f7, comp

#if media >= 7
c.le.s 1, $f7, $f6  
bc1t 1, THEN
bc1f ELSE       

#aprovado
THEN:
li $v0, 4
la $a0, cout4
syscall
li $v0, 2
movf.s $f12, $f6
syscall
li $v0,4
la $a0, aprov
syscall

j EXIT #pular

#reprovado
ELSE:
li $v0, 4
la $a0, cout4
syscall
li $v0, 2
movf.s $f12, $f6
syscall
li $v0,4
la $a0, reprov
syscall

EXIT:
li $v0, 10
syscall
