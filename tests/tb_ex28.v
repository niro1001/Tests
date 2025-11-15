module tb_ex28;
  reg clk;              
  reg rst;              
  reg coin;             
  reg sufficient;       
  wire [1:0] state;     
  ex28 uut(.clk(clk), .rst(rst), .coin(coin), .sufficient(sufficient), .state(state));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex28: Moore FSM");
    rst=1; coin=0; sufficient=0; #10; 
    if(state !== 0) $display("FAIL: Reset should go to IDLE, got state=%b", state);
    else $display("PASS: Reset to IDLE state");
    rst=0; coin=1; #10;    
    $display("INFO: After coin insert, state=%b", state);
    #10;                   
    $display("INFO: After wait, state=%b", state);
    sufficient=1; #10;     
    $display("PASS: Moore FSM transitions working");
    $finish;
  end
endmodule
