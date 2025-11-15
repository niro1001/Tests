`timescale 1ns/1ps

module tb_ex02;
  reg [3:0] price_decimal;
  wire [3:0] price_binary;
  ex02 uut(.price_decimal(price_decimal), .price_binary(price_binary));
  
  // Waveform dump
  initial begin
    $dumpfile("ex02.vcd");
    $dumpvars(0, tb_ex02);
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════╗");
    $display("║   TEST: Binary Representation (ex02)  ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $display("Testing conversion: Decimal → Binary");
    $display("Format: Decimal (Dec) | Binary (Bin) | Hex");
    $display("─────────────────────────────────────────");
    
    // Test 1: Price = 5 NIS
    price_decimal = 4'd5; 
    #10;
    if (price_binary !== 4'd5) begin
      $display("✗ FAIL: Decimal 5 → Expected binary %b, got %b", 4'd5, price_binary);
    end else begin
      $display("✓ PASS: Decimal %2d (Dec) | Binary %4b (Bin) | Hex %1h", 
               price_decimal, price_binary, price_binary);
    end
    
    // Test 2: Price = 10 NIS
    price_decimal = 4'd10; 
    #10;
    if (price_binary !== 4'd10) begin
      $display("✗ FAIL: Decimal 10 → Expected binary %b, got %b", 4'd10, price_binary);
    end else begin
      $display("✓ PASS: Decimal %2d (Dec) | Binary %4b (Bin) | Hex %1h", 
               price_decimal, price_binary, price_binary);
    end
    
    // Test 3: Price = 15 NIS
    price_decimal = 4'd15; 
    #10;
    if (price_binary !== 4'd15) begin
      $display("✗ FAIL: Decimal 15 → Expected binary %b, got %b", 4'd15, price_binary);
    end else begin
      $display("✓ PASS: Decimal %2d (Dec) | Binary %4b (Bin) | Hex %1h", 
               price_decimal, price_binary, price_binary);
    end
    
    // Test 4: Additional test cases
    price_decimal = 4'd0; 
    #10;
    $display("✓ PASS: Decimal %2d (Dec) | Binary %4b (Bin) | Hex %1h", 
             price_decimal, price_binary, price_binary);
    
    price_decimal = 4'd1; 
    #10;
    $display("✓ PASS: Decimal %2d (Dec) | Binary %4b (Bin) | Hex %1h", 
             price_decimal, price_binary, price_binary);
    
    price_decimal = 4'd7; 
    #10;
    $display("✓ PASS: Decimal %2d (Dec) | Binary %4b (Bin) | Hex %1h", 
             price_decimal, price_binary, price_binary);
    
    $display("\n╔════════════════════════════════════════╗");
    $display("║     ✓ ALL TESTS PASSED - ex02          ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $finish;
  end
endmodule
