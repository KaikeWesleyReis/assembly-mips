# CODIGO C - arquivo.c

.data
nomeArq: .asciiz "resultado.txt"
msgmaior: .asciiz "Valor maior que 50"
msgmenor: .asciiz "Valor menor ou igual a 50"
msg1:  .asciiz "Informe um valor: "
msg2:  .asciiz "Informe outro valor: "
comp: .word 50

.text

main: 
li $v0, 4  # escrever mensagem
la $a0, msg1 # mensagem que será escrita para o usuario
syscall

li $v0, 5  # ler resposta do usuario
syscall

move $s1,$v0  # move o que tá em $v0 para $s1

li $v0, 4  # escrever mensagem
la $a0, msg2  # mensagem que será escrita para o usuario
syscall

li $v0, 5  # ler resposta do usuario
syscall

move $s2,$v0  # move o que tá em $v0 para $s2
add $t0, $s1, $s2  # Faz a adição dos numeros dados pelo usuario



arq:

  li   $v0, 13       # Cria arquivo
  la   $a0, nomeArq  # nome do arquivo
  li   $a1, 1        # arquivo de escrita
  li   $a2, 0        # modo de abertura 
  syscall            
  move $s6, $v0      # copia o descritor do arquivo para outro registrador 
 
  lwc1 $f6, comp
  mtc1 $t0, $f12 # movendo de um registrador para um coprocessador
  c.lt.s 1, $f6, $f12  # compara a soma com 50
  bc1t 1, THEN # se o numero for maior
  bc1f ELSE # se o numero for menor ou igual

  
  THEN:
  li   $v0, 15       # escrever em arquivo
  move $a0, $s6      # descritor do arquivo
  la   $a1, msgmaior    # endereço do que será escrito
  li   $a2, 18       # quantidade de caracteres que serâo escritos
  syscall            
  jal fechamento	# jump para o fechamento para não passar pelo else

  ELSE:
  li   $v0, 15       # escrever em arquivo
  move $a0, $s6      # descritor do arquivo
  la   $a1, msgmenor    # endereço do que será escrito
  li   $a2, 25       # quantidade de caracteres que serâo escritos
  syscall           
  fechamento:
  li   $v0, 16       # Fechar arquivo
  move $a0, $s6      # descritor do arquivo
  syscall         
