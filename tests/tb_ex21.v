module tb_ex21;
  reg clk, d;      
  wire q;          
  ex21 uut(.clk(clk), .d(d), .q(q));
  initial clk = 0;
  always #5 clk = ~clk;  
  initial begin
    d = 0;           
    #10;             
    if (q !== 0) $display("FAIL: Should store 0");
    d = 1;           
    #10;             
    if (q !== 1) $display("FAIL: Should store 1");
    $display("PASS");
    $finish;         
  end
endmodule
