module coin_counter_module_tb();

	logic coin_100;
	logic coin_500;
	logic reset;
	logic total_coins;

	coin_counter_module DUT(coin_100, coin_500, reset, total_coins);
	
	initial begin
		$display(total_coins);
		coin_100 = 1;
		reset = 0;
		#10;
		
		$display(total_coins);
		coin_100 = 1;
		reset = 0;
		#10
		
		$display(total_coins);
		coin_100 = 1;
		reset = 0;
		#10;
		
		$display(total_coins);
		coin_100 = 1;
		reset = 0;
	end

endmodule 