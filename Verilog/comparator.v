module comparator(A, B, equal, lesser, greater);
input [3:0]A;
input [3:0] B;
output wire equal, lesser, greater;
output wire equal_temp, lesser_temp, greater_temp;

wire g0, g1, g2, g3, e0, e1, e2, e3, l0, l1, l2, l3;
wire e0_temp, e1_temp, e2_temp, e3_temp;

and a1 (g0, A[0], ~B[0]);
and a2 (g1, A[1], ~B[1]);
and a3 (g2, A[2], ~B[2]);
and a4 (g3, A[3], ~B[3]);

or ogreater(greater_temp, g0, g1, g2, g3);

xor x1(e0_temp, A[0], B[0]);
xor x2(e1_temp, A[1], B[1]);
xor x3(e2_temp, A[2], B[2]);
xor x4(e3_temp, A[3], B[3]);

not n1(e0,e0_temp);
not n2(e1,e1_temp);
not n3(e2,e2_temp);
not n4(e3,e3_temp);

and a5(equal_temp, e0, e1, e2, e3);

and a6(l0, ~A[0], B[0]);
and a7(l1, ~A[1], B[1]);
and a8(l2, ~A[2], B[2]);
and a9(l3, ~A[3], B[3]);

or olesser(lesser_temp, l0, l1, l2, l3);

and(equal, equal_temp, M);
and(lesser, lesser_temp, M);
and(greater, greater_temp, M);

endmodule