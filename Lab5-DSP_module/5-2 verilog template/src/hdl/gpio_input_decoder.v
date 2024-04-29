module gpio_input_decoder(
	input [31:0] inst,
	output [9:0] bram_addr,
	output bram_en,
	output [4:0] dsp_inmode,
	output [3:0] dsp_alumode,
	output [6:0] dsp_opmode
);

	assign bram_addr = inst[9:0];
	assign bram_en = inst[10];
	assign dsp_inmode = inst[15:11];
	assign dsp_alumode = inst[19:16];
	assign dsp_opmode = inst[26:20];

endmodule