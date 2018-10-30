lw $t8,0($gp) #ler pos desejada para acesso
addi $t2,$gp,4 #aponta para o comeco do vetor A
addi $t3,$gp,16#aponta para o comeco do vetor B
li $t4,0 #auxiliar para receber valores

Loop: beq $t8,0,Fim #enquanto nao chegarmos na posicao desejada, continuar o loop
lw $t4,0($t2)       #recebe o que estiver no endereco $t2
beq $t4,0,LoopEmB   #caso $t4 seja 0, o vetor A chegou ao seu fim, prosseguiremos somento com o vetor B
lw $t4,0($t3)	    #recebe o que estiver no endereco $t3
beq $t4,0,LoopEmA   #caso $t4 seja 0, o vetor A chegou ao seu fim, prosseguiremos somento com o vetor A
addi $t2,$t2,4      #incrementamos o endereco de $t2 em 4 bits
addi $t3,$t3,4      #incrementamos o endereco de $t3 em 4 bits
addi $t8,$t8,-1     #como andamos uma posicao, decrementamos o indice da pos desejada
j Loop

LoopEmA: beq $t8,0,Fim	#analogo ao Loop geral, porm incrementando somente no vetor A
lw $t4,0($t2)
beq $t4,0,Fim
addi $t2,$t2,4
addi $t8,$t8,-1
j LoopEmA

LoopEmB: beq $t8,0,Fim #analogo ao Loop geral, porm incrementando somente no vetor A
lw $t4,0($t3)
beq $t4,0,Fim
addi $t3,$t3,4
addi $t8,$t8,-1
j LoopEmB

Fim: li $t4,0 #zerar o valor da auxiliar
lw $t5,0($t2) #$t5 recebe o valor do endereco $t2
lw $t6,0($t3) #$t5 recebe o valor do endereco $t3
add $t4,$t5,$t6 #$t4 revebera a soma de $t5 + $t6
sw $t4,0($gp) #salvar o valor da soma na primeira pos da memoria, sobreescrevendo o valor do indice