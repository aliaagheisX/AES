module Inv_mx (
    data_in,data_out
);
    
input [31:0] data_in;
output wire [31:0] data_out;
wire [7:0] e0,e1,e2,e3, b0,b1,b2,b3, d0,d1,d2,d3, g0,g1,g2,g3;

mutli me0(8'h0e, data_in[31-:8], e0);
mutli me1(8'h0e, data_in[23-:8], e1);
mutli me2(8'h0e, data_in[15-:8], e2);
mutli me3(8'h0e, data_in[7-:8], e3);


mutli mb0( 8'h0b, data_in[31-:8], b0);
mutli mb1( 8'h0b, data_in[23-:8], b1);
mutli mb2( 8'h0b, data_in[15-:8], b2);
mutli mb3( 8'h0b, data_in[7-:8], b3);

mutli md0( 8'h0d, data_in[31-:8], d0);
mutli md1( 8'h0d, data_in[23-:8], d1);
mutli md2( 8'h0d, data_in[15-:8], d2);
mutli md3( 8'h0d, data_in[7-:8], d3);

mutli mg0( 8'h09, data_in[31-:8], g0);
mutli mg1( 8'h09, data_in[23-:8], g1);
mutli mg2( 8'h09, data_in[15-:8], g2);
mutli mg3( 8'h09, data_in[7-:8], g3);



assign data_out[31-:8] = e0 ^ b1 ^ d2 ^ g3;
assign data_out[23-:8] = g0 ^ e1 ^ b2 ^ d3;
assign data_out[15-:8] = d0 ^ g1 ^ e2 ^ b3;
assign data_out[7-:8]  = b0 ^ d1 ^ g2 ^ e3;

endmodule