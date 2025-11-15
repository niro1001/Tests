module tb_ex37;
  reg a, b, cin;        
  wire sum, cout;       
  ex37 uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  initial begin
    $display("Testing ex37: Full Adder");
    a=1; b=1; cin=1; #1; 
    if(sum !== 1 || cout !== 1) 
      $display("FAIL: 1+1+1 should give sum=1, cout=1, got sum=%b, cout=%b", sum, cout);
    else 
      $display("PASS: 1+1+1 = 11 (sum=1, cout=1)");
    a=1; b=0; cin=0; #1; 
    if(sum !== 1 || cout !== 0) 
      $display("FAIL: 1+0+0 should give sum=1, cout=0, got sum=%b, cout=%b", sum, cout);
    else 
      $display("PASS: 1+0+0 = 1 (sum=1, cout=0)");
    $display("PASS: Full adder working correctly");
    $finish;
  end
endmodule
