module coin_counter_module
(
	input logic coin_100,
	input logic coin_500,
	input logic reset,
	output logic [3:0] total_coins
);

	always_ff@(negedge coin_100 or negedge coin_500 or posedge reset)
  
	begin
		if (reset)
			total_coins = 0;
		else if (~coin_100)
			total_coins = total_coins + 4'd1;
		else if (~coin_500)
			total_coins = total_coins + 4'd5;
	end
	 
endmodule 