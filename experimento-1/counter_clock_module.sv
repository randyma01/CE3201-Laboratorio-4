module counter_clock_module
(
	input logic clock, 
	output logic flag
);

	logic temp_flag;
	int count = 0;

	always @(posedge clock)
	
	begin
		if (count == 1000000)
			temp_flag = 1;
		else
			count = count + 1;
			temp_flag = 0;
	end
	
	assign flag = temp_flag;

endmodule 