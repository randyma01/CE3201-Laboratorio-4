module coin_display_module
(
	input logic [3:0] total,
	output logic [6:0] display
);

	always @(total)
		begin
			case (total)
			
			  0 : display = 7'b1000000;
			  
			  1 : display = 7'b1111001;
			  
			  2 : display = 7'b0100100;
			  
			  3 : display = 7'b0110000;
			  
			  4 : display = 7'b0011001;
			  
			  5 : display = 7'b0010010;
			  
			  6 : display = 7'b0000010;
			  
			  7 : display = 7'b1111000;
			  
			  8 : display = 7'b0000000;
			  
			  9 : display = 7'b0011000;
			  
			  default: display = 7'b1000000;
			  
			endcase
		end
	
endmodule 