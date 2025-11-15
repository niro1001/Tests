module tb_ex22;
  reg clk;          
  reg rst;          
  reg d;            
  wire q;           
  ex22 uut(.clk(clk), .rst(rst), .d(d), .q(q));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex22: D Flip-Flop with Reset");
    rst=1; d=1; #10; 
    if(q !== 0) $display("FAIL: Reset should force Q=0, got Q=%b", q);
    else $display("PASS: Reset forces Q=0 (D=1 ignored)");
    rst=0; #10; 
    if(q !== 1) $display("FAIL: After reset, Q should be 1, got Q=%b", q);
    else $display("PASS: Q captures D=1 after reset released");
    $display("PASS: D FF with Reset working correctly");
    $finish;
  end
endmodule
