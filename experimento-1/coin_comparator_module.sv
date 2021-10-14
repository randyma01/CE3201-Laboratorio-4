module coin_comparator_module
(
	input logic [3:0] total_coins,
	output logic coins_reset
);
 
	assign coins_reset = (total_coins >= 4'd12);
	 
endmodule 