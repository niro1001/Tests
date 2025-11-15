module tb_ex13;
  reg A;                    
  wire F1, F2, F3, F4;      
  ex13 uut(.A(A), .F1(F1), .F2(F2), .F3(F3), .F4(F4));
  initial begin
    $display("Testing ex13: Boolean Axioms");
    A=0; #1;
    if(F1!==0 || F2!==0 || F3!==1 || F4!==0) 
      $display("FAIL: A=0 axioms incorrect - F1=%b F2=%b F3=%b F4=%b", F1, F2, F3, F4);
    else 
      $display("PASS: A=0 → F1=0(A+0), F2=0(A*1), F3=1(A+1), F4=0(A*0)");
    A=1; #1;
    if(F1!==1 || F2!==1 || F3!==1 || F4!==0) 
      $display("FAIL: A=1 axioms incorrect - F1=%b F2=%b F3=%b F4=%b", F1, F2, F3, F4);
    else 
      $display("PASS: A=1 → F1=1(A+0), F2=1(A*1), F3=1(A+1), F4=0(A*0)");
    $display("PASS: Boolean Axioms working correctly");
    $finish;
  end
endmodule
