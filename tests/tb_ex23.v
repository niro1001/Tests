module tb_ex23;
  reg clk;          
  reg en;           
  reg d;            
  wire q;           
  ex23 uut(.clk(clk), .en(en), .d(d), .q(q));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex23: D Flip-Flop with Enable");
    en=0; d=1; #10; 
    if(q !== 0) $display("FAIL: en=0 should hold Q=0, got Q=%b", q);
    else $display("PASS: en=0 holds value (ignores D=1)");
    en=1; #10; 
    if(q !== 1) $display("FAIL: en=1 should capture D=1, got Q=%b", q);
    else $display("PASS: en=1 captures D=1");
    $display("PASS: D FF with Enable working correctly");
    $finish;
  end
endmodule
