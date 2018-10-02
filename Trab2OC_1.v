//Aluno: Caio Oliveira Helmut Henrici
//Matricula: 92558
module ff ( input data, input c, input r, output q);
reg q;
always @(posedge c or negedge r) 
begin
 if(r==1'b0)
  q <= 1'b0; 
 else 
  q <= data; 
end 
endmodule //End 

// ----   FSM alto nivel com Case
module statem(clk, reset, a, saida);
/*    

          +--+   1/0
   +----> |q5+-------+
  1|      +--+       v
   |
 +-++     0        +--+
 |q3+------------> |q2|
 +-++ <----+       +-++
   ^       |         |
   |       |1        |1/0
1/0|       +------+  v
   |              |
 +-++             +---+
 |q0| <------------+q4|
 +--+       0      +--+


*/
input clk, reset;
input [1:0] a;
output [2:0] saida;
reg [2:0] state;
parameter zero=3'd0, um=3'd1, dois=3'd2
, tres=3'd3, quatro=3'd4, cinco=3'd5, seis=3'd6, tresb=3'd7;

assign saida = (state == zero)? 3'd0:
	   (state == um)? 3'd1:
           (state == dois)? 3'd2:
	   (state == tres)? 3'd3:
	   (state == quatro)? 3'd4:
	   (state == cinco)? 3'd5:
	   (state == seis)?3'd6:3'd3;

always @(posedge clk or negedge reset)
     begin
          if (reset==0)
               state = zero;
          else
               case (state)
                    zero: if ( a == 2'd0) state = um;
			  else if (a == 2'd1) state = tres;
			       else if (a == 2'd2) state = um;
				    else state = cinco;
                    um: if ( a == 2'd0) state = dois;
			  else if (a == 2'd1) state = tres;
			       else if (a == 2'd2) state = tres;
				    else state = cinco;
                    dois: if (a == 2'd0) state = zero;
			     else if (a == 2'd1) state = quatro;
				  else if (a == 2'd2) state = tresb;
				    else state = cinco;
                    tres: if ( a == 2'd0) state = zero;
			  else if (a == 2'd1||a== 2'd2) state = dois;
				    else state = cinco;
		    quatro: if ( a == 2'd0) state = zero;
			    else if (a == 2'd1) state = tres;
			       else if (a == 2'd2) state = um;
				    else state = cinco;
                    cinco: if ( a == 2'd0) state = zero;
			   else if (a == 2'd1) state = tres;
			       else if (a == 2'd2) state = um;
				    else state = seis;
		    seis: if ( a == 2'd0) state = zero;
			  else if (a == 2'd1) state = tres;
			       else if (a == 2'd2) state = um;
				    else state = tres;
		    tresb: if ( a == 2'd0) state = zero;
			  else if (a == 2'd1) state = dois;
			       else if (a == 2'd2) state = um;
				    else state = cinco;
               endcase
     end
endmodule
// FSM com portas logicas
// programar ainda....
module statePorta(input clk, input res, input [1:0]a, output [2:0] s);
wire [2:0] e;
wire [2:0] p;

assign s[0] = e[0]; 
assign s[1] = e[1];
assign s[2] = e[2]&~e[1]|e[2]&~e[0];
//assign s = e;
//assign s = e;
assign p[0] = a[1]&~e[0]|~e[2]&~e[1]&~e[0]|~a[1]&a[0]&~e[1]|a[0]&e[2]&~e[0]|a[1]&~a[0]&~e[1]|a[1]&e[2]&e[1]|a[1]&a[0]&~e[2]; //6 operadores
assign p[1] = ~a[0]&~e[2]&e[0]|~a[1]&a[0]&~e[1]|~a[1]&a[0]&~e[0]|a[0]&e[2]&~e[1]&e[0]|a[0]&e[2]&e[1]&~e[0]|a[1]&~a[0]&~e[2]&e[1];//8 operadores
assign p[2] = a[1]&a[0]&~e[1]|a[1]&a[0]&e[0]|a[0]&~e[2]&e[1]&~e[0]|a[1]&~e[2]&e[1]&~e[0];  //8 operadores
//total 22 operadores
ff  e0(p[0],clk,res,e[0]);
ff  e1(p[1],clk,res,e[1]);
ff  e2(p[2],clk,res,e[2]);

endmodule 




module stateMem(input clk,input res, input [1:0]a, output [2:0] saida);
reg [5:0] StateMachine [0:31]; // 16 linhas e 6 bits de largura
initial
begin  // programar ainda....

StateMachine[0]= 6'o10; StateMachine[1]= 6'o21;
StateMachine[2]= 6'o02; StateMachine[3]= 6'o23;
StateMachine[4]= 6'o34; StateMachine[5]= 6'o65;
StateMachine[6]= 6'o36; StateMachine[7]= 6'o03;
StateMachine[8]= 6'o10; StateMachine[9]= 6'o31;
StateMachine[10]= 6'o42; StateMachine[11]= 6'o23;
StateMachine[12]= 6'o34; StateMachine[13]= 6'o65;
StateMachine[14]= 6'o36; StateMachine[15]= 6'o23;
StateMachine[16]= 6'o10; StateMachine[17]= 6'o31;
StateMachine[18]= 6'o72; StateMachine[19]= 6'o23;
StateMachine[20]= 6'o34; StateMachine[21]= 6'o65;
StateMachine[22]= 6'o36; StateMachine[23]= 6'o13;
StateMachine[24]= 6'o10; StateMachine[25]= 6'o21;
StateMachine[26]= 6'o52; StateMachine[27]= 6'o53;
StateMachine[28]= 6'o34; StateMachine[29]= 6'o65;
StateMachine[30]= 6'o36; StateMachine[31]= 6'o53;

end
wire [4:0] address;  // 16 linhas = 4 bits de endereco
wire [5:0] dout; // 6 bits de largura 3+3 = proximo estado + saida
assign address[3] = a[0];
assign address[4] = a[1];
assign dout = StateMachine[address];
assign saida = dout[2:0];
ff st0(dout[3],clk,res,address[0]);
ff st1(dout[4],clk,res,address[1]);
ff st2(dout[5],clk,res,address[2]);
endmodule

module main;
reg c,res;
reg [1:0] a;
wire [2:0] saida;
wire [2:0] saida1;
wire [2:0] saida2;

statem FSMCase(c,res,a,saida);
stateMem FSMemo(c,res,a,saida2);
statePorta FSMDoor(c,res,a,saida1);


initial
    c = 1'b0;
  always
    c= #(1) ~c;

// visualizar formas de onda usar gtkwave out.vcd
initial  begin
     $dumpfile ("out.vcd"); 
     $dumpvars; 
   end 

  initial 
    begin
     $monitor($time," c %b res %b a %b s %d smem %d sporta %d",c,res,a,saida, saida2, saida1);
      #1 res=0; a=2'd0;
      #1 res=1;
      #16 a=2'd1;
      #16 a=2'd2;
      #16 a=2'd3;
      #16;
      $finish ;
    end
endmodule
