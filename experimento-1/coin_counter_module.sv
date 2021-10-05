module coin_counter_module
(
    input logic coin_100, // buton 1
    input logic coin_500, // buton 2
    input logic reset, // switch 9
    output logic [5:0] total_coins
);
//Hay errores!

    always_ff@(posedge coin_100 or posedge coin_500 or negedge reset)
  
    begin
        if (!reset)
            total_coins = 0;
        else if (total_coins => 1000)
            total_coins = 0;
        else
            if (coin_100)
                total_coins = total_coins + 100;
            else
                total_coins = total_coins + 500;
    end

	 
endmodule