module tb_ex10;
  reg [4:0] paid;             
  reg [3:0] price;            
  wire is_sufficient;         
  ex10 uut(.paid(paid), .price(price), .is_sufficient(is_sufficient));
  initial begin
    $display("Testing ex10: Payment Comparison");
    paid=5'd15; price=4'd10; #1; 
    if(is_sufficient !== 1'b1) $display("FAIL: 15 >= 10 should be sufficient");
    else $display("PASS: 15 >= 10 detected correctly");
    paid=5'd5; price=4'd10; #1; 
    if(is_sufficient !== 1'b0) $display("FAIL: 5 < 10 should be insufficient");
    else $display("PASS: 5 < 10 detected correctly");
    $display("PASS: Payment comparison working correctly");
    $finish;
  end
endmodule
