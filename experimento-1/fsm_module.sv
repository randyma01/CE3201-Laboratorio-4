module fsm_module
(
    input logic clock,
    input logic reset,
    input logic result, // result of comparator
    output logic water,
	 output logic coffee,
	 output logic sugar,
	 output logic milk,
	 output logic chocolate,
	 output logic finished
);

    // states //
    logic [2:0] state;
    logic [2:0] next_state;

    // next_state //
    always_ff @(posedge clock or posedge reset)
        if (reset)
            state = 3'b000;
        else
            state = next_state;

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

    // outputs //
	 assign water = (state == 3'b000);
	 assign coffee = (state == 3'b001);
	 assign sugar = (state == 3'b010);
	 assign milk = (state == 3'b011);
	 assign chocolate = (state == 3'b100);
	 assign finished = (state == 3'b101);


endmodule 