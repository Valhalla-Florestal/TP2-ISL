module teste(a,w,clock,reset,ready);
  input wire a, clock;
  output reg w;

  always @ ( posedge clock ) begin
    if(reset) begin
      a = 0;
    end
    else if(ready) begin
      a = a+1;
      w = a;
    end
  end
endmodule
