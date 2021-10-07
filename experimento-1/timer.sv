module timer #(parameter N = 8)
(
	input logic clock, 
	input logic reset, 
	input logic enable,
	output logic [N-1:0] Q
);

    always_ff @(negedge clock or posedge reset)
        if(reset) 
				Q = 8'h00;
        else
            if (enable) 
					Q = Q + 1'b1;

endmodule 