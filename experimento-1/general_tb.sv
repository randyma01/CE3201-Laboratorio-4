module general_tb();

	// fgpa inputs
	logic clock;
	logic reset;
	
	// user inputs
	logic coin_100;
	logic coin_500;
	logic [2:0] coffee_type;
	logic confirm;
	
	// system outputs
	logic [6:0] total_coins_display;
	logic [6:0] change_display;
	logic water;
	logic coffee;
	logic sugar;
	logic milk;
	logic chocolate;
	logic finished;
	
	// connections variables
	logic [3:0] total_coins;
	logic coins_reset;
	logic [3:0] change;
	logic enable;
	logic [1:0] seconds;
	logic [2:0] state;
	logic [1:0] ingredient_time;
	logic comparator_result;
	
	
	//  counts total coins inserted verify
	coin_counter_module DUT_COIN_COUNTER(coin_100, coin_500, reset, total_coins);
	
	
	// if total coins is equal or bigger than 1000
	coin_comparator_module DUT_COIN_COMPRATOR(total_coins, coins_reset);
	
	
		// display total coins inserted
		coin_display_module DUT_COINS_DISPLAY(total_coins, total_coins_display);
	
	
	// selects coffee and return change (if exists)
	substractor_module DUT_COFEE_SELECTOR(coffee_type, total_coins,confirm, change, enable);

	
		// display total coins change (if exits)
		coin_display_module DUT_CHANGE_DISPLAY(change, change_display);
	

	// general timer 
	timer_module DUT_GENERAL_TIMER(clock, reset, enable, seconds);
	
	
	// timer for each ingredient in for a coffee
	time_per_coffee_module DUT_COFFEE_TIMER(coffee_type, state, ingredient_time);
	
	
	// comparator for each coffee time ingredient
	time_comparator_module DUT_TIMER_COMPARATOR(seconds, ingredient_time, comparator_result);	
	
	
	// fsm module
	fsm_module DUT_FSM(clock, reset, comparator_result, water, coffee, sugar, milk, chocolate, finished, state);
	
	
	always begin
		clock = 0; 
		#40;
		clock = ~clock; 
		#40;
	end
	
	initial begin
	/*
		reset = 0;
		enable = 0;
		#40;
		
		reset = 1;
		enable = 0;
		#40;
		
		reset = 1;
		enable = 1;
		coffee_type = 3'b011;
		
		*/

		
	//state = 3'b11;
		//#40;
		
		//state = 3'b000;
		//#40;

		reset = 1;
		coin_100 = 1;
		coin_500 = 1;
		coffee_type = 3'b011;
		confirm=0;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 0;
		coin_500 = 1;
		//coffee_type = 3'b000;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 1;
		coin_500 = 1;
		//coffee_type = 3'b000;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 0;
		coin_500 = 1;
		//coffee_type = 3'b000;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 1;
		coin_500 = 1;
		//coffee_type = 3'b011;
		#40;
		
				reset = 1 && coins_reset;
		coin_100 = 0;
		coin_500 = 1;
		//coffee_type = 3'b011;
		#40;
		
		
		reset = 0 | coins_reset;
		coin_100 = 1;
		coin_500 = 1;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 0;
		coin_500 = 1;
		#40;
		
				reset = 0 | coins_reset;
		coin_100 = 1;
		coin_500 = 1;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 1;
		coin_500 = 0;
		#40;
		
		reset = 0 | coins_reset;
		coin_100 = 1;
		coin_500 = 1;
		confirm=1;
		

		
	end

endmodule 