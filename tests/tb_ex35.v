module tb_ex35;
  reg [3:0] a, b;       
  reg [1:0] op;         
  wire [4:0] result;    
  ex35 uut(.a(a), .b(b), .op(op), .result(result));
  initial begin
    $display("Testing ex35: Simple ALU");
    a=4'd5; b=4'd3; op=2'b00; #1; 
    if(result !== 5'd8) $display("FAIL: 5+3 should be 8, got %d", result);
    else $display("PASS: ADD: 5+3=8");
    op=2'b01; #1; 
    if(result !== 5'd2) $display("FAIL: 5-3 should be 2, got %d", result);
    else $display("PASS: SUB: 5-3=2");
    $display("PASS: Simple ALU working correctly");
    $finish;
  end
endmodule
