module tb_multimix ();


reg [31:0] c ;//= 128'hd4_bf_5d_30_e0_b4_52_ae_b8_41_11_f1_1e_27_98_e5;
reg clk;
wire [31:0] out;

initial begin
    c = 0;
    clk = 0;

    #5 c = 32'h046681e5;
    #5 c = 32'he0_cb_19_9a;
    #5 c = 32'h48f8d37a;
    #5 c = 32'h2806264c;
    #5 $finish;
end
always #2 clk = ~clk;

Inv_mx m(clk, c, out);


endmodule