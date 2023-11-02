module andckt(A, B, answer);

input [3:0] A, B;
output [3:0] answer;

and a1(answer[0], A[0], B[0]);
and a2(answer[1], A[1], B[1]);
and a3(answer[2], A[2], B[2]);
and a4(answer[3], A[3], B[3]);

endmodule