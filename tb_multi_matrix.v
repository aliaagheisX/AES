module tb_multimix ();


reg [31:0] c ;//= 128'hd4_bf_5d_30_e0_b4_52_ae_b8_41_11_f1_1e_27_98_e5;
reg clk;
wire [31:0] out;

initial begin
    c = 0;
    clk = 0;

    #5 c = 32'hd4_bf_5d_30;
    #5 c = 32'he0_b4_52_ae;
    #5 c = 32'hb8_41_11_f1;
    #5 c = 32'h1e_27_98_e5;
    #5 $finish;
end
always #2 clk = ~clk;

multi_matrix m(clk, c, out);


endmodule