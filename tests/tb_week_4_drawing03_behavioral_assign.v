`timescale 1ns/1ps

module tb_week_4_drawing03_behavioral_assign;
  reg A, B, C, D, E, F, G;
  wire Y;
  week_4_drawing03_behavioral_assign uut(.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .Y(Y));
  
  integer style_check_passed;
  
  initial begin
    $dumpfile("week_4_drawing03_behavioral_assign.vcd");
    $dumpvars(0, tb_week_4_drawing03_behavioral_assign);
  end
  
  initial begin
    style_check_passed = 0;
    $system("findstr /C:\"assign\" Week4\\week_4_drawing03_behavioral_assign.v > nul");
    if ($status == 0) begin
      style_check_passed = 1;
      $display("✓ Style check PASSED: Found 'assign' keyword (behavioral_assign style)");
    end else begin
      $display("✗ Style check FAILED: 'assign' keyword not found (should use behavioral_assign style)");
    end
  end
  
  initial begin
    $display("\n╔═══════════════════════════════════════════════════════════════╗");
    $display("║   TEST: Drawing 03 - Challenge Circuit (Behavioral Assign)   ║");
    $display("╚═══════════════════════════════════════════════════════════════╝\n");
    
    integer pass_count = 0;
    
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
    
    if (style_check_passed) begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✓ STYLE CHECK PASSED - week_4_drawing03_behavioral_assign   ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔═══════════════════════════════════════════════════════════════╗");
      $display("║  ✗ STYLE CHECK FAILED - week_4_drawing03_behavioral_assign     ║");
      $display("╚═══════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule
