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
module coin_counter_module
(
    input logic coin_100, // buton 1
    input logic coin_500, // buton 2
    input logic reset, // switch 9
    output logic [3:0] total_coins
);

    always_ff@(posedge coin_100 or posedge coin_500 or negedge reset)
  
    begin
        if (!reset)
            total_coins = 0;
			else if (coin_100)
				total_coins = total_coins + 4'd1;
			else if (coin_500)
				total_coins = total_coins + 4'd5;
    end
	 
endmodule

//------------------------------------------------------------------//
//------------------------Coins Comparator--------------------------//
//------------------------------------------------------------------//
module coin_comparator_module
(
    input logic [3:0] total_coins,
	output logic reset,
);
 
    assign reset = (total_coins == 4'd10);

endmodule


//------------------------------------------------------------------//
//------------------Coffee Selector + Coins Change------------------//
//------------------------------------------------------------------//
module substractor_module
(
    input logic [2:0] coffee_type,
    input logic [3:0] total_coins,
    output logic [3:0] change,
    output logic enable_timer
);

	// temporal variables //
	logic [3:0] temp_change;
	logic temp_et;
	
	always @(coffee_type, total_coins)
    begin
	   case (coffee_type)
		
			// expresso //
		  0 : 
				begin
					 if (total_coins >= 4'd3)
						begin
							temp_change = total_coins - 4'd3;
							temp_et = 1;
						end
                     else
					    begin
							temp_change = total_coins;
							temp_et = 0;
						end
				end
				
			
			// coffee & milk //		
			1 : 
				begin
					 if (total_coins >= 4'd4)
							begin
								temp_change = total_coins - 4'd4;
								temp_et = 1;
							end
                 else
							begin
								temp_change = total_coins;
								temp_et = 0;
							end
				end
				
			// capuccino //		
			2 : 
				begin
					 if (total_coins >= 4'd5)
							begin
								temp_change = total_coins - 4'd5;
								temp_et = 1;
							end
                 else
							begin
								temp_change = total_coins;
								temp_et = 0;
							end
				end
				
			// mocaccino //		
			2 : 
				begin
					 if (total_coins >= 4'd7)
							begin
								temp_change = total_coins - 4'd7;
								temp_et = 1;
							end
                 else
                        begin
                            temp_change = total_coins;
                            temp_et = 0;
                        end
				end
				
		  // default //
		  default : 
				begin
					temp_change = total_coins;
					temp_et = 0;
				end 
       endcase
	  end
	  
	  assign change = temp_change;
	  assign enable_timer = temp_et;
	  
endmodule 

//------------------------------------------------------------------//
//---------------------------Comparator-----------------------------//
//------------------------------------------------------------------//
entradas tiempo del timer, tiempo del TPTC

//------------------------------------------------------------------//
//---------------------------TPTC-----------------------------//
//------------------------------------------------------------------//
entradas estado de la mquina, tipo de cafe
salida tiempo de ingrediente

//------------------------------------------------------------------//
//---------------------------Time Counter---------------------------//
//------------------------------------------------------------------//
//CUENTA SEGUNDOS 
module counter #(parameter N=8)
    (
    input clk, rst, en,
    output[N-1:0] Q
    );

    always_ff @(negedge clk or posedge rst)
        if(rst) Q = 8'h00;
        else
            if (en) Q = Q + 1'b1;

endmodule

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