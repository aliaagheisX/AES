module tb_mixColumns();

reg [127:0] state = 128'hd4_bf_5d_30_e0_b4_52_ae_b8_41_11_f1_1e_27_98_e5;
reg clk;
wire [127:0] out;


initial begin
    clk = 0;
end

always #5 clk = ~clk;

mixColumns m(clk,state,out);


endmodule
/* integer i,j;

initial begin
    for(i = 0;i < 4;i = i+1) begin
        for(j = 0;j < 4;j = j+1) begin
            state[j][i] = msg[127-8*j-32*i-:7];
        end
    end
end
    MixColumns m(state1, out);
endmodule

state[0][0] 127:120
state[1][0] 119:112
state[2][0] 111:104
state[3][0] 103:96

state[0][1] 95:88
state[1][1] 87:80

 */ /* j=r i = c */