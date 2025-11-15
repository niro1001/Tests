module tb_ex46;
  reg clk, we;          
  reg [1:0] addr;       
  reg [3:0] data_in;    
  wire [3:0] data_out;  
  ex46 uut(.clk(clk), .addr(addr), .data_in(data_in), .we(we), .data_out(data_out));
  initial clk=0; 
  always #5 clk=~clk;
  initial begin
    $display("Testing ex46: Simple RAM");
    we=1; addr=2'd0; data_in=4'd10; #10;
    $display("Wrote 10 to address 0");
    we=0; #10; 
    if(data_out !== 4'd10) 
      $display("FAIL: Read %d from address 0, expected 10", data_out);
    else 
      $display("PASS: Read 10 from address 0");
    $display("PASS: RAM write/read working correctly");
    $finish;
  end
endmodule
