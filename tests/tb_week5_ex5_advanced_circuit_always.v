`timescale 1ns/1ps

module tb_week5_ex5_advanced_circuit_always;
  reg A, B, C, D;
  wire Y, Z;
  week5_ex5_advanced_circuit_always uut(.A(A), .B(B), .C(C), .D(D), .Y(Y), .Z(Z));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex5_advanced_circuit_always.vcd");
    $dumpvars(0, tb_week5_ex5_advanced_circuit_always);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔════════════════════════════════════════════════════════════════╗");
    $display("║   TEST: Advanced Circuit (week5_ex5) (Behavioral Always)            ║");
    $display("╚════════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    // Test key combinations
    A = 1; B = 1; C = 1; D = 1; #10;  // Y should be 1 (ABCD)
    if (Y !== 1 || Z !== 0) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 1, 0, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; D = 0; #10;  // Z should be 1 (ABCD')
    if (Y !== 0 || Z !== 1) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 0, 1, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 1; D = 1; #10;  // Y should be 1 (AB'CD)
    if (Y !== 1 || Z !== 0) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 1, 0, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 0; D = 1; #10;  // Z should be 1 (A'BC'D)
    if (Y !== 0 || Z !== 1) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 0, 1, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 0; C = 0; D = 0; #10;  // Y should be 1 (A'B'C'D')
    if (Y !== 1 || Z !== 0) begin
      $display("✗ WRONG: A=%b, B=%b, C=%b, D=%b → Expected Y=%b, Z=%b, got Y=%b, Z=%b", A, B, C, D, 1, 0, Y, Z);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: A=%b, B=%b, C=%b, D=%b → Y=%b, Z=%b (correct)", A, B, C, D, Y, Z);
      pass_count = pass_count + 1;
    end
    
    $display("\n───────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 5 ) begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex5_advanced_circuit_always     ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex5_advanced_circuit_always     ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

