module timer_module
(
	input logic clock, 
	input logic reset, 
	input logic enable,
	output logic [2:0] seconds
);

	always_ff @(posedge clock or posedge reset)
	  if(reset) 
			seconds = 3'd0;
	  else
			if (enable) 
				seconds = seconds + 1'b1;
endmodule 