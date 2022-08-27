module dechiper #(parameter Nk = 4)(
    input clk,
	 input decReset,
    input[127:0] in,
    input[Nk*32 - 1: 0] key,
    output reg [127:0]  out
);

localparam Nr = Nk+6;
localparam key_sch_len = (4*Nr+4) * 32 - 1;
reg [127:0] register;
wire [127:0] out_state;
wire [key_sch_len :0] k_sch;

Key_Expansion #(.Nk(Nk)) keys (key, k_sch); 



reg [3:0] round_counter = 0;
//reg [2:0] pulses_counter = 1;
    
//for(i = 1;i < Nr;i=i+1)  begin : generate_block 
Inv_round r (register,k_sch[key_sch_len - 128*(Nr - round_counter) -: 128], out_state); //4clk p
//end


//delay = Nr * 3

//last round
wire [127:0] sb,sr;
INV_Shift_Rows p2 (.in(register),.out(sb));
sub_bytes_inv p3 (.in(sb),.out(sr));


always @(posedge clk,posedge decReset) begin

    if(decReset) begin
	  round_counter=0;
	  out=0;
	  end
	  else
	  begin
    if(round_counter == 0) begin
        register <= in ^ k_sch[127 -: 128];
        round_counter <= 1;
    end
    else if(round_counter < Nr) begin
        register <= out_state;
        round_counter <= round_counter + 1;
    end 
    else begin
        out <= sr ^ k_sch[key_sch_len-:128];
    end
	 end
 end
    //$display("state[0]=%h in=%h k_sch=%h", state[0], in, k_sch[key_sch_len -: 128]);




endmodule

