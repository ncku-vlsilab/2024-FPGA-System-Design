module	RGB_LED(
	input			clk,
	input			rst,
	input	[7:0]	R_time_in,
	input	[7:0]	G_time_in,
	input	[7:0]	B_time_in,
	output			R_out,
	output			G_out,
	output			B_out
);

wire	[7:0]	next_counter_256;

reg		[7:0]	counter_256;

assign			next_counter_256 = (counter_256 == 8'd255)? 8'd0 : counter_256 + 8'd1;

assign			R_out = (counter_256 < R_time_in)? 1'd1 : 1'd0;
assign			G_out = (counter_256 < G_time_in)? 1'd1 : 1'd0;
assign			B_out = (counter_256 < B_time_in)? 1'd1 : 1'd0;

always @(posedge clk or posedge rst)
begin
	if(rst)
	begin
		counter_256	<= 8'd0;
	end
	else
	begin
		counter_256	<= next_counter_256;
	end
end

endmodule