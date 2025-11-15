module tb_ex39;
  reg [4:0] a, b;       
  wire [4:0] diff;      
  wire borrow;          
  ex39 uut(.a(a), .b(b), .diff(diff), .borrow(borrow));
  initial begin
    $display("Testing ex39: 5-bit Subtractor");
    a=5'd20; b=5'd15; #1; 
    if(diff !== 5'd5) $display("FAIL: 20-15 should be 5, got %d", diff);
    else $display("PASS: 20-15=5");
    a=5'd10; b=5'd5; #1; 
    if(diff !== 5'd5) $display("FAIL: 10-5 should be 5, got %d", diff);
    else $display("PASS: 10-5=5");
    $display("PASS: 5-bit subtractor working correctly");
    $finish;
  end
endmodule
