//ok roy here goes some info on this massive code tream :) one everything up to decide works fine and has been tested in the lab so no need to change it
//2) curently im using a wait after each transmitt command state this the condition to implement this is : (w_trans_busy===1'b1 || tran_trig_clk===1'b1)
//3) my sections go trnamit 4 or confirm then then verb then jump to s_wt_fresp which is state_wait_finish_repsonse from here its auto maticlly back up to the top and seems ok
//4) the dispensing is in but not tested in hard ware dont really bother with it easiest to do on the bench with a set of servos
//5) to avoid latchs i have 2 version of the signals 1 is updated in the FSM and isnt really clock the second is clocked properly, so all data to be sent to things like submodules should use the name_clk signal
//6) finally the HEx displays are left to right atm where they shoudl be right to left this may need sorted
//
//have fun any problem feel free to text me 
	
	
module top_level_fsm2 ( //will need inputs of a clock,reset,datain,dataout,servopwms,leds
	input clk50m,
	input reset,
	input serial_raw,
	output serial_return,
	input [7:0]data,
	input data_trig,
	output [4:0] state_out,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output txbusy,
	output [4:0] pwm,
	output reg [5:0] led_out
	);
	
	reg [7:0]serial_in; //regiuster to store the vaule of the most recent valid command from the RS232
	reg [7:0]trans_word; //register to store the vaule to send to the Mbed controller over rs232
	reg [4:0]state;
	reg [4:0]nxt_state;
	reg [7:0]verb;
	reg [7:0]verb_clk;
	reg [7:0]arg1;
	reg [7:0]arg1_clk;
	reg [7:0]arg2;
	reg [7:0]arg2_clk;
	reg [7:0]arg3;
	reg [7:0]arg3_clk;
	reg [7:0]servo_pos1;
	reg [7:0]servo_pos2;
	reg [7:0]servo_pos3;
	reg [7:0]servo_pos4;
	reg [7:0]servo_pos5;
	reg mtne_servo1;
	reg mtne_servo2;
	reg mtne_servo3;
	reg mtne_servo4;
	reg mtne_servo5;
	reg mled;
	reg tran_trig_clk;
	reg tran_trig;
	reg start_disp;
	reg [7:0]trans_word_clk;
	reg start_disp_clk;
	
	reg [23:0] cmd_word;
	reg [5:0] led_en;
	
	wire [7:0]w_serial_data; //wire to connect to the reciver
	wire w_data_ready;
	wire w_serial_out;
	wire w_trans_busy;
	wire w_all_done;
	wire w_red_done;
	wire w_blue_done;
	wire w_green_done;
	wire w_pwm_red;
	wire w_pwm_blue;
	wire w_pwm_green;
	
	wire [5:0] w_led_out;
	wire w_mled;
	
	assign  w_data_ready = data_trig;
	assign  w_serial_data= data;
	assign  serial_return = w_serial_out;
	assign  txbusy = w_trans_busy;
	assign	state_out = state;
	assign  w_all_done= (w_red_done && w_blue_done && w_green_done);
	assign  pwm[0]= w_pwm_red;
	assign  pwm[1]= w_pwm_blue;
	assign  pwm[2]= w_pwm_green;
	
	localparam s_reset = 6'd0;
	localparam s_init = 6'd1,
				s_annow = 6'd2,
				s_wt_ftran = 6'd3,
				s_wt_verb = 6'd4,
				s_wt_arg1 = 6'd5,
				s_wt_arg2 = 6'd6,
				s_wt_arg3 = 6'd7,
				s_decode = 6'd8,
				s_ping = 6'd9,
				s_disp = 6'd10,
				s_disp_tran = 6'd11,
				s_disp_txvb =6'd12,
				s_wt_disp = 6'd13,
				s_mtne = 6'd14,
				s_mservo1 = 6'd15,
				s_mservo2 = 6'd16,
				s_mservo3 = 6'd17,
				s_mservo4 = 6'd18,
				s_mservo5 = 6'd19,
				s_mservo_tran = 6'd20,
				s_mservo_txvb = 6'd21,
				s_wt_mservo = 6'd22,
				s_mled = 6'd23,
				s_mled_tran = 6'd24,
				s_mled_txvb = 6'd25,
				s_wt_mled = 6'd26,
				s_anim = 6'd27,
				s_aleds = 6'd28,
				s_aleds_tran = 6'd29,
				s_aleds_txvb = 6'd30,
				s_wt_aleds = 6'd31,
				s_aservos = 6'd32,
				s_aservos_tran = 6'd33,
				s_aservos_txvb = 6'd34,
				s_wt_aservos = 6'd35,
				s_sound = 6'd36,
				s_wt_fresp = 6'd37,
				s_confirm = 6'd38;
				
	localparam v_ping = 8'd2,
				v_go  =8'd6,
				v_mtne = 8'd3,
				v_sound = 8'd4,
				v_anim = 8'd5;
				
	localparam r_pong = 8'd5,
				r_ack = 8'd4,
				r_done = 8'd3,
				r_error = 8'd2,
				r_init = 8'd1;
	
	localparam 	m_servo1 = 8'd1,
				m_servo2 = 8'd2,
				m_servo3 = 8'd6,
				m_servo4 = 8'd4,
				m_servo5 = 8'd5,
				m_leds = 8'd3;
	
	
	//instantiate the transmitter/reciver
	//async_receiver #(.ClkFrequency(50000000), .Baud(115200)) rec1 (.clk(clk50m), .RxD(serial_raw), .RxD_data_ready(w_data_ready), .RxD_data(w_serial_data));
	async_transmitter #(.ClkFrequency(50000000), .Baud(115200)) tran1 (.clk(clk50m), .TxD_start(tran_trig_clk), .TxD_data(trans_word_clk), .TxD(w_serial_out), .TxD_busy(w_trans_busy));
	//instatiate the led_enroller
	led_control		led	(.led_enable(led_en), .reset(reset), .clock(clk50m), .mtne_mode(mled), .led_output(w_led_out));
	//instatiate the 3 token dispensors
	disp_x_token  #(
		.wait_cyles(12'h50),
		.servo_out(8'h00),
		.servo_in(8'hf8)
		)
	red_tokens
		(
		.num_token(arg1_clk) ,	// input [3:0] num_token_sig
		.start(start_disp_clk) ,	// input  start_sig
		.clock(clk50m) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.mtne_mode(mtne_servo1) ,	// input  mtne_mode_sig
		.mtne_pos(servo_pos1) ,	// input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_red) ,	// output  pwm_out_sig
		.done(w_red_done)	// output  done_sig
		);
		
	disp_x_token  #(
		.wait_cyles(12'h50),
		.servo_out(8'h00),
		.servo_in(8'hf8)
		)
	blue_tokens
		(
		.num_token(arg2_clk) ,	// input [3:0] num_token_sig
		.start(start_disp_clk) ,	// input  start_sig
		.clock(clk50m) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.mtne_mode(mtne_servo2) ,	// input  mtne_mode_sig
		.mtne_pos(servo_pos2) ,	// input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_blue) ,	// output  pwm_out_sig
		.done(w_blue_done)	// output  done_sig
		);
		
	disp_x_token  #(
		.wait_cyles(12'h50),
		.servo_out(8'h00),
		.servo_in(8'hf8)
		)
	green_tokens
		(
		.num_token(arg3_clk) ,	// input [3:0] num_token_sig
		.start(start_disp_clk) ,	// input  start_sig
		.clock(clk50m) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.mtne_mode(mtne_servo3) ,	// input  mtne_mode_sig
		.mtne_pos(servo_pos3) ,	// input [7:0] mtne_pos_sig
		.pwm_out(w_pwm_green) ,	// output  pwm_out_sig
		.done(w_green_done)	// output  done_sig
		);

	
	//whenever there is valid data avalible from the reciver
	//update the register serial in. if no new data is ready hold
	//vaule
	
	always @(posedge clk50m or negedge reset) begin			 
		if (reset===1'b0)begin
			serial_in <=8'd0;
		end else if (w_data_ready===1'b1) begin
			serial_in <=w_serial_data;
		end else begin
			serial_in<=serial_in;
		end
	end
	
	always @(posedge clk50m or negedge reset) begin
		if (reset===1'b0) begin
			state<=reset;
		end else begin
			state<=nxt_state;
		end
	end
	
	always @ (*) begin							//state changes
		case(state) 
			s_reset: 	begin
							nxt_state <=s_init;	//once in reset state move to initalise
						end
			s_init:   	begin
							nxt_state <=s_annow;
						end
			s_annow:	begin
							nxt_state <=s_wt_ftran;
						end					
			s_wt_ftran: begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_wt_ftran;
							end else begin
								nxt_state <=s_wt_verb;
							end
						end
			s_wt_verb: 	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_wt_arg1;
							end else begin
								nxt_state <=s_wt_verb;
							end
						end				
			s_wt_arg1:	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_wt_arg2;
							end else begin
								nxt_state <=s_wt_arg1;
							end
						end			
			s_wt_arg2:	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_wt_arg3;
							end else begin
								nxt_state <=s_wt_arg2;
							end
						end					
			s_wt_arg3:	begin
							if(w_data_ready===1'b1) begin
								nxt_state <=s_decode;
							end else begin
								nxt_state <=s_wt_arg3;
							end
						end					
			s_decode:	begin
							case(verb)
							v_ping: begin
									nxt_state <= s_ping;
									end
							v_go:	begin
									nxt_state <= s_disp;
									end
							v_mtne:	begin
									nxt_state <= s_mtne;
									end
							v_sound: begin
									 nxt_state <= s_sound;
									 end
							v_anim:	begin
									nxt_state <= s_anim;
									end
							default: begin
									nxt_state <= s_reset;
									end
							endcase
						end
			s_ping:		begin
						nxt_state <= s_wt_ftran;
						end
			s_disp:		begin
						nxt_state <= s_disp_tran;
						end
			s_disp_tran:begin
						if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_disp_tran;
							end else begin
								nxt_state <=s_disp_txvb;
							end	
						end
			s_disp_txvb:begin
						 nxt_state <=s_wt_disp;
						end				
			s_wt_disp:	begin
							if (w_all_done===1'b1) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_wt_disp;
							end
						end
			s_mtne:		begin
							case(cmd_word[15:8])
							m_servo1:	begin
										nxt_state <= s_mservo1;
										end
							m_servo2:	begin
										nxt_state <= s_mservo2;
										end
							m_servo3:	begin
										nxt_state <= s_mservo3;
										end
							m_servo4:	begin
										nxt_state <= s_mservo4;
										end
							m_servo5:	begin
										nxt_state <= s_mservo5;
										end
							m_leds: 	begin
										nxt_state<=s_mled;
										end
							default:	begin
										nxt_state <= s_reset;
										end
							endcase
						end
			s_mservo1:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo2:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo3:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo4:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo5:	begin
							nxt_state <= s_mservo_tran;
						end
			s_mservo_tran:begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
									nxt_state <=s_mservo_tran;
								end else begin
									nxt_state <=s_mservo_txvb;
								end	
							end
			s_mservo_txvb:begin
							nxt_state <=s_wt_mservo;
							end				
			s_wt_mservo:	begin
							if (data_trig===1'b0) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_wt_mservo;
							end
							end
			s_mled:		begin
						nxt_state <= s_mled_tran;
						end
			s_mled_tran:begin
						if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_mled_tran;
							end else begin
								nxt_state <=s_mled_txvb;
							end	
						end
			s_mled_txvb:begin
						 nxt_state <=s_wt_mled;
						end				
			s_wt_mled:	begin
							if (data_trig===1'b0) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_wt_mled;
							end
						end
			s_anim:		begin
							nxt_state <= s_aleds;
						end
			s_aleds:		begin
							nxt_state <= s_aleds_tran;
						end
			s_aleds_tran:begin
						if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_aleds_tran;
							end else begin
								nxt_state <=s_aleds_txvb;
							end	
						end
			s_aleds_txvb:begin
						 nxt_state <=s_wt_aleds;
						end				
			s_wt_aleds:	begin
							if (data_trig===1'b0) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_wt_aleds;
							end
						end
			s_aservos:	begin
							nxt_state <= s_aservos_tran;
						end
			s_aservos_tran:begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
									nxt_state <=s_aservos_tran;
								end else begin
									nxt_state <=s_aservos_txvb;
							end	
						end
			s_aservos_txvb:begin
						 nxt_state <=s_wt_aservos;
						end				
			s_wt_aservos:	begin
							if (data_trig===1'b0) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_wt_aservos;
							end
						end
			s_wt_fresp:	begin
							if(w_trans_busy===1'b1 || tran_trig_clk===1'b1) begin
								nxt_state <=s_wt_fresp;
							end else begin
								nxt_state <=s_confirm;
							end						
						end
			s_confirm:  begin
							nxt_state <= s_wt_ftran;
						end
			default:	begin
							nxt_state <=reset;
						end
			endcase
		end
	
	always @ (*) begin							//general outputs
		case(state)
			s_reset:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word='b0;
						start_disp=1'b0;
					end
			s_init: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word='b0;
						start_disp=1'b0;
					end
			s_annow: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						trans_word='b1;
						tran_trig=1'b1;
						start_disp=1'b0;
					end				
			s_wt_ftran:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word='b0;
						start_disp=1'b0;
						end				
			s_wt_verb:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						trans_word='b0;
						start_disp=1'b0; 
						end					
			s_wt_arg1:begin
						verb =serial_in;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig = 1'b0;
						trans_word='b0;
						start_disp=1'b0;
						end
			s_wt_arg2:begin
						verb =verb_clk;
						arg1 =serial_in;
						arg2 =0;
						arg3 =0;
						tran_trig = 1'b0;
						trans_word='b0;
						start_disp=1'b0;
						 end
			s_wt_arg3:begin 
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =serial_in;
						arg3 =0;
						tran_trig = 1'b0;
						trans_word='b0;
						start_disp=1'b0;
					end
			s_decode: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =serial_in; 
						trans_word=r_ack;
						tran_trig=1'b0;
						start_disp=1'b0;
					end
			s_ping:begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						trans_word=r_pong;
						tran_trig=1'b1;
						start_disp=1'b0;
						end
			s_disp:	begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b1;
						trans_word=r_ack;						
						tran_trig=1'b1;
					 end
			s_disp_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						end
			s_disp_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=verb;
						start_disp=1'b0;
					   end
			s_wt_disp: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig = 1'b0; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=8'd0;
						start_disp=1'b0;						
						end
			s_anim:	begin
					tran_trig=1'b1;
					verb =verb_clk;
					arg1 =arg1_clk;
					arg2 =arg2_clk;
					arg3 =arg3_clk;
					start_disp=1'b0;
					trans_word=r_ack;
					end					
			s_aleds: begin
					tran_trig=1'b0;
					verb =verb_clk;
					arg1 =arg1_clk;
					arg2 =arg2_clk;
					arg3 =arg3_clk;
					start_disp=1'b0;
					trans_word=8'd0;
					end
			s_aleds_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						end
			s_aleds_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=verb;
						start_disp=1'b0;
					   end
			s_wt_aleds: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig = 1'b0; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=8'd0;
						start_disp=1'b0;						
						end
			s_aservos: 	begin
						tran_trig=1'b0;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=8'd0;
						end
			s_aservos_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						end
			s_aservos_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=verb;
						start_disp=1'b0;
					   end
			s_wt_aservos: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig = 1'b0; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=8'd0;
						start_disp=1'b0;						
						end
			s_mtne:		begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=r_ack;
						end
			s_mservo1:	begin
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						end
			s_mservo2:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						end
			s_mservo3:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						end
			s_mservo4:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						end
			s_mservo5:	begin 
						tran_trig=1'b1;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=verb;
						end
			s_mservo_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						end
			s_mservo_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=verb;
						start_disp=1'b0;
					   end
			s_wt_mservo: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig = 1'b0; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=8'd0;
						start_disp=1'b0;						
						end
			s_mled:		begin
						tran_trig=1'b0;
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						trans_word=8'd0;
						end
			s_mled_tran: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk; 
						start_disp=1'b0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						end
			s_mled_txvb: begin
					   	verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig =1'b1; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=verb;
						start_disp=1'b0;
					   end
			s_wt_mled: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						start_disp=1'b0;
						tran_trig = 1'b0; //need to solve how to stop it constantly sending the verb back preferablly without adding a new state
						trans_word=8'd0;
						start_disp=1'b0;						
						end
			s_wt_fresp: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						tran_trig=1'b0;
						trans_word=8'd3;
						start_disp=1'b0;
						end
			s_confirm: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						tran_trig=1'b1;
						trans_word=8'd0;
						start_disp=1'b0;
						end
			default : begin
						verb =8'd0;
						arg1 =8'd0;
						arg2 =8'd0;
						arg3 =8'd0;
						tran_trig=1'b0;
						trans_word=8'd0;
						start_disp=1'b0;
						end
		endcase
	end
	
	always @ (*) begin							//servo control
		case(state)
			s_wt_mservo:begin
						case(cmd_word[15:8])
							m_servo1:	begin
											servo_pos1=cmd_word[23:16];
											servo_pos2=8'd0;
											servo_pos3=8'd0;
											servo_pos4=8'd0;
											servo_pos5=8'd0;
											mtne_servo1=1'b1;
											mtne_servo2=1'b0;
											mtne_servo3=1'b0;
											mtne_servo4=1'b0;
											mtne_servo5=1'b0;
										end
							m_servo2:	begin
											servo_pos1=8'd0;
											servo_pos2=cmd_word[23:16];
											servo_pos3=8'd0;
											servo_pos4=8'd0;
											servo_pos5=8'd0;
											mtne_servo1=1'b0;
											mtne_servo2=1'b1;
											mtne_servo3=1'b0;
											mtne_servo4=1'b0;
											mtne_servo5=1'b0;
										end
							m_servo3:	begin
											servo_pos1=8'd0;
											servo_pos2=8'd0;
											servo_pos3=cmd_word[23:16];
											servo_pos4=8'd0;
											servo_pos5=8'd0;
											mtne_servo1=1'b0;
											mtne_servo2=1'b0;
											mtne_servo3=1'b1;
											mtne_servo4=1'b0;
											mtne_servo5=1'b0;
										end
							m_servo4:	begin
											servo_pos1=8'd0;
											servo_pos2=8'd0;
											servo_pos3=8'd0;
											servo_pos4=cmd_word[23:16];
											servo_pos5=8'd0;
											mtne_servo1=1'b0;
											mtne_servo2=1'b0;
											mtne_servo3=1'b0;
											mtne_servo4=1'b1;
											mtne_servo5=1'b0;
										end
							m_servo5:	begin
											servo_pos1=8'd0;
											servo_pos2=8'd0;
											servo_pos3=8'd0;
											servo_pos4=8'd0;
											servo_pos5=cmd_word[23:16];
											mtne_servo1=1'b0;
											mtne_servo2=1'b0;
											mtne_servo3=1'b0;
											mtne_servo4=1'b0;
											mtne_servo5=1'b1;
										end
							default:	begin
											servo_pos1=8'd0;
											servo_pos2=8'd0;
											servo_pos3=8'd0;
											servo_pos4=8'd0;
											servo_pos5=8'd0;
											mtne_servo1=1'b0;
											mtne_servo2=1'b0;
											mtne_servo3=1'b0;
											mtne_servo4=1'b0;
											mtne_servo5=1'b0;
										end
							endcase
						end
			s_wt_aservos:begin
						servo_pos1=8'd0;
						servo_pos2=8'd0;
						servo_pos3=8'd0;
						servo_pos4=cmd_word[23:16];
						servo_pos5=cmd_word[23:16];
						mtne_servo1=1'b0;
						mtne_servo2=1'b0;
						mtne_servo3=1'b0;
						mtne_servo4=cmd_word[14];
						mtne_servo5=cmd_word[15];
						end
			default:	begin
						servo_pos1=8'd0;
						servo_pos2=8'd0;
						servo_pos3=8'd0;
						servo_pos4=8'd0;
						servo_pos5=8'd0;
						mtne_servo1=1'b0;
						mtne_servo2=1'b0;
						mtne_servo3=1'b0;
						mtne_servo4=1'b0;
						mtne_servo5=1'b0;
						end
			endcase
	end
	
	always @ (*) begin							//led control
		case(state)
			s_wt_mled:	begin
					led_en[5:0] = 6'd0;
					mled = 1'b1;
					end
			s_wt_aleds:	begin
					led_en[5:0] = cmd_word[13:8];
					mled = 1'b0;
					end
			default:begin
					led_en[5:0] = 6'd0;
					mled = 1'b0;
					end
		endcase
	end
	
	always @ (posedge clk50m or negedge reset) begin
		if (reset===1'b0) begin
			verb_clk=8'd0;
			arg1_clk=8'd0;
			arg2_clk=8'd0;
			arg3_clk=8'd0;
			tran_trig_clk=1'd0;
			trans_word_clk=8'd0;
			start_disp_clk=1'd0;
			cmd_word=24'd0;
			led_out = 6'd0;
		end else begin
			verb_clk=verb;
			arg1_clk=arg1;
			arg2_clk=arg2;
			arg3_clk=arg3;
			tran_trig_clk=tran_trig;
			trans_word_clk=trans_word;
			start_disp_clk=start_disp;
			cmd_word[7:0]=verb;
			cmd_word[15:8]=arg1;
			cmd_word[23:16]=arg2;
			led_out = w_led_out;
		end
	end
	
	
	hexdisplay h1 (verb, HEX3[6:0] );
	hexdisplay h2 (arg1, HEX2[6:0] );
	hexdisplay h3 (arg2, HEX1[6:0] );
	hexdisplay h4 (arg3, HEX0[6:0] );
	
	endmodule 