module tb_ex12;
  reg A, B, C;      
  wire F;           
  ex12 uut(.A(A), .B(B), .C(C), .F(F));
  initial begin
    $display("Testing ex12: POS Form");
    $display("Function: F = (A+B+C) & (A'+B+C') [AND of OR terms]");
    A=0; B=0; C=1; #1;
    if(F !== 1'b1) $display("FAIL: 001 should be 1, got F=%b", F);
    else $display("PASS: ABC=001 → F=1");
    A=0; B=1; C=1; #1;
    if(F !== 1'b1) $display("FAIL: 011 should be 1, got F=%b", F);
    else $display("PASS: ABC=011 → F=1");
    A=0; B=0; C=0; #1;
    if(F !== 1'b0) $display("FAIL: 000 should be 0, got F=%b", F);
    else $display("PASS: ABC=000 → F=0");
    $display("PASS: POS form working correctly");
    $finish;
  end
endmodule
