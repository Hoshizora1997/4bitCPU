module MUX_4IN_1OUT(
	input [3:0]IN_A,
	input [3:0]IN_B,
	input [3:0]IN_C,
	input [3:0]IN_D,
	input [1:0]SELECT,
	output [3:0]OUT
);

	reg [3:0]Q;

	always @ (IN_A or IN_B or IN_C or IN_D or SELECT) begin
		case(SELECT[1:0])
			2'b00:Q <= IN_A;
			2'b01:Q <= IN_B;
			2'b10:Q <= IN_C;
			2'b11:Q <= IN_D;
		endcase
	end
	
	assign OUT = Q;

endmodule
