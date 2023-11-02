//Half Adder
module halfadder(sum, carry, A, B);
input A, B;
output sum, carry;

xor x1(sum, A, B);
and a1(carry, A, B);
endmodule

// Full Adder
module fulladder(sum, carry, A, B, C);
input A, B, C;
output sum, carry;
wire sum_temp, carry1, carry2;

halfadder h1(sum_temp, carry1, A, B);
halfadder h2(sum, carry2, C, sum_temp);

or o1(carry, carry1, carry2);
endmodule

//Adder Subtractor
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

//AND
module andckt(A, B, result);

input [3:0] A, B;
output [3:0] result;

and a1(result[0], A[0], B[0]);
and a2(result[1], A[1], B[1]);
and a3(result[2], A[2], B[2]);
and a4(result[3], A[3], B[3]);
endmodule

//Compare
module comparator(A, B, equal, lesser, greater);
input [3:0]A;
input [3:0] B;
output wire equal, lesser, greater;
wire g0, g1, g2, g3, e0, e1, e2, e3, l0, l1, l2, l3;
wire e0_temp, e1_temp, e2_temp, e3_temp;

and a1 (g0, A[0], ~B[0]);
and a2 (g1, A[1], ~B[1]);
and a3 (g2, A[2], ~B[2]);
and a4 (g3, A[3], ~B[3]);

or ogreater(greater, g0, g1, g2, g3);

xor x1(e0_temp, A[0], B[0]);
xor x2(e1_temp, A[1], B[1]);
xor x3(e2_temp, A[2], B[2]);
xor x4(e3_temp, A[3], B[3]);

not n1(e0,e0_temp);
not n2(e1,e1_temp);
not n3(e2,e2_temp);
not n4(e3,e3_temp);

and a5(equal, e0, e1, e2, e3);

and a6(l0, ~A[0], B[0]);
and a7(l1, ~A[1], B[1]);
and a8(l2, ~A[2], B[2]);
and a9(l3, ~A[3], B[3]);

or olesser(lesser, l0, l1, l2, l3);
endmodule

//ALU
module alu(A0, A1, D0, D1, D2, D3);
input A0, A1;
output D0, D1, D2, D3;

wire A0comp, A1comp;

not n1(A0comp, A0);
not n2(A1comp, A1);

and a1(D0, A0comp, A1comp);
and a2(D1, A0, A1comp);
and a3(D2, A0comp, A1);
and a4(D3, A0, A1);
endmodule

//ENABLE for the inputs
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

//Final Implementation
module final(input A0, input A1, input [3:0] A, input [3:0] B, output [4:0] result,
output [3:0] answer, output eq, output less, output great);

wire D0, D1, D2, D3;
wire enable_addsub;
wire [3:0] Aout_addsub, Bout_addsub;
wire [3:0] Aout_comp, Bout_comp;
wire [3:0] Aout_andder, Bout_andder;

alu alu1(A0, A1, D0, D1, D2, D3);

or o1(enable_addsub, D0, D1);
enable e1(enable_addsub, A, B, Aout_addsub, Bout_addsub);
adder_subtractor as1(A, B, enable_addsub, result);

enable e2(D2, A, B, Aout_comp, Bout_comp);
comparator c1(A, B, eq, less, great);

enable e3(D3, A, B, Aout_andder, Bout_andder);
andckt andder(A, B, answer);
endmodule