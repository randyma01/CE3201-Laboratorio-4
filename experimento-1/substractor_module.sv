module substractor_module
(
	input logic [2:0] coffee_type,
	input logic [3:0] total_coins,
	input logic confirm,
	output logic [3:0] change,
	output logic enable
);

	// temporal variables //
	logic [3:0] temp_change;
	logic temp_et, temp_cf;
	
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
								temp_change =  4'd0;
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
								temp_change =  4'd0;
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
								temp_change =  4'd0;
								temp_et = 0;
							end
					end
					
				// mocaccino //		
				3 : 
					begin
						if (total_coins >= 4'd7)
							begin
								temp_change = total_coins - 4'd7;
								temp_et = 1;
							end
						else
							begin
								temp_change =  4'd0;
								temp_et = 0;
							end
					end
				
			  // default //
			  default : 
					begin
						temp_change =  4'd0;
						temp_et = 0;
					end 
       endcase
	  end
	  
	  // outputs //
	  always @(confirm)
		if (confirm)
			begin
				 change = temp_change;
				 enable = temp_et;
			end
		else
			begin
				 change = 4'd0;
				 enable = 0;
			end
			
	  
endmodule 