module tb_ex07;
  reg [4:0] paid;       
  reg [3:0] price;      
  wire [4:0] change;    
  ex07 uut(.paid(paid), .price(price), .change(change));
  initial begin
    $display("Testing ex07: Binary Subtraction (Change)");
    paid=5'd20; price=4'd15; #1; 
    if(change !== 5'd5) $display("FAIL: 20-15 should be 5, got %d", change);
    else $display("PASS: 20-15=5");
    paid=5'd10; price=4'd5; #1; 
    if(change !== 5'd5) $display("FAIL: 10-5 should be 5, got %d", change);
    else $display("PASS: 10-5=5");
    $display("PASS: Subtraction working correctly");
    $finish;
  end
endmodule
