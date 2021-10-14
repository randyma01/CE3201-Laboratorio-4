module coin_500_counter_module
(
	input logic coin_500,
	input logic reset,
	output logic [3:0] total_coins
);

	logic [3:0] number;

	always_ff@(negedge coin_500 or posedge reset)
  
	begin

		if (reset)
			number = 0;
		else
			number = number + 5;
	end

	
	assign total_coins=number;
	 
endmodule  