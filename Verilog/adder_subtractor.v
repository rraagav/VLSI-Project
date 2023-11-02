module adder_subtractor(A, B, M, result);
input [3:0] A, B;
input M; 
output [4:0] result;

wire c1, c2, c3, c4, b0, b1, b2, b3;

xor x1(b0, B[0], M);
fulladder f1(result[0], c1, A[0], b0, M);

xor x2(b1, B[1], M);
fulladder f2(result[1], c2, A[1], B[1], c1);

xor x3(b2, B[2], M);
fulladder f3(result[2], c3, A[2], B[2], c2);

xor x4(b3, B[3], M);
fulladder f4(result[3], result[4], A[3], B[3], c3);

endmodule
