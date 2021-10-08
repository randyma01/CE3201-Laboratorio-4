module time_comparator_module
(
    input logic [1:0] timer_count,
	 input logic [1:0] ingredient_time,
	 output logic result
);
 
    assign result = ( timer_count == ingredient_time);
	 
endmodule 