module Counter_4bit(
	input CLK,
	input [3:0]IN,
	input LD,
	input RESET,
	output [3:0]OUT
);

	reg [3:0]Q;
	
	always @ (posedge CLK) begin
		if (RESET) begin
			Q <= 4'b0000;
		end else begin
			if (LD) begin
				Q <= IN;
			end else begin
				Q <= Q + 4'b0001;
			end
		end
	end
	
	assign OUT = Q;
	
endmodule
