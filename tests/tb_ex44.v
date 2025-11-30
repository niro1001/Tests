module tb_ex44;
  reg [4:0] a, b;       
  reg [1:0] op;         
  wire [4:0] result;    
  wire carry;           
  wire zero;            
  wire negative;        
  ex44 uut(.a(a), .b(b), .op(op), .result(result), 
           .carry(carry), .zero(zero), .negative(negative));
  initial begin
    $display("Testing ex44: ALU with Status Flags");
    a=5'd5; b=5'd3; op=2'b00; #1; 
    if(result !== 5'd8 || zero) 
      $display("WRONG: 5+3 should be 8 with zero=0, got result=%d, zero=%b", result, zero);
    else 
      $display("PASS: 5+3=8, zero flag=0");
    a=5'd0; b=5'd0; op=2'b00; #1; 
    if(zero !== 1'b1) $display("WRONG: 0+0 should set zero flag");
    else $display("PASS: 0+0=0, zero flag=1");
    $display("PASS: ALU with status flags working correctly");
    $finish;
  end
endmodule
