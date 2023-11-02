module fulladder(sum, carry, A, B, C);
input A, B, C;
output sum, carry;
wire sum_temp, carry1, carry2;

halfadder h1(sum_temp, carry1, A, B);
halfadder h2(sum, carry2, C, sum_temp);

or o1(carry, carry1, carry2);

endmodule