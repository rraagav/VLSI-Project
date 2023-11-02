module enable(M, A, B, Aout, Bout);
input M;
input [3:0] A, B;
output [3:0] Aout, Bout;

and a1(Aout[0], A[0], M);
and a2(Aout[1], A[1], M);
and a3(Aout[2], A[2], M);
and a4(Aout[3], A[3], M);

and b1(Bout[0], B[0], M);
and b2(Bout[1], B[1], M);
and b3(Bout[2], B[2], M);
and b4(Bout[3], B[3], M);

endmodule
