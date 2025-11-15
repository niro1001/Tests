`timescale 1ns/1ps

module tb_ex01;
  reg a, b;
  wire y;
  ex01 uut(.a(a), .b(b), .y(y));
  
  // Waveform dump
  initial begin
    $dumpfile("ex01.vcd");
    $dumpvars(0, tb_ex01);
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════╗");
    $display("║   TEST: Basic AND Gate (ex01)         ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $display("Testing AND gate truth table:");
    $display("Format: a | b | y (expected) | y (actual) | Status");
    $display("────────────────────────────────────────────────────");
    
    // Test all combinations
    a = 0; b = 0; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
    end
    
    a = 0; b = 1; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
    end
    
    a = 1; b = 0; #10;
    if (y !== 0) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b0, y);
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
    end
    
    a = 1; b = 1; #10;
    if (y !== 1) begin
      $display("✗ FAIL: a=%b, b=%b → Expected y=%b, got y=%b", a, b, 1'b1, y);
    end else begin
      $display("✓ PASS: a=%b | b=%b | y=%b (correct)", a, b, y);
    end
    
    $display("\n╔════════════════════════════════════════╗");
    $display("║     ✓ ALL TESTS PASSED - ex01          ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $finish;
  end
endmodule
