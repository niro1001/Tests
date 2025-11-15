module tb_ex48;
  reg [1:0] addr;       
  wire [3:0] price;     
  ex48 uut(.addr(addr), .price(price));
  initial begin
    $display("Testing ex48: Price ROM");
    addr=2'd0; #1; 
    if(price !== 4'd5) $display("FAIL: Product 0 should be 5 NIS, got %d", price);
    else $display("PASS: Product 0 = 5 NIS");
    addr=2'd1; #1; 
    if(price !== 4'd10) $display("FAIL: Product 1 should be 10 NIS, got %d", price);
    else $display("PASS: Product 1 = 10 NIS");
    addr=2'd2; #1; 
    if(price !== 4'd15) $display("FAIL: Product 2 should be 15 NIS, got %d", price);
    else $display("PASS: Product 2 = 15 NIS");
    $display("PASS: Price ROM working correctly");
    $finish;
  end
endmodule
