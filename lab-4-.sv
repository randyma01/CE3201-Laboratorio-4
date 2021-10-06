//------------------------------------------------------------------//
//----------------------------Main Module---------------------------//
//------------------------------------------------------------------//
module coffee_machine
(
	input logic coins
	input logic coffee_type
	input logic confirmation
	inout logic cancel
	
	output [6:0] total_coins
	output [6:0] change
	output [3:0] ingredientes
	output logic completado
)


endmodule

//------------------------------------------------------------------//
//--------------------------Coins Counter---------------------------//
//------------------------------------------------------------------//
module counter_coins_module
(
    input logic coin_100, // buton 1
    input logic coin_500, // buton 2
    input logic reset, // switch 9
    output logic total_coins
);

    always_ff@(posedge coin_100 or posedge coin_500 negedge reset)
  
    begin
        if (reset)
            total_coins = 0;
        else if (1000 <= total_coins)
            total_coins = 0;
        else
            if (coin_100)
                total_coins = total_coins + 100;
            else
                total_coins = total_coins + 500;
    end

endmodule

//------------------------------------------------------------------//
//------------------Coffee Selector + Coins Change------------------//
//------------------------------------------------------------------//
module substractor_module
(
    input logic [3:0] coffee_type,
    input logic total_coins,
    input logic cancel_button,
    output logic change,
    output logic enable_timer
);

    // cancel process //
    always @(cancel_button)
        if (cancel_button)
            assign change = total_coins;

    // select coffee //
    begin
        case (coffee_type)

            // expresso  //
            2'b00: 
                begin
                    if (300 <= total_coins)
                        assign change = total_coins - 300;
                        assign enable_timer = 1
                    else
                        assign change = total_coins
                        assign enable_timer = 0
                end
            
            // with milk //
             2'b01: 
                begin
                    if (400 <= total_coins)
                        assign change = total_coins - 400;
                        assign enable_timer = 1
                    else
                        assign change = total_coins
                        assign enable_timer = 0
                end

            // capuccino //
             2'b10: 
                begin
                    if (500 <= total_coins)
                        assign change = total_coins - 500;
                        assign enable_timer = 1
                    else
                        assign change = total_coins
                        assign enable_timer = 0
                end

            // mocaccino //
             2'b11: 
                begin
                    if (700 <= total_coins)
                        assign change = total_coins - 700;
                        assign enable_timer = 1
                    else
                        assign change = total_coins
                        assign enable_timer = 0
                end
        endcase
    end

endmodule

//------------------------------------------------------------------//
//---------------------------Comparator-----------------------------//
//------------------------------------------------------------------//

//------------------------------------------------------------------//
//---------------------------Time Counter---------------------------//
//------------------------------------------------------------------//

//------------------------------------------------------------------//
//-------------------------------FSM--------------------------------//
//------------------------------------------------------------------//
module fsm_module
(
    input logic clock,
    input logic reset,
    input logic result, // result of comparator
    output logic [4:0] ingredient
);

    // states //
    logic [1:0] state;
    logic [1:0] next_sate;

    // next_state //
    always_ff @(posedge clock or posedge reset)
        if (reset)
            state = 3'b000;
        else
            state = next_state

    // next_state //
    always_comb 
        case(state)
            3'b000: if (result) next_state = 3'b001; else next_state = 3'b000;

            3'b001: if (result) next_state = 3'b010; else next_state = 3'b001;

            3'b010: if (result) next_state = 3'b011; else next_state = 3'b010;

            3'b011: if (result) next_state = 3'b100; else next_state = 3'b011;

            3'b100: if (result) next_state = 3'b101; else next_state = 3'b100;

            3'b101: next_state = 3'b101;

            default : next_state = 3'b000;
        endcase

    // output //
    begin
        case (state):
            3'b000: assign ingredient = 5'b00001;
            3'b001: assign ingredient = 5'b00010;
            3'b010: assign ingredient = 5'b00100;
            3'b011: assign ingredient = 5'b01000;
            3'b100: assign ingredient = 5'b10000;
        endcase
    end

endmodule