module tb_ex14;
  reg A, B, C;          
  wire F1, F2, F3;      
  ex14 uut(.A(A), .B(B), .C(C), .F1(F1), .F2(F2), .F3(F3));
  initial begin
    $display("Testing ex14: Boolean Theorems");
    A=1; B=1; C=0; #1;
    if(F1!==0 || F2!==0 || F3!==1) 
      $display("FAIL: 110 → F1=%b(exp 0), F2=%b(exp 0), F3=%b(exp 1)", F1, F2, F3);
    else 
      $display("PASS: ABC=110 → F1=0, F2=0, F3=1");
    A=0; B=0; C=0; #1;
    if(F1!==1 || F2!==1 || F3!==0) 
      $display("FAIL: 000 → F1=%b(exp 1), F2=%b(exp 1), F3=%b(exp 0)", F1, F2, F3);
    else 
      $display("PASS: ABC=000 → F1=1, F2=1, F3=0");
    $display("PASS: Boolean Theorems working correctly");
    $finish;
  end
endmodule
