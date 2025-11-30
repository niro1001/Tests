`timescale 1ns/1ps

module tb_week5_ex2_decoder_assign;
  reg [1:0] sel;
  wire [3:0] out;
  week5_ex2_decoder_assign uut(.sel(sel), .out(out));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex2_decoder_assign.vcd");
    $dumpvars(0, tb_week5_ex2_decoder_assign);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: 2-to-4 Decoder - Behavioral Assign                    ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    sel = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("✗ WRONG: sel=%b → Expected out=%b, got out=%b", sel, 4'b0001, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    sel = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("✗ WRONG: sel=%b → Expected out=%b, got out=%b", sel, 4'b0010, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    sel = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("✗ WRONG: sel=%b → Expected out=%b, got out=%b", sel, 4'b0100, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    sel = 2'b11; #10;
    if (out !== 4'b1000) begin
      $display("✗ WRONG: sel=%b → Expected out=%b, got out=%b", sel, 4'b1000, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: sel=%b | out=%b (correct)", sel, out);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 4 ) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex2_decoder_assign               ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex2_decoder_assign               ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule


