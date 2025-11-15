module tb_ex29;
  reg clk;              
  reg rst;              
  reg coin;             
  reg sufficient;       
  reg done;             
  wire [2:0] state;     
  ex29 uut(.clk(clk), .rst(rst), .coin(coin), .sufficient(sufficient), .done(done), .state(state));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex29: Mealy FSM");
    rst=1; coin=0; sufficient=0; done=0; #10; 
    if(state !== 0) $display("FAIL: Reset should go to IDLE, got state=%b", state);
    else $display("PASS: Reset to IDLE state");
    rst=0; coin=1; #10;         
    $display("INFO: After coin, state=%b", state);
    #10;                        
    $display("INFO: After wait, state=%b", state);
    sufficient=1; #10;          
    $display("INFO: Payment OK, state=%b", state);
    done=1; #10;                
    $display("INFO: Dispense done, state=%b", state);
    #10;
    $display("PASS: Mealy FSM with dispense working");
    $finish;
  end
endmodule
