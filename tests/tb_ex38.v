module tb_ex38;
  reg [3:0] a, b;       
  reg cin;              
  wire [3:0] sum;       
  wire cout;            
  ex38 uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  initial begin
    $display("Testing ex38: 4-bit Ripple Carry Adder");
    a=4'd5; b=4'd3; cin=0; #1; 
    if(sum !== 4'd8) $display("FAIL: 5+3 should be 8, got %d", sum);
    else $display("PASS: 5+3=8 (no overflow)");
    a=4'd15; b=4'd1; cin=0; #1; 
    if(sum !== 4'd0 || !cout) 
      $display("FAIL: 15+1 should overflow to 0 with cout=1, got sum=%d, cout=%b", sum, cout);
    else 
      $display("PASS: 15+1=16 overflows to 0, cout=1");
    $display("PASS: 4-bit ripple carry adder working correctly");
    $finish;
  end
endmodule
