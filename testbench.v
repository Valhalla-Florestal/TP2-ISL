`include "module.v"

module testbench();
  reg a,b,c,d,reset,ready;
  wire fim,t1,t2,t3,t4;

  subistantivo ex_instancia1(.a(a), .b(b), .c(c), .d(d), .ready(ready), .fim(fim), .t1(t1), .t2(t2), .t3(t3), .t4(t4));

  initial begin
    a = 1;
    b = 1;
    c = 1;
    d = 1;

    $dumpfile("ondas_xylo.vcd");
    $dumpvars;
    $display("a b c d = s0 s1 s2 s3 s4 s5 s6");
    // $monitor("%b%b%b%b = %b %b %b %b %b %b %b ",a,b,c,d,s0,s1,s2,,s3,s4,s5,s6);
    $monitor("%b%b%b%b = %b %b %b %b %b %b %b",a, b, c, d, s0, s1, s2, s3, s4, s5, s6);


    //always @ ( * ) begin
    //  #1; clock = ~clock;
    //end
            //   #1; clock = 4'b1;
            //   #1; reset = 1'b1;
            //   #1; reset = 1'b0;
                   reset = 1;
               #1; reset = 0;
          #1;  a = 0; b = 0; c = 0; d = 0;
          #1;  a = 0; b = 0; c = 0; d = 1;
          #1;  a = 0; b = 0; c = 1; d = 0;
          #1;  a = 0; b = 0; c = 1; d = 1;

          #1;  a = 0; b = 1; c = 0; d = 0;
          #1;  a = 0; b = 1; c = 0; d = 1;
          #1;  a = 0; b = 1; c = 1; d = 0;
          #1;  a = 0; b = 1; c = 1; d = 1;

          #1;  a = 1; b = 0; c = 0; d = 0;
          #1;  a = 1; b = 0; c = 0; d = 1;
          #1;  a = 1; b = 0; c = 1; d = 0;
          #1;  a = 1; b = 0; c = 1; d = 1;

          #1;  a = 1; b = 1; c = 0; d = 0;
          #1;  a = 1; b = 1; c = 0; d = 1;
          #1;  a = 1; b = 1; c = 1; d = 0;
          #1;  a = 1; b = 1; c = 1; d = 1;

          #1 $finish;
  end
endmodule
