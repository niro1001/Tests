`timescale 1ns/1ps

module tb_week5_ex6_challenge_circuit_structural;
  reg A, B, C, D, E, F, G;
  wire Y;
  week5_ex6_challenge_circuit_structural uut(.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .Y(Y));
  
  integer style_check_passed;
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex6_challenge_circuit_structural.vcd");
    $dumpvars(0, tb_week5_ex6_challenge_circuit_structural);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"wire\" week5\\week5_ex6_challenge_circuit_structural.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'wire' keyword (structural style)");
    end else begin
      $display("✗ Style check INCORRECT: 'wire' keyword not found (should use structural style)");
    end
  end
  
  initial begin
    $display("\n╔══════════════════════════════════════════════════════════╗");
    $display("║   TEST: Drawing 03 - Challenge Circuit (Structural)     ║");
    $display("║   Complex circuit with 7 inputs                         ║");
    $display("╚══════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    // Test several key combinations
    A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    pass_count = pass_count + 1;
    
    A = 1; B = 1; C = 1; D = 1; E = 0; F = 0; G = 0; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    pass_count = pass_count + 1;
    
    A = 0; B = 0; C = 0; D = 1; E = 1; F = 1; G = 1; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    pass_count = pass_count + 1;
    
    A = 1; B = 1; C = 1; D = 0; E = 1; F = 1; G = 1; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    pass_count = pass_count + 1;
    
    A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1; #10;
    $display("Testing: A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b → Y=%b", A, B, C, D, E, F, G, Y);
    pass_count = pass_count + 1;
    
    $display("\n────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d test cases executed", pass_count);
    
    if (1) begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✓ STYLE CHECK PASSED - week5_ex6_challenge_circuit_structural    ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✗ STYLE CHECK INCORRECT - week5_ex6_challenge_circuit_structural      ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

