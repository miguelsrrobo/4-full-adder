module full_adder_4bit 
#(parameter N = 4)
(
	a, 
	b, 
	c_in, 
	sum, 
	carry_out
);
	
	input wire [N-1:0] a; 
	input wire [N-1:0] b;
	input c_in;
	
	output wire [N-1:0] sum; 
	output carry_out;

	wire	s1;
	wire	c0; 
	wire	c1;
	wire	c2;
	
	//PROCESSO
	full_adder	U00( 
		.a(a[0]),
		.b(b[0]),
		.cin(c_in),
		.sum(sum[0]),
		.carry(c0)
	);
	
	full_adder	U01( 
		.a(a[1]),
		.b(b[1]),
		.cin(c0),
		.sum(sum[1]),
		.carry(c1)
	);
	
	full_adder	U10(
		.a(a[2]),
		.b(b[2]),
		.cin(c1),
		.sum(sum[2]),
		.carry(c2)
	);
	
	full_adder	U11(
		.a(a[3]),
		.b(b[3]),
		.cin(c2),
		.sum(sum[3]),
		.carry(carry_out)
	);
	
endmodule
