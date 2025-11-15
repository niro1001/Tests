// tb_ex00.v - Test for empty module
// This just checks that the empty module compiles

module tb_ex00;
  
  // Instantiate the empty module
  ex00 uut();
  
  initial begin
    $display("Testing ex00: Empty module");
    #10;  // Wait 10 time units
    $display("PASS: Empty module compiled successfully!");
    $finish;
  end
  
endmodule
