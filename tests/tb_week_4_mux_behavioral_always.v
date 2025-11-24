`timescale 1ns/1ps

module tb_week_4_mux_behavioral_always;
  reg a, b, sel;
  wire y;
  week_4_mux_behavioral_always uut(.a(a), .b(b), .sel(sel), .y(y));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week_4_mux_behavioral_always.vcd");
    $dumpvars(0, tb_week_4_mux_behavioral_always);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"always\" Week4\\week_4_mux_behavioral_always.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'always' keyword (behavioral_always style)");
    end else begin
      $display("✗ Style check FAILED: 'always' keyword not found (should use behavioral_always style)");
    end
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════════════════════════════╗");
    $display("║   TEST: 2-to-1 MUX - Behavioral Always                        ║");
    $display("╚════════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0;
    fail_count = 0;
    
    a = 0; b = 0; sel = 0; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; sel = 0; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; sel = 0; #10;
    if (y !== 1) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; sel = 0; #10;
    if (y !== 1) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 0; sel = 1; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; sel = 1; #10;
    if (y !== 1) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; sel = 1; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; sel = 1; #10;
    if (y !== 1) begin
      $display("✗ FAIL: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    $display("\n───────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d failed", pass_count, fail_count);
    
    if (pass_count == 8 && style_check_passed) begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week_4_mux_behavioral_always           ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS FAILED - week_4_mux_behavioral_always           ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

