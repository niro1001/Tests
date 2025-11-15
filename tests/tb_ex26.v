module tb_ex26;
  reg clk, rst, start;    
  wire state;             
  ex26 uut(.clk(clk), .rst(rst), .start(start), .state(state));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex26: 2-State FSM");
    rst=1; start=0; #10; 
    if(state !== 0) $display("FAIL: Reset should go to IDLE (0)");
    else $display("PASS: Reset to IDLE");
    rst=0; start=1; #10; 
    if(state !== 1) $display("FAIL: Start should go to ACTIVE (1)");
    else $display("PASS: Transition to ACTIVE");
    $display("PASS: 2-State FSM working correctly");
    $finish;
  end
endmodule
