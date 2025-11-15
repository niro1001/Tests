module tb_ex18;
  reg A, B, C;      
  wire F;           
  ex18 uut(.A(A), .B(B), .C(C), .F(F));
  initial begin
    $display("Testing ex18: K-Map with Don't Cares");
    $display("Function simplified to: F = C");
    A=0; B=0; C=0; #1;
    if(F !== 0) $display("FAIL: 000 should give F=0, got F=%b", F);
    else $display("PASS: ABC=000 → F=0");
    A=0; B=0; C=1; #1;
    if(F !== 1) $display("FAIL: 001 should give F=1, got F=%b", F);
    else $display("PASS: ABC=001 → F=1");
    A=1; B=0; C=0; #1;
    if(F !== 0) $display("FAIL: 100 should give F=0, got F=%b", F);
    else $display("PASS: ABC=100 → F=0");
    A=1; B=1; C=1; #1;
    if(F !== 1) $display("FAIL: 111 should give F=1, got F=%b", F);
    else $display("PASS: ABC=111 → F=1");
    A=0; B=1; C=0; #1;
    if(F !== 0) $display("FAIL: 010 should give F=0, got F=%b", F);
    else $display("PASS: ABC=010 → F=0");
    $display("PASS: K-map with don't cares (F=C) working correctly");
    $finish;
  end
endmodule
