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
comparator c1(A, B, D2, eq, less, great);

enable e3(D3, A, B, Aout_andder, Bout_andder);
andckt andder(A, B, answer);
endmodule