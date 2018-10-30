lw $t8,0($gp) #ler pos desejada para acesso
addi $t2,$gp,4 #aponta para o comeco do vetor A
addi $t3,$gp,16#aponta para o comeco do vetor B
li $t4,0 #auxiliar para receber valores
li $t5,0 #contador de variaveis negativas

Loop: beq $t8,0,Fim #enquanto nao chegarmos na posicao desejada, continuar o loop
lw $t4,0($t2)       #recebe o que estiver no endereco $t2
slt $t7,$t4,$zero   #checamos se o valor em $t4 eh negativo
add $t5,$t5,$t7     #caso $t4 seja negativo sera incrementado 1 no contador
beq $t4,0,LoopEmB   #caso $t4 seja 0, o vetor A chegou ao seu fim, prosseguiremos somento com o vetor B
lw $t4,0($t3)       #recebe o que estiver no endereco $t3
slt $t7,$t4,$zero   #checamos se o valor em $t4 eh negativo
add $t5,$t5,$t7     #caso $t4 seja negativo sera incrementado 1 no contador
beq $t4,0,LoopEmA   #caso $t4 seja 0, o vetor A chegou ao seu fim, prosseguiremos somento com o vetor A
addi $t2,$t2,4	    #incrementamos o endereco de $t2 em 4 bits
addi $t3,$t3,4      #incrementamos o endereco de $t3 em 4 bits
addi $t8,$t8,-1     #como andamos uma posicao, decrementamos o indice da pos desejada
j Loop

LoopEmA: beq $t8,0,Fim #analogo ao Loop geral, porm incrementando somente no vetor A
lw $t4,0($t2)
slt $t7,$t4,$zero
add $t5,$t5,$t7
beq $t4,0,Fim
addi $t2,$t2,4
addi $t8,$t8,-1
j LoopEmA

LoopEmB: beq $t8,0,Fim #analogo ao Loop geral, porm incrementando somente no vetor A
lw $t4,0($t3)
slt $t7,$t4,$zero
add $t5,$t5,$t7
beq $t4,0,Fim
addi $t3,$t3,4
addi $t8,$t8,-1
j LoopEmB

Fim: li $t4,0     #zerar o valor da auxiliar
lw $t9,0($t2)     #$t9 recebe o valor do endereco $t2
slt $t7,$t9,$zero #checamos se o valor em $t4 eh negativo
add $t5,$t5,$t7   #caso $t4 seja negativo sera incrementado 1 no contador
lw $t6,0($t3)     #$t5 recebe o valor do endereco $t2
slt $t7,$t6,$zero #checamos se o valor em $t4 eh negativo
add $t5,$t5,$t7   #caso $t4 seja negativo sera incrementado 1 no contador
sw $t5,0($gp)     #salvar o valor do contador na primeira pos da memoria, sobreescrevendo o valor do indice