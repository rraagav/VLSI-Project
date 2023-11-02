module halfadder(sum, carry, A, B);
input A, B;
output sum, carry;

xor x1(sum, A, B);
and a1(carry, A, B);

endmodule