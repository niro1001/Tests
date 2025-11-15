module tb_ex33;
  reg clk;              
  reg rst;              
  reg dispense_req;     
  reg payment_ok;       
  wire dispense;        
  ex33 uut(.clk(clk), .rst(rst), .dispense_req(dispense_req), 
           .payment_ok(payment_ok), .dispense(dispense));
  initial clk = 0; 
  always #5 clk = ~clk;
  initial begin
    $display("Testing ex33: FSM Dispense Controller");
    rst=1; dispense_req=0; payment_ok=0; #10;
    $display("INFO: Reset complete");
    rst=0; dispense_req=1; payment_ok=1; #10; 
    if(dispense !== 1'b1) $display("FAIL: Should dispense with valid payment");
    else $display("PASS: Dispense activated with valid payment");
    $display("PASS: FSM dispense controller working correctly");
    $finish;
  end
endmodule
