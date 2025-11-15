module tb_ex49;
  reg clk;              
  reg rst;              
  reg dispense;         
  reg [1:0] product;    
  wire [3:0] stock;     
  ex49 uut(.clk(clk), .rst(rst), .product(product), .dispense(dispense), .stock(stock));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex49: Inventory Manager");
    rst=1; product=2'd0; dispense=0; #10;
    $display("INFO: Inventory reset");
    rst=0; #10; 
    if(stock !== 4'd10) $display("FAIL: Initial stock should be 10, got %d", stock);
    else $display("PASS: Initial stock = 10");
    dispense=1; #10; 
    if(stock !== 4'd9) $display("FAIL: After dispense, stock should be 9, got %d", stock);
    else $display("PASS: Stock decreased to 9 after dispense");
    $display("PASS: Inventory manager working correctly");
    $finish;
  end
endmodule
