module Decoder(
	input [3:0]IN,
	input C,
	output [1:0]SELECT,
	output [3:0]LD
);
	
	assign SELECT[1] = IN[1];
	assign SELECT[0] = IN[0] | IN[3];
	assign LD[0] = IN[2] | IN[3];
	assign LD[1] = ~IN[2] | IN[3];
	assign LD[2] = ~(~IN[2] & IN[3]);
	assign LD[3] = (IN[0] | ~C) & IN[2] & IN[3];
	
endmodule
