module tb_ex36;
  reg a, b;           
  wire sum, carry;    
  ex36 uut(.a(a), .b(b), .sum(sum), .carry(carry));
  initial begin
    $display("Testing ex36: Half Adder");
    a=0; b=0; #1; 
    if(sum!==0 || carry!==0) $display("FAIL: 0+0 should be 0, carry 0");
    else $display("PASS: 0+0=0");
    a=1; b=1; #1; 
    if(sum!==0 || carry!==1) $display("FAIL: 1+1 should be 0, carry 1");
    else $display("PASS: 1+1=10 (binary)");
    a=1; b=0; #1; 
    if(sum!==1 || carry!==0) $display("FAIL: 1+0 should be 1, carry 0");
    else $display("PASS: 1+0=1");
    $display("PASS: Half Adder working correctly");
    $finish;
  end
endmodule
