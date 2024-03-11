/////////////////////////////////////////////////////////////////////
//  File Name : LED.v                                 //
//                                                                //
//  Purpose : use switches to control LEDs  //
//                                                                //
//  Creation Date : 2019/07/18                   //
//                                                               //
//  Last Modified : 2019/07/18                  //
//                                                              //
//  Auther : Wei-Cheng Chen                   //
/////////////////////////////////////////////////////////////////

module LED(
    input   clk ,
    input   rst ,
    input   [1:0] sw    ,
    output  reg     [3:0] led
    );
    
    always@(posedge clk or posedge rst)begin
        if(rst) begin
            led <= 4'b0000;
        end
        else begin
            case(sw)
                2'b00:  led <= 4'b0000;
                2'b01:  begin
                    if(led == 0)    led <= 4'b0001;
                    else led <= led << 1;
                end
                2'b10:  begin
                    if(led == 0)    led <= 4'b1000;
                    else led <= led >> 1;
                end
                2'b11:  led <= 4'b1111;
            endcase
        end
    end 
    
endmodule
