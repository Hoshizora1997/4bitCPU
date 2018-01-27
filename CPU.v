module CPU(
	input [9:0]SW,
	output [9:0]LEDR,
	input CLOCK_50,
	input [1:0]KEY
);
	
	wire [3:0]REG_A,REG_B,OUTPUT;
	wire [3:0]LD;
	wire [1:0]SELECT;
	wire [3:0]MUX_OUT;
	wire [3:0]ALU_OUT;
	wire [3:0]ROM_ADDR;
	wire [7:0]ROM_DATA;
	wire ALU_OUT_C,C;
	wire [3:0]INPUT;
	wire [3:0]DEF;
	
	assign DEF = 4'b0000;
	
	Register_4bit RegA (CLOCK_50,ALU_OUT,LD[0],~KEY[0],REG_A);
	Register_4bit RegB (CLOCK_50,ALU_OUT,LD[1],~KEY[0],REG_B);
	Register_4bit OutputReg (CLOCK_50,ALU_OUT,LD[2],~KEY[0],OUTPUT);
	Counter_4bit Counter (CLOCK_50,ALU_OUT,LD[3],~KEY[0],ROM_ADDR);
	
	MUX_4IN_1OUT Mux (REG_A,REG_B,SW[3:0],DEF,SELECT,MUX_OUT);
	
	ALU Alu (MUX_OUT,ROM_DATA[3:0],ALU_OUT,ALU_OUT_C);
	
	DFF_1bit Dff (CLOCK_50,ALU_OUT,~KEY[0],C);
	
	ROM Rom (ROM_ADDR,ROM_DATA);
	
	Decoder Decoder (ROM_DATA[7:4],C,SELECT,LD);
	
	assign LEDR[9:6] = OUTPUT[3:0];
	assign LEDR[3:0] = SW[3:0];
	assign LEDR[5:4] = ~KEY[1:0];
	
endmodule
