module motor_control (
	input go,
	input reset,
	input clk_50,
	input direct,
	output pwm,
	output [2:0]o_state,
	output slowc,
	output [6:0]HEX0,
	output [6:0]HEX1,
	output last_pos
	);
	
	reg [2:0] state /* synthesis keep */;   //registers for the state and next state
	reg [2:0] nxt_state;
	reg last_direct;  //register to store the last direction sent before current 1
	reg last_direct_clk/*synthesis keep*/;
	reg [7:0]motor_pos;    //registers for the motor potion and the clked version to be passed
	reg [7:0]motor_pos_clk/*synthesis keep*/;
	reg [11:0]counter;		// this is the counter to store the current timer
	reg counter_en;
	reg counter_en_clk/*synthesis keep*/;
	
	wire slow_clock;		//wire to move the slow clock to the counter
	wire w_pwm;				//wire to move the pwm to output
	
	assign pwm = w_pwm;
	assign o_state = state;
	assign slowc = slow_clock;
	assign last_pos = last_direct_clk;
	
	localparam s_reset 		= 3'd0; //parameters for the state for the state machine
	localparam s_init  		= 3'd1;
	localparam s_wt_go 		= 3'd2;
	localparam s_set_up 	= 3'd3;
	localparam s_set_down 	= 3'd4;
	localparam s_wt_time 	= 3'd5;
	localparam up			= 1'b1;
	localparam down			= 1'b0;

	parameter wait_time = 12'h004;   //the parameter that describes the wait time in milisecond
	parameter m_up= 8'hff;			//postion that cause servo to drive up
	parameter m_halt = 8'h50;		//postion that halts the motor from turning
	parameter m_down = 8'h0f;		//postion that drivers motor down
	
	clk_div #(.clock_div(50000)) ms (.old_clock(clk_50),.reset(reset),.new_clock(slow_clock)); 
	
	RCServo servo_m(.clk(clk_50),.RxD_data(motor_pos_clk),.RCServo_pulse_out(w_pwm));
	hexdisplay hx1(motor_pos_clk[3:0], HEX0);
	hexdisplay hx2(motor_pos_clk[7:4], HEX1);
	
	always@(posedge clk_50 or negedge reset) begin
		if (reset===1'b0) begin
			state<=s_reset;
		end else begin
			state<=nxt_state;
		end
	end
	
	always @(posedge clk_50) begin
		case(state)
			s_reset:	begin
							nxt_state<=s_init;  //when reset go to the init state next
						end
			s_init: 	begin
							nxt_state<=s_wt_go; //once initilaised go to the wait for go 
						end
			s_wt_go: 	begin
							//if the direction is 1 and last_direction was not 1 and go is asserted move the shutter up
							if ((direct!==last_direct_clk) && (direct===up)) begin 
								nxt_state <= s_set_up;
							//if the direction is 0 and last_direction was not 0 and go is asserted move the shutter up
							end else if ((direct!==last_direct_clk) && (direct===down)) begin
								nxt_state <= s_set_down;
							//else dont go anywhere
							end else begin
								nxt_state <= s_wt_go;
							end
						end
			s_set_up:	begin // once motor set move to the timer state
							nxt_state <= s_wt_time;
						end
			s_set_down:	begin //once motor set move to the timer state
							nxt_state <= s_wt_time;
						end
			s_wt_time:  begin //this is a time state will hold here untill the allocated time has passed
							if (counter>=wait_time) begin
								nxt_state <= s_init;
							end else begin
								nxt_state <= s_wt_time;
							end
						end
			default: 	nxt_state <= reset;
			endcase
		end
		
		always@(*) begin
			case(state)
			s_reset:	begin
							counter_en = 1'b0;		//set counter enable to be 0
							motor_pos = m_down; 		//set motor pulse to be halt position
							last_direct = down;						end
			s_init: 	begin
							counter_en = 1'b0;		//set counter enable to be 0
							motor_pos = m_halt; 		//set motor pulse to be halt position
							last_direct = last_direct_clk;
						end
			s_wt_go: 	begin
							counter_en = 1'b0;		//set counter enable to be 0
							motor_pos = m_halt; 		//set motor pulse to be up
							last_direct = last_direct_clk;
						end
			s_set_up:	begin // once motor set move to the timer state
							counter_en = 1'b1;		//set counter enable to be 1
							motor_pos = m_up; 		//set motor pulse to be down
							last_direct = up;
						end
			s_set_down:	begin //once motor set move to the timer state
							counter_en = 1'b1;		//set counter enable to be 1
							motor_pos = m_down; 		//set motor pulse to be halt position
							last_direct = down;
						end
			s_wt_time:  begin //this is a time state will hold here untill the allocated time has passed
							counter_en = 1'b1;		//set counter enable to be 1
							motor_pos = motor_pos_clk; 		//set motor pulse to be the last set vaule
							last_direct = last_direct_clk;
						end
			default: 	begin
							counter_en = 1'b0;		//set counter enable to be 0
							motor_pos = m_up; 		//set motor pulse to be halt position
							last_direct = up;
						end	
		endcase	
	end
	
	
	//at reset clear these vaules if not reset sync the data to a clock before sending out again
	always @(posedge clk_50 or negedge reset) begin
		if (reset===1'b0) begin
			motor_pos_clk = m_down; //could be 8'h50 to stop motor? or eveb m_up ?
			counter_en_clk = 1'd0;
			last_direct_clk = up;
		end else begin
			motor_pos_clk = motor_pos;
			counter_en_clk = counter_en;
			last_direct_clk = last_direct;
		end
	end
	

	
	
	
	//counter tht will count up when reset is asserted and an enble held high else 
	//it clears
	always@(posedge slow_clock or negedge reset or negedge counter_en_clk) begin
		if (reset===1'b0) begin
			counter = 12'd0;
		end else if(counter_en_clk===1'b0) begin
			counter = 12'd0;
		end else if(counter_en_clk===1'b1) begin
			counter = counter + 12'd1;
		end
	end
	

			
	
endmodule