`timescale 1ns/1ps

module tb_week5_ex1_and_assign;
  reg a, b;
  wire y;
  week5_ex1_and_assign uut(.a(a), .b(b), .y(y));
  
  integer pass_count;
  integer fail_count;
  
  // Waveform dump
  initial begin
    $dumpfile("week5_ex1_and_assign.vcd");
    $dumpvars(0, tb_week5_ex1_and_assign);
  end
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: AND Gate - Behavioral Assign (week5_ex1_and_assign)  ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    $display("Testing AND gate truth table:");
    $display("Format: a | b | y (expected) | y (actual) | Status");
    $display("─────────────────────────────────────────────────────────────────");
    
    pass_count = 0;
    fail_count = 0;
    
    // Test all combinations
    a = 0; b = 0; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 4) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex1_and_assign                  ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex1_and_assign                  ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

