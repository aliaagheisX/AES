module key_expansion_tb ();
    //test 192
    reg clk;
    wire [127:0] out, out_inv;
    initial begin
        clk = 0;
        #5 clk = 1;
    end
   
    always #5 clk = ~clk;
    enchiper #(.Nk(4)) en(clk,128'h00112233445566778899aabbccddeeff,128'h000102030405060708090a0b0c0d0e0f,out);
    dechiper #(.Nk(4)) de(clk,out,128'h000102030405060708090a0b0c0d0e0f,out_inv);

endmodule