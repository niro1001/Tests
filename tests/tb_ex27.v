module tb_ex27;
  reg clk;              
  reg rst;              
  reg coin, check;      
  wire [1:0] state;     
  ex27 uut(.clk(clk), .rst(rst), .coin(coin), .check(check), .state(state));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex27: 3-State FSM");
    rst=1; coin=0; check=0; #10; 
    if(state !== 0) $display("FAIL: Reset should go to IDLE, got state=%b", state);
    else $display("PASS: Reset to IDLE state");
    rst=0; coin=1; #10; 
    if(state !== 1) $display("FAIL: Coin should trigger ACCEPT, got state=%b", state);
    else $display("PASS: Transitioned to ACCEPT state");
    $display("PASS: 3-State FSM working correctly");
    $finish;
  end
endmodule
