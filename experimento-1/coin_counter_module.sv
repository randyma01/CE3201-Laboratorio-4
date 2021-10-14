module coin_counter_module
(
	input logic coin_100,
	//input logic coin_500,
	input logic reset,
	output logic [3:0] total_coins
);

	logic [3:0] number;

	//always_ff@(negedge coin_100 or negedge coin_500 or posedge reset)
	always_ff@(negedge coin_100 or posedge reset)
  
	begin
		if (reset)
			number = 0;
		else
			number = number + 1;
	
	
		/*if (reset)
			number = 4'b0000;
		else if (~coin_100)
			number=number+4'b0001;
		else if (~coin_500)
			number=number+4'b0101;
			*/
	end
	
	assign total_coins=number;
	 
endmodule 