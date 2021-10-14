module time_per_coffee_module
(
	input logic [2:0] coffee_type,
	input logic [2:0] state,
	output logic [2:0] ingredient_time
);
	
	// temporal variable //
	logic [2:0] temp_time;
	
	always @(coffee_type, state)
		begin
			case(coffee_type)
				
				//expreso //
				1:
					begin
						case(state)
						//Water
							0: temp_time = 3'd3;
						//coffee
							1: temp_time = 3'd4;
						//milk
							2: temp_time = 3'd1;
						//chocolate
							3: temp_time = 3'd1;
						//sugar
							4: temp_time = 3'd2;
							default: temp_time = 3'd0;
						endcase
					 end
				 
				//W. milk //
				2:
					begin
						case(state)
						//Water
							0: temp_time = 3'd3;
						//coffee
							1: temp_time = 3'd3;
						//milk
							2: temp_time = 3'd2;
						//chocolate
							3: temp_time = 3'd1;
						//sugar
							4: temp_time = 3'd2;
							default: temp_time = 3'd0;
						endcase
					 end
					 
				// capuccino //
				3:
					begin
						case(state)
						//Water
							0: temp_time = 3'd3;
						//coffee
							1: temp_time = 3'd2;
						//milk
							2: temp_time = 3'd3;
						//chocolate
							3: temp_time = 3'd1;
						//sugar
							4: temp_time = 3'd2;
							default: temp_time = 3'd0;
						endcase
					 end
		
				// mocaccino //
				4:
					 begin
						case(state)
						//Water
							0: temp_time = 3'd2;
						//coffee
							1: temp_time = 3'd2;
						//milk
							2: temp_time = 3'd2;
						//chocolate
							3: temp_time = 3'd3;
						//sugar
							4: temp_time = 3'd2;
							default: temp_time = 3'd0;
						endcase
					 end
				  
				 // default // 
				default: temp_time = 3'd0;
		endcase
	 end 
	 
	 // output //
	 assign ingredient_time = temp_time;
	 
endmodule 