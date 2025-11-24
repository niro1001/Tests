`timescale 1ns/1ps

module tb_week_4_drawing01_behavioral_always;
  reg A, B, C;
  wire Y;
  week_4_drawing01_behavioral_always uut(.A(A), .B(B), .C(C), .Y(Y));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week_4_drawing01_behavioral_always.vcd");
    $dumpvars(0, tb_week_4_drawing01_behavioral_always);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"always\" Week4\\week_4_drawing01_behavioral_always.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'always' keyword (behavioral_always style)");
    end else begin
      $display("✗ Style check FAILED: 'always' keyword not found (should use behavioral_always style)");
    end
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════════════════════════════╗");
    $display("║   TEST: Drawing 01 - Behavioral Always                       ║");
    $display("╚════════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0;
    fail_count = 0;
    
    // Test all 8 combinations
    A = 0; B = 0; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 0; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ FAIL: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    $display("\n───────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d failed", pass_count, fail_count);
    
    if (pass_count == 8 && style_check_passed) begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week_4_drawing01_behavioral_always      ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS FAILED - week_4_drawing01_behavioral_always     ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

