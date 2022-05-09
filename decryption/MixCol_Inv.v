module InvMixCol (clk,data_in,data_out);

input clk;
input [127:0] data_in;
output reg [127:0] data_out;

wire [127:0] temp;

Inv_mx m0(clk,data_in[127-:32],temp[127-:32]);
Inv_mx m1(clk,data_in[95-:32],temp[95-:32]);
Inv_mx m2(clk,data_in[63-:32],temp[63-:32]);
Inv_mx m3(clk,data_in[31-:32],temp[31-:32]);

always @(posedge clk) begin
    data_out <= temp;
end


endmodule