module coffee_machine
(
	// default inputs 
	input logic clock, 					// fpga clock
	input logic reset, 					// switch 9
	
	// user inputs
	input logic coin_100, 				// sw 3
	//input logic coin_500, 				// sw 4
	input logic [2:0] coffee_type, 	// switches 0, 1 y 2
	input logic confirm,             //switch 7
	
	// system outputs 
	output logic [6:0] total_coins_display,
	output logic [6:0] change_display,
	output logic [6:0] zero1_display,
	output logic [6:0] zero2_display,
	output logic [6:0] zero3_display,
	output logic [6:0] zero4_display,
	output logic water,
	output logic coffee,
	output logic sugar,
	output logic milk,
	output logic chocolate,
	output logic finished
);
	
	// connections
	logic [3:0] total_coins; 
	logic coins_reset;
	logic [3:0] change;
	logic enable; 
	logic [1:0] seconds;
	logic [1:0] ingredient_time;
	logic comparator_result;
	logic [2:0] state;
	
	
	// verify if total coins is equal or bigger then 100
	//coin_counter_module COIN_COUNTER(coin_100, coin_500, reset | coins_reset, total_coins);
	coin_counter_module COIN_COUNTER(coin_100, reset | coins_reset, total_coins);
	
	
	
	// counts total coins inserted 
	coin_comparator_module COIN_COMPRATOR(total_coins, coins_reset);
	
	
		// display total coins inserted
		coin_display_module COINS_DISPLAY(total_coins, total_coins_display);
	
	
	// selects coffee and return change (if exists)
	substractor_module COFEE_SELECTOR(coffee_type, total_coins,confirm, change, enable);

	
		// display total coins change (if exits)
		coin_display_module CHANGE_DISPLAY(change, change_display);
		
		coin_display_module ZERO1_DISPLAY(7'b1000000, zero1_display);
		coin_display_module ZERO2_DISPLAY(7'b1000000, zero2_display);
		coin_display_module ZERO3_DISPLAY(7'b1000000, zero3_display);
		coin_display_module ZERO4_DISPLAY(7'b1000000, zero4_display);

	
	
	// general timer
	timer_module GENERAL_TIMER(clock, reset, enable, seconds);
	
	
	// timer for each ingredient in for a coffee
	time_per_coffee_module COFFEE_TIMER(coffee_type, state, ingredient_time);
	
	
	// comparator for each coffee time ingredient
	time_comparator_module TIMER_COMPARATOR(seconds, ingredient_time, comparator_result);	
	
	
	// fsm module 
	fsm_module FSM(clock, reset, comparator_result, water, coffee, sugar, milk, chocolate, finished, state);
	
endmodule 