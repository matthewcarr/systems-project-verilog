module clk_div(
	input  old_clock,
	input  reset,
	output new_clock);
	
	reg [32:0]counter; 	//counter to count up to the clock pulse
	
	parameter clock_div=4;
	
	always@(posedge old_clock or negedge reset) begin
		if (reset==='b0) begin
			counter <= 32'b0;
		end else if (counter === (clock_div-1)) begin
			counter <=32'b0;
		end else begin
			counter <= counter + 1'b1;
		end
	end
	
	assign new_clock = (counter<=((clock_div/2)-1));

endmodule