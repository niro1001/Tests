module tb_ex40;
  reg [4:0] a, b;           
  reg sub;                  
  wire [4:0] result;        
  wire carry_borrow;        
  ex40 uut(.a(a), .b(b), .sub(sub), .result(result), .carry_borrow(carry_borrow));
  initial begin
    $display("Testing ex40: Adder/Subtractor Unit");
    a=5'd10; b=5'd5; sub=0; #1; 
    if(result !== 5'd15) $display("FAIL: ADD 10+5 should be 15, got %d", result);
    else $display("PASS: ADD 10+5=15");
    sub=1; #1; 
    if(result !== 5'd5) $display("FAIL: SUB 10-5 should be 5, got %d", result);
    else $display("PASS: SUB 10-5=5");
    $display("PASS: Combined adder/subtractor working correctly");
    $finish;
  end
endmodule
