module timer_module
(
	input logic clock, 
	input logic reset, 
	input logic enable,
	output logic [1:0] Q
);

	always_ff @(negedge clock or posedge reset)
	  if(reset) 
			Q = 2'd0;
	  else
			if (enable) 
				Q = Q + 1'b1;

endmodule 