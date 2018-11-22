lw R1,0(R0)
ADD R2,R1,R3
igual4: 
BEQ R2,R4,Final
ADDI R2,R2,1
SW R0,0(R2)
J igual4
Final: NOP


