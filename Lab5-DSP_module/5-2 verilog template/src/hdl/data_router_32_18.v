`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/03 15:41:41
// Design Name: 
// Module Name: data_router_32_18
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_router_32_18(
    input [31:0] d_in,
    output [17:0] d_out
    );
	
	assign d_out = d_in[17:0];
endmodule
