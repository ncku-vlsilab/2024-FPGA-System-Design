`timescale 1ns / 1ps



module data_router_48_32(
    input [47:0] d_in,
    output [31:0] d_out
    );
	
	assign d_out = d_in[31:0];
endmodule
