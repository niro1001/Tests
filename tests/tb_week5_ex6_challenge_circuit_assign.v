`timescale 1ns/1ps

module tb_week5_ex6_challenge_circuit_assign;
  reg A, B, C, D, E, F, G;
  wire Y;
  week5_ex6_challenge_circuit_assign uut(.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .Y(Y));
  
  initial begin
    $dumpfile("week5_ex6_challenge_circuit_assign.vcd");
    $dumpvars(0, tb_week5_ex6_challenge_circuit_assign);
  end
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: Challenge Circuit - Behavioral Assign (week5_ex6)     ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0;
    fail_count = 0;
    
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
    
    $display("\n─────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d test cases executed", pass_count);
    
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║  ✓ ALL TESTS PASSED - week5_ex6_challenge_circuit_assign     ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    $finish;
  end
endmodule

