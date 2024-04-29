(* keep_hierarchy = "yes" *)module	memory_ctrl(
	input					clk,
	input					rst_n,
	input 				cmd_valid,
	input 	[7:0]	cmd,
	input 	[7:0]	data_in,
	input 	[7:0]	address,
	output 				cmd_done,
	output 	[7:0]	data_out
);

wire 	[1:0]	next_state;
wire    [1:0]   next_clk_4;
wire            clk_4_f;
wire				write_enable;
wire	[7:0]	data_in_to_mem;

reg 	[1:0]	state;		//0 : wait_cmd	1 : read 2 : wrtie_edge 3 : idle
reg     [1:0]   clk_4;

assign			cmd_done = ((state == 2'd0) || (state == 2'd3))? 1'd1 : 1'd0;
assign			next_state = (state == 2'd0)? {cmd_valid & cmd[1], cmd_valid & cmd[0]} :
												 (state == 2'd1)? 2'd3 :
												 (state == 2'd2)? 2'd3 : {cmd_valid, cmd_valid};
assign			write_enable = (state == 2'd2)? 1'd1 : 1'd0;
assign			data_in_to_mem = (state == 2'd2)? data_in : 8'd0;
assign          next_clk_4 = (clk_4 == 2'd3)? 2'd0 : clk_4 + 2'd1;
assign          clk_4_f = clk_4[1];

mem256X8 mem_i(
	.clk(clk),
	.write_enable(write_enable),
	.data_in(data_in_to_mem),
	.address(address),
	.data_out(data_out)
);
always @(negedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		clk_4	<= 2'd0;
	end
	else
	begin
		clk_4	<= next_clk_4;
	end
end

always @(negedge clk_4_f or negedge rst_n)
begin
	if(!rst_n)
	begin
		state	<= 2'd0;
	end
	else
	begin
		state	<= next_state;
	end
end

endmodule
