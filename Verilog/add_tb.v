module testbench;

  // Inputs
  reg [3:0] A, B;
  reg M;

  // Outputs
  wire [4:0] result;

  // Instantiate the module to be tested
  adder_subtractor uut (
    .A(A),
    .B(B),
    .M(M),
    .result(result)
  );

  initial begin
    // Initialize inputs
    A = 4'b1101; // Example values, you can change these
    B = 4'b0010;
    M = 1'b0; // Set to 1 for subtraction, 0 for addition
        #10;

    // Display initial inputs
    $display("A = %b, B = %b, M = %b Result = %b", A, B, M, result);

    // Apply a delay
    #10;

    // Change inputs for testing different scenarios
    A = 4'b0000;
    B = 4'b1000;
    M = 1'b0; // Set to 1 for subtraction, 0 for addition
    #1;

    // Display new inputs
    $display("A = %b, B = %b, M = %b Result = %b", A, B, M, result);

    // Apply a delay
    #10;

    // Terminate simulation
    $finish;
  end

endmodule
