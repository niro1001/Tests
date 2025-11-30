`timescale 1ns/1ps

module tb_week5_ex1_xor_always;
  reg a, b;
  wire y;
  week5_ex1_xor_always uut(.a(a), .b(b), .y(y));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex1_xor_always.vcd");
    $dumpvars(0, tb_week5_ex1_xor_always);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔════════════════════════════════════════════════════════════════╗");
    $display("║   TEST: XOR Gate - Behavioral Always (week5_ex1_xor_always)   ║");
    $display("╚════════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    a = 0; b = 0; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    $display("\n───────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 4 ) begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex1_xor_always                    ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex1_xor_always                    ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule


