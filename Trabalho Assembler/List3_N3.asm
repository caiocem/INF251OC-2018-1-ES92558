lw $t2,0($gp) #ler A
lw $t3,8($gp) #ler B
li $t4,0      #0 auxiliar
beq $t2,$zero,Fim #A é 0? se sim terminar
slt $t7,$zero,$t2  #A é menor q 0?
beq $t7,$zero,Anegativo #Caso A < 0, ir para Anegativo
Loop: add $t4,$t4,$t3 #Caso A > 0, incrementar B em t4
addi $t2,$t2,-1 #decrementar A em 1
beq $zero,$t2,Fim #repetir loop enquanto A>0
j Loop

Anegativo: sub $t4,$t4,$t3 #caso A seja negativo, decrementar B em t4
addi $t2,$t2,1 #incrementar A em 1
beq $zero,$t2,Fim #repetir loop enquanto A<0
j Anegativo

Fim: sw $t4,16($gp) #gravar t4 na memoria apos executar os loops