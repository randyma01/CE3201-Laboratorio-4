module time_comparator_module
(
	input logic [2:0] timer_count,
	input logic [2:0] ingredient_time,
	output logic comparator_result
);

	assign comparator_result = (timer_count > ingredient_time);
	 
endmodule 