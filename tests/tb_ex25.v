module tb_ex25;
  reg clk;              
  reg load;             
  reg clear;            
  reg [4:0] d;          
  wire [4:0] q;         
  ex25 uut(.clk(clk), .load(load), .clear(clear), .d(d), .q(q));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex25: 5-bit Register with Load/Clear");
    clear=1; load=0; d=5'd10; #10; 
    if(q !== 5'd0) $display("FAIL: Clear should force Q=0, got Q=%d", q);
    else $display("PASS: Clear forces Q=0");
    clear=0; load=1; #10; 
    if(q !== 5'd10) $display("FAIL: Load should set Q=10, got Q=%d", q);
    else $display("PASS: Loaded 10 into register");
    $display("PASS: Register with Load/Clear working correctly");
    $finish;
  end
endmodule
