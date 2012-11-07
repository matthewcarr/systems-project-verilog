module input_decoder_test2(	input clk, 
							input [7:0] data, 				
							input data_ready, 				//a pulse to say the data is ready (for changing states)
							output reg [3:0] state, 		//current state
							output reg [7:0] response, 		//the response to the mbed
							output reg [7:0] arg1, 			//args for testing
							output reg [7:0] arg2, 			
							output reg [7:0] arg3,
							output reg ctrl,				//enable for hardware control
							output reg sound,				//enable for sound
							output reg anim,				//enable for animatronics
							output reg token				//enable for token dispense
							);

/*
Prototype of the input decoding thing. Data goes in, stuff happens, send out a response
Current problems and tasks:
 -	implement submodules
*/

reg success;					//hardcoded for now, should be a return from the dispensing etc submodules, 1 for good things
reg [7:0] curdata;				//the data at the time of state transition, used to (hopefully) remove output changes during state
reg [3:0] nstate;				//the state it should go to next
reg [3:0] verb;					//verb to start branch

localparam STATE_RESET = 		4'b0001;
localparam STATE_PING = 		4'b0010;
localparam STATE_CTRL0 = 		4'b0011;
localparam STATE_SOUND0 = 		4'b0100;
localparam STATE_ANIM0 = 		4'b0101;
localparam STATE_TOKEN_RED =	4'b0110;
localparam STATE_CTRL1 = 		4'b0111;
//parameter STATE_CTRL2 =		4'b1000;
localparam STATE_SOUND1 =		4'b1001;
localparam STATE_ANIM1 = 		4'b1010;
//localparam STATE_TOKEN_RED = 	4'b1011;
localparam STATE_TOKEN_BLUE = 	4'b1100;
localparam STATE_TOKEN_GREEN = 	4'b1101;
localparam STATE_WAIT		=	4'b1110;
localparam STATE_ERROR		=	4'b1111;

//register stuff
wire [7:0] w_data;				//wire for data into registers (maybe adding a wire each will sort some problems?)
wire [23:0] buffer;				//wire for data out of registers
wire w_rw1, w_rw2, w_rw3;		//wire for read/write (0 to read, 1 to write)
wire w_clk;

reg [7:0] regdata;
reg rw1, rw2, rw3;

assign w_clk = clk;
assign w_data = regdata;
assign w_rw1 = rw1;
assign w_rw2 = rw2;
assign w_rw3 = rw3;

register reg1(w_clk, w_rw1, w_data, buffer[7:0]);
register reg2(w_clk, w_rw2, w_data, buffer[15:8]);
register reg3(w_clk, w_rw3, w_data, buffer[23:16]);
//end of register stuff

initial 
begin
arg1 = 0;
arg2 = 0;
arg3 = 0;
success = 1;
end

reg state_change;

always @ (posedge clk)				//sets state on clock pulse, better than on data_ready
begin
if ((data_ready == 1) && (state_change == 1))
begin
curdata = data;
state <= nstate;
state_change = 0;
end
if (data_ready == 0) state_change = 1;

//end

//always @ (posedge data_ready)		//this is not good, but it works, try and fix later
//begin

case(data)								//sets the state to go to if in the first state ie accepting verbs
	4'b0001:	begin					//reset
				verb = STATE_RESET;
				ctrl = 0;
				sound = 0;
				anim = 0;
				token = 0;
				end	
	4'b0010:	begin					//respond to ping from mbed
				verb = STATE_PING;
				ctrl = 0;
				sound = 0;
				anim = 0;
				token = 0;
				end	
	4'b0011:	begin					//hardware control for maintenance
				verb = STATE_CTRL0;
				ctrl = 1;
				sound = 0;
				anim = 0;
				token = 0;
				end	
	4'b0100:	begin					//play a sound
				verb = STATE_SOUND0;
				ctrl = 0;
				sound = 1;
				anim = 0;
				token = 0;
				end
	4'b0101:	begin					//start or stop animatronics
				verb = STATE_ANIM0;
				ctrl = 0;
				sound = 0;
				anim = 1;
				token = 0;
				end
	4'b0110:	begin					//dispense tokens
				verb = STATE_TOKEN_RED;
				ctrl = 0;
				sound = 0;
				anim = 0;
				token = 1;
				end
	default: 	begin
				verb = 0;
				ctrl = 0;
				sound = 0;
				anim = 0;
				token = 0;
				end	
endcase

case(state)							//determines the next state based on the current state
	0:	nstate = verb;
	STATE_RESET:		nstate = 0;					
	STATE_PING:			nstate = 0;					
	STATE_CTRL0:		nstate = STATE_CTRL1;		
	STATE_CTRL1:		nstate = STATE_WAIT;		
	STATE_SOUND0:		nstate = STATE_SOUND1;		
	STATE_SOUND1:		nstate = STATE_WAIT;		
	STATE_ANIM0:		nstate = STATE_ANIM1;		
	STATE_ANIM1:		nstate = STATE_WAIT;		
	STATE_TOKEN_RED:	nstate = STATE_TOKEN_BLUE;	
	STATE_TOKEN_BLUE:	nstate = STATE_TOKEN_GREEN;	
	STATE_TOKEN_GREEN:	nstate = STATE_WAIT;
	STATE_WAIT:			begin
						if (response == 8'b00000011) nstate = 0;	//good things
						else if(response == 8'b00000010) nstate = STATE_ERROR;	//bad things
						else nstate = STATE_WAIT;	//wait even longer
						end
	STATE_ERROR:		nstate = STATE_RESET;		//reset after error, maybe change later
	default:			nstate = 0;
endcase
end

always @ (state)					//do things when the state changes, which should be on posedge data_ready, after the next clk pulse
begin

//curdata = data;						//introduced to prevent the output changing with the data (hopefully)

case(state)
	0:	begin						//accepting verbs, output current stored values
		response = 0;
		rw1 = 0;
		rw2 = 0;
		rw3 = 0;
		regdata = 0;
		arg1 = buffer[7:0];
		arg2 = buffer[15:8];
		arg3 = buffer[23:16];
		end
		
	STATE_RESET:	begin			//reset: set state to init, respond with reset
		response = 8'b00000001;
		regdata = 0;
		rw1 = 1;
		rw2 = 1;
		rw3 = 1;
		arg1 = 0;
		arg2 = 0;
		arg3 = 0;			
		end							
		
	STATE_PING:		begin			//respond to mbed ping				
		response = 8'b00000101;
		rw1 = 0;
		rw2 = 0;
		rw3 = 0;
		regdata = 0;
		arg1 = 0;
		arg2 = 0;
		arg3 = 0;
		end
		
	STATE_CTRL0:	begin			//accept hardware ID, output 1st argument for ACK command response
		response = 8'b00000100;		//respond with start command ack
		rw2 = 0;
		rw3 = 0;
		regdata = curdata;			//store HWID in register 1
		rw1 = 1;			
		arg1 = regdata;
		arg2 = 0;
		arg3 = 0;
		end
		
	STATE_CTRL1:	begin			//set state for hardware under control
		response = 8'b00000011;		//respond with command under execution
		rw1 = 0;
		rw3 = 0;
		regdata = curdata;			//store HW state in register 2
		rw2 = 1;
		arg1 = buffer[7:0];
		arg2 = regdata;
		arg3 = 0;		
		end
		
	STATE_SOUND0:	begin			//start state to play a sound
		response = 8'b00000100;		//start ack command response
		rw2 = 0;
		rw3 = 0;
		regdata = curdata;
		rw1 = 1;
		arg1 = regdata;
		arg2 = 0;
		arg3 = 0;	
		end
		
	STATE_SOUND1:	begin			//exists only to send back command for ack
		response = 8'b00000100;		//respond with binary value for sound command
		rw1 = 0;
		rw2 = 0;
		rw3 = 0;
		regdata = curdata;		//makes sure the data is stored
		arg1 = 0;
		arg2 = 0;
		arg3 = 0;			
		end
	
	STATE_ANIM0:	begin			//start state to start or stop anim
		response = 8'b00000100;		//start ack command response
		rw2 = 0;
		rw3 = 0;
		regdata = curdata;
		rw1 = 1;
		arg1 = regdata;
		arg2 = 0;
		arg3 = 0;	
		end
	
	STATE_ANIM1:	begin			//start or stop anim
		response = 8'b00000101;		//respond with binary value for anim start/stop
		rw1 = 0;
		rw2 = 0;
		rw3 = 0;
		regdata = curdata;
		arg1 = 0;
		arg2 = 0;
		arg3 = 0;				
		end
	
	STATE_TOKEN_RED:	begin			//dispense red tokens
		response = 8'b00000100;			//start ack command response
		rw2 = 0;
		rw3 = 0;
		regdata = curdata;
		rw1 = 1;
		arg1 = regdata;
		arg2 = 0;
		arg3 = 0;
		end
		
	STATE_TOKEN_BLUE:	begin			//dispense blue tokens
		response = 8'b00000110;			//respond with value for dispense verb
		rw1 = 0;				
		rw3 = 0;
		regdata = curdata;
		rw2 = 1;
		arg1 = buffer[7:0];
		arg2 = regdata;
		arg3 = 0;					
		end
	
	STATE_TOKEN_GREEN:	begin			//dispense green tokens
		response = 0;					//blank response
		rw1 = 0;
		rw2 = 0;
		regdata = curdata;
		rw3 = 1;
		arg1 = buffer[7:0];
		arg2 = buffer[15:8];
		arg3 = regdata;
		end
	
	STATE_WAIT:		begin				//wait for success or error
		if (success == 1)				//if everything is fine respond with success
			begin
			response = 8'b00000011;
			end
		else if (success == 0)			//if it is all bad, respond with error
			begin
			response = 8'b00000010;
			end
		else response = 0;				//else give a blank response
		regdata = curdata;
		rw1 = 0;
		rw2 = 0;
		rw3 = 0;
		arg1 = buffer[7:0];
		arg2 = buffer[15:8];
		arg3 = buffer[23:16];
		end
	
	default:	begin						//error state
				response = 8'b00000010;		//output that something went really wrong
				rw1 = 0;
				rw2 = 0;
				rw3 = 0;
				regdata = 0;
				arg1 = 0;
				arg2 = 0;
				arg3 = 0;
				end
endcase
end

endmodule 