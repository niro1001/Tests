module tb_ex16;
  reg A, B, C;      
  wire F;           
  ex16 uut(.A(A), .B(B), .C(C), .F(F));
  initial begin
    $display("Testing ex16: 3-Variable K-Map");
    A=0; B=0; C=0; #1;
    if(F !== 1) $display("FAIL: 000 should be 1, got F=%b", F);
    else $display("PASS: ABC=000 → F=1");
    A=0; B=0; C=1; #1;
    if(F !== 0) $display("FAIL: 001 should be 0, got F=%b", F);
    else $display("PASS: ABC=001 → F=0");
    A=1; B=0; C=0; #1;
    if(F !== 1) $display("FAIL: 100 should be 1, got F=%b", F);
    else $display("PASS: ABC=100 → F=1");
    A=1; B=0; C=1; #1;
    if(F !== 1) $display("FAIL: 101 should be 1, got F=%b", F);
    else $display("PASS: ABC=101 → F=1");
    A=1; B=1; C=1; #1;
    if(F !== 1) $display("FAIL: 111 should be 1, got F=%b", F);
    else $display("PASS: ABC=111 → F=1");
    A=0; B=1; C=0; #1;
    if(F !== 0) $display("FAIL: 010 should be 0, got F=%b", F);
    else $display("PASS: ABC=010 → F=0");
    $display("PASS: 3-variable K-map working correctly");
    $finish;
  end
endmodule
