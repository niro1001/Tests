module tb_ex19;
  reg [3:0] D;      
  reg [1:0] sel;    
  wire Y;           
  ex19 uut(.D(D), .sel(sel), .Y(Y));
  initial begin
    $display("Testing ex19: 4:1 Multiplexer");
    D = 4'b0101;
    sel = 2'b00; #1;
    if(Y !== 1) $display("FAIL: sel=00 should select D[0]=1, got Y=%b", Y);
    else $display("PASS: sel=00 → Y=D[0]=1");
    sel = 2'b01; #1;
    if(Y !== 0) $display("FAIL: sel=01 should select D[1]=0, got Y=%b", Y);
    else $display("PASS: sel=01 → Y=D[1]=0");
    sel = 2'b10; #1;
    if(Y !== 1) $display("FAIL: sel=10 should select D[2]=1, got Y=%b", Y);
    else $display("PASS: sel=10 → Y=D[2]=1");
    sel = 2'b11; #1;
    if(Y !== 0) $display("FAIL: sel=11 should select D[3]=0, got Y=%b", Y);
    else $display("PASS: sel=11 → Y=D[3]=0");
    D = 4'b1010; sel = 2'b00; #1;
    if(Y !== 0) $display("FAIL: With new D, sel=00 should select D[0]=0, got Y=%b", Y);
    else $display("PASS: With D=1010, sel=00 → Y=D[0]=0");
    $display("PASS: 4:1 Multiplexer working correctly");
    $finish;
  end
endmodule
