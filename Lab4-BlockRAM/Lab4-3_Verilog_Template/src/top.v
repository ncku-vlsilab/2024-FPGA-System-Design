module top(
	input clk,
	input rst,
	output [3:0] led
);
	
	reg [35:0] cnt;
	wire [31:0] shift_out;
    
	assign led = shift_out[3:0];

	shift inst_shift(
		.clk(clk),
		.en_A(rst),
		.addr(cnt[35:24]),
		.data_out(shift_out)
	);
	
	always@(posedge clk)begin
		if(rst)
			cnt <= 36'd0;
		else 
			cnt <= cnt + 36'd1;
	end
endmodule