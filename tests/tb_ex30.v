module tb_ex30;
  reg clk;                      
  reg rst;                      
  reg next_state;               
  wire [3:0] state_binary;      
  wire [3:0] state_onehot;      
  ex30 uut(.clk(clk), .rst(rst), .next_state(next_state), 
           .state_binary(state_binary), .state_onehot(state_onehot));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex30: State Encoding (Binary vs One-Hot)");
    rst=1; next_state=0; #10; 
    if(state_binary !== 0 || state_onehot !== 1) 
      $display("FAIL: Reset - binary=%b, onehot=%b", state_binary, state_onehot);
    else 
      $display("PASS: Reset - Binary=0, One-Hot=1 (0001)");
    rst=0; next_state=1; #10; 
    if(state_binary !== 1 || state_onehot !== 2) 
      $display("FAIL: State 1 - binary=%b, onehot=%b", state_binary, state_onehot);
    else 
      $display("PASS: State 1 - Binary=1, One-Hot=2 (0010)");
    $display("PASS: State encoding working correctly");
    $finish;
  end
endmodule
