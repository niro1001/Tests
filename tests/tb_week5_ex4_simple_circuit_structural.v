`timescale 1ns/1ps

module tb_week5_ex4_simple_circuit_structural;
  reg A, B, C;
  wire Y;
  week5_ex4_simple_circuit_structural uut(.A(A), .B(B), .C(C), .Y(Y));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex4_simple_circuit_structural.vcd");
    $dumpvars(0, tb_week5_ex4_simple_circuit_structural);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔══════════════════════════════════════════════════════════╗");
    $display("║   TEST: Simple Circuit - Structural (week5_ex4)       ║");
    $display("║   Circuit: Y = (A' AND B') OR (B AND C)                ║");
    $display("╚══════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    // Test all 8 combinations
    A = 0; B = 0; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 0; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 0; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; #10;
    if (Y !== ((~A & ~B) | (B & C))) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b → Expected Y=%b, got Y=%b", A, B, C, (~A & ~B) | (B & C), Y);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b → Y=%b (correct)", A, B, C, Y);
      pass_count = pass_count + 1;
    end
    
    $display("\n────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 8 ) begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex4_simple_circuit_structural ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔══════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex4_simple_circuit_structural ║");
      $display("╚══════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

