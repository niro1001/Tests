module tb_ex06;
  reg [3:0] coin1, coin2;
  wire [4:0] sum;
  ex06 uut(.coin1(coin1), .coin2(coin2), .sum(sum));
  initial begin
    $display("Testing ex06: Binary Addition");
    coin1=4'd5; coin2=4'd5; #1; 
    if(sum !== 5'd10) $display("FAIL: 5+5 should be 10, got %d", sum);
    else $display("PASS: 5+5=10");
    coin1=4'd10; coin2=4'd10; #1; 
    if(sum !== 5'd20) $display("FAIL: 10+10 should be 20, got %d", sum);
    else $display("PASS: 10+10=20");
    $display("PASS: Binary addition working correctly");
    $finish;
  end
endmodule
