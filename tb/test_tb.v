module test_tb ();
reg clk;
reg [7:0] i;
wire [7:0] out;

mutli i1(clk, 8'd1, i, out);
initial begin
    clk = 0;
    i = 1;
    $display("at i = %d out = %h", i, out);

end
    
always #5 begin
    clk = ~clk;
    i = i + 1;
end

always @(out) $display("at i = %d out = %h", i, out);
endmodule