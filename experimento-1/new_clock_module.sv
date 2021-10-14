module new_clock_module 
(
    input logic clock,
    output logic new_clock
);

    logic temp_new_clock = 1'b0;
    int count = 1;

    always @(posedge clock)
        begin
            if(count == 11499999) 
                begin 
                    count = 1;
                    temp_new_clock = ~temp_new_clock;
                end 
            else 
                count = count + 1; 
        end

    assign new_clock = temp_new_clock;

endmodule