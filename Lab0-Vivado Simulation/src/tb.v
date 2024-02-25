module tb ();
    //Inputs
    reg clk;
    reg rst;
    reg [7:0] a;
    reg [7:0] b;
    //Output
    wire [7:0] c;
    
    adder adder_i   (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .c(c)
    );
    
    initial begin
        //Initialize
        clk = 0;
        rst = 0;
        a = 0;
        b = 0;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #100;
        a = 4;
        b = 7;
        #10;
        a = 8;
        b = 17;
    end
    
    always #5 clk = ~clk ;
endmodule 