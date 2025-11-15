module tb_ex11;
  reg A, B, C;      
  wire F;           
  ex11 uut(.A(A), .B(B), .C(C), .F(F));
  initial begin
    $display("Testing ex11: SOP Form");
    A=0; B=0; C=1; #1; 
    if(F !== 1'b1) $display("FAIL: 001 should be 1");
    A=0; B=1; C=1; #1; 
    if(F !== 1'b1) $display("FAIL: 011 should be 1");
    A=0; B=0; C=0; #1; 
    if(F !== 1'b0) $display("FAIL: 000 should be 0");
    $display("PASS: SOP form working correctly");
    $finish;
  end
endmodule
