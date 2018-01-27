module DFF_1bit(
	input CLK,
	input IN,
	input RESET,
	output OUT
);
	
	reg Q;

	always @ (posedge CLK) begin
		if (RESET) begin
			Q <= 1'b0;
		end else begin
			Q <= IN;
		end
	end
	
	assign OUT = Q;
	
endmodule
