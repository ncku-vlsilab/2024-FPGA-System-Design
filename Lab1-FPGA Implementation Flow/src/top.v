module top(
    input   clk   ,
    input   rst   ,
    input   [1:0] sw  ,
    output  [3:0] led
    );
    
    wire    clk_div ;
    
    LED led_0(
    .clk    (clk_div),
    .rst    (rst),
    .sw     (sw),
    .led    (led)
    );
    
    divider div_0(
    .clk    (clk),
    .rst    (rst),
    .clk_div    (clk_div)
    );
    
endmodule
