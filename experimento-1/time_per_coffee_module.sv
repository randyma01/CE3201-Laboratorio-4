module time_per_coffee_module
(
	input logic [2:0]coffee_type,
	input logic [2:0]state,
	output logic [1:0]ingredient_time
);
	
	
	logic [1:0] temp_time;
	
	
	always @(coffee_type, state)
    begin
		case(coffee_type)
		//expreso
			0:
				 begin
					case(state)
					//Water
						0: temp_time = 2'd2;
					//coffee
						1: temp_time = 2'd3;
					//milk
						2: temp_time = 2'd0;
					//chocolate
						3: temp_time = 2'd0;
					//sugar
						4: temp_time = 2'd1;
						default: temp_time = 2'd0;
					endcase
				 end
				 
				 
		//W. milk 
			1:
				 begin
					case(state)
					//Water
						0: temp_time = 2'd2;
					//coffee
						1: temp_time = 2'd2;
					//milk
						2: temp_time = 2'd1;
					//chocolate
						3: temp_time = 2'd0;
					//sugar
						4: temp_time = 2'd1;
						default: temp_time = 2'd0;
					endcase
				 end
				 
		
		 //Capuccino
			2:
				 begin
					case(state)
					//Water
						0: temp_time = 2'd2;
					//coffee
						1: temp_time = 2'd1;
					//milk
						2: temp_time = 2'd2;
					//chocolate
						3: temp_time = 2'd0;
					//sugar
						4: temp_time = 2'd1;
						default: temp_time = 2'd0;
					endcase
				 end
		
		//Mocaccino
			3:
				 begin
					case(state)
					//Water
						0: temp_time = 2'd1;
					//coffee
						1: temp_time = 2'd1;
					//milk
						2: temp_time = 2'd1;
					//chocolate
						3: temp_time = 2'd2;
					//sugar
						4: temp_time = 2'd1;
						default: temp_time = 2'd0;
					endcase
				 end
				  
			default: temp_time = 2'd0;
		endcase
	 end 
	 
	 
	 assign ingredient_time = temp_time;
endmodule