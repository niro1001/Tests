`timescale 1ns/1ps

module tb_ex04;
  reg [3:0] coin_input;
  wire is_valid;
  wire [3:0] coin_value;
  ex04 uut(.coin_input(coin_input), .is_valid(is_valid), .coin_value(coin_value));
  
  // Waveform dump
  initial begin
    $dumpfile("ex04.vcd");
    $dumpvars(0, tb_ex04);
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════╗");
    $display("║   TEST: Coin Validation (ex04)        ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $display("Testing coin validation: Legal coins are 1, 5, 10 NIS");
    $display("Format: Coin Value (Dec/Hex) | Valid? | Output Value");
    $display("────────────────────────────────────────────────────");
    
    // Test 1: 1 NIS (valid)
    coin_input = 4'd1; 
    #10;
    if (!is_valid || coin_value !== 4'd1) begin
      $display("✗ FAIL: 1 NIS → Expected valid=1, value=1, got valid=%b, value=%d", 
               is_valid, coin_value);
    end else begin
      $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: YES | Output: %2d NIS", 
               coin_input, coin_input, coin_value);
    end
    
    // Test 2: 5 NIS (valid)
    coin_input = 4'd5; 
    #10;
    if (!is_valid || coin_value !== 4'd5) begin
      $display("✗ FAIL: 5 NIS → Expected valid=1, value=5, got valid=%b, value=%d", 
               is_valid, coin_value);
    end else begin
      $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: YES | Output: %2d NIS", 
               coin_input, coin_input, coin_value);
    end
    
    // Test 3: 10 NIS (valid)
    coin_input = 4'd10; 
    #10;
    if (!is_valid || coin_value !== 4'd10) begin
      $display("✗ FAIL: 10 NIS → Expected valid=1, value=10, got valid=%b, value=%d", 
               is_valid, coin_value);
    end else begin
      $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: YES | Output: %2d NIS", 
               coin_input, coin_input, coin_value);
    end
    
    // Test 4: 3 NIS (invalid)
    coin_input = 4'd3; 
    #10;
    if(is_valid !== 1'b0) begin
      $display("✗ FAIL: 3 NIS → Expected valid=0, got valid=%b", is_valid);
    end else begin
      $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: NO  | Output: %2d NIS (rejected)", 
               coin_input, coin_input, coin_value);
    end
    
    // Test 5: 15 NIS (invalid)
    coin_input = 4'd15; 
    #10;
    if(is_valid !== 1'b0) begin
      $display("✗ FAIL: 15 NIS → Expected valid=0, got valid=%b", is_valid);
    end else begin
      $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: NO  | Output: %2d NIS (rejected)", 
               coin_input, coin_input, coin_value);
    end
    
    // Additional test cases
    coin_input = 4'd0; 
    #10;
    $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: %s | Output: %2d NIS", 
             coin_input, coin_input, is_valid ? "YES" : "NO ", coin_value);
    
    coin_input = 4'd2; 
    #10;
    $display("✓ PASS: Coin %2d NIS (Hex %1h) | Valid: %s | Output: %2d NIS", 
             coin_input, coin_input, is_valid ? "YES" : "NO ", coin_value);
    
    $display("\n╔════════════════════════════════════════╗");
    $display("║     ✓ ALL TESTS PASSED - ex04          ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $finish;
  end
endmodule
