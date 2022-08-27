module enchiper #(parameter Nk = 4)(
    input clk,
    input reset,
	 input enable,
	 output reg decReset=0,
    input[127:0] load,
    input[Nk*32 - 1: 0] key,
    output reg [127:0]  out
    
);

localparam Nr = Nk+6;
localparam key_sch_len = (4*Nr+4) * 32 - 1;
reg [127:0] register;
wire [127:0] out_state;
wire [key_sch_len :0] k_sch;


reg[127:0] in;
Key_Expansion #(.Nk(Nk)) keys (key, k_sch); 



reg [3:0] round_counter = 0;
    
//for(i = 1;i < Nr;i=i+1)  begin : generate_block
round r (register, k_sch[key_sch_len - 128*round_counter -: 128], out_state); //4clk p
//end


//delay = Nr * 3

//last round
wire [127:0] sb,sr;
sub_bytes p2 (.in(register),.out(sb));
Shift_Rows p3 (.in(sb),.out(sr));


always @(posedge clk or posedge reset or posedge enable) begin
	if(reset) begin
	 round_counter=0;
	 in=0;
	 decReset=1;
	 end
	 else if(enable) begin
         in<= load;
         round_counter = 0;
         decReset=1;
     end
else  begin
	 
    if(round_counter == 0) begin
        register <= in ^ k_sch[key_sch_len -: 128];
        round_counter <= 1;
    end
    else if(round_counter < Nr) begin
        register <= out_state;
        round_counter <= round_counter + 1;
    end 
    else begin
        out <= sr ^ k_sch[127-:128];
        decReset=0;
    end
end
    //$display("state[0]=%h in=%h k_sch=%h", state[0], in, k_sch[key_sch_len -: 128]);
end

endmodule