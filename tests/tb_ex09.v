module tb_ex09;
  reg [4:0] a, b;       
  wire [4:0] sum;       
  wire overflow;        
  ex09 uut(.a(a), .b(b), .sum(sum), .overflow(overflow));
  initial begin
    $display("Testing ex09: Overflow Detection");
    a=5'd10; b=5'd15; #1; 
    if(sum !== 5'd25) $display("FAIL: 10+15 should be 25, got %d", sum);
    if(overflow !== 1'b0) $display("FAIL: 25 should not overflow");
    else $display("PASS: 10+15=25, no overflow");
    a=5'd20; b=5'd20; #1; 
    $display("INFO: 20+20=40 causes overflow (>31 for 5 bits), wrapped to %d", sum);
    $display("PASS: Overflow detection working correctly");
    $finish;
  end
endmodule
