`timescale 1ns/1ps

module tb_week_4_decoder_behavioral_assign;
  reg [1:0] sel;
  wire [3:0] out;
  week_4_decoder_behavioral_assign uut(.sel(sel), .out(out));
  
  integer style_check_passed;
  
  initial begin
    $dumpfile("week_4_decoder_behavioral_assign.vcd");
    $dumpvars(0, tb_week_4_decoder_behavioral_assign);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"assign\" Week4\\week_4_decoder_behavioral_assign.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'assign' keyword (behavioral_assign style)");
    end else begin
      $display("✗ Style check FAILED: 'assign' keyword not found (should use behavioral_assign style)");
    end
  end
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: 2-to-4 Decoder - Behavioral Assign                    ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    integer pass_count = 0;
    integer fail_count = 0;
    
    sel = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("✗ FAIL: sel=%b → Expected out=%b, got out=%b", sel, 4'b0001, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    sel = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("✗ FAIL: sel=%b → Expected out=%b, got out=%b", sel, 4'b0010, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    sel = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("✗ FAIL: sel=%b → Expected out=%b, got out=%b", sel, 4'b0100, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    sel = 2'b11; #10;
    if (out !== 4'b1000) begin
      $display("✗ FAIL: sel=%b → Expected out=%b, got out=%b", sel, 4'b1000, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d failed", pass_count, fail_count);
    
    if (pass_count == 4 && style_check_passed) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week_4_decoder_behavioral_assign       ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS FAILED - week_4_decoder_behavioral_assign       ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

