module top(output R_out,
           output G_out,
           output B_out,
           input [1:0] sw,
           input rst,
           input clk);

//----------Variables----------//
wire [7:0] R_time_out;
wire [7:0] G_time_out;
wire [7:0] B_time_out;

//----------Module instances----------//
PWM_Decoder_0 PWM_Decoder0(.sw(sw), .R_time_out(R_time_out), .G_time_out(G_time_out), .B_time_out(B_time_out));
RGB_LED_0 RGB_LED_0_ins(.clk(clk), .rst(rst), .R_time_in(R_time_out), .G_time_in(G_time_out), .B_time_in(B_time_out),
              .R_out(R_out), .G_out(G_out), .B_out(B_out));
 endmodule