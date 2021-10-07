module coin_comparator_module
(
    input logic [3:0] total_coins,
	 output logic reset
);
 
    assign reset = (total_coins == 4'd10);
	 
endmodule 