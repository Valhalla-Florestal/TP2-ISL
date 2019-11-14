module subistantivo (a,b,c,d,reset,ready,ok,clock,fim,state,concreto,abstrato,nomep,nota_inv);
  input wire a,b,c,d,reset,clock,ok,ready,concreto,abstrato,nomep,nota_inv;
  output reg fim,state;

  parameter zero = 2'b00;
  parameter one = 2'b01;
  parameter two = 2'b10;
  parameter three = 2'b11;

  reg [2:1] state;
  reg [2:1] next_state;

  always @(posedge clock) begin
    if(reset)begin
      state = zero;
      concreto = 0;
      abstrato = 0;
      nomep = 0;
      nota_inv = 0;
    end
    else begin
      state = next_state;
      concreto = 4'b0111;
      abstrato = 4'b1001;
      nomep = 4'b1010;
      nota_inv = 4'b1100;
    end      
    always @(posedge ok) begin
      always @(state) begin
        case(ok or state)
          zero:
          begin
            if(ok and concreto) next_state = one;
            else if(ok and abstrato) next_state = two;
            else if(ok and nomep) next_state = three;
            else next_state = zero;
          end
          one:
          begin
            if(ok and abstrato) next_state = two;
            else if(ok and nomep) next_state = three;
            else if(ok and concreto) next_state = one;
            else next_state = one;
          end
          two:
          begin
            if(ok and (nomep == 1)) next_state = three;
            else next_state = two;
          end
          three:
          begin 
            if(ok and (nota_inv == 1)) next_state = zero;
            else next_state = three; 
      end  
    end
  end
endmodule //
