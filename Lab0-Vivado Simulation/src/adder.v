module adder(
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    output reg  [7:0]   c
    ); 
 
always@(posedge clk or posedge rst)begin
   if(rst)
     c <= 0;
   else
     c <= a + b;
 end
    
endmodule