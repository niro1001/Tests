`timescale 1ns/1ps

module tb_week_4_drawing02_behavioral_assign;
  reg A, B, C, D;
  wire Y, Z;
  week_4_drawing02_behavioral_assign uut(.A(A), .B(B), .C(C), .D(D), .Y(Y), .Z(Z));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week_4_drawing02_behavioral_assign.vcd");
    $dumpvars(0, tb_week_4_drawing02_behavioral_assign);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"assign\" Week4\\week_4_drawing02_behavioral_assign.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'assign' keyword (behavioral_assign style)");
    end else begin
      $display("✗ Style check FAILED: 'assign' keyword not found (should use behavioral_assign style)");
    end
  end
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: Drawing 02 - PLA Circuit (Behavioral Assign)         ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0;
    fail_count = 0;
    
    // Test key combinations
    A = 1; B = 1; C = 1; D = 1; #10;  // Y should be 1 (ABCD)
    if (Y !== 1 || Z !== 0) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 1, 0, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; D = 0; #10;  // Z should be 1 (ABCD')
    if (Y !== 0 || Z !== 1) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 0, 1, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 1; D = 1; #10;  // Y should be 1 (AB'CD)
    if (Y !== 1 || Z !== 0) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 1, 0, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 0; D = 1; #10;  // Z should be 1 (A'BC'D)
    if (Y !== 0 || Z !== 1) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 0, 1, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 0; C = 0; D = 0; #10;  // Y should be 1 (A'B'C'D')
    if (Y !== 1 || Z !== 0) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 1, 0, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    if (fail_count == 0) begin
      $display("Functional Tests: %0d passed", pass_count);
    end else begin
      $display("Functional Tests: %0d passed, %0d failed", pass_count, fail_count);
    end
    
    if (pass_count == 5 && style_check_passed) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week_4_drawing02_behavioral_assign   ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS FAILED - week_4_drawing02_behavioral_assign      ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule
