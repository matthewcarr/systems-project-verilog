module clk_div(
	input  old_clock,
	input  reset,
	output new_clock);
	
	reg [32:0]counter; 	//counter to count up to the clock pulse
	
	parameter clock_div=4; //parameter that declears the divison factor
	

	//at a rising clock or falling reset one fo 3 things happens
	//if reset is low then the counter is held at 0 untill not in the 
	//reset phase. otherwise if the counter is currently equal to the
	//clock division factor then it is set to 0. if neither of the
	//above is true it is incremented by 1
	always@(posedge old_clock or negedge reset) begin
		if (reset==='b0) begin
			counter <= 32'b0;
		end else if (counter === (clock_div-1)) begin
			counter <=32'b0;
		end else begin
			counter <= counter + 1'b1;
		end
	end
	
	assign new_clock = (counter<=((clock_div/2)-1)); //when below half vaule set high

endmodule