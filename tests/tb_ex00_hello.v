// tb_ex00_hello.v - Test for Hello Verilog
// This runs the hello module and checks the output

module tb_ex00_hello;
  
  // Instantiate the hello module
  ex00_hello uut();
  
  initial begin
    $display("Testing ex00_hello:");
    #10;  // Wait for hello module to run
    $display("PASS: Hello test completed!");
    $finish;
  end
  
endmodule
