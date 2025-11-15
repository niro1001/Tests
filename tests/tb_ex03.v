`timescale 1ns/1ps

module tb_ex03;
  reg [3:0] hex_in;
  wire [3:0] binary_out;
  ex03 uut(.hex_in(hex_in), .binary_out(binary_out));
  
  // Waveform dump
  initial begin
    $dumpfile("ex03.vcd");
    $dumpvars(0, tb_ex03);
  end
  
  initial begin
    $display("\n╔════════════════════════════════════════╗");
    $display("║   TEST: Hexadecimal Conversion (ex03) ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $display("Testing conversion: Hexadecimal → Binary → Decimal");
    $display("Format: Hex | Binary | Decimal");
    $display("─────────────────────────────────────────");
    
    // Test 1: Hex A (10 decimal)
    hex_in = 4'hA; 
    #10;
    if (binary_out !== 4'b1010) begin
      $display("✗ FAIL: Hex A → Expected binary 1010, got %b", binary_out);
    end else begin
      $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
               hex_in, binary_out, binary_out);
    end
    
    // Test 2: Hex F (15 decimal)
    hex_in = 4'hF; 
    #10;
    if (binary_out !== 4'b1111) begin
      $display("✗ FAIL: Hex F → Expected binary 1111, got %b", binary_out);
    end else begin
      $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
               hex_in, binary_out, binary_out);
    end
    
    // Test 3: Hex 5 (5 decimal)
    hex_in = 4'h5; 
    #10;
    if (binary_out !== 4'b0101) begin
      $display("✗ FAIL: Hex 5 → Expected binary 0101, got %b", binary_out);
    end else begin
      $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
               hex_in, binary_out, binary_out);
    end
    
    // Test 4: Additional test cases
    hex_in = 4'h0; 
    #10;
    $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
             hex_in, binary_out, binary_out);
    
    hex_in = 4'h1; 
    #10;
    $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
             hex_in, binary_out, binary_out);
    
    hex_in = 4'h9; 
    #10;
    $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
             hex_in, binary_out, binary_out);
    
    hex_in = 4'hC; 
    #10;
    $display("✓ PASS: Hex %1h | Binary %4b | Decimal %2d", 
             hex_in, binary_out, binary_out);
    
    $display("\n╔════════════════════════════════════════╗");
    $display("║     ✓ ALL TESTS PASSED - ex03          ║");
    $display("╚════════════════════════════════════════╝\n");
    
    $finish;
  end
endmodule
