module coffee_machine_tb();
	
	// fgpa inputs
	logic clock;
	logic reset;
	
	// user inputs
	logic coin_100;
	logic coin_500;
	logic [2:0] coffee_type;
	
	// system outputs
	logic [6:0] total_coins_display;
	logic [6:0] change_display;
	logic water;
	logic coffee;
	logic sugar;
	logic milk;
	logic chocolate;
	logic finished;
	

	coffee_machine DUT
	(
	clock,
	reset,
	coin_100, 
	coin_500, 
	coffee_type,
	total_coins_display,
	change_display,
	water,
	coffee,
	sugar,
	milk,
	chocolate,
	finished
	);
	
	
	always begin
		clock = 0; 
		#40;
		clock = ~clock; 
		#40;
	end

	initial begin
	
		reset = 0;
		coin_100 = 0;
		coin_500 = 0;
		coffee_type = 3'b011;
		#40;
		
		reset = 1;
		coin_100 = 1;
		coin_500 = 0;
		//coffee_type = 3'b000;
		#40;
		
		reset = 1;
		coin_100 = 0;
		coin_500 = 0;
		//coffee_type = 3'b000;
		#40;
		
		reset = 1;
		coin_100 = 1;
		coin_500 = 0;
		//coffee_type = 3'b000;
		#40;
		
		reset = 1;
		coin_100 = 0;
		coin_500 = 1;
		//coffee_type = 3'b011;
		#40;
		
		reset = 1;
		coin_100 = 0;
		coin_500 = 0;
		#40;
	end
	
endmodule 