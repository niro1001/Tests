`timescale 1ns/1ps

module tb_week5_ex2_mux_structural;
  reg a, b, sel;
  wire y;
  week5_ex2_mux_structural uut(.a(a), .b(b), .sel(sel), .y(y));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex2_mux_structural.vcd");
    $dumpvars(0, tb_week5_ex2_mux_structural);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔══════════════════════════════════════════════════════════╗");
    $display("║   TEST: 2-to-1 MUX - Structural                         ║");
    $display("╚══════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    a = 0; b = 0; sel = 0; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; sel = 0; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; sel = 0; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; sel = 0; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 0; sel = 1; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 0; b = 1; sel = 1; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 0; sel = 1; #10;
    if (y !== 0) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b0, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    a = 1; b = 1; sel = 1; #10;
    if (y !== 1) begin
      $display("✗ WRONG: a=%b, b=%b, sel=%b → Expected y=%b, got y=%b", a, b, sel, 1'b1, y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: a=%b | b=%b | sel=%b | y=%b (correct)", a, b, sel, y);
      pass_count = pass_count + 1;
    end
    
    $display("\n────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 8 ) begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex2_mux_structural         ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex2_mux_structural         ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule


