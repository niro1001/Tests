`timescale 1ns/1ps

module tb_week_4_encoder_behavioral_assign;
  reg [3:0] in;
  wire [1:0] out;
  week_4_encoder_behavioral_assign uut(.in(in), .out(out));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week_4_encoder_behavioral_assign.vcd");
    $dumpvars(0, tb_week_4_encoder_behavioral_assign);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"assign\" Week4\\week_4_encoder_behavioral_assign.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'assign' keyword (behavioral_assign style)");
    end else begin
      $display("✗ Style check FAILED: 'assign' keyword not found (should use behavioral_assign style)");
    end
  end
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: 4-to-2 Encoder - Behavioral Assign                   ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0;
    fail_count = 0;
    
    in = 4'b0001; #10;
    if (out !== 2'b00) begin
      $display("✗ FAIL: in=%b → Expected out=%b, got out=%b", in, 2'b00, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    in = 4'b0010; #10;
    if (out !== 2'b01) begin
      $display("✗ FAIL: in=%b → Expected out=%b, got out=%b", in, 2'b01, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    in = 4'b0100; #10;
    if (out !== 2'b10) begin
      $display("✗ FAIL: in=%b → Expected out=%b, got out=%b", in, 2'b10, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    in = 4'b1000; #10;
    if (out !== 2'b11) begin
      $display("✗ FAIL: in=%b → Expected out=%b, got out=%b", in, 2'b11, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d failed", pass_count, fail_count);
    
    if (pass_count == 4 && style_check_passed) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week_4_encoder_behavioral_assign      ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS FAILED - week_4_encoder_behavioral_assign      ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

