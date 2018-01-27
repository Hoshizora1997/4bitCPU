module ROM(
	input [3:0]ADDR,
	output [7:0]DATA
);
	
	reg [7:0]Q;

	always @ (ADDR) begin
		case(ADDR)
			4'b0000: Q <= 8'b10110111;//mov B,0000
			4'b0001: Q <= 8'b00000001;//out B
			4'b0010: Q <= 8'b11100001;//add B,0011
			4'b0011: Q <= 8'b00000001;//jnc 0010
			4'b0100: Q <= 8'b11100011;//out B
			4'b0101: Q <= 8'b10110110;//jmp 0010
			4'b0110: Q <= 8'b00000001;
			4'b0111: Q <= 8'b11100110;
			4'b1000: Q <= 8'b00000001;
			4'b1001: Q <= 8'b11101000;
			4'b1010: Q <= 8'b10110000;
			4'b1011: Q <= 8'b10110100;
			4'b1100: Q <= 8'b00000001;
			4'b1101: Q <= 8'b11101010;
			4'b1110: Q <= 8'b10111000;
			4'b1111: Q <= 8'b11110000;
		endcase
	end
	
	assign DATA = Q;

endmodule