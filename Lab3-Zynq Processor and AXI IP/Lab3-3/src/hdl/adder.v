module adder (
  input [2:0] A,
  input [2:0] B,
  output wire [3:0] S
);
  
  assign S = {1'b0, A} + {1'b0, B};

endmodule
