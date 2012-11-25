module clk_div	(
	input  old_clock,		//clock to be divided
	input  reset,			//reset, held high when not reset
	output new_clock		//divided clock
	);
	
	reg [32:0]counter; 	//counter to count up to the clock pulse
	reg r_new_clock;    //new register to smooth out the output from this module

	parameter clock_div=4;  //parameter that declears the divison factor
  	
	//at a rising clock or falling reset one of 3 things happens:
	//If reset is low then the counter is held at 0 until not in the 
	//reset phase. Otherwise if the counter is currently equal to the
	//clock division factor then it is set to 0. If neither of the
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
	
	always @(posedge old_clock) begin
		r_new_clock <= (counter<=((clock_div/2)-1));	//set new clock to high when below halfway through
	end
	
	assign new_clock = r_new_clock; //when below half value set high

endmodule