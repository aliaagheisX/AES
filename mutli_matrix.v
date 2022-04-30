module multi_matrix (
    clk,data_in,data_out
);
    
input clk;
input [31:0] data_in;
output reg [31:0] data_out;
wire [7:0] out_temp_1,out_temp_2,out_temp_3,out_temp_4,
out_temp_21,out_temp_22,out_temp_23,out_temp_24;

mutli m11(clk, 8'h02, data_in[31-:8], out_temp_1);
mutli m22(clk, 8'h02, data_in[23-:8], out_temp_2);
mutli m33(clk, 8'h02, data_in[15-:8], out_temp_3);
mutli m44(clk, 8'h02, data_in[7-:8], out_temp_4);

assign out_temp_21 = out_temp_2 ^ data_in[23-:8];
assign out_temp_22 = out_temp_3 ^ data_in[15-:8];
assign out_temp_23 = out_temp_4 ^ data_in[7-:8];
assign out_temp_24 = out_temp_1 ^ data_in[31-:8];

always @ (posedge clk) begin
 data_out[31-:8] = out_temp_1 ^ out_temp_21 ^ data_in[15-:8] ^ data_in[7-:8];


 data_out[23-:8] = data_in[31-:8] ^ out_temp_2 ^ out_temp_22 ^ data_in[7-:8];

 data_out[15-:8] = data_in[31-:8] ^ data_in[23-:8] ^ out_temp_3 ^ out_temp_23;

 data_out[7-:8] = out_temp_24 ^ data_in[23-:8] ^ data_in[15-:8] ^ out_temp_4;
end
endmodule