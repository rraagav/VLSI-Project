module testbench;

  // Inputs for the 'final' module
  reg A0, A1;
  reg [3:0] A, B;

  // Outputs for the 'final' module
  wire [4:0] result;
  wire [3:0] answer;
  wire eq, less, great;

  // Instantiate the 'final' module
  final uut (
    .A0(A0),
    .A1(A1),
    .A(A),
    .B(B),
    .result(result),
    .answer(answer),
    .eq(eq),
    .less(less),
    .great(great)
  );

  // Initialize the inputs
  initial begin
    A0 = 0;
    A1 = 0;
    A = 4'b0000;
    B = 4'b0000;

    // Apply test cases
    // Test Case 1
    A0 = 1;
    A1 = 1;
    A = 4'b1110;
    B = 4'b0011;
    #10;  // Add a delay
    $display("A0 = %b, A1 = %b, A = %b, B = %b", A0, A1, A, B);
    $display("Result: %b", result);
    $display("Answer: %b", answer);
    $display("Equal: %b, Less: %b, Greater: %b", eq, less, great);
    
    // Test Case 2
    A0 = 1;
    A1 = 0;
    A = 4'b1010;
    B = 4'b0101;
    #10;  // Add a delay
    $display("A0 = %b, A1 = %b, A = %b, B = %b", A0, A1, A, B);
    $display("Result: %b", result);
    $display("Answer: %b", answer);
    $display("Equal: %b, Less: %b, Greater: %b", eq, less, great);
    
    A0 = 1;
    A1 = 0;
    A = 4'b1010;
    B = 4'b1010;
    #10;  // Add a delay
    $display("A0 = %b, A1 = %b, A = %b, B = %b", A0, A1, A, B);
    $display("Result: %b", result);
    $display("Answer: %b", answer);
    $display("Equal: %b, Less: %b, Greater: %b", eq, less, great);

    // Test Case 3
    A0 = 0;
    A1 = 1;
    A = 4'b1100;
    B = 4'b0011;
    #10;  // Add a delay
    $display("A0 = %b, A1 = %b, A = %b, B = %b", A0, A1, A, B);
    $display("Result: %b", result);
    $display("Answer: %b", answer);
    $display("Equal: %b, Less: %b, Greater: %b", eq, less, great);

    // Add more test cases as needed

    // Terminate the simulation
    $finish;

  end

endmodule