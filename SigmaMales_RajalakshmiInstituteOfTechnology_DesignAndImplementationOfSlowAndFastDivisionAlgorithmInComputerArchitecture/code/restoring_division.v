module restoring_division (
  input wire clk,
  input wire [7:0] dividend,
  input wire [7:0] divisor,
  output reg [7:0] quotient,
  output reg [7:0] remainder
);
  reg [7:0] dividend_reg;
  reg [7:0] divisor_reg;
  reg [7:0] quotient_reg;
  reg [7:0] remainder_reg;
  reg [3:0] count;

  always @(posedge clk) begin
    dividend_reg <= dividend;
    divisor_reg <= divisor;
    if (count < 8) begin
      remainder_reg <= remainder_reg - divisor_reg;
      count <= count + 1;
      if (remainder_reg < 0) begin
        remainder_reg <= remainder_reg + divisor_reg;
        quotient_reg[count] <= 1'b0;
      end else begin
        quotient_reg[count] <= 1'b1;
      end
    end
  end

  always @(dividend, clk) begin
    if (count == 0) begin
      quotient <= quotient_reg;
      remainder <= dividend_reg;
    end
  end
endmodule