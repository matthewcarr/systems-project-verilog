module top_level_fsm ( //will need inputs of a clock,reset,datain,dataout,servopwms,leds
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
	output txbusy
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
	reg servo_pos1;
	reg servo_pos2;
	reg servo_pos3;
	reg servo_pos4;
	reg servo_pos5;
	reg mtne_servo1;
	reg mtne_servo2;
	reg mtne_servo3;
	reg mtne_servo4;
	reg mtne_servo5;
	reg mled;
	reg tran_trig_clk;
	reg tran_trig;

	
	wire [7:0]w_serial_data; //wire to connect to the reciver
	wire w_data_ready;
	wire w_serial_out;
	wire w_trans_busy;
	
	assign  w_data_ready = data_trig;
	assign  w_serial_data= data;
	assign  serial_return = w_serial_out;
	assign  txbusy = w_trans_busy;
	assign	state_out = state;
	
	
	localparam s_reset = 5'd0;
	localparam s_init = 5'd1,
				s_annow = 5'd2,
				s_wt_ftran = 5'd3,
				s_wt_verb = 5'd4,
				s_wt_arg1 = 5'd5,
				s_wt_arg2 = 5'd6,
				s_wt_arg3 = 5'd7,
				s_decode = 5'd8,
				s_ping = 5'd9,
				s_disp = 5'd10,
				s_wt_disp = 5'd11,
				s_confirm = 5'd20;
				
	localparam v_ping = 8'd2;

	
	//instantiate the transmitter/reciver
	//async_receiver #(.ClkFrequency(50000000), .Baud(115200)) rec1 (.clk(clk50m), .RxD(serial_raw), .RxD_data_ready(w_data_ready), .RxD_data(w_serial_data));
	async_transmitter #(.ClkFrequency(50000000), .Baud(115200)) tran1 (.clk(clk50m), .TxD_start(tran_trig_clk), .TxD_data(trans_word), .TxD(w_serial_out), .TxD_busy(w_trans_busy));
	//instatiate the led_controller
	
	//instatiate the 3 token dispensors
	
	//whenever there is valid data avalible from the reciver
	//update the register serial in. if no new data is ready hold
	//vaule
	
	always @(posedge clk50m) begin			 
		if (w_data_ready===1'b1) begin
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
	
	always @(*) begin
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
							default: begin
									nxt_state <= s_reset;
									end
							endcase
						end
			s_ping:		begin
						nxt_state <= s_wt_ftran;
						end
//			s_disp:		begin
//						nxt_state <= s_wt_disp;
//						end
//			s_wt_disp:	begin
//							if (all_done===1'b1) begin
//								nxt_state <=s_confirm;
//							end else begin
//								nxt_state <=s_wt_disp;
//							end
//						end
//			s_leds:		begin
//							nxt_state <= s_confirm;
//						end
//			s_mtne:		begin
//							case(cmd_word[15:8])
//							//mtne list
//							leds: begin
//								  nxt_state<=s_mled;
//								  end
//							endcase
//						end
//			s_mservo1:	begin
//							nxt_state <= s_confirm;
//						end
//			s_mservo2:	begin
//							nxt_state <= s_confirm;
//						end
//			s_mservo3:	begin
//							nxt_state <= s_confirm;
//						end
//			s_mservo4:	begin
//							nxt_state <= s_confirm;
//						end
//			s_mservo5:	begin
//							nxt_state <= s_confirm;
//						end
//			s_mled:		begin
//							nxt_state <= s_confirm;
//						end
			s_confirm:  begin
							nxt_state <= s_wt_verb;
						end
			default:	begin
							nxt_state <=reset;
						end
			endcase
		end
	
	always @ (state) begin
		case(state)
			s_reset:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
					end
			s_init: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
					end
			s_annow: begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b1;
					end
					
			s_wt_ftran:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig=1'b0;
						end
					
			s_wt_verb:begin
						verb =0;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						//cmd_word[31:0]<=32'b0;
						tran_trig=1'b0; 
					end
					
			s_wt_arg1:begin
						verb =serial_in;
						arg1 =0;
						arg2 =0;
						arg3 =0;
						tran_trig = 1'b0;
						end
			s_wt_arg2:begin
						verb =verb_clk;
						arg1 =serial_in;
						arg2 =0;
						arg3 =0;
						 tran_trig = 1'b0;
						 end
			s_wt_arg3:begin 
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =serial_in;
						arg3 =0;
						tran_trig = 1'b0;
					end
			s_decode: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =serial_in; 
						trans_word=verb;
						tran_trig=1'b0;
					end
			s_ping:begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
							tran_trig=1'b1;
						end
//			s_disp:	begin 
//					start_disp<=1'b1;
//					 tran_trig<=1'b1;
//					 end
//			s_wt_disp: begin
//						start_disp<=1'b0;
//						tran_trig<=1'b0; 
//						trans_word<=complete;
//						end
//						
//			s_leds: begin
//					led_cont[5:0]<=cmd[13:8]; 
//					tran_trig<=1'b1; 
//					trans_word<=complete;
//					end
//			s_mtne: begin 
//						tran_trig<=1'b1;
//						
//					end
//			s_mservo1:begin
//						servo_pos1<=cmd_word[23:16];
//						 mtne_servo1<=1'b1;
//						end
//			s_mservo2:begin 
//						servo_pos2<=cmd_word[23:16];
//						 mtne_servo2<=1'b1;
//						end
//			s_mservo3:begin
//						servo_pos3<=cmd_word[23:16]; 
//						mtne_servo3<=1'b1;
//						end
//			s_mservo4:begin
//						servo_pos4<=cmd_word[23:16]; 
//						mtne_servo4<=1'b1;
//						end
//			s_mservo5:begin 
//						servo_pos5<=cmd_word[23:16]; 
//						mtne_servo5<=1'b1;
//						end
//			s_mled:	begin
//					mled<=1'b1;
//					end
			s_confirm: begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						tran_trig=1'b1;
						end
			default : begin
						verb =verb_clk;
						arg1 =arg1_clk;
						arg2 =arg2_clk;
						arg3 =arg3_clk;
						tran_trig=1'b0;
						end
		endcase
	end
	
	always @ (posedge clk50m) begin
		verb_clk=verb;
		arg1_clk=arg1;
		arg2_clk=arg2;
		arg3_clk=arg3;
		tran_trig_clk=tran_trig;
	end
	
	
	
	hexdisplay h1 (verb, HEX0[6:0] );
	hexdisplay h2 (arg1, HEX1[6:0] );
	hexdisplay h3 (arg2, HEX2[6:0] );
	hexdisplay h4 (arg3,HEX3[6:0] );
	
	endmodule 