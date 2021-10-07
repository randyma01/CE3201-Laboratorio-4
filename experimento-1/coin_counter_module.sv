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