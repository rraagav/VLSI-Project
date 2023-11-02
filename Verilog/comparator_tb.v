module testbench;

  reg [3:0] A;
  reg [3:0] B;
  wire equal, lesser, greater;
  
  comparator uut (
    .A(A),
    .B(B),
    .equal(equal),
    .lesser(lesser),
    .greater(greater)
  );

  initial begin
    $display("Testing Comparator Module");

    A = 4'b0101;  // A = 5
    B = 4'b0010;  // B = 2
    #10;
    $display("A = %b, B = %b, Equal = %b, Lesser = %b, Greater = %b", A, B, equal, lesser, greater);

    A = 4'b1100;  // A = 12
    B = 4'b1010;  // B = 10
    #10;
    $display("A = %b, B = %b, Equal = %b, Lesser = %b, Greater = %b", A, B, equal, lesser, greater);

    A = 4'b0011;  // A = 3
    B = 4'b1100;  // B = 12
    #10;
    $display("A = %b, B = %b, Equal = %b, Lesser = %b, Greater = %b", A, B, equal, lesser, greater);

    $finish;
  end

endmodule
