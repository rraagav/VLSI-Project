module testbench_and;

  // Declare signals for testbench
  reg [3:0] A, B;
  wire [3:0] result;

  // Instantiate the AND module
  andckt uut (
    .A(A),
    .B(B),
    .result(result)
  );

  // Initialize simulation
  initial begin
    $dumpfile("and_test.vcd");
    $dumpvars(0, testbench_and);

    // Test case 1: A = 4'b1101, B = 4'b1010
    A = 4'b1101;
    B = 4'b1010;
    #10; // Wait for some time to let signals settle
    if (result !== 4'b1000)
      $display("Test case 1 failed");
    else
      $display("Test case 1 passed");

    // Test case 2: A = 4'b0110, B = 4'b1011
    A = 4'b0110;
    B = 4'b1011;
    #10; // Wait for some time to let signals settle
    if (result !== 4'b0010)
      $display("Test case 2 failed");
    else
      $display("Test case 2 passed");

    // Test case 3: A = 4'b1100, B = 4'b1100
    A = 4'b1101;
    B = 4'b1100;
    #10; // Wait for some time to let signals settle
    if (result !== 4'b1100)
      $display("Test case 3 failed");
    else
      $display("Test case 3 passed");

    // End simulation
    $finish;
  end

endmodule
