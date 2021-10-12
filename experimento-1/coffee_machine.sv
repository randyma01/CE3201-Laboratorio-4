module coffee_machine
(
	//---default inputs---//
	input logic clock, // ?
	input logic reset, // switch 9
	
	//---user inputs---//
	input logic coin_100, // button 1
	input logic coin_500, // button 2
	input logic coffee_type, // switches 1 y 2
	
	//---system outputs---//
	output logic [6:0] total_coins_inserted_display,
	output logic [6:0] total_change_coins_display,
	output logic water,
	output logic coffee,
	output logic sugar,
	output logic milk,
	output logic chocolate,
	output logic finished
);

	//---logical variables---//
	logic total_coins_inserted; // total coins inserted
	logic actual_coins_count; // verify is total coins is equal to 1000
	logic coins_reseter; // reset when is count is more than 1000
	logic [1:0] ingredient_time; // time for each ingredient

	//---temporal variables---//
	logic temp_enable; // temporal enable
	logic temp_change; // temporal change
	logic temp_seconds; //timer counted
	logic temp_time_result; //
	logic temp_state; // 
	
	
	//---counter compator---// ???
	coin_comparator_module coins_comparator(total_coins_inserted, coins_reseter);
	
	
	
	//---counter of total coins inserted---//
	coin_counter_module total_coins_counter(coin_100, coin_500, reset || coins_reseter, total_coins_inserted);
	
	
	
	//---coins display (coins inserted)---//
	coin_display_module coins_display(total_coins_inserted, total_coins_inserted_display);

	
	
	
	//---coffee selection---//
	substractor_module coffee_selector(coffee_type, total_coins_inserted, temp_change, temp_enable);
	

	
	
	//---coins display (if change)---//
	coin_display_module change(temp_change, total_change_coins);
	
	
	
	
	//---timer counter---//
	timer_module fpga_clock(clock, reset, temp_enable, temp_seconds);
	
	
	
	
	//---timer for each ingredient---//
	time_per_coffee_module ingredients_coffee_1(coffee_type, 3'b000, ingredient_time);
	
		
	
	//---time comaparator for each ingredient---//
	time_comparator_module ingredients_coffee_comparator(temp_seconds, ingredient_time, temp_time_result);
	
	
	
	//---FSM---//
	fsm_module FSM(clock, reset, temp_time_result, water, coffee, sugar, milk, chocolate, finished, temp_state);
	
	
	
	//---timer for each ingredient---//
	//time_per_coffee_module ingredients_coffee_2(coffee_type, state, ingredient_time);

endmodule
