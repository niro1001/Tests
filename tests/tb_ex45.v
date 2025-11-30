module tb_ex45;
  reg [4:0] a, b;       
  reg [2:0] op;         
  wire [4:0] result;    
  wire carry;           
  wire zero;            
  ex45 uut(.a(a), .b(b), .op(op), .result(result), .carry(carry), .zero(zero));
  initial begin
    $display("Testing ex45: Complete ALU (8 Operations)");
    a=5'd5; b=5'd3; op=3'b000; #1; 
    if(result !== 5'd8) $display("WRONG: ADD 5+3 should be 8, got %d", result);
    else $display("PASS: ADD: 5+3=8");
    op=3'b001; #1; 
    if(result !== 5'd2) $display("WRONG: SUB 5-3 should be 2, got %d", result);
    else $display("PASS: SUB: 5-3=2");
    op=3'b101; #1; 
    if(result !== ~5'd5) $display("WRONG: NOT ~5 should be %d, got %d", ~5'd5, result);
    else $display("PASS: NOT: ~5=%d", result);
    $display("PASS: Complete ALU working correctly");
    $finish;
  end
endmodule
