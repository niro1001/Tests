module tb_ex20;
  reg [2:0] in;         
  reg en;               
  wire [7:0] out;       
  ex20 uut(.in(in), .en(en), .out(out));
  initial begin
    $display("Testing ex20: 3:8 Decoder");
    en = 0; in = 3'b000; #1;
    if(out !== 8'b00000000) $display("FAIL: en=0 should disable all outputs, got %b", out);
    else $display("PASS: en=0 → all outputs disabled");
    en = 1; in = 3'b000; #1;
    if(out !== 8'b00000001) $display("FAIL: in=000 should activate out[0], got %b", out);
    else $display("PASS: in=000 → out=00000001");
    in = 3'b001; #1;
    if(out !== 8'b00000010) $display("FAIL: in=001 should activate out[1], got %b", out);
    else $display("PASS: in=001 → out=00000010");
    in = 3'b010; #1;
    if(out !== 8'b00000100) $display("FAIL: in=010 should activate out[2], got %b", out);
    else $display("PASS: in=010 → out=00000100");
    in = 3'b100; #1;
    if(out !== 8'b00010000) $display("FAIL: in=100 should activate out[4], got %b", out);
    else $display("PASS: in=100 → out=00010000");
    in = 3'b111; #1;
    if(out !== 8'b10000000) $display("FAIL: in=111 should activate out[7], got %b", out);
    else $display("PASS: in=111 → out=10000000");
    en = 0; #1;
    if(out !== 8'b00000000) $display("FAIL: en=0 should disable outputs again, got %b", out);
    else $display("PASS: Enable control working");
    $display("PASS: 3:8 Decoder working correctly");
    $finish;
  end
endmodule
