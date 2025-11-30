`timescale 1ns/1ps

module tb_week5_ex6_challenge_circuit_structural;
  reg A, B, C, D, E, F, G;
  wire Y;
  week5_ex6_challenge_circuit_structural uut(.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .Y(Y));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex6_challenge_circuit_structural.vcd");
    $dumpvars(0, tb_week5_ex6_challenge_circuit_structural);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔══════════════════════════════════════════════════════════╗");
    $display("║   TEST: Drawing 03 - Challenge Circuit (Structural)     ║");
    $display("║   Complex circuit with 7 inputs                         ║");
    $display("╚══════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    // Test several key combinations
    A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    if (Y !== 1'b0 && Y !== 1'b1) begin
      $display("✗ WRONG: Invalid output Y=%b", Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: Y=%b (valid output)", Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; D = 1; E = 0; F = 0; G = 0; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    if (Y !== 1'b0 && Y !== 1'b1) begin
      $display("✗ WRONG: Invalid output Y=%b", Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: Y=%b (valid output)", Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 0; C = 0; D = 1; E = 1; F = 1; G = 1; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    if (Y !== 1'b0 && Y !== 1'b1) begin
      $display("✗ WRONG: Invalid output Y=%b", Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: Y=%b (valid output)", Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; D = 0; E = 1; F = 1; G = 1; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    if (Y !== 1'b0 && Y !== 1'b1) begin
      $display("✗ WRONG: Invalid output Y=%b", Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: Y=%b (valid output)", Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    if (Y !== 1'b0 && Y !== 1'b1) begin
      $display("✗ WRONG: Invalid output Y=%b", Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: Y=%b (valid output)", Y);
      pass_count = pass_count + 1;
    end
    
    $display("\n────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 5) begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex6_challenge_circuit_structural      ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex6_challenge_circuit_structural      ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

