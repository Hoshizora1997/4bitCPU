module TestMOD(
	input wire [9:0]SW,
	input CLOCK_50,
	input wire [1:0]KEY,
	output wire [9:0]LEDR
);

	Register_4bit(
		CLOCK_50,
		SW[3:0],
		~KEY[0],
		~KEY[1],
		LEDR[9:6]
	);
	
	assign LEDR[5:4] = KEY[1:0];
	assign LEDR[3:0] = SW[3:0];
	
endmodule
