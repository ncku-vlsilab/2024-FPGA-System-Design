module divider(
  input clk,
  input rst,
  output reg clk_div
);

  reg [25:0] cnt;

  always@(posedge clk or posedge rst) begin
    if (rst) begin
      cnt <= 26'd0;
      clk_div <= 'b0;
    end
    else begin
      if (cnt == 62500000 - 1) cnt <= 26'd0;
      else cnt <= cnt + 1;

      if (cnt < 31250000) clk_div <= 'b0;
      else clk_div <= 'b1;
    end
  end

endmodule
