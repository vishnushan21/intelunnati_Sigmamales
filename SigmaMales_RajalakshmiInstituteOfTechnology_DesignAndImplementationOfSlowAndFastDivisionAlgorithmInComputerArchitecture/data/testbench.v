module restoring_division_tb;
  reg [7:0] dividend;
  reg [7:0] divisor;
  wire [7:0] quotient;
  wire [7:0] remainder;
  reg clk;

  // Instantiate the DUT
  restoring_division dut (
    .clk(clk),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );

  // Clock generation
  always #5 clk = ~clk; // Toggle the clock every 5 time units

  // Test case
  initial begin
    clk = 0;
    dividend = 50;
    divisor = 7;

    #10; // Wait for some time to stabilize

    $display("Dividend = %d, Divisor = %d", dividend, divisor);
    $display("Quotient = %d, Remainder = %d", quotient, remainder);
    
    #50; // Wait for some additional time

    $finish; // End the simulation
  end
endmodule
