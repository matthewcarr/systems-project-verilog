module RCServo(
	input clk,
	input [7:0] RxD_data,
	output RCServo_pulse_out,
	output RC_cycle_start);

reg [7:0] RxD_data_reg;
always @(posedge clk) RxD_data_reg <= RxD_data;
// adapted from code on fpgas for fun web page
/*inputs: clock (at 50MHz adjust for different clock frequencies) and 8 bit data. 
The 8 bit input varies the pulse length from 1ms to 2ms in 256 steps. 
The pulses occur every 16ms. These can all be varied by adjusting the code*/
////////////////////////////////////////////////////////////////////////////
// divide the clock for a 50MHz clock to get a tick as close as possible to 3.9us

parameter ClkDiv = 195;  // 50000000/1000/256 = 195.31

reg [7:0] ClkCount;
reg ClkTick;
always @(posedge clk) ClkTick <= (ClkCount==ClkDiv-2); //set ClkTick to 1 when reach state
always @(posedge clk) if(ClkTick) ClkCount <= 0; else ClkCount <= ClkCount + 1; /* reset ClkCount when 1 tick
                                                                             else continue counting*/

////////////////////////////////////////////////////////////////////////////
reg [11:0] PulseCount;
always @(posedge ClkTick) PulseCount <= PulseCount + 1; // for each tick increment pulsecount 1

// make sure the RCServo_position is stable while the pulse is generated
reg [7:0] RCServo_position;
reg RCServo_pulse;
reg start_flag;

reg RCservo_vaule_udpated;

	always @(posedge clk) begin
		if(PulseCount==0) begin
			RCServo_position <= RxD_data_reg; //first time through Pulsecount update width of pulse thereafter leave steady until time for next pulse
			if (start_flag) begin				//if this is the first pulse and its the first clock trigger the update flag to be high for a cycle
				RCservo_vaule_udpated <=1;		
				start_flag <=0;
			end 
			else RCservo_vaule_udpated <=0;		//if first pulse still but not first clock reset the flag to 0
		end
		else if(PulseCount) begin		//on first clock pulse after first reset the pulse updated flag trigger
			RCservo_vaule_udpated <=0;
			start_flag <=1;
		end
		RCServo_pulse <= (PulseCount < {4'b0001, RCServo_position}); //set output high for the while the time passed is less than pulse lenght.
	end
                                                                   
//always @(posedge clk) RCServo_pulse <= (PulseCount < {4'b0001, RCServo_position}); /*set output low until length of pulse is reached*/                                                                           
assign RC_cycle_start = RCservo_vaule_udpated;
assign RCServo_pulse_out = RCServo_pulse;
endmodule 