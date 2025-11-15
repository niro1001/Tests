module tb_ex41;
  reg [4:0] a, b;     
  reg op;             
  wire [4:0] result;  
  ex41 uut(.a(a), .b(b), .op(op), .result(result));
  initial begin
    $display("Testing ex41: 2-Operation ALU");
    a=5'd10; b=5'd5; op=0; #1; 
    if(result !== 5'd15) $display("FAIL: ADD 10+5 should be 15, got %d", result);
    else $display("PASS: ADD 10+5=15");
    op=1; #1; 
    if(result !== 5'd5) $display("FAIL: SUB 10-5 should be 5, got %d", result);
    else $display("PASS: SUB 10-5=5");
    $display("PASS: 2-Operation ALU working correctly");
    $finish;
  end
endmodule
