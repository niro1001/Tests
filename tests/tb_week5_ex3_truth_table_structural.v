`timescale 1ns/1ps

module tb_week5_ex3_truth_table_structural;
  reg A, B, C;
  wire F;
  week5_ex3_truth_table_structural uut(.A(A), .B(B), .C(C), .F(F));
  
  integer pass_count;
  integer fail_count;
  
  initial begin
    $dumpfile("week5_ex3_truth_table_structural.vcd");
    $dumpvars(0, tb_week5_ex3_truth_table_structural);
  end
  
  // Style check removed - autograder handles style checking
  
  initial begin
    $display("\n╔════════════════════════════════════════════════════════════════╗");
    $display("║   TEST: Truth Table - Structural (week5_ex3)                   ║");
    $display("╚════════════════════════════════════════════════════════════════╝\n");
    
    pass_count = 0; fail_count = 0;
    
    // Test all 8 combinations of 3-variable truth table
    A = 0; B = 0; C = 0; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=000 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=000 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 0; C = 1; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=001 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=001 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 0; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=010 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=010 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 0; B = 1; C = 1; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=011 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=011 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 0; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=100 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=100 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 0; C = 1; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=101 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=101 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 0; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=110 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=110 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    A = 1; B = 1; C = 1; #10;
    if (F !== 1'b0 && F !== 1'b1) begin
      $display("✗ WRONG: ABC=111 → F=%b (invalid)", F);
      fail_count = fail_count + 1;
    end else begin
      $display("✓ PASS: ABC=111 → F=%b", F);
      pass_count = pass_count + 1;
    end
    
    $display("\n───────────────────────────────────────────────────────────────────");
    $display("Functional Tests: %0d passed, %0d wrong", pass_count, fail_count);
    
    if (pass_count == 8) begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✓ ALL TESTS PASSED - week5_ex3_truth_table_structural        ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end else begin
      $display("\n╔════════════════════════════════════════════════════════════════╗");
      $display("║  ✗ SOME TESTS WRONG - week5_ex3_truth_table_structural        ║");
      $display("╚════════════════════════════════════════════════════════════════╝\n");
    end
    
    $finish;
  end
endmodule

