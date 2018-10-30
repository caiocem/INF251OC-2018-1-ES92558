#Matricula 92558
lw $t4,0($gp) #ler A
lw $t5,8($gp) #ler B
lw $t6,16($gp)#ler C
slt $t7,$t4,$t5 #ver se A < B
beq $t7,$zero,AMaiorqB #Caso A > b ir para AMaiorqB checar se C<A
slt $t7,$t4,$t6 #Como A < B ver se A < C
beq $t7,$zero,BMaiorqAMaiorqC #Caso C<A e A<B ja temos a saida C<A<B gravada por BMaioqAMaiorqC 
slt $t7,$t5,$t6
beq $t7,$zero,BMaiorqCMaiorqA #Como A<B e A<C caso C<B temos a ordem A<C<B gravada por BMaiorqCMaiorqA
sw $t6,0($gp) #Pelos testes anteriores sabemo que A<B , A<C e B<C, gravamos a ordem inversa A<B<C
sw $t5,8($gp)
sw $t4,16($gp)
j Fim

AMaiorqB: slt $t7,$t4,$t6 #Como B<A, checar C<A
beq $t7,$zero,AMaiorqBeC  #Caso C>A, como sabemos que B<A temos o resultado B<A<C, se nao ver qual maior B ou C
sw $t6,0($gp)
sw $t5,16($gp)
sw $t4,8($gp)
j Fim

AMaiorqBeC: slt $t7,$t5,$t6
beq $t7,$zero,AMaiorqBMaiorqC #Caso B<C temos a saida B<C<A, ois B<A e C<A
sw $t4,0($gp)
sw $t6,8($gp)
sw $t5,16($gp)
j Fim

AMaiorqBMaiorqC: sw $t4,0($gp) #Como C<B e C<A temos B<C<A
sw $t5,8($gp)
sw $t6,16($gp)
j Fim

BMaiorqAMaiorqC: sw $t5,0($gp)
sw $t4,8($gp)
sw $t6,16($gp)
j Fim

BMaiorqCMaiorqA: sw $t5,0($gp)
sw $t6,8($gp)
sw $t4,16($gp)

Fim: NOP
