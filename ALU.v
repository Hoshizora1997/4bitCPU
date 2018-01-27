module ALU(
	input [3:0]IN_A,
	input [3:0]IN_B,
	output [3:0]OUT,
	output C
);
	
	wire [4:0]SUM;

	assign SUM = IN_A + IN_B;
	
	assign OUT = SUM[3:0];
	assign C = SUM[4];
	
endmodule
