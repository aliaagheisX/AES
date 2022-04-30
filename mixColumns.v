module mixColumns (clk,data_in,data_out);

input clk;
input [127:0] data_in;
output [127:0] data_out;

wire [31:0] out0,out1,out2,out3;

multi_matrix m0(clk,data_in[127-:32],out0);
multi_matrix m1(clk,data_in[95-:32],out1);
multi_matrix m2(clk,data_in[63-:32],out2);
multi_matrix m3(clk,data_in[31-:32],out3);

assign data_out = {out0, out1, out2,out3};


endmodule