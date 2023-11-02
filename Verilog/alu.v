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