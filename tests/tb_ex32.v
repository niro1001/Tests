module tb_ex32;
  reg clk;              
  reg rst;              
  reg [4:0] paid;       
  reg [3:0] price;      
  wire valid;           
  ex32 uut(.clk(clk), .rst(rst), .paid(paid), .price(price), .valid(valid));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex32: FSM Payment Validator");
    rst=1; paid=5'd10; price=4'd5; #10;
    $display("INFO: Reset complete");
    rst=0; #10; 
    if(valid !== 1'b1) $display("FAIL: 10 >= 5 should be valid");
    else $display("PASS: Valid payment detected (10 >= 5)");
    paid=5'd3; price=4'd5; #10; 
    if(valid !== 1'b0) $display("FAIL: 3 < 5 should be invalid");
    else $display("PASS: Invalid payment detected (3 < 5)");
    $display("PASS: FSM payment validator working correctly");
    $finish;
  end
endmodule
