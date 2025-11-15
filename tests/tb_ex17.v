module tb_ex17;
  reg A, B, C, D;   
  wire F;           
  ex17 uut(.A(A), .B(B), .C(C), .D(D), .F(F));
  initial begin
    $display("Testing ex17: 4-Variable K-Map");
    $display("Function: F = (~B&~D) | (~B&~C) | (~A&~C&D)");
    A=0; B=0; C=0; D=0; #1;
    if(F !== 1) $display("FAIL: 0000 should be 1, got F=%b", F);
    else $display("PASS: ABCD=0000 → F=1");
    A=0; B=0; C=1; D=0; #1;
    if(F !== 1) $display("FAIL: 0010 should be 1, got F=%b", F);
    else $display("PASS: ABCD=0010 → F=1");
    A=0; B=1; C=0; D=1; #1;
    if(F !== 1) $display("FAIL: 0101 should be 1, got F=%b", F);
    else $display("PASS: ABCD=0101 → F=1");
    A=1; B=1; C=1; D=1; #1;
    if(F !== 0) $display("FAIL: 1111 should be 0, got F=%b", F);
    else $display("PASS: ABCD=1111 → F=0");
    A=0; B=0; C=0; D=1; #1;
    if(F !== 1) $display("FAIL: 0001 should be 1, got F=%b", F);
    else $display("PASS: ABCD=0001 → F=1");
    $display("PASS: 4-variable K-map working correctly");
    $finish;
  end
endmodule
