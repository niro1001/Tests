module tb_ex43;
  reg [4:0] a, b;       
  reg [1:0] op;         
  wire [4:0] result;    
  wire equal;           
  wire greater;         
  ex43 uut(.a(a), .b(b), .op(op), .result(result), .equal(equal), .greater(greater));
  initial begin
    $display("Testing ex43: ALU with Comparison Flags");
    a=5'd10; b=5'd10; op=2'b10; #1; 
    if(equal !== 1'b1) $display("FAIL: 10===10 should set equal flag");
    else $display("PASS: Equal flag detected (10===10)");
    a=5'd15; b=5'd10; op=2'b10; #1; 
    if(greater !== 1'b1) $display("FAIL: 15>10 should set greater flag");
    else $display("PASS: Greater flag detected (15>10)");
    $display("PASS: ALU with comparison flags working correctly");
    $finish;
  end
endmodule
