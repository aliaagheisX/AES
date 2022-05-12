module key_expansion_tb ();
    //test 192
    wire [44*32 - 1:0] out_128;
    Key_Expansion #(.Nk(4)) t_128(128'h2b7e151628aed2a6abf7158809cf4f3c, out_128);

    wire [52*32 -1:0] out_192;
    Key_Expansion #(.Nk(6)) t_192(192'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b, out_192);
    //test 256
    wire [60*32-1 : 0] out_256;
    Key_Expansion #(.Nk(8)) t_256(256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4 , out_256);

endmodule