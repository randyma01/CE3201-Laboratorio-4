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