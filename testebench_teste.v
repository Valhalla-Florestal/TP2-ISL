`include "teste.v"

module testbench ();
  reg w;
  wire a,clock;
  teste instancial (.a(a), .w(w), .clock(clock));

  initial begin
      $dumpfile("teste.vcd");
      $dumpvars(0, testbench);
      $display("a  = w");
      $monitor("%b = %b ",a,w);
  end

      //always @ ( * ) begin
      //  #1; clock = ~clock;
      //end

  initial begin
       reset = 1;
    #1; reset = 0;
    #1; a = 0; ready = 1;
    #1; a = 1; ready = 1;
  end
  #1; $finish;
endmodule // testbench
