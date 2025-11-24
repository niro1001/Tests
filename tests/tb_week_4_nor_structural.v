`timescale 1ns/1ps

module tb_week_4_nor_structural;
  reg a, b;
  wire y;
  week_4_nor_structural uut(.a(a), .b(b), .y(y));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week_4_nor_structural.vcd");
    $dumpvars(0, tb_week_4_nor_structural);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"wire\" Week4\\week_4_nor_structural.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'wire' keyword (structural style)");
    end else begin
      $display("✗ Style check FAILED: 'wire' keyword not found (should use structural style)");
    end
  end
  
  initial begin
    $display("\n╔══════════════════════════════════════════════════════════╗");
    $display("║   TEST: NOR Gate - Structural (week_4_nor_structural)   ║");
    $display("╚══════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0;
    fail_count = 0;
    
    a = 0; b = 0; #10;
    if (y !== 1) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
      pass_count = pass_count + 1;
    end
    
    $display("\n────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d failed", pass_count, fail_count);
    
    if (pass_count == 4 && style_check_passed) begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week_4_nor_structural             ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS FAILED - week_4_nor_structural             ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

