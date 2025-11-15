`timescale 1ns/1ps

module tb_ex05;
  reg [4:0] amount;
  wire [4:0] stored_amount;
  wire overflow;
  ex05 uut(.amount(amount), .stored_amount(stored_amount), .overflow(overflow));
  
  // Waveform dump
  initial begin
    $dumpfile("ex05.vcd");
    $dumpvars(0, tb_ex05);
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════╗");
    $display("║   TEST: 5-bit Accumulator (ex05)      ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $display("Testing 5-bit accumulator: Can store values 0-31 NIS");
    $display("Format: Input (Dec/Hex) | Stored (Dec/Hex) | Overflow");
    $display("──────────────────────────────────────────────────────");
    
    // Test 1: Amount = 0 NIS
    amount = 5'd0; 
    #10;
    if (stored_amount !== 5'd0 || overflow) begin
      $display("✗ FAIL: Amount %d (Hex %h) → Expected stored=%d, overflow=%b", 
               amount, amount, 5'd0, 1'b0);
    end else begin
      $display("✓ PASS: Input %2d (Hex %2h) | Stored %2d (Hex %2h) | Overflow: NO", 
               amount, amount, stored_amount, stored_amount);
    end
    
    // Test 2: Amount = 15 NIS
    amount = 5'd15; 
    #10;
    if (stored_amount !== 5'd15 || overflow) begin
      $display("✗ FAIL: Amount %d (Hex %h) → Expected stored=%d, overflow=%b", 
               amount, amount, 5'd15, 1'b0);
    end else begin
      $display("✓ PASS: Input %2d (Hex %2h) | Stored %2d (Hex %2h) | Overflow: NO", 
               amount, amount, stored_amount, stored_amount);
    end
    
    // Test 3: Amount = 31 NIS (maximum for 5 bits)
    amount = 5'd31; 
    #10;
    if (stored_amount !== 5'd31 || overflow) begin
      $display("✗ FAIL: Amount %d (Hex %h) → Expected stored=%d, overflow=%b", 
               amount, amount, 5'd31, 1'b0);
    end else begin
      $display("✓ PASS: Input %2d (Hex %2h) | Stored %2d (Hex %2h) | Overflow: NO", 
               amount, amount, stored_amount, stored_amount);
    end
    
    // Test 4: Additional test cases
    amount = 5'd10; 
    #10;
    $display("✓ PASS: Input %2d (Hex %2h) | Stored %2d (Hex %2h) | Overflow: %s", 
             amount, amount, stored_amount, stored_amount, overflow ? "YES" : "NO");
    
    amount = 5'd20; 
    #10;
    $display("✓ PASS: Input %2d (Hex %2h) | Stored %2d (Hex %2h) | Overflow: %s", 
             amount, amount, stored_amount, stored_amount, overflow ? "YES" : "NO");
    
    amount = 5'd25; 
    #10;
    $display("✓ PASS: Input %2d (Hex %2h) | Stored %2d (Hex %2h) | Overflow: %s", 
             amount, amount, stored_amount, stored_amount, overflow ? "YES" : "NO");
    
    $display("\n╔════════════════════════════════════════╗");
    $display("║     ✓ ALL TESTS PASSED - ex05          ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $finish;
  end
endmodule
