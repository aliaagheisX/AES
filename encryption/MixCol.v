module MixCol 
( input[127:0] ip,
 output[127:0] op
);

mx mod1(.in(ip[127:96]),.out(op[127:96]));
mx mod2(.in(ip[95:64]),.out(op[95:64]));
mx mod3(.in(ip[63:32]),.out(op[63:32]));
mx mod4(.in(ip[31:0]),.out(op[31:0]));

endmodule 