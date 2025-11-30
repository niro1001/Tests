`timescale 1ns/1ps

module tb_week5_ex1_not_assign;
  reg a;
  wire y;
  week5_ex1_not_assign uut(.a(a), .y(y));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex1_not_assign.vcd");
    $dumpvars(0, tb_week5_ex1_not_assign);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"assign\" week5\\week5_ex1_not_assign.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'assign' keyword (behavioral_assign style)");
    end else begin
      $display("✗ Style check INCORRECT: 'assign' keyword not found (should use behavioral_assign style)");
    end
  end
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: NOT Gate - Behavioral Assign (week5_ex1_not_assign)  ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    a = 0; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b → Expected y=%b, got y=%b", a, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | y=%b (correct)", a, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b → Expected y=%b, got y=%b", a, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | y=%b (correct)", a, y);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d incorrect", pass_count, fail_count);
    
    if (pass_count == 2 ) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex1_not_assign                  ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS INCORRECT - week5_ex1_not_assign                  ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule


