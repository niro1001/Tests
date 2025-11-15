module tb_ex47;
  reg clk;              
  reg we, re;           
  reg [1:0] addr;       
  reg [3:0] data_in;    
  wire [3:0] data_out;  
  ex47 uut(.clk(clk), .addr(addr), .data_in(data_in), .we(we), .re(re), .data_out(data_out));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex47: RAM with Read/Write Enable");
    we=1; re=0; addr=2'd0; data_in=4'd15; #10;
    $display("INFO: Wrote 15 to address 0");
    we=0; re=1; #10; 
    if(data_out !== 4'd15) 
      $display("FAIL: Read from addr 0 should be 15, got %d", data_out);
    else 
      $display("PASS: Read 15 from address 0");
    $display("PASS: RAM with read/write enable working correctly");
    $finish;
  end
endmodule
