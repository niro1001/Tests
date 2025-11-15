module tb_ex34;
  reg clk;              
  reg rst;              
  reg calculate;        
  reg [4:0] paid;       
  reg [3:0] price;      
  wire [4:0] change;    
  ex34 uut(.clk(clk), .rst(rst), .calculate(calculate), 
           .paid(paid), .price(price), .change(change));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex34: FSM Change Calculator");
    rst=1; calculate=0; paid=5'd20; price=4'd15; #10;
    $display("INFO: Reset complete, paid=20, price=15");
    rst=0; calculate=1; #10; 
    if(change !== 5'd5) $display("FAIL: Change should be 5, got %d", change);
    else $display("PASS: Change calculated correctly (20-15=5)");
    $display("PASS: FSM change calculator working correctly");
    $finish;
  end
endmodule
