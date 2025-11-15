module tb_ex24;
  reg clk;              
  reg rst;              
  reg en;               
  reg [4:0] d;          
  wire [4:0] q;         
  ex24 uut(.clk(clk), .rst(rst), .en(en), .d(d), .q(q));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex24: 5-bit Register");
    rst=1; en=0; d=5'd15; #10; 
    if(q !== 5'd0) $display("FAIL: Reset should clear Q=0, got Q=%d", q);
    else $display("PASS: Reset clears register to 0");
    rst=0; en=1; #10; 
    if(q !== 5'd15) $display("FAIL: en=1 should load 15, got Q=%d", q);
    else $display("PASS: Loaded 15 into register");
    $display("PASS: 5-bit register working correctly");
    $finish;
  end
endmodule
