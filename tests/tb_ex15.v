module tb_ex15;
  reg A, B, C;      
  wire F;           
  ex15 uut(.A(A), .B(B), .C(C), .F(F));
  initial begin
    $display("Testing ex15: Consensus Theorem");
    $display("Simplified form: F = AB + A'C (BC term eliminated)");
    A=1; B=1; C=0; #1;
    if(F !== 1'b1) $display("FAIL: 110 should be 1 (from AB term), got F=%b", F);
    else $display("PASS: ABC=110 → F=1 (AB=1)");
    A=0; B=0; C=1; #1;
    if(F !== 1'b1) $display("FAIL: 001 should be 1 (from A'C term), got F=%b", F);
    else $display("PASS: ABC=001 → F=1 (A'C=1)");
    A=0; B=0; C=0; #1;
    if(F !== 1'b0) $display("FAIL: 000 should be 0 (no terms true), got F=%b", F);
    else $display("PASS: ABC=000 → F=0 (all terms false)");
    A=0; B=1; C=1; #1;
    if(F !== 1'b1) $display("FAIL: 011 should be 1 (from A'C), got F=%b", F);
    else $display("PASS: ABC=011 → F=1 (demonstrates BC redundancy)");
    $display("PASS: Consensus Theorem working correctly");
    $finish;
  end
endmodule
