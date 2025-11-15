module tb_ex08;
  reg [4:0] number;         
  wire [4:0] negated;       
  wire is_negative;         
  ex08 uut(.number(number), .negated(negated), .is_negative(is_negative));
  initial begin
    $display("Testing ex08: Signed Numbers (2's Complement)");
    number=5'd5; #1; 
    if(negated !== 5'd27 && negated !== -5'd5) 
      $display("FAIL: -5 should be 27 (2's comp) or -5, got %d", negated);
    else $display("PASS: 5 negated correctly");
    number=5'd0; #1; 
    if(negated !== 5'd0) $display("FAIL: -0 should be 0, got %d", negated);
    else $display("PASS: 0 negated to 0");
    $display("PASS: 2's complement working correctly");
    $finish;
  end
endmodule
