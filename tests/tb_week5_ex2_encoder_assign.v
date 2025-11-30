`timescale 1ns/1ps

module tb_week5_ex2_encoder_assign;
  reg [3:0] in;
  wire [1:0] out;
  week5_ex2_encoder_assign uut(.in(in), .out(out));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex2_encoder_assign.vcd");
    $dumpvars(0, tb_week5_ex2_encoder_assign);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: 4-to-2 Encoder - Behavioral Assign (week5_ex2)      ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    in = 4'b0001; #10;
    if (out !== 2'b00) begin
      $display("✗ WRONG: in=%b → Expected out=%b, got out=%b", in, 2'b00, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    in = 4'b0010; #10;
    if (out !== 2'b01) begin
      $display("✗ WRONG: in=%b → Expected out=%b, got out=%b", in, 2'b01, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    in = 4'b0100; #10;
    if (out !== 2'b10) begin
      $display("✗ WRONG: in=%b → Expected out=%b, got out=%b", in, 2'b10, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    in = 4'b1000; #10;
    if (out !== 2'b11) begin
      $display("✗ WRONG: in=%b → Expected out=%b, got out=%b", in, 2'b11, out);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: in=%b | out=%b (correct)", in, out);
      pass_count = pass_count + 1;
    end
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 4 ) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex2_encoder_assign              ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex2_encoder_assign              ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule


