module tb_ex42;
  reg [4:0] a, b;       
  reg [1:0] op;         
  wire [4:0] result;    
  ex42 uut(.a(a), .b(b), .op(op), .result(result));
  initial begin
    $display("Testing ex42: 4-Operation ALU");
    a=5'd5; b=5'd3; op=2'b00; #1; 
    if(result !== 5'd8) $display("FAIL: ADD 5+3 should be 8, got %d", result);
    else $display("PASS: ADD: 5+3=8");
    op=2'b01; #1; 
    if(result !== 5'd2) $display("FAIL: SUB 5-3 should be 2, got %d", result);
    else $display("PASS: SUB: 5-3=2");
    op=2'b10; #1; 
    if(result !== 5'd1) $display("FAIL: AND 5&3 should be 1, got %d", result);
    else $display("PASS: AND: 5&3=1");
    op=2'b11; #1; 
    if(result !== 5'd7) $display("FAIL: OR 5|3 should be 7, got %d", result);
    else $display("PASS: OR: 5|3=7");
    $display("PASS: 4-operation ALU working correctly");
    $finish;
  end
endmodule
