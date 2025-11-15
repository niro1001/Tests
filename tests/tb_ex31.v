module tb_ex31;
  reg clk;              
  reg rst;              
  reg coin_valid;       
  reg [3:0] coin;       
  wire [4:0] total;     
  ex31 uut(.clk(clk), .rst(rst), .coin_valid(coin_valid), .coin(coin), .total(total));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex31: FSM-Controlled Accumulator");
    rst=1; coin_valid=0; coin=4'd0; #10;
    $display("PASS: Reset complete");
    rst=0; coin_valid=1; coin=4'd5; #10; 
    if(total !== 5'd5) $display("FAIL: After 5 NIS, expected 5, got %d", total);
    else $display("PASS: Accumulated 5 NIS, total=5");
    coin=4'd10; #10; 
    if(total !== 5'd15) $display("FAIL: After 10 NIS, expected 15, got %d", total);
    else $display("PASS: Accumulated 10 NIS, total=15");
    $display("PASS: FSM-controlled accumulator working correctly");
    $finish;
  end
endmodule
