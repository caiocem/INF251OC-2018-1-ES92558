addi $t2,$gp,4 # t2 ponteiro inicio vetor

loop: lw $t4,0($t2) # t4 recebe o elemento gravado no endereco t2
add $t3,$t3,$t4 # t3 recebe t3 + t4 (elemento do endereço t2)
addi $t2,$t2,4  #incrementa o endereco de t2 em 4 bits
beq $t4,$zero,fim # se t4 for 0, chegou ao fim
jal loop # proximo item
fim: sw $t3,0($gp) # grava o somatorio na posicao gp