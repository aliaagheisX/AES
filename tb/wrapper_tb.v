module wrapper_tb ();
    reg clk,reset,enable;
    wire led3,led1,led2;
    initial begin
        clk = 0;
        reset = 0;
        enable = 0;
        #2 reset = 1;
        #4 reset = 0;
        #5 enable = 1;
        #7 enable = 0;
    end
    always #5 clk = ~clk;
    wrapper wp(clk,led1, led2, led3,reset,enable);

endmodule
