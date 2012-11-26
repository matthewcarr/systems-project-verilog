//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2012 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module AUDIO_SOPC_clock_0_in_arbitrator (
                                          // inputs:
                                           AUDIO_SOPC_clock_0_in_endofpacket,
                                           AUDIO_SOPC_clock_0_in_readdata,
                                           AUDIO_SOPC_clock_0_in_waitrequest,
                                           clk,
                                           cpu_0_data_master_address_to_slave,
                                           cpu_0_data_master_byteenable,
                                           cpu_0_data_master_dbs_address,
                                           cpu_0_data_master_dbs_write_8,
                                           cpu_0_data_master_no_byte_enables_and_last_term,
                                           cpu_0_data_master_read,
                                           cpu_0_data_master_waitrequest,
                                           cpu_0_data_master_write,
                                           reset_n,

                                          // outputs:
                                           AUDIO_SOPC_clock_0_in_address,
                                           AUDIO_SOPC_clock_0_in_endofpacket_from_sa,
                                           AUDIO_SOPC_clock_0_in_nativeaddress,
                                           AUDIO_SOPC_clock_0_in_read,
                                           AUDIO_SOPC_clock_0_in_readdata_from_sa,
                                           AUDIO_SOPC_clock_0_in_reset_n,
                                           AUDIO_SOPC_clock_0_in_waitrequest_from_sa,
                                           AUDIO_SOPC_clock_0_in_write,
                                           AUDIO_SOPC_clock_0_in_writedata,
                                           cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in,
                                           cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in,
                                           cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in,
                                           cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in,
                                           cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in,
                                           d1_AUDIO_SOPC_clock_0_in_end_xfer
                                        )
;

  output           AUDIO_SOPC_clock_0_in_address;
  output           AUDIO_SOPC_clock_0_in_endofpacket_from_sa;
  output           AUDIO_SOPC_clock_0_in_nativeaddress;
  output           AUDIO_SOPC_clock_0_in_read;
  output  [  7: 0] AUDIO_SOPC_clock_0_in_readdata_from_sa;
  output           AUDIO_SOPC_clock_0_in_reset_n;
  output           AUDIO_SOPC_clock_0_in_waitrequest_from_sa;
  output           AUDIO_SOPC_clock_0_in_write;
  output  [  7: 0] AUDIO_SOPC_clock_0_in_writedata;
  output           cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in;
  output           cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in;
  output           cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in;
  output           cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in;
  output           cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in;
  output           d1_AUDIO_SOPC_clock_0_in_end_xfer;
  input            AUDIO_SOPC_clock_0_in_endofpacket;
  input   [  7: 0] AUDIO_SOPC_clock_0_in_readdata;
  input            AUDIO_SOPC_clock_0_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [  7: 0] cpu_0_data_master_dbs_write_8;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input            reset_n;

  wire             AUDIO_SOPC_clock_0_in_address;
  wire             AUDIO_SOPC_clock_0_in_allgrants;
  wire             AUDIO_SOPC_clock_0_in_allow_new_arb_cycle;
  wire             AUDIO_SOPC_clock_0_in_any_bursting_master_saved_grant;
  wire             AUDIO_SOPC_clock_0_in_any_continuerequest;
  wire             AUDIO_SOPC_clock_0_in_arb_counter_enable;
  reg     [  2: 0] AUDIO_SOPC_clock_0_in_arb_share_counter;
  wire    [  2: 0] AUDIO_SOPC_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] AUDIO_SOPC_clock_0_in_arb_share_set_values;
  wire             AUDIO_SOPC_clock_0_in_beginbursttransfer_internal;
  wire             AUDIO_SOPC_clock_0_in_begins_xfer;
  wire             AUDIO_SOPC_clock_0_in_end_xfer;
  wire             AUDIO_SOPC_clock_0_in_endofpacket_from_sa;
  wire             AUDIO_SOPC_clock_0_in_firsttransfer;
  wire             AUDIO_SOPC_clock_0_in_grant_vector;
  wire             AUDIO_SOPC_clock_0_in_in_a_read_cycle;
  wire             AUDIO_SOPC_clock_0_in_in_a_write_cycle;
  wire             AUDIO_SOPC_clock_0_in_master_qreq_vector;
  wire             AUDIO_SOPC_clock_0_in_nativeaddress;
  wire             AUDIO_SOPC_clock_0_in_non_bursting_master_requests;
  wire             AUDIO_SOPC_clock_0_in_pretend_byte_enable;
  wire             AUDIO_SOPC_clock_0_in_read;
  wire    [  7: 0] AUDIO_SOPC_clock_0_in_readdata_from_sa;
  reg              AUDIO_SOPC_clock_0_in_reg_firsttransfer;
  wire             AUDIO_SOPC_clock_0_in_reset_n;
  reg              AUDIO_SOPC_clock_0_in_slavearbiterlockenable;
  wire             AUDIO_SOPC_clock_0_in_slavearbiterlockenable2;
  wire             AUDIO_SOPC_clock_0_in_unreg_firsttransfer;
  wire             AUDIO_SOPC_clock_0_in_waitrequest_from_sa;
  wire             AUDIO_SOPC_clock_0_in_waits_for_read;
  wire             AUDIO_SOPC_clock_0_in_waits_for_write;
  wire             AUDIO_SOPC_clock_0_in_write;
  wire    [  7: 0] AUDIO_SOPC_clock_0_in_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_0;
  wire             cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_1;
  wire             cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_2;
  wire             cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_3;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_saved_grant_AUDIO_SOPC_clock_0_in;
  reg              d1_AUDIO_SOPC_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_AUDIO_SOPC_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~AUDIO_SOPC_clock_0_in_end_xfer;
    end


  assign AUDIO_SOPC_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in));
  //assign AUDIO_SOPC_clock_0_in_readdata_from_sa = AUDIO_SOPC_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_readdata_from_sa = AUDIO_SOPC_clock_0_in_readdata;

  assign cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in = ({cpu_0_data_master_address_to_slave[24 : 1] , 1'b0} == 25'h1101430) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign AUDIO_SOPC_clock_0_in_waitrequest_from_sa = AUDIO_SOPC_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_waitrequest_from_sa = AUDIO_SOPC_clock_0_in_waitrequest;

  //AUDIO_SOPC_clock_0_in_arb_share_counter set values, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_arb_share_set_values = (cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in)? 4 :
    1;

  //AUDIO_SOPC_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_non_bursting_master_requests = cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in;

  //AUDIO_SOPC_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_any_bursting_master_saved_grant = 0;

  //AUDIO_SOPC_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_arb_share_counter_next_value = AUDIO_SOPC_clock_0_in_firsttransfer ? (AUDIO_SOPC_clock_0_in_arb_share_set_values - 1) : |AUDIO_SOPC_clock_0_in_arb_share_counter ? (AUDIO_SOPC_clock_0_in_arb_share_counter - 1) : 0;

  //AUDIO_SOPC_clock_0_in_allgrants all slave grants, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_allgrants = |AUDIO_SOPC_clock_0_in_grant_vector;

  //AUDIO_SOPC_clock_0_in_end_xfer assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_end_xfer = ~(AUDIO_SOPC_clock_0_in_waits_for_read | AUDIO_SOPC_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in = AUDIO_SOPC_clock_0_in_end_xfer & (~AUDIO_SOPC_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //AUDIO_SOPC_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in & AUDIO_SOPC_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in & ~AUDIO_SOPC_clock_0_in_non_bursting_master_requests);

  //AUDIO_SOPC_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_in_arb_share_counter <= 0;
      else if (AUDIO_SOPC_clock_0_in_arb_counter_enable)
          AUDIO_SOPC_clock_0_in_arb_share_counter <= AUDIO_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //AUDIO_SOPC_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|AUDIO_SOPC_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in) | (end_xfer_arb_share_counter_term_AUDIO_SOPC_clock_0_in & ~AUDIO_SOPC_clock_0_in_non_bursting_master_requests))
          AUDIO_SOPC_clock_0_in_slavearbiterlockenable <= |AUDIO_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master AUDIO_SOPC_clock_0/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = AUDIO_SOPC_clock_0_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //AUDIO_SOPC_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_slavearbiterlockenable2 = |AUDIO_SOPC_clock_0_in_arb_share_counter_next_value;

  //cpu_0/data_master AUDIO_SOPC_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = AUDIO_SOPC_clock_0_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //AUDIO_SOPC_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in = cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in) & cpu_0_data_master_write));
  //AUDIO_SOPC_clock_0_in_writedata mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_writedata = cpu_0_data_master_dbs_write_8;

  //assign AUDIO_SOPC_clock_0_in_endofpacket_from_sa = AUDIO_SOPC_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_endofpacket_from_sa = AUDIO_SOPC_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in = cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in;

  //cpu_0/data_master saved-grant AUDIO_SOPC_clock_0/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_AUDIO_SOPC_clock_0_in = cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in;

  //allow new arb cycle for AUDIO_SOPC_clock_0/in, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign AUDIO_SOPC_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign AUDIO_SOPC_clock_0_in_master_qreq_vector = 1;

  //AUDIO_SOPC_clock_0_in_reset_n assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_reset_n = reset_n;

  //AUDIO_SOPC_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_firsttransfer = AUDIO_SOPC_clock_0_in_begins_xfer ? AUDIO_SOPC_clock_0_in_unreg_firsttransfer : AUDIO_SOPC_clock_0_in_reg_firsttransfer;

  //AUDIO_SOPC_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_unreg_firsttransfer = ~(AUDIO_SOPC_clock_0_in_slavearbiterlockenable & AUDIO_SOPC_clock_0_in_any_continuerequest);

  //AUDIO_SOPC_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (AUDIO_SOPC_clock_0_in_begins_xfer)
          AUDIO_SOPC_clock_0_in_reg_firsttransfer <= AUDIO_SOPC_clock_0_in_unreg_firsttransfer;
    end


  //AUDIO_SOPC_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_beginbursttransfer_internal = AUDIO_SOPC_clock_0_in_begins_xfer;

  //AUDIO_SOPC_clock_0_in_read assignment, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_read = cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in & cpu_0_data_master_read;

  //AUDIO_SOPC_clock_0_in_write assignment, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_write = ((cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in & cpu_0_data_master_write)) & AUDIO_SOPC_clock_0_in_pretend_byte_enable;

  //AUDIO_SOPC_clock_0_in_address mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_address = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1 : 0]};

  //slaveid AUDIO_SOPC_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_AUDIO_SOPC_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_AUDIO_SOPC_clock_0_in_end_xfer <= 1;
      else 
        d1_AUDIO_SOPC_clock_0_in_end_xfer <= AUDIO_SOPC_clock_0_in_end_xfer;
    end


  //AUDIO_SOPC_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_waits_for_read = AUDIO_SOPC_clock_0_in_in_a_read_cycle & AUDIO_SOPC_clock_0_in_waitrequest_from_sa;

  //AUDIO_SOPC_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_in_a_read_cycle = cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = AUDIO_SOPC_clock_0_in_in_a_read_cycle;

  //AUDIO_SOPC_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_waits_for_write = AUDIO_SOPC_clock_0_in_in_a_write_cycle & AUDIO_SOPC_clock_0_in_waitrequest_from_sa;

  //AUDIO_SOPC_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_in_in_a_write_cycle = cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = AUDIO_SOPC_clock_0_in_in_a_write_cycle;

  assign wait_for_AUDIO_SOPC_clock_0_in_counter = 0;
  //AUDIO_SOPC_clock_0_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_in_pretend_byte_enable = (cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in)? cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in :
    -1;

  assign {cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_3,
cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_2,
cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_1,
cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in = ((cpu_0_data_master_dbs_address[1 : 0] == 0))? cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_0 :
    ((cpu_0_data_master_dbs_address[1 : 0] == 1))? cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_1 :
    ((cpu_0_data_master_dbs_address[1 : 0] == 2))? cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_2 :
    cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //AUDIO_SOPC_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module AUDIO_SOPC_clock_0_out_arbitrator (
                                           // inputs:
                                            AUDIO_SOPC_clock_0_out_address,
                                            AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave,
                                            AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave,
                                            AUDIO_SOPC_clock_0_out_read,
                                            AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave,
                                            AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave,
                                            AUDIO_SOPC_clock_0_out_write,
                                            AUDIO_SOPC_clock_0_out_writedata,
                                            clk,
                                            clocks_0_avalon_clocks_slave_readdata_from_sa,
                                            d1_clocks_0_avalon_clocks_slave_end_xfer,
                                            reset_n,

                                           // outputs:
                                            AUDIO_SOPC_clock_0_out_address_to_slave,
                                            AUDIO_SOPC_clock_0_out_readdata,
                                            AUDIO_SOPC_clock_0_out_reset_n,
                                            AUDIO_SOPC_clock_0_out_waitrequest
                                         )
;

  output           AUDIO_SOPC_clock_0_out_address_to_slave;
  output  [  7: 0] AUDIO_SOPC_clock_0_out_readdata;
  output           AUDIO_SOPC_clock_0_out_reset_n;
  output           AUDIO_SOPC_clock_0_out_waitrequest;
  input            AUDIO_SOPC_clock_0_out_address;
  input            AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  input            AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  input            AUDIO_SOPC_clock_0_out_read;
  input            AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  input            AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  input            AUDIO_SOPC_clock_0_out_write;
  input   [  7: 0] AUDIO_SOPC_clock_0_out_writedata;
  input            clk;
  input   [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  input            d1_clocks_0_avalon_clocks_slave_end_xfer;
  input            reset_n;

  reg              AUDIO_SOPC_clock_0_out_address_last_time;
  wire             AUDIO_SOPC_clock_0_out_address_to_slave;
  reg              AUDIO_SOPC_clock_0_out_read_last_time;
  wire    [  7: 0] AUDIO_SOPC_clock_0_out_readdata;
  wire             AUDIO_SOPC_clock_0_out_reset_n;
  wire             AUDIO_SOPC_clock_0_out_run;
  wire             AUDIO_SOPC_clock_0_out_waitrequest;
  reg              AUDIO_SOPC_clock_0_out_write_last_time;
  reg     [  7: 0] AUDIO_SOPC_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave | AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave | ~AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave) & ((~AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave | ~AUDIO_SOPC_clock_0_out_read | (AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave & AUDIO_SOPC_clock_0_out_read))) & ((~AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave | ~(AUDIO_SOPC_clock_0_out_read | AUDIO_SOPC_clock_0_out_write) | (1 & (AUDIO_SOPC_clock_0_out_read | AUDIO_SOPC_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign AUDIO_SOPC_clock_0_out_address_to_slave = AUDIO_SOPC_clock_0_out_address;

  //AUDIO_SOPC_clock_0/out readdata mux, which is an e_mux
  assign AUDIO_SOPC_clock_0_out_readdata = clocks_0_avalon_clocks_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_waitrequest = ~AUDIO_SOPC_clock_0_out_run;

  //AUDIO_SOPC_clock_0_out_reset_n assignment, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //AUDIO_SOPC_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_out_address_last_time <= 0;
      else 
        AUDIO_SOPC_clock_0_out_address_last_time <= AUDIO_SOPC_clock_0_out_address;
    end


  //AUDIO_SOPC_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= AUDIO_SOPC_clock_0_out_waitrequest & (AUDIO_SOPC_clock_0_out_read | AUDIO_SOPC_clock_0_out_write);
    end


  //AUDIO_SOPC_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (AUDIO_SOPC_clock_0_out_address != AUDIO_SOPC_clock_0_out_address_last_time))
        begin
          $write("%0d ns: AUDIO_SOPC_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //AUDIO_SOPC_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_out_read_last_time <= 0;
      else 
        AUDIO_SOPC_clock_0_out_read_last_time <= AUDIO_SOPC_clock_0_out_read;
    end


  //AUDIO_SOPC_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (AUDIO_SOPC_clock_0_out_read != AUDIO_SOPC_clock_0_out_read_last_time))
        begin
          $write("%0d ns: AUDIO_SOPC_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //AUDIO_SOPC_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_out_write_last_time <= 0;
      else 
        AUDIO_SOPC_clock_0_out_write_last_time <= AUDIO_SOPC_clock_0_out_write;
    end


  //AUDIO_SOPC_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (AUDIO_SOPC_clock_0_out_write != AUDIO_SOPC_clock_0_out_write_last_time))
        begin
          $write("%0d ns: AUDIO_SOPC_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //AUDIO_SOPC_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_out_writedata_last_time <= 0;
      else 
        AUDIO_SOPC_clock_0_out_writedata_last_time <= AUDIO_SOPC_clock_0_out_writedata;
    end


  //AUDIO_SOPC_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (AUDIO_SOPC_clock_0_out_writedata != AUDIO_SOPC_clock_0_out_writedata_last_time) & AUDIO_SOPC_clock_0_out_write)
        begin
          $write("%0d ns: AUDIO_SOPC_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SDCARD_avalon_sdcard_slave_arbitrator (
                                               // inputs:
                                                SDCARD_avalon_sdcard_slave_readdata,
                                                SDCARD_avalon_sdcard_slave_waitrequest,
                                                clk,
                                                cpu_0_data_master_address_to_slave,
                                                cpu_0_data_master_byteenable,
                                                cpu_0_data_master_read,
                                                cpu_0_data_master_waitrequest,
                                                cpu_0_data_master_write,
                                                cpu_0_data_master_writedata,
                                                reset_n,

                                               // outputs:
                                                SDCARD_avalon_sdcard_slave_address,
                                                SDCARD_avalon_sdcard_slave_byteenable,
                                                SDCARD_avalon_sdcard_slave_chipselect,
                                                SDCARD_avalon_sdcard_slave_read,
                                                SDCARD_avalon_sdcard_slave_readdata_from_sa,
                                                SDCARD_avalon_sdcard_slave_reset_n,
                                                SDCARD_avalon_sdcard_slave_waitrequest_from_sa,
                                                SDCARD_avalon_sdcard_slave_write,
                                                SDCARD_avalon_sdcard_slave_writedata,
                                                cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave,
                                                cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave,
                                                cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave,
                                                cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave,
                                                d1_SDCARD_avalon_sdcard_slave_end_xfer
                                             )
;

  output  [  7: 0] SDCARD_avalon_sdcard_slave_address;
  output  [  3: 0] SDCARD_avalon_sdcard_slave_byteenable;
  output           SDCARD_avalon_sdcard_slave_chipselect;
  output           SDCARD_avalon_sdcard_slave_read;
  output  [ 31: 0] SDCARD_avalon_sdcard_slave_readdata_from_sa;
  output           SDCARD_avalon_sdcard_slave_reset_n;
  output           SDCARD_avalon_sdcard_slave_waitrequest_from_sa;
  output           SDCARD_avalon_sdcard_slave_write;
  output  [ 31: 0] SDCARD_avalon_sdcard_slave_writedata;
  output           cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave;
  output           cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave;
  output           cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave;
  output           cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave;
  output           d1_SDCARD_avalon_sdcard_slave_end_xfer;
  input   [ 31: 0] SDCARD_avalon_sdcard_slave_readdata;
  input            SDCARD_avalon_sdcard_slave_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  7: 0] SDCARD_avalon_sdcard_slave_address;
  wire             SDCARD_avalon_sdcard_slave_allgrants;
  wire             SDCARD_avalon_sdcard_slave_allow_new_arb_cycle;
  wire             SDCARD_avalon_sdcard_slave_any_bursting_master_saved_grant;
  wire             SDCARD_avalon_sdcard_slave_any_continuerequest;
  wire             SDCARD_avalon_sdcard_slave_arb_counter_enable;
  reg     [  2: 0] SDCARD_avalon_sdcard_slave_arb_share_counter;
  wire    [  2: 0] SDCARD_avalon_sdcard_slave_arb_share_counter_next_value;
  wire    [  2: 0] SDCARD_avalon_sdcard_slave_arb_share_set_values;
  wire             SDCARD_avalon_sdcard_slave_beginbursttransfer_internal;
  wire             SDCARD_avalon_sdcard_slave_begins_xfer;
  wire    [  3: 0] SDCARD_avalon_sdcard_slave_byteenable;
  wire             SDCARD_avalon_sdcard_slave_chipselect;
  wire             SDCARD_avalon_sdcard_slave_end_xfer;
  wire             SDCARD_avalon_sdcard_slave_firsttransfer;
  wire             SDCARD_avalon_sdcard_slave_grant_vector;
  wire             SDCARD_avalon_sdcard_slave_in_a_read_cycle;
  wire             SDCARD_avalon_sdcard_slave_in_a_write_cycle;
  wire             SDCARD_avalon_sdcard_slave_master_qreq_vector;
  wire             SDCARD_avalon_sdcard_slave_non_bursting_master_requests;
  wire             SDCARD_avalon_sdcard_slave_read;
  wire    [ 31: 0] SDCARD_avalon_sdcard_slave_readdata_from_sa;
  reg              SDCARD_avalon_sdcard_slave_reg_firsttransfer;
  wire             SDCARD_avalon_sdcard_slave_reset_n;
  reg              SDCARD_avalon_sdcard_slave_slavearbiterlockenable;
  wire             SDCARD_avalon_sdcard_slave_slavearbiterlockenable2;
  wire             SDCARD_avalon_sdcard_slave_unreg_firsttransfer;
  wire             SDCARD_avalon_sdcard_slave_waitrequest_from_sa;
  wire             SDCARD_avalon_sdcard_slave_waits_for_read;
  wire             SDCARD_avalon_sdcard_slave_waits_for_write;
  wire             SDCARD_avalon_sdcard_slave_write;
  wire    [ 31: 0] SDCARD_avalon_sdcard_slave_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_saved_grant_SDCARD_avalon_sdcard_slave;
  reg              d1_SDCARD_avalon_sdcard_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_SDCARD_avalon_sdcard_slave_from_cpu_0_data_master;
  wire             wait_for_SDCARD_avalon_sdcard_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SDCARD_avalon_sdcard_slave_end_xfer;
    end


  assign SDCARD_avalon_sdcard_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave));
  //assign SDCARD_avalon_sdcard_slave_readdata_from_sa = SDCARD_avalon_sdcard_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_readdata_from_sa = SDCARD_avalon_sdcard_slave_readdata;

  assign cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave = ({cpu_0_data_master_address_to_slave[24 : 10] , 10'b0} == 25'h1101000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign SDCARD_avalon_sdcard_slave_waitrequest_from_sa = SDCARD_avalon_sdcard_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_waitrequest_from_sa = SDCARD_avalon_sdcard_slave_waitrequest;

  //SDCARD_avalon_sdcard_slave_arb_share_counter set values, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_arb_share_set_values = 1;

  //SDCARD_avalon_sdcard_slave_non_bursting_master_requests mux, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_non_bursting_master_requests = cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave;

  //SDCARD_avalon_sdcard_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_any_bursting_master_saved_grant = 0;

  //SDCARD_avalon_sdcard_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_arb_share_counter_next_value = SDCARD_avalon_sdcard_slave_firsttransfer ? (SDCARD_avalon_sdcard_slave_arb_share_set_values - 1) : |SDCARD_avalon_sdcard_slave_arb_share_counter ? (SDCARD_avalon_sdcard_slave_arb_share_counter - 1) : 0;

  //SDCARD_avalon_sdcard_slave_allgrants all slave grants, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_allgrants = |SDCARD_avalon_sdcard_slave_grant_vector;

  //SDCARD_avalon_sdcard_slave_end_xfer assignment, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_end_xfer = ~(SDCARD_avalon_sdcard_slave_waits_for_read | SDCARD_avalon_sdcard_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave = SDCARD_avalon_sdcard_slave_end_xfer & (~SDCARD_avalon_sdcard_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SDCARD_avalon_sdcard_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave & SDCARD_avalon_sdcard_slave_allgrants) | (end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave & ~SDCARD_avalon_sdcard_slave_non_bursting_master_requests);

  //SDCARD_avalon_sdcard_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDCARD_avalon_sdcard_slave_arb_share_counter <= 0;
      else if (SDCARD_avalon_sdcard_slave_arb_counter_enable)
          SDCARD_avalon_sdcard_slave_arb_share_counter <= SDCARD_avalon_sdcard_slave_arb_share_counter_next_value;
    end


  //SDCARD_avalon_sdcard_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDCARD_avalon_sdcard_slave_slavearbiterlockenable <= 0;
      else if ((|SDCARD_avalon_sdcard_slave_master_qreq_vector & end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave) | (end_xfer_arb_share_counter_term_SDCARD_avalon_sdcard_slave & ~SDCARD_avalon_sdcard_slave_non_bursting_master_requests))
          SDCARD_avalon_sdcard_slave_slavearbiterlockenable <= |SDCARD_avalon_sdcard_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master SDCARD/avalon_sdcard_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = SDCARD_avalon_sdcard_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //SDCARD_avalon_sdcard_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_slavearbiterlockenable2 = |SDCARD_avalon_sdcard_slave_arb_share_counter_next_value;

  //cpu_0/data_master SDCARD/avalon_sdcard_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = SDCARD_avalon_sdcard_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //SDCARD_avalon_sdcard_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave = cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //SDCARD_avalon_sdcard_slave_writedata mux, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave = cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave;

  //cpu_0/data_master saved-grant SDCARD/avalon_sdcard_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_SDCARD_avalon_sdcard_slave = cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave;

  //allow new arb cycle for SDCARD/avalon_sdcard_slave, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign SDCARD_avalon_sdcard_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign SDCARD_avalon_sdcard_slave_master_qreq_vector = 1;

  //SDCARD_avalon_sdcard_slave_reset_n assignment, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_reset_n = reset_n;

  assign SDCARD_avalon_sdcard_slave_chipselect = cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave;
  //SDCARD_avalon_sdcard_slave_firsttransfer first transaction, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_firsttransfer = SDCARD_avalon_sdcard_slave_begins_xfer ? SDCARD_avalon_sdcard_slave_unreg_firsttransfer : SDCARD_avalon_sdcard_slave_reg_firsttransfer;

  //SDCARD_avalon_sdcard_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_unreg_firsttransfer = ~(SDCARD_avalon_sdcard_slave_slavearbiterlockenable & SDCARD_avalon_sdcard_slave_any_continuerequest);

  //SDCARD_avalon_sdcard_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDCARD_avalon_sdcard_slave_reg_firsttransfer <= 1'b1;
      else if (SDCARD_avalon_sdcard_slave_begins_xfer)
          SDCARD_avalon_sdcard_slave_reg_firsttransfer <= SDCARD_avalon_sdcard_slave_unreg_firsttransfer;
    end


  //SDCARD_avalon_sdcard_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_beginbursttransfer_internal = SDCARD_avalon_sdcard_slave_begins_xfer;

  //SDCARD_avalon_sdcard_slave_read assignment, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_read = cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave & cpu_0_data_master_read;

  //SDCARD_avalon_sdcard_slave_write assignment, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_write = cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave & cpu_0_data_master_write;

  assign shifted_address_to_SDCARD_avalon_sdcard_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //SDCARD_avalon_sdcard_slave_address mux, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_address = shifted_address_to_SDCARD_avalon_sdcard_slave_from_cpu_0_data_master >> 2;

  //d1_SDCARD_avalon_sdcard_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SDCARD_avalon_sdcard_slave_end_xfer <= 1;
      else 
        d1_SDCARD_avalon_sdcard_slave_end_xfer <= SDCARD_avalon_sdcard_slave_end_xfer;
    end


  //SDCARD_avalon_sdcard_slave_waits_for_read in a cycle, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_waits_for_read = SDCARD_avalon_sdcard_slave_in_a_read_cycle & SDCARD_avalon_sdcard_slave_waitrequest_from_sa;

  //SDCARD_avalon_sdcard_slave_in_a_read_cycle assignment, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_in_a_read_cycle = cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SDCARD_avalon_sdcard_slave_in_a_read_cycle;

  //SDCARD_avalon_sdcard_slave_waits_for_write in a cycle, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_waits_for_write = SDCARD_avalon_sdcard_slave_in_a_write_cycle & SDCARD_avalon_sdcard_slave_waitrequest_from_sa;

  //SDCARD_avalon_sdcard_slave_in_a_write_cycle assignment, which is an e_assign
  assign SDCARD_avalon_sdcard_slave_in_a_write_cycle = cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SDCARD_avalon_sdcard_slave_in_a_write_cycle;

  assign wait_for_SDCARD_avalon_sdcard_slave_counter = 0;
  //SDCARD_avalon_sdcard_slave_byteenable byte enable port mux, which is an e_mux
  assign SDCARD_avalon_sdcard_slave_byteenable = (cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SDCARD/avalon_sdcard_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module audio_avalon_audio_slave_arbitrator (
                                             // inputs:
                                              audio_avalon_audio_slave_irq,
                                              audio_avalon_audio_slave_readdata,
                                              clk,
                                              cpu_0_data_master_address_to_slave,
                                              cpu_0_data_master_read,
                                              cpu_0_data_master_waitrequest,
                                              cpu_0_data_master_write,
                                              cpu_0_data_master_writedata,
                                              reset_n,

                                             // outputs:
                                              audio_avalon_audio_slave_address,
                                              audio_avalon_audio_slave_chipselect,
                                              audio_avalon_audio_slave_irq_from_sa,
                                              audio_avalon_audio_slave_read,
                                              audio_avalon_audio_slave_readdata_from_sa,
                                              audio_avalon_audio_slave_reset,
                                              audio_avalon_audio_slave_write,
                                              audio_avalon_audio_slave_writedata,
                                              cpu_0_data_master_granted_audio_avalon_audio_slave,
                                              cpu_0_data_master_qualified_request_audio_avalon_audio_slave,
                                              cpu_0_data_master_read_data_valid_audio_avalon_audio_slave,
                                              cpu_0_data_master_requests_audio_avalon_audio_slave,
                                              d1_audio_avalon_audio_slave_end_xfer,
                                              registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave
                                           )
;

  output  [  1: 0] audio_avalon_audio_slave_address;
  output           audio_avalon_audio_slave_chipselect;
  output           audio_avalon_audio_slave_irq_from_sa;
  output           audio_avalon_audio_slave_read;
  output  [ 31: 0] audio_avalon_audio_slave_readdata_from_sa;
  output           audio_avalon_audio_slave_reset;
  output           audio_avalon_audio_slave_write;
  output  [ 31: 0] audio_avalon_audio_slave_writedata;
  output           cpu_0_data_master_granted_audio_avalon_audio_slave;
  output           cpu_0_data_master_qualified_request_audio_avalon_audio_slave;
  output           cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  output           cpu_0_data_master_requests_audio_avalon_audio_slave;
  output           d1_audio_avalon_audio_slave_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  input            audio_avalon_audio_slave_irq;
  input   [ 31: 0] audio_avalon_audio_slave_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] audio_avalon_audio_slave_address;
  wire             audio_avalon_audio_slave_allgrants;
  wire             audio_avalon_audio_slave_allow_new_arb_cycle;
  wire             audio_avalon_audio_slave_any_bursting_master_saved_grant;
  wire             audio_avalon_audio_slave_any_continuerequest;
  wire             audio_avalon_audio_slave_arb_counter_enable;
  reg     [  2: 0] audio_avalon_audio_slave_arb_share_counter;
  wire    [  2: 0] audio_avalon_audio_slave_arb_share_counter_next_value;
  wire    [  2: 0] audio_avalon_audio_slave_arb_share_set_values;
  wire             audio_avalon_audio_slave_beginbursttransfer_internal;
  wire             audio_avalon_audio_slave_begins_xfer;
  wire             audio_avalon_audio_slave_chipselect;
  wire             audio_avalon_audio_slave_end_xfer;
  wire             audio_avalon_audio_slave_firsttransfer;
  wire             audio_avalon_audio_slave_grant_vector;
  wire             audio_avalon_audio_slave_in_a_read_cycle;
  wire             audio_avalon_audio_slave_in_a_write_cycle;
  wire             audio_avalon_audio_slave_irq_from_sa;
  wire             audio_avalon_audio_slave_master_qreq_vector;
  wire             audio_avalon_audio_slave_non_bursting_master_requests;
  wire             audio_avalon_audio_slave_read;
  wire    [ 31: 0] audio_avalon_audio_slave_readdata_from_sa;
  reg              audio_avalon_audio_slave_reg_firsttransfer;
  wire             audio_avalon_audio_slave_reset;
  reg              audio_avalon_audio_slave_slavearbiterlockenable;
  wire             audio_avalon_audio_slave_slavearbiterlockenable2;
  wire             audio_avalon_audio_slave_unreg_firsttransfer;
  wire             audio_avalon_audio_slave_waits_for_read;
  wire             audio_avalon_audio_slave_waits_for_write;
  wire             audio_avalon_audio_slave_write;
  wire    [ 31: 0] audio_avalon_audio_slave_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_audio_avalon_audio_slave;
  wire             cpu_0_data_master_qualified_request_audio_avalon_audio_slave;
  wire             cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  reg              cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register_in;
  wire             cpu_0_data_master_requests_audio_avalon_audio_slave;
  wire             cpu_0_data_master_saved_grant_audio_avalon_audio_slave;
  reg              d1_audio_avalon_audio_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_audio_avalon_audio_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  wire    [ 24: 0] shifted_address_to_audio_avalon_audio_slave_from_cpu_0_data_master;
  wire             wait_for_audio_avalon_audio_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~audio_avalon_audio_slave_end_xfer;
    end


  assign audio_avalon_audio_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_audio_avalon_audio_slave));
  //assign audio_avalon_audio_slave_readdata_from_sa = audio_avalon_audio_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_avalon_audio_slave_readdata_from_sa = audio_avalon_audio_slave_readdata;

  assign cpu_0_data_master_requests_audio_avalon_audio_slave = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1101400) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave = cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register_in;

  //audio_avalon_audio_slave_arb_share_counter set values, which is an e_mux
  assign audio_avalon_audio_slave_arb_share_set_values = 1;

  //audio_avalon_audio_slave_non_bursting_master_requests mux, which is an e_mux
  assign audio_avalon_audio_slave_non_bursting_master_requests = cpu_0_data_master_requests_audio_avalon_audio_slave;

  //audio_avalon_audio_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign audio_avalon_audio_slave_any_bursting_master_saved_grant = 0;

  //audio_avalon_audio_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign audio_avalon_audio_slave_arb_share_counter_next_value = audio_avalon_audio_slave_firsttransfer ? (audio_avalon_audio_slave_arb_share_set_values - 1) : |audio_avalon_audio_slave_arb_share_counter ? (audio_avalon_audio_slave_arb_share_counter - 1) : 0;

  //audio_avalon_audio_slave_allgrants all slave grants, which is an e_mux
  assign audio_avalon_audio_slave_allgrants = |audio_avalon_audio_slave_grant_vector;

  //audio_avalon_audio_slave_end_xfer assignment, which is an e_assign
  assign audio_avalon_audio_slave_end_xfer = ~(audio_avalon_audio_slave_waits_for_read | audio_avalon_audio_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_audio_avalon_audio_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_audio_avalon_audio_slave = audio_avalon_audio_slave_end_xfer & (~audio_avalon_audio_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //audio_avalon_audio_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign audio_avalon_audio_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_audio_avalon_audio_slave & audio_avalon_audio_slave_allgrants) | (end_xfer_arb_share_counter_term_audio_avalon_audio_slave & ~audio_avalon_audio_slave_non_bursting_master_requests);

  //audio_avalon_audio_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_avalon_audio_slave_arb_share_counter <= 0;
      else if (audio_avalon_audio_slave_arb_counter_enable)
          audio_avalon_audio_slave_arb_share_counter <= audio_avalon_audio_slave_arb_share_counter_next_value;
    end


  //audio_avalon_audio_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_avalon_audio_slave_slavearbiterlockenable <= 0;
      else if ((|audio_avalon_audio_slave_master_qreq_vector & end_xfer_arb_share_counter_term_audio_avalon_audio_slave) | (end_xfer_arb_share_counter_term_audio_avalon_audio_slave & ~audio_avalon_audio_slave_non_bursting_master_requests))
          audio_avalon_audio_slave_slavearbiterlockenable <= |audio_avalon_audio_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master audio/avalon_audio_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = audio_avalon_audio_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //audio_avalon_audio_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign audio_avalon_audio_slave_slavearbiterlockenable2 = |audio_avalon_audio_slave_arb_share_counter_next_value;

  //cpu_0/data_master audio/avalon_audio_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = audio_avalon_audio_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //audio_avalon_audio_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign audio_avalon_audio_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_audio_avalon_audio_slave = cpu_0_data_master_requests_audio_avalon_audio_slave & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register_in = cpu_0_data_master_granted_audio_avalon_audio_slave & cpu_0_data_master_read & ~audio_avalon_audio_slave_waits_for_read & ~(|cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register = {cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register, cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_audio_avalon_audio_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_avalon_audio_slave = cpu_0_data_master_read_data_valid_audio_avalon_audio_slave_shift_register;

  //audio_avalon_audio_slave_writedata mux, which is an e_mux
  assign audio_avalon_audio_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_audio_avalon_audio_slave = cpu_0_data_master_qualified_request_audio_avalon_audio_slave;

  //cpu_0/data_master saved-grant audio/avalon_audio_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_audio_avalon_audio_slave = cpu_0_data_master_requests_audio_avalon_audio_slave;

  //allow new arb cycle for audio/avalon_audio_slave, which is an e_assign
  assign audio_avalon_audio_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign audio_avalon_audio_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign audio_avalon_audio_slave_master_qreq_vector = 1;

  //~audio_avalon_audio_slave_reset assignment, which is an e_assign
  assign audio_avalon_audio_slave_reset = ~reset_n;

  assign audio_avalon_audio_slave_chipselect = cpu_0_data_master_granted_audio_avalon_audio_slave;
  //audio_avalon_audio_slave_firsttransfer first transaction, which is an e_assign
  assign audio_avalon_audio_slave_firsttransfer = audio_avalon_audio_slave_begins_xfer ? audio_avalon_audio_slave_unreg_firsttransfer : audio_avalon_audio_slave_reg_firsttransfer;

  //audio_avalon_audio_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign audio_avalon_audio_slave_unreg_firsttransfer = ~(audio_avalon_audio_slave_slavearbiterlockenable & audio_avalon_audio_slave_any_continuerequest);

  //audio_avalon_audio_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_avalon_audio_slave_reg_firsttransfer <= 1'b1;
      else if (audio_avalon_audio_slave_begins_xfer)
          audio_avalon_audio_slave_reg_firsttransfer <= audio_avalon_audio_slave_unreg_firsttransfer;
    end


  //audio_avalon_audio_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign audio_avalon_audio_slave_beginbursttransfer_internal = audio_avalon_audio_slave_begins_xfer;

  //audio_avalon_audio_slave_read assignment, which is an e_mux
  assign audio_avalon_audio_slave_read = cpu_0_data_master_granted_audio_avalon_audio_slave & cpu_0_data_master_read;

  //audio_avalon_audio_slave_write assignment, which is an e_mux
  assign audio_avalon_audio_slave_write = cpu_0_data_master_granted_audio_avalon_audio_slave & cpu_0_data_master_write;

  assign shifted_address_to_audio_avalon_audio_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //audio_avalon_audio_slave_address mux, which is an e_mux
  assign audio_avalon_audio_slave_address = shifted_address_to_audio_avalon_audio_slave_from_cpu_0_data_master >> 2;

  //d1_audio_avalon_audio_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_audio_avalon_audio_slave_end_xfer <= 1;
      else 
        d1_audio_avalon_audio_slave_end_xfer <= audio_avalon_audio_slave_end_xfer;
    end


  //audio_avalon_audio_slave_waits_for_read in a cycle, which is an e_mux
  assign audio_avalon_audio_slave_waits_for_read = audio_avalon_audio_slave_in_a_read_cycle & 0;

  //audio_avalon_audio_slave_in_a_read_cycle assignment, which is an e_assign
  assign audio_avalon_audio_slave_in_a_read_cycle = cpu_0_data_master_granted_audio_avalon_audio_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = audio_avalon_audio_slave_in_a_read_cycle;

  //audio_avalon_audio_slave_waits_for_write in a cycle, which is an e_mux
  assign audio_avalon_audio_slave_waits_for_write = audio_avalon_audio_slave_in_a_write_cycle & 0;

  //audio_avalon_audio_slave_in_a_write_cycle assignment, which is an e_assign
  assign audio_avalon_audio_slave_in_a_write_cycle = cpu_0_data_master_granted_audio_avalon_audio_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = audio_avalon_audio_slave_in_a_write_cycle;

  assign wait_for_audio_avalon_audio_slave_counter = 0;
  //assign audio_avalon_audio_slave_irq_from_sa = audio_avalon_audio_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_avalon_audio_slave_irq_from_sa = audio_avalon_audio_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //audio/avalon_audio_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module audio_and_video_config_0_avalon_av_config_slave_arbitrator (
                                                                    // inputs:
                                                                     audio_and_video_config_0_avalon_av_config_slave_readdata,
                                                                     audio_and_video_config_0_avalon_av_config_slave_waitrequest,
                                                                     clk,
                                                                     cpu_0_data_master_address_to_slave,
                                                                     cpu_0_data_master_byteenable,
                                                                     cpu_0_data_master_read,
                                                                     cpu_0_data_master_waitrequest,
                                                                     cpu_0_data_master_write,
                                                                     cpu_0_data_master_writedata,
                                                                     reset_n,

                                                                    // outputs:
                                                                     audio_and_video_config_0_avalon_av_config_slave_address,
                                                                     audio_and_video_config_0_avalon_av_config_slave_byteenable,
                                                                     audio_and_video_config_0_avalon_av_config_slave_read,
                                                                     audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa,
                                                                     audio_and_video_config_0_avalon_av_config_slave_reset,
                                                                     audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa,
                                                                     audio_and_video_config_0_avalon_av_config_slave_write,
                                                                     audio_and_video_config_0_avalon_av_config_slave_writedata,
                                                                     cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave,
                                                                     cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave,
                                                                     cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave,
                                                                     cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave,
                                                                     d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer,
                                                                     registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave
                                                                  )
;

  output  [  1: 0] audio_and_video_config_0_avalon_av_config_slave_address;
  output  [  3: 0] audio_and_video_config_0_avalon_av_config_slave_byteenable;
  output           audio_and_video_config_0_avalon_av_config_slave_read;
  output  [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;
  output           audio_and_video_config_0_avalon_av_config_slave_reset;
  output           audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;
  output           audio_and_video_config_0_avalon_av_config_slave_write;
  output  [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_writedata;
  output           cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave;
  output           cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  output           cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  output           cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave;
  output           d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  input   [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata;
  input            audio_and_video_config_0_avalon_av_config_slave_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] audio_and_video_config_0_avalon_av_config_slave_address;
  wire             audio_and_video_config_0_avalon_av_config_slave_allgrants;
  wire             audio_and_video_config_0_avalon_av_config_slave_allow_new_arb_cycle;
  wire             audio_and_video_config_0_avalon_av_config_slave_any_bursting_master_saved_grant;
  wire             audio_and_video_config_0_avalon_av_config_slave_any_continuerequest;
  wire             audio_and_video_config_0_avalon_av_config_slave_arb_counter_enable;
  reg     [  2: 0] audio_and_video_config_0_avalon_av_config_slave_arb_share_counter;
  wire    [  2: 0] audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value;
  wire    [  2: 0] audio_and_video_config_0_avalon_av_config_slave_arb_share_set_values;
  wire             audio_and_video_config_0_avalon_av_config_slave_beginbursttransfer_internal;
  wire             audio_and_video_config_0_avalon_av_config_slave_begins_xfer;
  wire    [  3: 0] audio_and_video_config_0_avalon_av_config_slave_byteenable;
  wire             audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  wire             audio_and_video_config_0_avalon_av_config_slave_firsttransfer;
  wire             audio_and_video_config_0_avalon_av_config_slave_grant_vector;
  wire             audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle;
  wire             audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle;
  wire             audio_and_video_config_0_avalon_av_config_slave_master_qreq_vector;
  wire             audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests;
  wire             audio_and_video_config_0_avalon_av_config_slave_read;
  wire    [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;
  reg              audio_and_video_config_0_avalon_av_config_slave_reg_firsttransfer;
  wire             audio_and_video_config_0_avalon_av_config_slave_reset;
  reg              audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable;
  wire             audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2;
  wire             audio_and_video_config_0_avalon_av_config_slave_unreg_firsttransfer;
  wire             audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;
  wire             audio_and_video_config_0_avalon_av_config_slave_waits_for_read;
  wire             audio_and_video_config_0_avalon_av_config_slave_waits_for_write;
  wire             audio_and_video_config_0_avalon_av_config_slave_write;
  wire    [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  reg              cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in;
  wire             cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_saved_grant_audio_and_video_config_0_avalon_av_config_slave;
  reg              d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  wire    [ 24: 0] shifted_address_to_audio_and_video_config_0_avalon_av_config_slave_from_cpu_0_data_master;
  wire             wait_for_audio_and_video_config_0_avalon_av_config_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~audio_and_video_config_0_avalon_av_config_slave_end_xfer;
    end


  assign audio_and_video_config_0_avalon_av_config_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave));
  //assign audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa = audio_and_video_config_0_avalon_av_config_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa = audio_and_video_config_0_avalon_av_config_slave_readdata;

  assign cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1101410) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa = audio_and_video_config_0_avalon_av_config_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa = audio_and_video_config_0_avalon_av_config_slave_waitrequest;

  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave = cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in;

  //audio_and_video_config_0_avalon_av_config_slave_arb_share_counter set values, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_arb_share_set_values = 1;

  //audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests = cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave;

  //audio_and_video_config_0_avalon_av_config_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_any_bursting_master_saved_grant = 0;

  //audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value = audio_and_video_config_0_avalon_av_config_slave_firsttransfer ? (audio_and_video_config_0_avalon_av_config_slave_arb_share_set_values - 1) : |audio_and_video_config_0_avalon_av_config_slave_arb_share_counter ? (audio_and_video_config_0_avalon_av_config_slave_arb_share_counter - 1) : 0;

  //audio_and_video_config_0_avalon_av_config_slave_allgrants all slave grants, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_allgrants = |audio_and_video_config_0_avalon_av_config_slave_grant_vector;

  //audio_and_video_config_0_avalon_av_config_slave_end_xfer assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_end_xfer = ~(audio_and_video_config_0_avalon_av_config_slave_waits_for_read | audio_and_video_config_0_avalon_av_config_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave = audio_and_video_config_0_avalon_av_config_slave_end_xfer & (~audio_and_video_config_0_avalon_av_config_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //audio_and_video_config_0_avalon_av_config_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave & audio_and_video_config_0_avalon_av_config_slave_allgrants) | (end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave & ~audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests);

  //audio_and_video_config_0_avalon_av_config_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_and_video_config_0_avalon_av_config_slave_arb_share_counter <= 0;
      else if (audio_and_video_config_0_avalon_av_config_slave_arb_counter_enable)
          audio_and_video_config_0_avalon_av_config_slave_arb_share_counter <= audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value;
    end


  //audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable <= 0;
      else if ((|audio_and_video_config_0_avalon_av_config_slave_master_qreq_vector & end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave) | (end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave & ~audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests))
          audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable <= |audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master audio_and_video_config_0/avalon_av_config_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2 = |audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value;

  //cpu_0/data_master audio_and_video_config_0/avalon_av_config_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //audio_and_video_config_0_avalon_av_config_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave = cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in = cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave & cpu_0_data_master_read & ~audio_and_video_config_0_avalon_av_config_slave_waits_for_read & ~(|cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register = {cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register, cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave = cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;

  //audio_and_video_config_0_avalon_av_config_slave_writedata mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave = cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave;

  //cpu_0/data_master saved-grant audio_and_video_config_0/avalon_av_config_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_audio_and_video_config_0_avalon_av_config_slave = cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave;

  //allow new arb cycle for audio_and_video_config_0/avalon_av_config_slave, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign audio_and_video_config_0_avalon_av_config_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign audio_and_video_config_0_avalon_av_config_slave_master_qreq_vector = 1;

  //~audio_and_video_config_0_avalon_av_config_slave_reset assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_reset = ~reset_n;

  //audio_and_video_config_0_avalon_av_config_slave_firsttransfer first transaction, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_firsttransfer = audio_and_video_config_0_avalon_av_config_slave_begins_xfer ? audio_and_video_config_0_avalon_av_config_slave_unreg_firsttransfer : audio_and_video_config_0_avalon_av_config_slave_reg_firsttransfer;

  //audio_and_video_config_0_avalon_av_config_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_unreg_firsttransfer = ~(audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable & audio_and_video_config_0_avalon_av_config_slave_any_continuerequest);

  //audio_and_video_config_0_avalon_av_config_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_and_video_config_0_avalon_av_config_slave_reg_firsttransfer <= 1'b1;
      else if (audio_and_video_config_0_avalon_av_config_slave_begins_xfer)
          audio_and_video_config_0_avalon_av_config_slave_reg_firsttransfer <= audio_and_video_config_0_avalon_av_config_slave_unreg_firsttransfer;
    end


  //audio_and_video_config_0_avalon_av_config_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_beginbursttransfer_internal = audio_and_video_config_0_avalon_av_config_slave_begins_xfer;

  //audio_and_video_config_0_avalon_av_config_slave_read assignment, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_read = cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave & cpu_0_data_master_read;

  //audio_and_video_config_0_avalon_av_config_slave_write assignment, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_write = cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave & cpu_0_data_master_write;

  assign shifted_address_to_audio_and_video_config_0_avalon_av_config_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //audio_and_video_config_0_avalon_av_config_slave_address mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_address = shifted_address_to_audio_and_video_config_0_avalon_av_config_slave_from_cpu_0_data_master >> 2;

  //d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer <= 1;
      else 
        d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer <= audio_and_video_config_0_avalon_av_config_slave_end_xfer;
    end


  //audio_and_video_config_0_avalon_av_config_slave_waits_for_read in a cycle, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_waits_for_read = audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle & audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;

  //audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle = cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle;

  //audio_and_video_config_0_avalon_av_config_slave_waits_for_write in a cycle, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_waits_for_write = audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle & audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;

  //audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle = cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle;

  assign wait_for_audio_and_video_config_0_avalon_av_config_slave_counter = 0;
  //audio_and_video_config_0_avalon_av_config_slave_byteenable byte enable port mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_byteenable = (cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //audio_and_video_config_0/avalon_av_config_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clocks_0_avalon_clocks_slave_arbitrator (
                                                 // inputs:
                                                  AUDIO_SOPC_clock_0_out_address_to_slave,
                                                  AUDIO_SOPC_clock_0_out_read,
                                                  AUDIO_SOPC_clock_0_out_write,
                                                  clk,
                                                  clocks_0_avalon_clocks_slave_readdata,
                                                  reset_n,

                                                 // outputs:
                                                  AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave,
                                                  AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave,
                                                  AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave,
                                                  AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave,
                                                  clocks_0_avalon_clocks_slave_address,
                                                  clocks_0_avalon_clocks_slave_readdata_from_sa,
                                                  d1_clocks_0_avalon_clocks_slave_end_xfer
                                               )
;

  output           AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  output           AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  output           AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  output           AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  output           clocks_0_avalon_clocks_slave_address;
  output  [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  output           d1_clocks_0_avalon_clocks_slave_end_xfer;
  input            AUDIO_SOPC_clock_0_out_address_to_slave;
  input            AUDIO_SOPC_clock_0_out_read;
  input            AUDIO_SOPC_clock_0_out_write;
  input            clk;
  input   [  7: 0] clocks_0_avalon_clocks_slave_readdata;
  input            reset_n;

  wire             AUDIO_SOPC_clock_0_out_arbiterlock;
  wire             AUDIO_SOPC_clock_0_out_arbiterlock2;
  wire             AUDIO_SOPC_clock_0_out_continuerequest;
  wire             AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  wire             AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  wire             AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  reg              AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  wire             AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in;
  wire             AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  wire             AUDIO_SOPC_clock_0_out_saved_grant_clocks_0_avalon_clocks_slave;
  wire             clocks_0_avalon_clocks_slave_address;
  wire             clocks_0_avalon_clocks_slave_allgrants;
  wire             clocks_0_avalon_clocks_slave_allow_new_arb_cycle;
  wire             clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant;
  wire             clocks_0_avalon_clocks_slave_any_continuerequest;
  wire             clocks_0_avalon_clocks_slave_arb_counter_enable;
  reg              clocks_0_avalon_clocks_slave_arb_share_counter;
  wire             clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
  wire             clocks_0_avalon_clocks_slave_arb_share_set_values;
  wire             clocks_0_avalon_clocks_slave_beginbursttransfer_internal;
  wire             clocks_0_avalon_clocks_slave_begins_xfer;
  wire             clocks_0_avalon_clocks_slave_end_xfer;
  wire             clocks_0_avalon_clocks_slave_firsttransfer;
  wire             clocks_0_avalon_clocks_slave_grant_vector;
  wire             clocks_0_avalon_clocks_slave_in_a_read_cycle;
  wire             clocks_0_avalon_clocks_slave_in_a_write_cycle;
  wire             clocks_0_avalon_clocks_slave_master_qreq_vector;
  wire             clocks_0_avalon_clocks_slave_non_bursting_master_requests;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  reg              clocks_0_avalon_clocks_slave_reg_firsttransfer;
  reg              clocks_0_avalon_clocks_slave_slavearbiterlockenable;
  wire             clocks_0_avalon_clocks_slave_slavearbiterlockenable2;
  wire             clocks_0_avalon_clocks_slave_unreg_firsttransfer;
  wire             clocks_0_avalon_clocks_slave_waits_for_read;
  wire             clocks_0_avalon_clocks_slave_waits_for_write;
  reg              d1_clocks_0_avalon_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  wire             wait_for_clocks_0_avalon_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clocks_0_avalon_clocks_slave_end_xfer;
    end


  assign clocks_0_avalon_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave));
  //assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata;

  assign AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave = ((1) & (AUDIO_SOPC_clock_0_out_read | AUDIO_SOPC_clock_0_out_write)) & AUDIO_SOPC_clock_0_out_read;
  //clocks_0_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  assign clocks_0_avalon_clocks_slave_arb_share_set_values = 1;

  //clocks_0_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_non_bursting_master_requests = AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave;

  //clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant = 0;

  //clocks_0_avalon_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_arb_share_counter_next_value = clocks_0_avalon_clocks_slave_firsttransfer ? (clocks_0_avalon_clocks_slave_arb_share_set_values - 1) : |clocks_0_avalon_clocks_slave_arb_share_counter ? (clocks_0_avalon_clocks_slave_arb_share_counter - 1) : 0;

  //clocks_0_avalon_clocks_slave_allgrants all slave grants, which is an e_mux
  assign clocks_0_avalon_clocks_slave_allgrants = |clocks_0_avalon_clocks_slave_grant_vector;

  //clocks_0_avalon_clocks_slave_end_xfer assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_end_xfer = ~(clocks_0_avalon_clocks_slave_waits_for_read | clocks_0_avalon_clocks_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave = clocks_0_avalon_clocks_slave_end_xfer & (~clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //clocks_0_avalon_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign clocks_0_avalon_clocks_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave & clocks_0_avalon_clocks_slave_allgrants) | (end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave & ~clocks_0_avalon_clocks_slave_non_bursting_master_requests);

  //clocks_0_avalon_clocks_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_0_avalon_clocks_slave_arb_share_counter <= 0;
      else if (clocks_0_avalon_clocks_slave_arb_counter_enable)
          clocks_0_avalon_clocks_slave_arb_share_counter <= clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //clocks_0_avalon_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_0_avalon_clocks_slave_slavearbiterlockenable <= 0;
      else if ((|clocks_0_avalon_clocks_slave_master_qreq_vector & end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave) | (end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave & ~clocks_0_avalon_clocks_slave_non_bursting_master_requests))
          clocks_0_avalon_clocks_slave_slavearbiterlockenable <= |clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //AUDIO_SOPC_clock_0/out clocks_0/avalon_clocks_slave arbiterlock, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_arbiterlock = clocks_0_avalon_clocks_slave_slavearbiterlockenable & AUDIO_SOPC_clock_0_out_continuerequest;

  //clocks_0_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clocks_0_avalon_clocks_slave_slavearbiterlockenable2 = |clocks_0_avalon_clocks_slave_arb_share_counter_next_value;

  //AUDIO_SOPC_clock_0/out clocks_0/avalon_clocks_slave arbiterlock2, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_arbiterlock2 = clocks_0_avalon_clocks_slave_slavearbiterlockenable2 & AUDIO_SOPC_clock_0_out_continuerequest;

  //clocks_0_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign clocks_0_avalon_clocks_slave_any_continuerequest = 1;

  //AUDIO_SOPC_clock_0_out_continuerequest continued request, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_continuerequest = 1;

  assign AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave = AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave & ~((AUDIO_SOPC_clock_0_out_read & ((|AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register))));
  //AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in = AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave & AUDIO_SOPC_clock_0_out_read & ~clocks_0_avalon_clocks_slave_waits_for_read & ~(|AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register);

  //shift register p1 AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register = {AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register, AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in};

  //AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= 0;
      else 
        AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= p1_AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
    end


  //local readdatavalid AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave, which is an e_mux
  assign AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave = AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;

  //master is always granted when requested
  assign AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave = AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;

  //AUDIO_SOPC_clock_0/out saved-grant clocks_0/avalon_clocks_slave, which is an e_assign
  assign AUDIO_SOPC_clock_0_out_saved_grant_clocks_0_avalon_clocks_slave = AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave;

  //allow new arb cycle for clocks_0/avalon_clocks_slave, which is an e_assign
  assign clocks_0_avalon_clocks_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign clocks_0_avalon_clocks_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign clocks_0_avalon_clocks_slave_master_qreq_vector = 1;

  //clocks_0_avalon_clocks_slave_firsttransfer first transaction, which is an e_assign
  assign clocks_0_avalon_clocks_slave_firsttransfer = clocks_0_avalon_clocks_slave_begins_xfer ? clocks_0_avalon_clocks_slave_unreg_firsttransfer : clocks_0_avalon_clocks_slave_reg_firsttransfer;

  //clocks_0_avalon_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign clocks_0_avalon_clocks_slave_unreg_firsttransfer = ~(clocks_0_avalon_clocks_slave_slavearbiterlockenable & clocks_0_avalon_clocks_slave_any_continuerequest);

  //clocks_0_avalon_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_0_avalon_clocks_slave_reg_firsttransfer <= 1'b1;
      else if (clocks_0_avalon_clocks_slave_begins_xfer)
          clocks_0_avalon_clocks_slave_reg_firsttransfer <= clocks_0_avalon_clocks_slave_unreg_firsttransfer;
    end


  //clocks_0_avalon_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign clocks_0_avalon_clocks_slave_beginbursttransfer_internal = clocks_0_avalon_clocks_slave_begins_xfer;

  //clocks_0_avalon_clocks_slave_address mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_address = AUDIO_SOPC_clock_0_out_address_to_slave;

  //d1_clocks_0_avalon_clocks_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_clocks_0_avalon_clocks_slave_end_xfer <= 1;
      else 
        d1_clocks_0_avalon_clocks_slave_end_xfer <= clocks_0_avalon_clocks_slave_end_xfer;
    end


  //clocks_0_avalon_clocks_slave_waits_for_read in a cycle, which is an e_mux
  assign clocks_0_avalon_clocks_slave_waits_for_read = clocks_0_avalon_clocks_slave_in_a_read_cycle & 0;

  //clocks_0_avalon_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_in_a_read_cycle = AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave & AUDIO_SOPC_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clocks_0_avalon_clocks_slave_in_a_read_cycle;

  //clocks_0_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign clocks_0_avalon_clocks_slave_waits_for_write = clocks_0_avalon_clocks_slave_in_a_write_cycle & 0;

  //clocks_0_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_in_a_write_cycle = AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave & AUDIO_SOPC_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = clocks_0_avalon_clocks_slave_in_a_write_cycle;

  assign wait_for_clocks_0_avalon_clocks_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clocks_0/avalon_clocks_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_waitrequest,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_read,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_0_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1100800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1100800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~(cpu_0_data_master_arbiterlock);
  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       AUDIO_SOPC_clock_0_in_readdata_from_sa,
                                       AUDIO_SOPC_clock_0_in_waitrequest_from_sa,
                                       SDCARD_avalon_sdcard_slave_readdata_from_sa,
                                       SDCARD_avalon_sdcard_slave_waitrequest_from_sa,
                                       audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa,
                                       audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa,
                                       audio_avalon_audio_slave_irq_from_sa,
                                       audio_avalon_audio_slave_readdata_from_sa,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in,
                                       cpu_0_data_master_byteenable_sdram_0_s1,
                                       cpu_0_data_master_byteenable_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in,
                                       cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave,
                                       cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave,
                                       cpu_0_data_master_granted_audio_avalon_audio_slave,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_sdram_0_s1,
                                       cpu_0_data_master_granted_sounds_ids_s1,
                                       cpu_0_data_master_granted_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_granted_start_sound_s1,
                                       cpu_0_data_master_granted_sysid_control_slave,
                                       cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in,
                                       cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave,
                                       cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave,
                                       cpu_0_data_master_qualified_request_audio_avalon_audio_slave,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_sdram_0_s1,
                                       cpu_0_data_master_qualified_request_sounds_ids_s1,
                                       cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_qualified_request_start_sound_s1,
                                       cpu_0_data_master_qualified_request_sysid_control_slave,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in,
                                       cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave,
                                       cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave,
                                       cpu_0_data_master_read_data_valid_audio_avalon_audio_slave,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_read_data_valid_sounds_ids_s1,
                                       cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
                                       cpu_0_data_master_read_data_valid_start_sound_s1,
                                       cpu_0_data_master_read_data_valid_sysid_control_slave,
                                       cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in,
                                       cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave,
                                       cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave,
                                       cpu_0_data_master_requests_audio_avalon_audio_slave,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_sdram_0_s1,
                                       cpu_0_data_master_requests_sounds_ids_s1,
                                       cpu_0_data_master_requests_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_requests_start_sound_s1,
                                       cpu_0_data_master_requests_sysid_control_slave,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_AUDIO_SOPC_clock_0_in_end_xfer,
                                       d1_SDCARD_avalon_sdcard_slave_end_xfer,
                                       d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer,
                                       d1_audio_avalon_audio_slave_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_sdram_0_s1_end_xfer,
                                       d1_sounds_ids_s1_end_xfer,
                                       d1_sram_0_avalon_sram_slave_end_xfer,
                                       d1_start_sound_s1_end_xfer,
                                       d1_sysid_control_slave_end_xfer,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave,
                                       registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave,
                                       reset_n,
                                       sdram_0_s1_readdata_from_sa,
                                       sdram_0_s1_waitrequest_from_sa,
                                       sounds_ids_s1_readdata_from_sa,
                                       sram_0_avalon_sram_slave_readdata_from_sa,
                                       start_sound_s1_readdata_from_sa,
                                       sysid_control_slave_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_dbs_write_8,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_no_byte_enables_and_last_term,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 24: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output  [  7: 0] cpu_0_data_master_dbs_write_8;
  output  [ 31: 0] cpu_0_data_master_irq;
  output           cpu_0_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input   [  7: 0] AUDIO_SOPC_clock_0_in_readdata_from_sa;
  input            AUDIO_SOPC_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] SDCARD_avalon_sdcard_slave_readdata_from_sa;
  input            SDCARD_avalon_sdcard_slave_waitrequest_from_sa;
  input   [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;
  input            audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;
  input            audio_avalon_audio_slave_irq_from_sa;
  input   [ 31: 0] audio_avalon_audio_slave_readdata_from_sa;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in;
  input   [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  input   [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in;
  input            cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave;
  input            cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave;
  input            cpu_0_data_master_granted_audio_avalon_audio_slave;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_sdram_0_s1;
  input            cpu_0_data_master_granted_sounds_ids_s1;
  input            cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_granted_start_sound_s1;
  input            cpu_0_data_master_granted_sysid_control_slave;
  input            cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in;
  input            cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave;
  input            cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  input            cpu_0_data_master_qualified_request_audio_avalon_audio_slave;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_sdram_0_s1;
  input            cpu_0_data_master_qualified_request_sounds_ids_s1;
  input            cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_qualified_request_start_sound_s1;
  input            cpu_0_data_master_qualified_request_sysid_control_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in;
  input            cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave;
  input            cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  input            cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_read_data_valid_sounds_ids_s1;
  input            cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  input            cpu_0_data_master_read_data_valid_start_sound_s1;
  input            cpu_0_data_master_read_data_valid_sysid_control_slave;
  input            cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in;
  input            cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave;
  input            cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave;
  input            cpu_0_data_master_requests_audio_avalon_audio_slave;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_sdram_0_s1;
  input            cpu_0_data_master_requests_sounds_ids_s1;
  input            cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_requests_start_sound_s1;
  input            cpu_0_data_master_requests_sysid_control_slave;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_AUDIO_SOPC_clock_0_in_end_xfer;
  input            d1_SDCARD_avalon_sdcard_slave_end_xfer;
  input            d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  input            d1_audio_avalon_audio_slave_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_sounds_ids_s1_end_xfer;
  input            d1_sram_0_avalon_sram_slave_end_xfer;
  input            d1_start_sound_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input            registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  input            registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [  3: 0] sounds_ids_s1_readdata_from_sa;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  input            start_sound_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;

  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [  7: 0] cpu_0_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_0_data_master_irq;
  reg              cpu_0_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_cpu_0_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  reg     [ 31: 0] registered_cpu_0_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in | ((cpu_0_data_master_write & !cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in & cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0])) | ~cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in)) & ((~cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in | ~cpu_0_data_master_read | (1 & ~AUDIO_SOPC_clock_0_in_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in | ~cpu_0_data_master_write | (1 & ~AUDIO_SOPC_clock_0_in_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave | ~cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave) & ((~cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~SDCARD_avalon_sdcard_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~SDCARD_avalon_sdcard_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_audio_avalon_audio_slave | registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave | ~cpu_0_data_master_requests_audio_avalon_audio_slave) & ((~cpu_0_data_master_qualified_request_audio_avalon_audio_slave | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_audio_avalon_audio_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave | registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave | ~cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave) & ((~cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_sdram_0_s1 | (cpu_0_data_master_read_data_valid_sdram_0_s1 & cpu_0_data_master_dbs_address[1]) | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sdram_0_s1) & (cpu_0_data_master_granted_sdram_0_s1 | ~cpu_0_data_master_qualified_request_sdram_0_s1) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_read | (cpu_0_data_master_read_data_valid_sdram_0_s1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_write | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_sounds_ids_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sounds_ids_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave & cpu_0_data_master_dbs_address[1]) | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalon_sram_slave & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sram_0_avalon_sram_slave) & (cpu_0_data_master_granted_sram_0_avalon_sram_slave | ~cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave) & ((~cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_data_master_read | (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_start_sound_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_0_data_master_qualified_request_start_sound_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[24 : 0];

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_0_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in)? (((cpu_0_data_master_dbs_address == 2'b11) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in)) :
    (cpu_0_data_master_requests_sdram_0_s1)? (((cpu_0_data_master_dbs_address == 2'b10) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1)) :
    (((cpu_0_data_master_dbs_address == 2'b10) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalon_sram_slave));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in & cpu_0_data_master_write & !cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in)) |
    (cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in & cpu_0_data_master_read & 1 & 1 & ~AUDIO_SOPC_clock_0_in_waitrequest_from_sa) |
    (cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in & cpu_0_data_master_write & 1 & 1 & ~AUDIO_SOPC_clock_0_in_waitrequest_from_sa) |
    (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_sdram_0_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1)) |
    cpu_0_data_master_read_data_valid_sdram_0_s1 |
    (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_sram_0_avalon_sram_slave & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalon_sram_slave)) |
    cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave |
    (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_write & 1 & 1);

  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = AUDIO_SOPC_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = AUDIO_SOPC_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = AUDIO_SOPC_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_0_data_master_readdata <= 0;
      else 
        registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in}} | {AUDIO_SOPC_clock_0_in_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave}} | SDCARD_avalon_sdcard_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_0_data_master_requests_sram_0_avalon_sram_slave}} | {sram_0_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_audio_avalon_audio_slave}} | audio_avalon_audio_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave}} | audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_sdram_0_s1}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_sounds_ids_s1}} | sounds_ids_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_sram_0_avalon_sram_slave}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_start_sound_s1}} | start_sound_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa);

  //mux write dbs 2, which is an e_mux
  assign cpu_0_data_master_dbs_write_8 = ((cpu_0_data_master_dbs_address[1 : 0] == 0))? cpu_0_data_master_writedata[7 : 0] :
    ((cpu_0_data_master_dbs_address[1 : 0] == 1))? cpu_0_data_master_writedata[15 : 8] :
    ((cpu_0_data_master_dbs_address[1 : 0] == 2))? cpu_0_data_master_writedata[23 : 16] :
    cpu_0_data_master_writedata[31 : 24];

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in)? 1 :
    (cpu_0_data_master_requests_sdram_0_s1)? 2 :
    (cpu_0_data_master_requests_sram_0_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in & ~cpu_0_data_master_waitrequest)) &
    (~(cpu_0_data_master_requests_sdram_0_s1 & ~cpu_0_data_master_waitrequest)) &
    (~(cpu_0_data_master_requests_sram_0_avalon_sram_slave & ~cpu_0_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    audio_avalon_audio_slave_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa};

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_0_data_master_requests_sdram_0_s1)? sdram_0_s1_readdata_from_sa :
    sram_0_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    (~(cpu_0_data_master_dbs_address[1]))? cpu_0_data_master_writedata[15 : 0] :
    (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_sdram_0_s1,
                                              cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                              cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_sdram_0_s1,
                                              cpu_0_instruction_master_requests_sram_0_avalon_sram_slave,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_sdram_0_s1_end_xfer,
                                              d1_sram_0_avalon_sram_slave_end_xfer,
                                              reset_n,
                                              sdram_0_s1_readdata_from_sa,
                                              sdram_0_s1_waitrequest_from_sa,
                                              sram_0_avalon_sram_slave_readdata_from_sa,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 24: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_sdram_0_s1;
  input            cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_sdram_0_s1;
  input            cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  input            cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_sdram_0_s1;
  input            cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_sram_0_avalon_sram_slave_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_0_instruction_master_dbs_address;
  wire    [  1: 0] cpu_0_instruction_master_dbs_increment;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_sdram_0_s1 | (cpu_0_instruction_master_read_data_valid_sdram_0_s1 & cpu_0_instruction_master_dbs_address[1]) | ~cpu_0_instruction_master_requests_sdram_0_s1) & (cpu_0_instruction_master_granted_sdram_0_s1 | ~cpu_0_instruction_master_qualified_request_sdram_0_s1) & ((~cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_sdram_0_s1 & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave | (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave & cpu_0_instruction_master_dbs_address[1]) | ~cpu_0_instruction_master_requests_sram_0_avalon_sram_slave) & (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave | ~cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave) & ((~cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[24 : 0];

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_0_instruction_master_requests_sram_0_avalon_sram_slave}} | {sram_0_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_0_instruction_master_requests_sdram_0_s1)? sdram_0_s1_readdata_from_sa :
    sram_0_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_requests_sram_0_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_instruction_master_dbs_address + cpu_0_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_0_instruction_master_read_data_valid_sdram_0_s1 |
    cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_waitrequest,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1101420) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module (
                                                             // inputs:
                                                              clear_fifo,
                                                              clk,
                                                              data_in,
                                                              read,
                                                              reset_n,
                                                              sync_reset,
                                                              write,

                                                             // outputs:
                                                              data_out,
                                                              empty,
                                                              fifo_contains_ones_n,
                                                              full
                                                           )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_byteenable,
                                cpu_0_data_master_dbs_address,
                                cpu_0_data_master_dbs_write_16,
                                cpu_0_data_master_no_byte_enables_and_last_term,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_instruction_master_address_to_slave,
                                cpu_0_instruction_master_dbs_address,
                                cpu_0_instruction_master_read,
                                reset_n,
                                sdram_0_s1_readdata,
                                sdram_0_s1_readdatavalid,
                                sdram_0_s1_waitrequest,

                               // outputs:
                                cpu_0_data_master_byteenable_sdram_0_s1,
                                cpu_0_data_master_granted_sdram_0_s1,
                                cpu_0_data_master_qualified_request_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_requests_sdram_0_s1,
                                cpu_0_instruction_master_granted_sdram_0_s1,
                                cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_instruction_master_requests_sdram_0_s1,
                                d1_sdram_0_s1_end_xfer,
                                sdram_0_s1_address,
                                sdram_0_s1_byteenable_n,
                                sdram_0_s1_chipselect,
                                sdram_0_s1_read_n,
                                sdram_0_s1_readdata_from_sa,
                                sdram_0_s1_reset_n,
                                sdram_0_s1_waitrequest_from_sa,
                                sdram_0_s1_write_n,
                                sdram_0_s1_writedata
                             )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  output           cpu_0_data_master_granted_sdram_0_s1;
  output           cpu_0_data_master_qualified_request_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_data_master_requests_sdram_0_s1;
  output           cpu_0_instruction_master_granted_sdram_0_s1;
  output           cpu_0_instruction_master_qualified_request_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_instruction_master_requests_sdram_0_s1;
  output           d1_sdram_0_s1_end_xfer;
  output  [ 21: 0] sdram_0_s1_address;
  output  [  1: 0] sdram_0_s1_byteenable_n;
  output           sdram_0_s1_chipselect;
  output           sdram_0_s1_read_n;
  output  [ 15: 0] sdram_0_s1_readdata_from_sa;
  output           sdram_0_s1_reset_n;
  output           sdram_0_s1_waitrequest_from_sa;
  output           sdram_0_s1_write_n;
  output  [ 15: 0] sdram_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata;
  input            sdram_0_s1_readdatavalid;
  input            sdram_0_s1_waitrequest;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_saved_grant_sdram_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_saved_grant_sdram_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
  wire    [ 21: 0] sdram_0_s1_address;
  wire             sdram_0_s1_allgrants;
  wire             sdram_0_s1_allow_new_arb_cycle;
  wire             sdram_0_s1_any_bursting_master_saved_grant;
  wire             sdram_0_s1_any_continuerequest;
  reg     [  1: 0] sdram_0_s1_arb_addend;
  wire             sdram_0_s1_arb_counter_enable;
  reg     [  2: 0] sdram_0_s1_arb_share_counter;
  wire    [  2: 0] sdram_0_s1_arb_share_counter_next_value;
  wire    [  2: 0] sdram_0_s1_arb_share_set_values;
  wire    [  1: 0] sdram_0_s1_arb_winner;
  wire             sdram_0_s1_arbitration_holdoff_internal;
  wire             sdram_0_s1_beginbursttransfer_internal;
  wire             sdram_0_s1_begins_xfer;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire    [  3: 0] sdram_0_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_0_s1_chosen_master_rot_left;
  wire             sdram_0_s1_end_xfer;
  wire             sdram_0_s1_firsttransfer;
  wire    [  1: 0] sdram_0_s1_grant_vector;
  wire             sdram_0_s1_in_a_read_cycle;
  wire             sdram_0_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_0_s1_master_qreq_vector;
  wire             sdram_0_s1_move_on_to_next_transaction;
  wire             sdram_0_s1_non_bursting_master_requests;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid_from_sa;
  reg              sdram_0_s1_reg_firsttransfer;
  wire             sdram_0_s1_reset_n;
  reg     [  1: 0] sdram_0_s1_saved_chosen_master_vector;
  reg              sdram_0_s1_slavearbiterlockenable;
  wire             sdram_0_s1_slavearbiterlockenable2;
  wire             sdram_0_s1_unreg_firsttransfer;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_waits_for_read;
  wire             sdram_0_s1_waits_for_write;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master;
  wire             wait_for_sdram_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_0_s1_end_xfer;
    end


  assign sdram_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sdram_0_s1 | cpu_0_instruction_master_qualified_request_sdram_0_s1));
  //assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata;

  assign cpu_0_data_master_requests_sdram_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest;

  //assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid;

  //sdram_0_s1_arb_share_counter set values, which is an e_mux
  assign sdram_0_s1_arb_share_set_values = (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    1;

  //sdram_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1 |
    cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_0_s1_any_bursting_master_saved_grant = 0;

  //sdram_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_0_s1_arb_share_counter_next_value = sdram_0_s1_firsttransfer ? (sdram_0_s1_arb_share_set_values - 1) : |sdram_0_s1_arb_share_counter ? (sdram_0_s1_arb_share_counter - 1) : 0;

  //sdram_0_s1_allgrants all slave grants, which is an e_mux
  assign sdram_0_s1_allgrants = (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector);

  //sdram_0_s1_end_xfer assignment, which is an e_assign
  assign sdram_0_s1_end_xfer = ~(sdram_0_s1_waits_for_read | sdram_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_0_s1 = sdram_0_s1_end_xfer & (~sdram_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_0_s1 & sdram_0_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests);

  //sdram_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_share_counter <= 0;
      else if (sdram_0_s1_arb_counter_enable)
          sdram_0_s1_arb_share_counter <= sdram_0_s1_arb_share_counter_next_value;
    end


  //sdram_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_0_s1) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests))
          sdram_0_s1_slavearbiterlockenable <= |sdram_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sdram_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_0_s1_slavearbiterlockenable2 = |sdram_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= cpu_0_instruction_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 & cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sdram_0_s1 = cpu_0_data_master_requests_sdram_0_s1 & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))) | ((~cpu_0_data_master_waitrequest | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_sdram_0_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //unique name for sdram_0_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_0_s1_move_on_to_next_transaction = sdram_0_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_data_master_granted_sdram_0_s1),
      .data_out             (cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_data_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_data_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;

  //sdram_0_s1_writedata mux, which is an e_mux
  assign sdram_0_s1_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sdram_0_s1 = (({cpu_0_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= cpu_0_data_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 & cpu_0_data_master_requests_sdram_0_s1;

  assign cpu_0_instruction_master_qualified_request_sdram_0_s1 = cpu_0_instruction_master_requests_sdram_0_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_sdram_0_s1),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;

  //allow new arb cycle for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_sdram_0_s1;

  //cpu_0/instruction_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[0] && cpu_0_instruction_master_requests_sdram_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sdram_0_s1;

  //cpu_0/data_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[1] && cpu_0_data_master_requests_sdram_0_s1;

  //sdram_0/s1 chosen-master double-vector, which is an e_assign
  assign sdram_0_s1_chosen_master_double_vector = {sdram_0_s1_master_qreq_vector, sdram_0_s1_master_qreq_vector} & ({~sdram_0_s1_master_qreq_vector, ~sdram_0_s1_master_qreq_vector} + sdram_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_0_s1_arb_winner = (sdram_0_s1_allow_new_arb_cycle & | sdram_0_s1_grant_vector) ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;

  //saved sdram_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_saved_chosen_master_vector <= 0;
      else if (sdram_0_s1_allow_new_arb_cycle)
          sdram_0_s1_saved_chosen_master_vector <= |sdram_0_s1_grant_vector ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_0_s1_grant_vector = {(sdram_0_s1_chosen_master_double_vector[1] | sdram_0_s1_chosen_master_double_vector[3]),
    (sdram_0_s1_chosen_master_double_vector[0] | sdram_0_s1_chosen_master_double_vector[2])};

  //sdram_0/s1 chosen master rotated left, which is an e_assign
  assign sdram_0_s1_chosen_master_rot_left = (sdram_0_s1_arb_winner << 1) ? (sdram_0_s1_arb_winner << 1) : 1;

  //sdram_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_addend <= 1;
      else if (|sdram_0_s1_grant_vector)
          sdram_0_s1_arb_addend <= sdram_0_s1_end_xfer? sdram_0_s1_chosen_master_rot_left : sdram_0_s1_grant_vector;
    end


  //sdram_0_s1_reset_n assignment, which is an e_assign
  assign sdram_0_s1_reset_n = reset_n;

  assign sdram_0_s1_chipselect = cpu_0_data_master_granted_sdram_0_s1 | cpu_0_instruction_master_granted_sdram_0_s1;
  //sdram_0_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_firsttransfer = sdram_0_s1_begins_xfer ? sdram_0_s1_unreg_firsttransfer : sdram_0_s1_reg_firsttransfer;

  //sdram_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_unreg_firsttransfer = ~(sdram_0_s1_slavearbiterlockenable & sdram_0_s1_any_continuerequest);

  //sdram_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_0_s1_begins_xfer)
          sdram_0_s1_reg_firsttransfer <= sdram_0_s1_unreg_firsttransfer;
    end


  //sdram_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_0_s1_beginbursttransfer_internal = sdram_0_s1_begins_xfer;

  //sdram_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_0_s1_arbitration_holdoff_internal = sdram_0_s1_begins_xfer & sdram_0_s1_firsttransfer;

  //~sdram_0_s1_read_n assignment, which is an e_mux
  assign sdram_0_s1_read_n = ~((cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read));

  //~sdram_0_s1_write_n assignment, which is an e_mux
  assign sdram_0_s1_write_n = ~(cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sdram_0_s1_address mux, which is an e_mux
  assign sdram_0_s1_address = (cpu_0_data_master_granted_sdram_0_s1)? (shifted_address_to_sdram_0_s1_from_cpu_0_data_master >> 1) :
    (shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_0_s1_end_xfer <= 1;
      else 
        d1_sdram_0_s1_end_xfer <= sdram_0_s1_end_xfer;
    end


  //sdram_0_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_read = sdram_0_s1_in_a_read_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_0_s1_in_a_read_cycle;

  //sdram_0_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_write = sdram_0_s1_in_a_write_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_write_cycle = cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_0_s1_in_a_write_cycle;

  assign wait_for_sdram_0_s1_counter = 0;
  //~sdram_0_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_0_s1_byteenable_n = ~((cpu_0_data_master_granted_sdram_0_s1)? cpu_0_data_master_byteenable_sdram_0_s1 :
    -1);

  assign {cpu_0_data_master_byteenable_sdram_0_s1_segment_1,
cpu_0_data_master_byteenable_sdram_0_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sdram_0_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sdram_0_s1_segment_0 :
    cpu_0_data_master_byteenable_sdram_0_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sdram_0_s1 + cpu_0_instruction_master_granted_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sdram_0_s1 + cpu_0_instruction_master_saved_grant_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sounds_ids_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_write,
                                   reset_n,
                                   sounds_ids_s1_readdata,

                                  // outputs:
                                   cpu_0_data_master_granted_sounds_ids_s1,
                                   cpu_0_data_master_qualified_request_sounds_ids_s1,
                                   cpu_0_data_master_read_data_valid_sounds_ids_s1,
                                   cpu_0_data_master_requests_sounds_ids_s1,
                                   d1_sounds_ids_s1_end_xfer,
                                   sounds_ids_s1_address,
                                   sounds_ids_s1_readdata_from_sa,
                                   sounds_ids_s1_reset_n
                                )
;

  output           cpu_0_data_master_granted_sounds_ids_s1;
  output           cpu_0_data_master_qualified_request_sounds_ids_s1;
  output           cpu_0_data_master_read_data_valid_sounds_ids_s1;
  output           cpu_0_data_master_requests_sounds_ids_s1;
  output           d1_sounds_ids_s1_end_xfer;
  output  [  1: 0] sounds_ids_s1_address;
  output  [  3: 0] sounds_ids_s1_readdata_from_sa;
  output           sounds_ids_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [  3: 0] sounds_ids_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sounds_ids_s1;
  wire             cpu_0_data_master_qualified_request_sounds_ids_s1;
  wire             cpu_0_data_master_read_data_valid_sounds_ids_s1;
  wire             cpu_0_data_master_requests_sounds_ids_s1;
  wire             cpu_0_data_master_saved_grant_sounds_ids_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sounds_ids_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sounds_ids_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sounds_ids_s1_from_cpu_0_data_master;
  wire    [  1: 0] sounds_ids_s1_address;
  wire             sounds_ids_s1_allgrants;
  wire             sounds_ids_s1_allow_new_arb_cycle;
  wire             sounds_ids_s1_any_bursting_master_saved_grant;
  wire             sounds_ids_s1_any_continuerequest;
  wire             sounds_ids_s1_arb_counter_enable;
  reg     [  2: 0] sounds_ids_s1_arb_share_counter;
  wire    [  2: 0] sounds_ids_s1_arb_share_counter_next_value;
  wire    [  2: 0] sounds_ids_s1_arb_share_set_values;
  wire             sounds_ids_s1_beginbursttransfer_internal;
  wire             sounds_ids_s1_begins_xfer;
  wire             sounds_ids_s1_end_xfer;
  wire             sounds_ids_s1_firsttransfer;
  wire             sounds_ids_s1_grant_vector;
  wire             sounds_ids_s1_in_a_read_cycle;
  wire             sounds_ids_s1_in_a_write_cycle;
  wire             sounds_ids_s1_master_qreq_vector;
  wire             sounds_ids_s1_non_bursting_master_requests;
  wire    [  3: 0] sounds_ids_s1_readdata_from_sa;
  reg              sounds_ids_s1_reg_firsttransfer;
  wire             sounds_ids_s1_reset_n;
  reg              sounds_ids_s1_slavearbiterlockenable;
  wire             sounds_ids_s1_slavearbiterlockenable2;
  wire             sounds_ids_s1_unreg_firsttransfer;
  wire             sounds_ids_s1_waits_for_read;
  wire             sounds_ids_s1_waits_for_write;
  wire             wait_for_sounds_ids_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sounds_ids_s1_end_xfer;
    end


  assign sounds_ids_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sounds_ids_s1));
  //assign sounds_ids_s1_readdata_from_sa = sounds_ids_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sounds_ids_s1_readdata_from_sa = sounds_ids_s1_readdata;

  assign cpu_0_data_master_requests_sounds_ids_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h0) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sounds_ids_s1_arb_share_counter set values, which is an e_mux
  assign sounds_ids_s1_arb_share_set_values = 1;

  //sounds_ids_s1_non_bursting_master_requests mux, which is an e_mux
  assign sounds_ids_s1_non_bursting_master_requests = cpu_0_data_master_requests_sounds_ids_s1;

  //sounds_ids_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sounds_ids_s1_any_bursting_master_saved_grant = 0;

  //sounds_ids_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sounds_ids_s1_arb_share_counter_next_value = sounds_ids_s1_firsttransfer ? (sounds_ids_s1_arb_share_set_values - 1) : |sounds_ids_s1_arb_share_counter ? (sounds_ids_s1_arb_share_counter - 1) : 0;

  //sounds_ids_s1_allgrants all slave grants, which is an e_mux
  assign sounds_ids_s1_allgrants = |sounds_ids_s1_grant_vector;

  //sounds_ids_s1_end_xfer assignment, which is an e_assign
  assign sounds_ids_s1_end_xfer = ~(sounds_ids_s1_waits_for_read | sounds_ids_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sounds_ids_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sounds_ids_s1 = sounds_ids_s1_end_xfer & (~sounds_ids_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sounds_ids_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sounds_ids_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sounds_ids_s1 & sounds_ids_s1_allgrants) | (end_xfer_arb_share_counter_term_sounds_ids_s1 & ~sounds_ids_s1_non_bursting_master_requests);

  //sounds_ids_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sounds_ids_s1_arb_share_counter <= 0;
      else if (sounds_ids_s1_arb_counter_enable)
          sounds_ids_s1_arb_share_counter <= sounds_ids_s1_arb_share_counter_next_value;
    end


  //sounds_ids_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sounds_ids_s1_slavearbiterlockenable <= 0;
      else if ((|sounds_ids_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sounds_ids_s1) | (end_xfer_arb_share_counter_term_sounds_ids_s1 & ~sounds_ids_s1_non_bursting_master_requests))
          sounds_ids_s1_slavearbiterlockenable <= |sounds_ids_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master sounds_ids/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sounds_ids_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sounds_ids_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sounds_ids_s1_slavearbiterlockenable2 = |sounds_ids_s1_arb_share_counter_next_value;

  //cpu_0/data_master sounds_ids/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sounds_ids_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //sounds_ids_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sounds_ids_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sounds_ids_s1 = cpu_0_data_master_requests_sounds_ids_s1;
  //master is always granted when requested
  assign cpu_0_data_master_granted_sounds_ids_s1 = cpu_0_data_master_qualified_request_sounds_ids_s1;

  //cpu_0/data_master saved-grant sounds_ids/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_sounds_ids_s1 = cpu_0_data_master_requests_sounds_ids_s1;

  //allow new arb cycle for sounds_ids/s1, which is an e_assign
  assign sounds_ids_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sounds_ids_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sounds_ids_s1_master_qreq_vector = 1;

  //sounds_ids_s1_reset_n assignment, which is an e_assign
  assign sounds_ids_s1_reset_n = reset_n;

  //sounds_ids_s1_firsttransfer first transaction, which is an e_assign
  assign sounds_ids_s1_firsttransfer = sounds_ids_s1_begins_xfer ? sounds_ids_s1_unreg_firsttransfer : sounds_ids_s1_reg_firsttransfer;

  //sounds_ids_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sounds_ids_s1_unreg_firsttransfer = ~(sounds_ids_s1_slavearbiterlockenable & sounds_ids_s1_any_continuerequest);

  //sounds_ids_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sounds_ids_s1_reg_firsttransfer <= 1'b1;
      else if (sounds_ids_s1_begins_xfer)
          sounds_ids_s1_reg_firsttransfer <= sounds_ids_s1_unreg_firsttransfer;
    end


  //sounds_ids_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sounds_ids_s1_beginbursttransfer_internal = sounds_ids_s1_begins_xfer;

  assign shifted_address_to_sounds_ids_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sounds_ids_s1_address mux, which is an e_mux
  assign sounds_ids_s1_address = shifted_address_to_sounds_ids_s1_from_cpu_0_data_master >> 2;

  //d1_sounds_ids_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sounds_ids_s1_end_xfer <= 1;
      else 
        d1_sounds_ids_s1_end_xfer <= sounds_ids_s1_end_xfer;
    end


  //sounds_ids_s1_waits_for_read in a cycle, which is an e_mux
  assign sounds_ids_s1_waits_for_read = sounds_ids_s1_in_a_read_cycle & sounds_ids_s1_begins_xfer;

  //sounds_ids_s1_in_a_read_cycle assignment, which is an e_assign
  assign sounds_ids_s1_in_a_read_cycle = cpu_0_data_master_granted_sounds_ids_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sounds_ids_s1_in_a_read_cycle;

  //sounds_ids_s1_waits_for_write in a cycle, which is an e_mux
  assign sounds_ids_s1_waits_for_write = sounds_ids_s1_in_a_write_cycle & 0;

  //sounds_ids_s1_in_a_write_cycle assignment, which is an e_assign
  assign sounds_ids_s1_in_a_write_cycle = cpu_0_data_master_granted_sounds_ids_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sounds_ids_s1_in_a_write_cycle;

  assign wait_for_sounds_ids_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sounds_ids/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module (
                                                                           // inputs:
                                                                            clear_fifo,
                                                                            clk,
                                                                            data_in,
                                                                            read,
                                                                            reset_n,
                                                                            sync_reset,
                                                                            write,

                                                                           // outputs:
                                                                            data_out,
                                                                            empty,
                                                                            fifo_contains_ones_n,
                                                                            full
                                                                         )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module (
                                                                                  // inputs:
                                                                                   clear_fifo,
                                                                                   clk,
                                                                                   data_in,
                                                                                   read,
                                                                                   reset_n,
                                                                                   sync_reset,
                                                                                   write,

                                                                                  // outputs:
                                                                                   data_out,
                                                                                   empty,
                                                                                   fifo_contains_ones_n,
                                                                                   full
                                                                                )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_0_avalon_sram_slave_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_data_master_address_to_slave,
                                              cpu_0_data_master_byteenable,
                                              cpu_0_data_master_dbs_address,
                                              cpu_0_data_master_dbs_write_16,
                                              cpu_0_data_master_no_byte_enables_and_last_term,
                                              cpu_0_data_master_read,
                                              cpu_0_data_master_waitrequest,
                                              cpu_0_data_master_write,
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_read,
                                              reset_n,
                                              sram_0_avalon_sram_slave_readdata,
                                              sram_0_avalon_sram_slave_readdatavalid,

                                             // outputs:
                                              cpu_0_data_master_byteenable_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_granted_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
                                              cpu_0_data_master_requests_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
                                              cpu_0_instruction_master_requests_sram_0_avalon_sram_slave,
                                              d1_sram_0_avalon_sram_slave_end_xfer,
                                              sram_0_avalon_sram_slave_address,
                                              sram_0_avalon_sram_slave_byteenable,
                                              sram_0_avalon_sram_slave_read,
                                              sram_0_avalon_sram_slave_readdata_from_sa,
                                              sram_0_avalon_sram_slave_reset,
                                              sram_0_avalon_sram_slave_write,
                                              sram_0_avalon_sram_slave_writedata
                                           )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  output           cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  output           cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  output           d1_sram_0_avalon_sram_slave_end_xfer;
  output  [ 17: 0] sram_0_avalon_sram_slave_address;
  output  [  1: 0] sram_0_avalon_sram_slave_byteenable;
  output           sram_0_avalon_sram_slave_read;
  output  [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  output           sram_0_avalon_sram_slave_reset;
  output           sram_0_avalon_sram_slave_write;
  output  [ 15: 0] sram_0_avalon_sram_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata;
  input            sram_0_avalon_sram_slave_readdatavalid;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_rdv_fifo_output_from_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sram_0_avalon_sram_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave;
  wire    [ 24: 0] shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master;
  wire    [ 17: 0] sram_0_avalon_sram_slave_address;
  wire             sram_0_avalon_sram_slave_allgrants;
  wire             sram_0_avalon_sram_slave_allow_new_arb_cycle;
  wire             sram_0_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             sram_0_avalon_sram_slave_any_continuerequest;
  reg     [  1: 0] sram_0_avalon_sram_slave_arb_addend;
  wire             sram_0_avalon_sram_slave_arb_counter_enable;
  reg     [  2: 0] sram_0_avalon_sram_slave_arb_share_counter;
  wire    [  2: 0] sram_0_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  2: 0] sram_0_avalon_sram_slave_arb_share_set_values;
  wire    [  1: 0] sram_0_avalon_sram_slave_arb_winner;
  wire             sram_0_avalon_sram_slave_arbitration_holdoff_internal;
  wire             sram_0_avalon_sram_slave_beginbursttransfer_internal;
  wire             sram_0_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] sram_0_avalon_sram_slave_byteenable;
  wire    [  3: 0] sram_0_avalon_sram_slave_chosen_master_double_vector;
  wire    [  1: 0] sram_0_avalon_sram_slave_chosen_master_rot_left;
  wire             sram_0_avalon_sram_slave_end_xfer;
  wire             sram_0_avalon_sram_slave_firsttransfer;
  wire    [  1: 0] sram_0_avalon_sram_slave_grant_vector;
  wire             sram_0_avalon_sram_slave_in_a_read_cycle;
  wire             sram_0_avalon_sram_slave_in_a_write_cycle;
  wire    [  1: 0] sram_0_avalon_sram_slave_master_qreq_vector;
  wire             sram_0_avalon_sram_slave_move_on_to_next_transaction;
  wire             sram_0_avalon_sram_slave_non_bursting_master_requests;
  wire             sram_0_avalon_sram_slave_read;
  wire    [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  wire             sram_0_avalon_sram_slave_readdatavalid_from_sa;
  reg              sram_0_avalon_sram_slave_reg_firsttransfer;
  wire             sram_0_avalon_sram_slave_reset;
  reg     [  1: 0] sram_0_avalon_sram_slave_saved_chosen_master_vector;
  reg              sram_0_avalon_sram_slave_slavearbiterlockenable;
  wire             sram_0_avalon_sram_slave_slavearbiterlockenable2;
  wire             sram_0_avalon_sram_slave_unreg_firsttransfer;
  wire             sram_0_avalon_sram_slave_waits_for_read;
  wire             sram_0_avalon_sram_slave_waits_for_write;
  wire             sram_0_avalon_sram_slave_write;
  wire    [ 15: 0] sram_0_avalon_sram_slave_writedata;
  wire             wait_for_sram_0_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_0_avalon_sram_slave_end_xfer;
    end


  assign sram_0_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave));
  //assign sram_0_avalon_sram_slave_readdata_from_sa = sram_0_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_0_avalon_sram_slave_readdata_from_sa = sram_0_avalon_sram_slave_readdata;

  assign cpu_0_data_master_requests_sram_0_avalon_sram_slave = ({cpu_0_data_master_address_to_slave[24 : 19] , 19'b0} == 25'h1080000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign sram_0_avalon_sram_slave_readdatavalid_from_sa = sram_0_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_0_avalon_sram_slave_readdatavalid_from_sa = sram_0_avalon_sram_slave_readdatavalid;

  //sram_0_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign sram_0_avalon_sram_slave_arb_share_set_values = (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)? 2 :
    1;

  //sram_0_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign sram_0_avalon_sram_slave_non_bursting_master_requests = cpu_0_data_master_requests_sram_0_avalon_sram_slave |
    cpu_0_instruction_master_requests_sram_0_avalon_sram_slave |
    cpu_0_data_master_requests_sram_0_avalon_sram_slave |
    cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;

  //sram_0_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_0_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //sram_0_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_arb_share_counter_next_value = sram_0_avalon_sram_slave_firsttransfer ? (sram_0_avalon_sram_slave_arb_share_set_values - 1) : |sram_0_avalon_sram_slave_arb_share_counter ? (sram_0_avalon_sram_slave_arb_share_counter - 1) : 0;

  //sram_0_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign sram_0_avalon_sram_slave_allgrants = (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector);

  //sram_0_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_end_xfer = ~(sram_0_avalon_sram_slave_waits_for_read | sram_0_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_end_xfer & (~sram_0_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_0_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_0_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave & sram_0_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave & ~sram_0_avalon_sram_slave_non_bursting_master_requests);

  //sram_0_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_arb_share_counter <= 0;
      else if (sram_0_avalon_sram_slave_arb_counter_enable)
          sram_0_avalon_sram_slave_arb_share_counter <= sram_0_avalon_sram_slave_arb_share_counter_next_value;
    end


  //sram_0_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|sram_0_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave) | (end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave & ~sram_0_avalon_sram_slave_non_bursting_master_requests))
          sram_0_avalon_sram_slave_slavearbiterlockenable <= |sram_0_avalon_sram_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sram_0/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sram_0_avalon_sram_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sram_0_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_0_avalon_sram_slave_slavearbiterlockenable2 = |sram_0_avalon_sram_slave_arb_share_counter_next_value;

  //cpu_0/data_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sram_0_avalon_sram_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sram_0/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sram_0_avalon_sram_slave_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sram_0_avalon_sram_slave_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sram_0/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave <= cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave ? 1 : (sram_0_avalon_sram_slave_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sram_0_avalon_sram_slave) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave & cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;

  //sram_0_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_0_avalon_sram_slave_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave = cpu_0_data_master_requests_sram_0_avalon_sram_slave & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest | (|cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register))) | ((~cpu_0_data_master_waitrequest | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_sram_0_avalon_sram_slave) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //unique name for sram_0_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  assign sram_0_avalon_sram_slave_move_on_to_next_transaction = sram_0_avalon_sram_slave_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_data_master_granted_sram_0_avalon_sram_slave),
      .data_out             (cpu_0_data_master_rdv_fifo_output_from_sram_0_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave),
      .full                 (),
      .read                 (sram_0_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sram_0_avalon_sram_slave_waits_for_read)
    );

  assign cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register = ~cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  //local readdatavalid cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave = (sram_0_avalon_sram_slave_readdatavalid_from_sa & cpu_0_data_master_rdv_fifo_output_from_sram_0_avalon_sram_slave) & ~ cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave;

  //sram_0_avalon_sram_slave_writedata mux, which is an e_mux
  assign sram_0_avalon_sram_slave_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sram_0_avalon_sram_slave = (({cpu_0_instruction_master_address_to_slave[24 : 19] , 19'b0} == 25'h1080000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sram_0/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave <= cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave ? 1 : (sram_0_avalon_sram_slave_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sram_0_avalon_sram_slave) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave & cpu_0_data_master_requests_sram_0_avalon_sram_slave;

  assign cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave = cpu_0_instruction_master_requests_sram_0_avalon_sram_slave & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register))) | cpu_0_data_master_arbiterlock);
  //rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_sram_0_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave),
      .full                 (),
      .read                 (sram_0_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sram_0_avalon_sram_slave_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave = (sram_0_avalon_sram_slave_readdatavalid_from_sa & cpu_0_instruction_master_rdv_fifo_output_from_sram_0_avalon_sram_slave) & ~ cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave;

  //allow new arb cycle for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;

  //cpu_0/instruction_master grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_instruction_master_granted_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_grant_vector[0];

  //cpu_0/instruction_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_arb_winner[0] && cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;

  //cpu_0/data_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;

  //cpu_0/data_master grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_data_master_granted_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_grant_vector[1];

  //cpu_0/data_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_arb_winner[1] && cpu_0_data_master_requests_sram_0_avalon_sram_slave;

  //sram_0/avalon_sram_slave chosen-master double-vector, which is an e_assign
  assign sram_0_avalon_sram_slave_chosen_master_double_vector = {sram_0_avalon_sram_slave_master_qreq_vector, sram_0_avalon_sram_slave_master_qreq_vector} & ({~sram_0_avalon_sram_slave_master_qreq_vector, ~sram_0_avalon_sram_slave_master_qreq_vector} + sram_0_avalon_sram_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_0_avalon_sram_slave_arb_winner = (sram_0_avalon_sram_slave_allow_new_arb_cycle & | sram_0_avalon_sram_slave_grant_vector) ? sram_0_avalon_sram_slave_grant_vector : sram_0_avalon_sram_slave_saved_chosen_master_vector;

  //saved sram_0_avalon_sram_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_saved_chosen_master_vector <= 0;
      else if (sram_0_avalon_sram_slave_allow_new_arb_cycle)
          sram_0_avalon_sram_slave_saved_chosen_master_vector <= |sram_0_avalon_sram_slave_grant_vector ? sram_0_avalon_sram_slave_grant_vector : sram_0_avalon_sram_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_0_avalon_sram_slave_grant_vector = {(sram_0_avalon_sram_slave_chosen_master_double_vector[1] | sram_0_avalon_sram_slave_chosen_master_double_vector[3]),
    (sram_0_avalon_sram_slave_chosen_master_double_vector[0] | sram_0_avalon_sram_slave_chosen_master_double_vector[2])};

  //sram_0/avalon_sram_slave chosen master rotated left, which is an e_assign
  assign sram_0_avalon_sram_slave_chosen_master_rot_left = (sram_0_avalon_sram_slave_arb_winner << 1) ? (sram_0_avalon_sram_slave_arb_winner << 1) : 1;

  //sram_0/avalon_sram_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_arb_addend <= 1;
      else if (|sram_0_avalon_sram_slave_grant_vector)
          sram_0_avalon_sram_slave_arb_addend <= sram_0_avalon_sram_slave_end_xfer? sram_0_avalon_sram_slave_chosen_master_rot_left : sram_0_avalon_sram_slave_grant_vector;
    end


  //~sram_0_avalon_sram_slave_reset assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_reset = ~reset_n;

  //sram_0_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign sram_0_avalon_sram_slave_firsttransfer = sram_0_avalon_sram_slave_begins_xfer ? sram_0_avalon_sram_slave_unreg_firsttransfer : sram_0_avalon_sram_slave_reg_firsttransfer;

  //sram_0_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_0_avalon_sram_slave_unreg_firsttransfer = ~(sram_0_avalon_sram_slave_slavearbiterlockenable & sram_0_avalon_sram_slave_any_continuerequest);

  //sram_0_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (sram_0_avalon_sram_slave_begins_xfer)
          sram_0_avalon_sram_slave_reg_firsttransfer <= sram_0_avalon_sram_slave_unreg_firsttransfer;
    end


  //sram_0_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_0_avalon_sram_slave_beginbursttransfer_internal = sram_0_avalon_sram_slave_begins_xfer;

  //sram_0_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_0_avalon_sram_slave_arbitration_holdoff_internal = sram_0_avalon_sram_slave_begins_xfer & sram_0_avalon_sram_slave_firsttransfer;

  //sram_0_avalon_sram_slave_read assignment, which is an e_mux
  assign sram_0_avalon_sram_slave_read = (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave & cpu_0_instruction_master_read);

  //sram_0_avalon_sram_slave_write assignment, which is an e_mux
  assign sram_0_avalon_sram_slave_write = cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_write;

  assign shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_0_avalon_sram_slave_address mux, which is an e_mux
  assign sram_0_avalon_sram_slave_address = (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? (shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master >> 1) :
    (shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sram_0_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_0_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_sram_0_avalon_sram_slave_end_xfer <= sram_0_avalon_sram_slave_end_xfer;
    end


  //sram_0_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign sram_0_avalon_sram_slave_waits_for_read = sram_0_avalon_sram_slave_in_a_read_cycle & 0;

  //sram_0_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_in_a_read_cycle = (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_0_avalon_sram_slave_in_a_read_cycle;

  //sram_0_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign sram_0_avalon_sram_slave_waits_for_write = sram_0_avalon_sram_slave_in_a_write_cycle & 0;

  //sram_0_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_in_a_write_cycle = cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_0_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_sram_0_avalon_sram_slave_counter = 0;
  //sram_0_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign sram_0_avalon_sram_slave_byteenable = (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? cpu_0_data_master_byteenable_sram_0_avalon_sram_slave :
    -1;

  assign {cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1,
cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sram_0_avalon_sram_slave = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0 :
    cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram_0/avalon_sram_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sram_0_avalon_sram_slave + cpu_0_instruction_master_granted_sram_0_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave + cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module start_sound_s1_arbitrator (
                                   // inputs:
                                    clk,
                                    cpu_0_data_master_address_to_slave,
                                    cpu_0_data_master_read,
                                    cpu_0_data_master_write,
                                    reset_n,
                                    start_sound_s1_readdata,

                                   // outputs:
                                    cpu_0_data_master_granted_start_sound_s1,
                                    cpu_0_data_master_qualified_request_start_sound_s1,
                                    cpu_0_data_master_read_data_valid_start_sound_s1,
                                    cpu_0_data_master_requests_start_sound_s1,
                                    d1_start_sound_s1_end_xfer,
                                    start_sound_s1_address,
                                    start_sound_s1_readdata_from_sa,
                                    start_sound_s1_reset_n
                                 )
;

  output           cpu_0_data_master_granted_start_sound_s1;
  output           cpu_0_data_master_qualified_request_start_sound_s1;
  output           cpu_0_data_master_read_data_valid_start_sound_s1;
  output           cpu_0_data_master_requests_start_sound_s1;
  output           d1_start_sound_s1_end_xfer;
  output  [  1: 0] start_sound_s1_address;
  output           start_sound_s1_readdata_from_sa;
  output           start_sound_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input            start_sound_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_start_sound_s1;
  wire             cpu_0_data_master_qualified_request_start_sound_s1;
  wire             cpu_0_data_master_read_data_valid_start_sound_s1;
  wire             cpu_0_data_master_requests_start_sound_s1;
  wire             cpu_0_data_master_saved_grant_start_sound_s1;
  reg              d1_reasons_to_wait;
  reg              d1_start_sound_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_start_sound_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_start_sound_s1_from_cpu_0_data_master;
  wire    [  1: 0] start_sound_s1_address;
  wire             start_sound_s1_allgrants;
  wire             start_sound_s1_allow_new_arb_cycle;
  wire             start_sound_s1_any_bursting_master_saved_grant;
  wire             start_sound_s1_any_continuerequest;
  wire             start_sound_s1_arb_counter_enable;
  reg     [  2: 0] start_sound_s1_arb_share_counter;
  wire    [  2: 0] start_sound_s1_arb_share_counter_next_value;
  wire    [  2: 0] start_sound_s1_arb_share_set_values;
  wire             start_sound_s1_beginbursttransfer_internal;
  wire             start_sound_s1_begins_xfer;
  wire             start_sound_s1_end_xfer;
  wire             start_sound_s1_firsttransfer;
  wire             start_sound_s1_grant_vector;
  wire             start_sound_s1_in_a_read_cycle;
  wire             start_sound_s1_in_a_write_cycle;
  wire             start_sound_s1_master_qreq_vector;
  wire             start_sound_s1_non_bursting_master_requests;
  wire             start_sound_s1_readdata_from_sa;
  reg              start_sound_s1_reg_firsttransfer;
  wire             start_sound_s1_reset_n;
  reg              start_sound_s1_slavearbiterlockenable;
  wire             start_sound_s1_slavearbiterlockenable2;
  wire             start_sound_s1_unreg_firsttransfer;
  wire             start_sound_s1_waits_for_read;
  wire             start_sound_s1_waits_for_write;
  wire             wait_for_start_sound_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~start_sound_s1_end_xfer;
    end


  assign start_sound_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_start_sound_s1));
  //assign start_sound_s1_readdata_from_sa = start_sound_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign start_sound_s1_readdata_from_sa = start_sound_s1_readdata;

  assign cpu_0_data_master_requests_start_sound_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h100) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //start_sound_s1_arb_share_counter set values, which is an e_mux
  assign start_sound_s1_arb_share_set_values = 1;

  //start_sound_s1_non_bursting_master_requests mux, which is an e_mux
  assign start_sound_s1_non_bursting_master_requests = cpu_0_data_master_requests_start_sound_s1;

  //start_sound_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign start_sound_s1_any_bursting_master_saved_grant = 0;

  //start_sound_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign start_sound_s1_arb_share_counter_next_value = start_sound_s1_firsttransfer ? (start_sound_s1_arb_share_set_values - 1) : |start_sound_s1_arb_share_counter ? (start_sound_s1_arb_share_counter - 1) : 0;

  //start_sound_s1_allgrants all slave grants, which is an e_mux
  assign start_sound_s1_allgrants = |start_sound_s1_grant_vector;

  //start_sound_s1_end_xfer assignment, which is an e_assign
  assign start_sound_s1_end_xfer = ~(start_sound_s1_waits_for_read | start_sound_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_start_sound_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_start_sound_s1 = start_sound_s1_end_xfer & (~start_sound_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //start_sound_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign start_sound_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_start_sound_s1 & start_sound_s1_allgrants) | (end_xfer_arb_share_counter_term_start_sound_s1 & ~start_sound_s1_non_bursting_master_requests);

  //start_sound_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          start_sound_s1_arb_share_counter <= 0;
      else if (start_sound_s1_arb_counter_enable)
          start_sound_s1_arb_share_counter <= start_sound_s1_arb_share_counter_next_value;
    end


  //start_sound_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          start_sound_s1_slavearbiterlockenable <= 0;
      else if ((|start_sound_s1_master_qreq_vector & end_xfer_arb_share_counter_term_start_sound_s1) | (end_xfer_arb_share_counter_term_start_sound_s1 & ~start_sound_s1_non_bursting_master_requests))
          start_sound_s1_slavearbiterlockenable <= |start_sound_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master start_sound/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = start_sound_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //start_sound_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign start_sound_s1_slavearbiterlockenable2 = |start_sound_s1_arb_share_counter_next_value;

  //cpu_0/data_master start_sound/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = start_sound_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //start_sound_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign start_sound_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_start_sound_s1 = cpu_0_data_master_requests_start_sound_s1;
  //master is always granted when requested
  assign cpu_0_data_master_granted_start_sound_s1 = cpu_0_data_master_qualified_request_start_sound_s1;

  //cpu_0/data_master saved-grant start_sound/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_start_sound_s1 = cpu_0_data_master_requests_start_sound_s1;

  //allow new arb cycle for start_sound/s1, which is an e_assign
  assign start_sound_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign start_sound_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign start_sound_s1_master_qreq_vector = 1;

  //start_sound_s1_reset_n assignment, which is an e_assign
  assign start_sound_s1_reset_n = reset_n;

  //start_sound_s1_firsttransfer first transaction, which is an e_assign
  assign start_sound_s1_firsttransfer = start_sound_s1_begins_xfer ? start_sound_s1_unreg_firsttransfer : start_sound_s1_reg_firsttransfer;

  //start_sound_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign start_sound_s1_unreg_firsttransfer = ~(start_sound_s1_slavearbiterlockenable & start_sound_s1_any_continuerequest);

  //start_sound_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          start_sound_s1_reg_firsttransfer <= 1'b1;
      else if (start_sound_s1_begins_xfer)
          start_sound_s1_reg_firsttransfer <= start_sound_s1_unreg_firsttransfer;
    end


  //start_sound_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign start_sound_s1_beginbursttransfer_internal = start_sound_s1_begins_xfer;

  assign shifted_address_to_start_sound_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //start_sound_s1_address mux, which is an e_mux
  assign start_sound_s1_address = shifted_address_to_start_sound_s1_from_cpu_0_data_master >> 2;

  //d1_start_sound_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_start_sound_s1_end_xfer <= 1;
      else 
        d1_start_sound_s1_end_xfer <= start_sound_s1_end_xfer;
    end


  //start_sound_s1_waits_for_read in a cycle, which is an e_mux
  assign start_sound_s1_waits_for_read = start_sound_s1_in_a_read_cycle & start_sound_s1_begins_xfer;

  //start_sound_s1_in_a_read_cycle assignment, which is an e_assign
  assign start_sound_s1_in_a_read_cycle = cpu_0_data_master_granted_start_sound_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = start_sound_s1_in_a_read_cycle;

  //start_sound_s1_waits_for_write in a cycle, which is an e_mux
  assign start_sound_s1_waits_for_write = start_sound_s1_in_a_write_cycle & 0;

  //start_sound_s1_in_a_write_cycle assignment, which is an e_assign
  assign start_sound_s1_in_a_write_cycle = cpu_0_data_master_granted_start_sound_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = start_sound_s1_in_a_write_cycle;

  assign wait_for_start_sound_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //start_sound/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_0_data_master_granted_sysid_control_slave,
                                         cpu_0_data_master_qualified_request_sysid_control_slave,
                                         cpu_0_data_master_read_data_valid_sysid_control_slave,
                                         cpu_0_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa
                                      )
;

  output           cpu_0_data_master_granted_sysid_control_slave;
  output           cpu_0_data_master_qualified_request_sysid_control_slave;
  output           cpu_0_data_master_read_data_valid_sysid_control_slave;
  output           cpu_0_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_0_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_0_data_master_requests_sysid_control_slave = (({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1101428) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_0_data_master_granted_sysid_control_slave = cpu_0_data_master_qualified_request_sysid_control_slave;

  //cpu_0/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_0_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module AUDIO_SOPC_reset_clocks_0_sys_clk_out_domain_synch_module (
                                                                   // inputs:
                                                                    clk,
                                                                    data_in,
                                                                    reset_n,

                                                                   // outputs:
                                                                    data_out
                                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module AUDIO_SOPC_reset_clk_50_domain_synch_module (
                                                     // inputs:
                                                      clk,
                                                      data_in,
                                                      reset_n,

                                                     // outputs:
                                                      data_out
                                                   )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module AUDIO_SOPC (
                    // 1) global signals:
                     clk_27,
                     clk_50,
                     clocks_0_AUD_CLK_out,
                     clocks_0_SDRAM_CLK_out,
                     clocks_0_sys_clk_out,
                     reset_n,

                    // the_SDCARD
                     b_SD_cmd_to_and_from_the_SDCARD,
                     b_SD_dat3_to_and_from_the_SDCARD,
                     b_SD_dat_to_and_from_the_SDCARD,
                     o_SD_clock_from_the_SDCARD,

                    // the_audio
                     AUD_ADCDAT_to_the_audio,
                     AUD_ADCLRCK_to_and_from_the_audio,
                     AUD_BCLK_to_and_from_the_audio,
                     AUD_DACDAT_from_the_audio,
                     AUD_DACLRCK_to_and_from_the_audio,

                    // the_audio_and_video_config_0
                     I2C_SCLK_from_the_audio_and_video_config_0,
                     I2C_SDAT_to_and_from_the_audio_and_video_config_0,

                    // the_sdram_0
                     zs_addr_from_the_sdram_0,
                     zs_ba_from_the_sdram_0,
                     zs_cas_n_from_the_sdram_0,
                     zs_cke_from_the_sdram_0,
                     zs_cs_n_from_the_sdram_0,
                     zs_dq_to_and_from_the_sdram_0,
                     zs_dqm_from_the_sdram_0,
                     zs_ras_n_from_the_sdram_0,
                     zs_we_n_from_the_sdram_0,

                    // the_sounds_ids
                     in_port_to_the_sounds_ids,

                    // the_sram_0
                     SRAM_ADDR_from_the_sram_0,
                     SRAM_CE_N_from_the_sram_0,
                     SRAM_DQ_to_and_from_the_sram_0,
                     SRAM_LB_N_from_the_sram_0,
                     SRAM_OE_N_from_the_sram_0,
                     SRAM_UB_N_from_the_sram_0,
                     SRAM_WE_N_from_the_sram_0,

                    // the_start_sound
                     in_port_to_the_start_sound
                  )
;

  inout            AUD_ADCLRCK_to_and_from_the_audio;
  inout            AUD_BCLK_to_and_from_the_audio;
  output           AUD_DACDAT_from_the_audio;
  inout            AUD_DACLRCK_to_and_from_the_audio;
  output           I2C_SCLK_from_the_audio_and_video_config_0;
  inout            I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  output  [ 17: 0] SRAM_ADDR_from_the_sram_0;
  output           SRAM_CE_N_from_the_sram_0;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  output           SRAM_LB_N_from_the_sram_0;
  output           SRAM_OE_N_from_the_sram_0;
  output           SRAM_UB_N_from_the_sram_0;
  output           SRAM_WE_N_from_the_sram_0;
  inout            b_SD_cmd_to_and_from_the_SDCARD;
  inout            b_SD_dat3_to_and_from_the_SDCARD;
  inout            b_SD_dat_to_and_from_the_SDCARD;
  output           clocks_0_AUD_CLK_out;
  output           clocks_0_SDRAM_CLK_out;
  output           clocks_0_sys_clk_out;
  output           o_SD_clock_from_the_SDCARD;
  output  [ 11: 0] zs_addr_from_the_sdram_0;
  output  [  1: 0] zs_ba_from_the_sdram_0;
  output           zs_cas_n_from_the_sdram_0;
  output           zs_cke_from_the_sdram_0;
  output           zs_cs_n_from_the_sdram_0;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  output  [  1: 0] zs_dqm_from_the_sdram_0;
  output           zs_ras_n_from_the_sdram_0;
  output           zs_we_n_from_the_sdram_0;
  input            AUD_ADCDAT_to_the_audio;
  input            clk_27;
  input            clk_50;
  input   [  3: 0] in_port_to_the_sounds_ids;
  input            in_port_to_the_start_sound;
  input            reset_n;

  wire             AUDIO_SOPC_clock_0_in_address;
  wire             AUDIO_SOPC_clock_0_in_endofpacket;
  wire             AUDIO_SOPC_clock_0_in_endofpacket_from_sa;
  wire             AUDIO_SOPC_clock_0_in_nativeaddress;
  wire             AUDIO_SOPC_clock_0_in_read;
  wire    [  7: 0] AUDIO_SOPC_clock_0_in_readdata;
  wire    [  7: 0] AUDIO_SOPC_clock_0_in_readdata_from_sa;
  wire             AUDIO_SOPC_clock_0_in_reset_n;
  wire             AUDIO_SOPC_clock_0_in_waitrequest;
  wire             AUDIO_SOPC_clock_0_in_waitrequest_from_sa;
  wire             AUDIO_SOPC_clock_0_in_write;
  wire    [  7: 0] AUDIO_SOPC_clock_0_in_writedata;
  wire             AUDIO_SOPC_clock_0_out_address;
  wire             AUDIO_SOPC_clock_0_out_address_to_slave;
  wire             AUDIO_SOPC_clock_0_out_endofpacket;
  wire             AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  wire             AUDIO_SOPC_clock_0_out_nativeaddress;
  wire             AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  wire             AUDIO_SOPC_clock_0_out_read;
  wire             AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  wire    [  7: 0] AUDIO_SOPC_clock_0_out_readdata;
  wire             AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  wire             AUDIO_SOPC_clock_0_out_reset_n;
  wire             AUDIO_SOPC_clock_0_out_waitrequest;
  wire             AUDIO_SOPC_clock_0_out_write;
  wire    [  7: 0] AUDIO_SOPC_clock_0_out_writedata;
  wire             AUD_ADCLRCK_to_and_from_the_audio;
  wire             AUD_BCLK_to_and_from_the_audio;
  wire             AUD_DACDAT_from_the_audio;
  wire             AUD_DACLRCK_to_and_from_the_audio;
  wire             I2C_SCLK_from_the_audio_and_video_config_0;
  wire             I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  wire    [  7: 0] SDCARD_avalon_sdcard_slave_address;
  wire    [  3: 0] SDCARD_avalon_sdcard_slave_byteenable;
  wire             SDCARD_avalon_sdcard_slave_chipselect;
  wire             SDCARD_avalon_sdcard_slave_read;
  wire    [ 31: 0] SDCARD_avalon_sdcard_slave_readdata;
  wire    [ 31: 0] SDCARD_avalon_sdcard_slave_readdata_from_sa;
  wire             SDCARD_avalon_sdcard_slave_reset_n;
  wire             SDCARD_avalon_sdcard_slave_waitrequest;
  wire             SDCARD_avalon_sdcard_slave_waitrequest_from_sa;
  wire             SDCARD_avalon_sdcard_slave_write;
  wire    [ 31: 0] SDCARD_avalon_sdcard_slave_writedata;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_0;
  wire             SRAM_CE_N_from_the_sram_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  wire             SRAM_LB_N_from_the_sram_0;
  wire             SRAM_OE_N_from_the_sram_0;
  wire             SRAM_UB_N_from_the_sram_0;
  wire             SRAM_WE_N_from_the_sram_0;
  wire    [  1: 0] audio_and_video_config_0_avalon_av_config_slave_address;
  wire    [  3: 0] audio_and_video_config_0_avalon_av_config_slave_byteenable;
  wire             audio_and_video_config_0_avalon_av_config_slave_read;
  wire    [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata;
  wire    [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;
  wire             audio_and_video_config_0_avalon_av_config_slave_reset;
  wire             audio_and_video_config_0_avalon_av_config_slave_waitrequest;
  wire             audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;
  wire             audio_and_video_config_0_avalon_av_config_slave_write;
  wire    [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_writedata;
  wire    [  1: 0] audio_avalon_audio_slave_address;
  wire             audio_avalon_audio_slave_chipselect;
  wire             audio_avalon_audio_slave_irq;
  wire             audio_avalon_audio_slave_irq_from_sa;
  wire             audio_avalon_audio_slave_read;
  wire    [ 31: 0] audio_avalon_audio_slave_readdata;
  wire    [ 31: 0] audio_avalon_audio_slave_readdata_from_sa;
  wire             audio_avalon_audio_slave_reset;
  wire             audio_avalon_audio_slave_write;
  wire    [ 31: 0] audio_avalon_audio_slave_writedata;
  wire             b_SD_cmd_to_and_from_the_SDCARD;
  wire             b_SD_dat3_to_and_from_the_SDCARD;
  wire             b_SD_dat_to_and_from_the_SDCARD;
  wire             clk_50_reset_n;
  wire             clocks_0_AUD_CLK_out;
  wire             clocks_0_SDRAM_CLK_out;
  wire             clocks_0_avalon_clocks_slave_address;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  wire             clocks_0_sys_clk_out;
  wire             clocks_0_sys_clk_out_reset_n;
  wire    [ 24: 0] cpu_0_data_master_address;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [  7: 0] cpu_0_data_master_dbs_write_8;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_granted_audio_avalon_audio_slave;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_granted_sounds_ids_s1;
  wire             cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_granted_start_sound_s1;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_no_byte_enables_and_last_term;
  wire             cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_qualified_request_audio_avalon_audio_slave;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sounds_ids_s1;
  wire             cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_qualified_request_start_sound_s1;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_sounds_ids_s1;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_start_sound_s1;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in;
  wire             cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave;
  wire             cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave;
  wire             cpu_0_data_master_requests_audio_avalon_audio_slave;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_requests_sounds_ids_s1;
  wire             cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_requests_start_sound_s1;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 24: 0] cpu_0_instruction_master_address;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             d1_AUDIO_SOPC_clock_0_in_end_xfer;
  wire             d1_SDCARD_avalon_sdcard_slave_end_xfer;
  wire             d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  wire             d1_audio_avalon_audio_slave_end_xfer;
  wire             d1_clocks_0_avalon_clocks_slave_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_sdram_0_s1_end_xfer;
  wire             d1_sounds_ids_s1_end_xfer;
  wire             d1_sram_0_avalon_sram_slave_end_xfer;
  wire             d1_start_sound_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             o_SD_clock_from_the_SDCARD;
  wire             out_clk_clocks_0_AUD_CLK;
  wire             out_clk_clocks_0_SDRAM_CLK;
  wire             out_clk_clocks_0_sys_clk;
  wire             registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  wire             registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_0_s1_address;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid;
  wire             sdram_0_s1_reset_n;
  wire             sdram_0_s1_waitrequest;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [  1: 0] sounds_ids_s1_address;
  wire    [  3: 0] sounds_ids_s1_readdata;
  wire    [  3: 0] sounds_ids_s1_readdata_from_sa;
  wire             sounds_ids_s1_reset_n;
  wire    [ 17: 0] sram_0_avalon_sram_slave_address;
  wire    [  1: 0] sram_0_avalon_sram_slave_byteenable;
  wire             sram_0_avalon_sram_slave_read;
  wire    [ 15: 0] sram_0_avalon_sram_slave_readdata;
  wire    [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  wire             sram_0_avalon_sram_slave_readdatavalid;
  wire             sram_0_avalon_sram_slave_reset;
  wire             sram_0_avalon_sram_slave_write;
  wire    [ 15: 0] sram_0_avalon_sram_slave_writedata;
  wire    [  1: 0] start_sound_s1_address;
  wire             start_sound_s1_readdata;
  wire             start_sound_s1_readdata_from_sa;
  wire             start_sound_s1_reset_n;
  wire             sysid_control_slave_address;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;
  AUDIO_SOPC_clock_0_in_arbitrator the_AUDIO_SOPC_clock_0_in
    (
      .AUDIO_SOPC_clock_0_in_address                             (AUDIO_SOPC_clock_0_in_address),
      .AUDIO_SOPC_clock_0_in_endofpacket                         (AUDIO_SOPC_clock_0_in_endofpacket),
      .AUDIO_SOPC_clock_0_in_endofpacket_from_sa                 (AUDIO_SOPC_clock_0_in_endofpacket_from_sa),
      .AUDIO_SOPC_clock_0_in_nativeaddress                       (AUDIO_SOPC_clock_0_in_nativeaddress),
      .AUDIO_SOPC_clock_0_in_read                                (AUDIO_SOPC_clock_0_in_read),
      .AUDIO_SOPC_clock_0_in_readdata                            (AUDIO_SOPC_clock_0_in_readdata),
      .AUDIO_SOPC_clock_0_in_readdata_from_sa                    (AUDIO_SOPC_clock_0_in_readdata_from_sa),
      .AUDIO_SOPC_clock_0_in_reset_n                             (AUDIO_SOPC_clock_0_in_reset_n),
      .AUDIO_SOPC_clock_0_in_waitrequest                         (AUDIO_SOPC_clock_0_in_waitrequest),
      .AUDIO_SOPC_clock_0_in_waitrequest_from_sa                 (AUDIO_SOPC_clock_0_in_waitrequest_from_sa),
      .AUDIO_SOPC_clock_0_in_write                               (AUDIO_SOPC_clock_0_in_write),
      .AUDIO_SOPC_clock_0_in_writedata                           (AUDIO_SOPC_clock_0_in_writedata),
      .clk                                                       (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                        (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                              (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in        (cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_dbs_address                             (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_8                             (cpu_0_data_master_dbs_write_8),
      .cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in           (cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_no_byte_enables_and_last_term           (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in (cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_read                                    (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in   (cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in          (cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_waitrequest                             (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                   (cpu_0_data_master_write),
      .d1_AUDIO_SOPC_clock_0_in_end_xfer                         (d1_AUDIO_SOPC_clock_0_in_end_xfer),
      .reset_n                                                   (clocks_0_sys_clk_out_reset_n)
    );

  AUDIO_SOPC_clock_0_out_arbitrator the_AUDIO_SOPC_clock_0_out
    (
      .AUDIO_SOPC_clock_0_out_address                                        (AUDIO_SOPC_clock_0_out_address),
      .AUDIO_SOPC_clock_0_out_address_to_slave                               (AUDIO_SOPC_clock_0_out_address_to_slave),
      .AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave           (AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave (AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_read                                           (AUDIO_SOPC_clock_0_out_read),
      .AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave   (AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_readdata                                       (AUDIO_SOPC_clock_0_out_readdata),
      .AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave          (AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_reset_n                                        (AUDIO_SOPC_clock_0_out_reset_n),
      .AUDIO_SOPC_clock_0_out_waitrequest                                    (AUDIO_SOPC_clock_0_out_waitrequest),
      .AUDIO_SOPC_clock_0_out_write                                          (AUDIO_SOPC_clock_0_out_write),
      .AUDIO_SOPC_clock_0_out_writedata                                      (AUDIO_SOPC_clock_0_out_writedata),
      .clk                                                                   (clk_50),
      .clocks_0_avalon_clocks_slave_readdata_from_sa                         (clocks_0_avalon_clocks_slave_readdata_from_sa),
      .d1_clocks_0_avalon_clocks_slave_end_xfer                              (d1_clocks_0_avalon_clocks_slave_end_xfer),
      .reset_n                                                               (clk_50_reset_n)
    );

  AUDIO_SOPC_clock_0 the_AUDIO_SOPC_clock_0
    (
      .master_address       (AUDIO_SOPC_clock_0_out_address),
      .master_clk           (clk_50),
      .master_endofpacket   (AUDIO_SOPC_clock_0_out_endofpacket),
      .master_nativeaddress (AUDIO_SOPC_clock_0_out_nativeaddress),
      .master_read          (AUDIO_SOPC_clock_0_out_read),
      .master_readdata      (AUDIO_SOPC_clock_0_out_readdata),
      .master_reset_n       (AUDIO_SOPC_clock_0_out_reset_n),
      .master_waitrequest   (AUDIO_SOPC_clock_0_out_waitrequest),
      .master_write         (AUDIO_SOPC_clock_0_out_write),
      .master_writedata     (AUDIO_SOPC_clock_0_out_writedata),
      .slave_address        (AUDIO_SOPC_clock_0_in_address),
      .slave_clk            (clocks_0_sys_clk_out),
      .slave_endofpacket    (AUDIO_SOPC_clock_0_in_endofpacket),
      .slave_nativeaddress  (AUDIO_SOPC_clock_0_in_nativeaddress),
      .slave_read           (AUDIO_SOPC_clock_0_in_read),
      .slave_readdata       (AUDIO_SOPC_clock_0_in_readdata),
      .slave_reset_n        (AUDIO_SOPC_clock_0_in_reset_n),
      .slave_waitrequest    (AUDIO_SOPC_clock_0_in_waitrequest),
      .slave_write          (AUDIO_SOPC_clock_0_in_write),
      .slave_writedata      (AUDIO_SOPC_clock_0_in_writedata)
    );

  SDCARD_avalon_sdcard_slave_arbitrator the_SDCARD_avalon_sdcard_slave
    (
      .SDCARD_avalon_sdcard_slave_address                             (SDCARD_avalon_sdcard_slave_address),
      .SDCARD_avalon_sdcard_slave_byteenable                          (SDCARD_avalon_sdcard_slave_byteenable),
      .SDCARD_avalon_sdcard_slave_chipselect                          (SDCARD_avalon_sdcard_slave_chipselect),
      .SDCARD_avalon_sdcard_slave_read                                (SDCARD_avalon_sdcard_slave_read),
      .SDCARD_avalon_sdcard_slave_readdata                            (SDCARD_avalon_sdcard_slave_readdata),
      .SDCARD_avalon_sdcard_slave_readdata_from_sa                    (SDCARD_avalon_sdcard_slave_readdata_from_sa),
      .SDCARD_avalon_sdcard_slave_reset_n                             (SDCARD_avalon_sdcard_slave_reset_n),
      .SDCARD_avalon_sdcard_slave_waitrequest                         (SDCARD_avalon_sdcard_slave_waitrequest),
      .SDCARD_avalon_sdcard_slave_waitrequest_from_sa                 (SDCARD_avalon_sdcard_slave_waitrequest_from_sa),
      .SDCARD_avalon_sdcard_slave_write                               (SDCARD_avalon_sdcard_slave_write),
      .SDCARD_avalon_sdcard_slave_writedata                           (SDCARD_avalon_sdcard_slave_writedata),
      .clk                                                            (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                   (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave           (cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave (cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_read                                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave   (cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave          (cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_waitrequest                                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                    (cpu_0_data_master_writedata),
      .d1_SDCARD_avalon_sdcard_slave_end_xfer                         (d1_SDCARD_avalon_sdcard_slave_end_xfer),
      .reset_n                                                        (clocks_0_sys_clk_out_reset_n)
    );

  SDCARD the_SDCARD
    (
      .b_SD_cmd             (b_SD_cmd_to_and_from_the_SDCARD),
      .b_SD_dat             (b_SD_dat_to_and_from_the_SDCARD),
      .b_SD_dat3            (b_SD_dat3_to_and_from_the_SDCARD),
      .i_avalon_address     (SDCARD_avalon_sdcard_slave_address),
      .i_avalon_byteenable  (SDCARD_avalon_sdcard_slave_byteenable),
      .i_avalon_chip_select (SDCARD_avalon_sdcard_slave_chipselect),
      .i_avalon_read        (SDCARD_avalon_sdcard_slave_read),
      .i_avalon_write       (SDCARD_avalon_sdcard_slave_write),
      .i_avalon_writedata   (SDCARD_avalon_sdcard_slave_writedata),
      .i_clock              (clocks_0_sys_clk_out),
      .i_reset_n            (SDCARD_avalon_sdcard_slave_reset_n),
      .o_SD_clock           (o_SD_clock_from_the_SDCARD),
      .o_avalon_readdata    (SDCARD_avalon_sdcard_slave_readdata),
      .o_avalon_waitrequest (SDCARD_avalon_sdcard_slave_waitrequest)
    );

  audio_avalon_audio_slave_arbitrator the_audio_avalon_audio_slave
    (
      .audio_avalon_audio_slave_address                                      (audio_avalon_audio_slave_address),
      .audio_avalon_audio_slave_chipselect                                   (audio_avalon_audio_slave_chipselect),
      .audio_avalon_audio_slave_irq                                          (audio_avalon_audio_slave_irq),
      .audio_avalon_audio_slave_irq_from_sa                                  (audio_avalon_audio_slave_irq_from_sa),
      .audio_avalon_audio_slave_read                                         (audio_avalon_audio_slave_read),
      .audio_avalon_audio_slave_readdata                                     (audio_avalon_audio_slave_readdata),
      .audio_avalon_audio_slave_readdata_from_sa                             (audio_avalon_audio_slave_readdata_from_sa),
      .audio_avalon_audio_slave_reset                                        (audio_avalon_audio_slave_reset),
      .audio_avalon_audio_slave_write                                        (audio_avalon_audio_slave_write),
      .audio_avalon_audio_slave_writedata                                    (audio_avalon_audio_slave_writedata),
      .clk                                                                   (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                                    (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_audio_avalon_audio_slave                    (cpu_0_data_master_granted_audio_avalon_audio_slave),
      .cpu_0_data_master_qualified_request_audio_avalon_audio_slave          (cpu_0_data_master_qualified_request_audio_avalon_audio_slave),
      .cpu_0_data_master_read                                                (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_audio_avalon_audio_slave            (cpu_0_data_master_read_data_valid_audio_avalon_audio_slave),
      .cpu_0_data_master_requests_audio_avalon_audio_slave                   (cpu_0_data_master_requests_audio_avalon_audio_slave),
      .cpu_0_data_master_waitrequest                                         (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                               (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                           (cpu_0_data_master_writedata),
      .d1_audio_avalon_audio_slave_end_xfer                                  (d1_audio_avalon_audio_slave_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave (registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave),
      .reset_n                                                               (clocks_0_sys_clk_out_reset_n)
    );

  audio the_audio
    (
      .AUD_ADCDAT  (AUD_ADCDAT_to_the_audio),
      .AUD_ADCLRCK (AUD_ADCLRCK_to_and_from_the_audio),
      .AUD_BCLK    (AUD_BCLK_to_and_from_the_audio),
      .AUD_DACDAT  (AUD_DACDAT_from_the_audio),
      .AUD_DACLRCK (AUD_DACLRCK_to_and_from_the_audio),
      .address     (audio_avalon_audio_slave_address),
      .chipselect  (audio_avalon_audio_slave_chipselect),
      .clk         (clocks_0_sys_clk_out),
      .irq         (audio_avalon_audio_slave_irq),
      .read        (audio_avalon_audio_slave_read),
      .readdata    (audio_avalon_audio_slave_readdata),
      .reset       (audio_avalon_audio_slave_reset),
      .write       (audio_avalon_audio_slave_write),
      .writedata   (audio_avalon_audio_slave_writedata)
    );

  audio_and_video_config_0_avalon_av_config_slave_arbitrator the_audio_and_video_config_0_avalon_av_config_slave
    (
      .audio_and_video_config_0_avalon_av_config_slave_address                                      (audio_and_video_config_0_avalon_av_config_slave_address),
      .audio_and_video_config_0_avalon_av_config_slave_byteenable                                   (audio_and_video_config_0_avalon_av_config_slave_byteenable),
      .audio_and_video_config_0_avalon_av_config_slave_read                                         (audio_and_video_config_0_avalon_av_config_slave_read),
      .audio_and_video_config_0_avalon_av_config_slave_readdata                                     (audio_and_video_config_0_avalon_av_config_slave_readdata),
      .audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa                             (audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_reset                                        (audio_and_video_config_0_avalon_av_config_slave_reset),
      .audio_and_video_config_0_avalon_av_config_slave_waitrequest                                  (audio_and_video_config_0_avalon_av_config_slave_waitrequest),
      .audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa                          (audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_write                                        (audio_and_video_config_0_avalon_av_config_slave_write),
      .audio_and_video_config_0_avalon_av_config_slave_writedata                                    (audio_and_video_config_0_avalon_av_config_slave_writedata),
      .clk                                                                                          (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                                                           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                                 (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave                    (cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave          (cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_read                                                                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave            (cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave                   (cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_waitrequest                                                                (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                                  (cpu_0_data_master_writedata),
      .d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer                                  (d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave (registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave),
      .reset_n                                                                                      (clocks_0_sys_clk_out_reset_n)
    );

  audio_and_video_config_0 the_audio_and_video_config_0
    (
      .I2C_SCLK    (I2C_SCLK_from_the_audio_and_video_config_0),
      .I2C_SDAT    (I2C_SDAT_to_and_from_the_audio_and_video_config_0),
      .address     (audio_and_video_config_0_avalon_av_config_slave_address),
      .byteenable  (audio_and_video_config_0_avalon_av_config_slave_byteenable),
      .clk         (clocks_0_sys_clk_out),
      .read        (audio_and_video_config_0_avalon_av_config_slave_read),
      .readdata    (audio_and_video_config_0_avalon_av_config_slave_readdata),
      .reset       (audio_and_video_config_0_avalon_av_config_slave_reset),
      .waitrequest (audio_and_video_config_0_avalon_av_config_slave_waitrequest),
      .write       (audio_and_video_config_0_avalon_av_config_slave_write),
      .writedata   (audio_and_video_config_0_avalon_av_config_slave_writedata)
    );

  clocks_0_avalon_clocks_slave_arbitrator the_clocks_0_avalon_clocks_slave
    (
      .AUDIO_SOPC_clock_0_out_address_to_slave                               (AUDIO_SOPC_clock_0_out_address_to_slave),
      .AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave           (AUDIO_SOPC_clock_0_out_granted_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave (AUDIO_SOPC_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_read                                           (AUDIO_SOPC_clock_0_out_read),
      .AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave   (AUDIO_SOPC_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave          (AUDIO_SOPC_clock_0_out_requests_clocks_0_avalon_clocks_slave),
      .AUDIO_SOPC_clock_0_out_write                                          (AUDIO_SOPC_clock_0_out_write),
      .clk                                                                   (clk_50),
      .clocks_0_avalon_clocks_slave_address                                  (clocks_0_avalon_clocks_slave_address),
      .clocks_0_avalon_clocks_slave_readdata                                 (clocks_0_avalon_clocks_slave_readdata),
      .clocks_0_avalon_clocks_slave_readdata_from_sa                         (clocks_0_avalon_clocks_slave_readdata_from_sa),
      .d1_clocks_0_avalon_clocks_slave_end_xfer                              (d1_clocks_0_avalon_clocks_slave_end_xfer),
      .reset_n                                                               (clk_50_reset_n)
    );

  //clocks_0_AUD_CLK_out out_clk assignment, which is an e_assign
  assign clocks_0_AUD_CLK_out = out_clk_clocks_0_AUD_CLK;

  //clocks_0_SDRAM_CLK_out out_clk assignment, which is an e_assign
  assign clocks_0_SDRAM_CLK_out = out_clk_clocks_0_SDRAM_CLK;

  //clocks_0_sys_clk_out out_clk assignment, which is an e_assign
  assign clocks_0_sys_clk_out = out_clk_clocks_0_sys_clk;

  clocks_0 the_clocks_0
    (
      .AUD_CLK   (out_clk_clocks_0_AUD_CLK),
      .CLOCK_27  (clk_27),
      .CLOCK_50  (clk_50),
      .SDRAM_CLK (out_clk_clocks_0_SDRAM_CLK),
      .address   (clocks_0_avalon_clocks_slave_address),
      .readdata  (clocks_0_avalon_clocks_slave_readdata),
      .sys_clk   (out_clk_clocks_0_sys_clk)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                                      (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clocks_0_sys_clk_out_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .AUDIO_SOPC_clock_0_in_readdata_from_sa                                                       (AUDIO_SOPC_clock_0_in_readdata_from_sa),
      .AUDIO_SOPC_clock_0_in_waitrequest_from_sa                                                    (AUDIO_SOPC_clock_0_in_waitrequest_from_sa),
      .SDCARD_avalon_sdcard_slave_readdata_from_sa                                                  (SDCARD_avalon_sdcard_slave_readdata_from_sa),
      .SDCARD_avalon_sdcard_slave_waitrequest_from_sa                                               (SDCARD_avalon_sdcard_slave_waitrequest_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa                             (audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa                          (audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa),
      .audio_avalon_audio_slave_irq_from_sa                                                         (audio_avalon_audio_slave_irq_from_sa),
      .audio_avalon_audio_slave_readdata_from_sa                                                    (audio_avalon_audio_slave_readdata_from_sa),
      .clk                                                                                          (clocks_0_sys_clk_out),
      .cpu_0_data_master_address                                                                    (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                                           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in                                           (cpu_0_data_master_byteenable_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_byteenable_sdram_0_s1                                                      (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_byteenable_sram_0_avalon_sram_slave                                        (cpu_0_data_master_byteenable_sram_0_avalon_sram_slave),
      .cpu_0_data_master_dbs_address                                                                (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                                               (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_dbs_write_8                                                                (cpu_0_data_master_dbs_write_8),
      .cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in                                              (cpu_0_data_master_granted_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave                                         (cpu_0_data_master_granted_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave                    (cpu_0_data_master_granted_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_granted_audio_avalon_audio_slave                                           (cpu_0_data_master_granted_audio_avalon_audio_slave),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                                            (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave                                      (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_sdram_0_s1                                                         (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_granted_sounds_ids_s1                                                      (cpu_0_data_master_granted_sounds_ids_s1),
      .cpu_0_data_master_granted_sram_0_avalon_sram_slave                                           (cpu_0_data_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_data_master_granted_start_sound_s1                                                     (cpu_0_data_master_granted_start_sound_s1),
      .cpu_0_data_master_granted_sysid_control_slave                                                (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_irq                                                                        (cpu_0_data_master_irq),
      .cpu_0_data_master_no_byte_enables_and_last_term                                              (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in                                    (cpu_0_data_master_qualified_request_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave                               (cpu_0_data_master_qualified_request_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave          (cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_qualified_request_audio_avalon_audio_slave                                 (cpu_0_data_master_qualified_request_audio_avalon_audio_slave),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module                                  (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave                            (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_sdram_0_s1                                               (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_qualified_request_sounds_ids_s1                                            (cpu_0_data_master_qualified_request_sounds_ids_s1),
      .cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave                                 (cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_data_master_qualified_request_start_sound_s1                                           (cpu_0_data_master_qualified_request_start_sound_s1),
      .cpu_0_data_master_qualified_request_sysid_control_slave                                      (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                                                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in                                      (cpu_0_data_master_read_data_valid_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave                                 (cpu_0_data_master_read_data_valid_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave            (cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_read_data_valid_audio_avalon_audio_slave                                   (cpu_0_data_master_read_data_valid_audio_avalon_audio_slave),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module                                    (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave                              (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                                                 (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                                  (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_sounds_ids_s1                                              (cpu_0_data_master_read_data_valid_sounds_ids_s1),
      .cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave                                   (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register                    (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register),
      .cpu_0_data_master_read_data_valid_start_sound_s1                                             (cpu_0_data_master_read_data_valid_start_sound_s1),
      .cpu_0_data_master_read_data_valid_sysid_control_slave                                        (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_readdata                                                                   (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in                                             (cpu_0_data_master_requests_AUDIO_SOPC_clock_0_in),
      .cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave                                        (cpu_0_data_master_requests_SDCARD_avalon_sdcard_slave),
      .cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave                   (cpu_0_data_master_requests_audio_and_video_config_0_avalon_av_config_slave),
      .cpu_0_data_master_requests_audio_avalon_audio_slave                                          (cpu_0_data_master_requests_audio_avalon_audio_slave),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                                           (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave                                     (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_sdram_0_s1                                                        (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_requests_sounds_ids_s1                                                     (cpu_0_data_master_requests_sounds_ids_s1),
      .cpu_0_data_master_requests_sram_0_avalon_sram_slave                                          (cpu_0_data_master_requests_sram_0_avalon_sram_slave),
      .cpu_0_data_master_requests_start_sound_s1                                                    (cpu_0_data_master_requests_start_sound_s1),
      .cpu_0_data_master_requests_sysid_control_slave                                               (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_waitrequest                                                                (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                                  (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                                                     (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_AUDIO_SOPC_clock_0_in_end_xfer                                                            (d1_AUDIO_SOPC_clock_0_in_end_xfer),
      .d1_SDCARD_avalon_sdcard_slave_end_xfer                                                       (d1_SDCARD_avalon_sdcard_slave_end_xfer),
      .d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer                                  (d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer),
      .d1_audio_avalon_audio_slave_end_xfer                                                         (d1_audio_avalon_audio_slave_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                                          (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                                                    (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                                       (d1_sdram_0_s1_end_xfer),
      .d1_sounds_ids_s1_end_xfer                                                                    (d1_sounds_ids_s1_end_xfer),
      .d1_sram_0_avalon_sram_slave_end_xfer                                                         (d1_sram_0_avalon_sram_slave_end_xfer),
      .d1_start_sound_s1_end_xfer                                                                   (d1_start_sound_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                              (d1_sysid_control_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                                                    (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                                               (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                                            (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave (registered_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_av_config_slave),
      .registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave                        (registered_cpu_0_data_master_read_data_valid_audio_avalon_audio_slave),
      .reset_n                                                                                      (clocks_0_sys_clk_out_reset_n),
      .sdram_0_s1_readdata_from_sa                                                                  (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                                               (sdram_0_s1_waitrequest_from_sa),
      .sounds_ids_s1_readdata_from_sa                                                               (sounds_ids_s1_readdata_from_sa),
      .sram_0_avalon_sram_slave_readdata_from_sa                                                    (sram_0_avalon_sram_slave_readdata_from_sa),
      .start_sound_s1_readdata_from_sa                                                              (start_sound_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                                         (sysid_control_slave_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                              (clocks_0_sys_clk_out),
      .cpu_0_instruction_master_address                                                 (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                                        (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                                             (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module                         (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_sdram_0_s1                                      (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_granted_sram_0_avalon_sram_slave                        (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module               (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1                            (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave              (cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_read                                                    (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module                 (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                              (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register               (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave                (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register),
      .cpu_0_instruction_master_readdata                                                (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module                        (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_sdram_0_s1                                     (cpu_0_instruction_master_requests_sdram_0_s1),
      .cpu_0_instruction_master_requests_sram_0_avalon_sram_slave                       (cpu_0_instruction_master_requests_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_waitrequest                                             (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                                         (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                              (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                           (d1_sdram_0_s1_end_xfer),
      .d1_sram_0_avalon_sram_slave_end_xfer                                             (d1_sram_0_avalon_sram_slave_end_xfer),
      .reset_n                                                                          (clocks_0_sys_clk_out_reset_n),
      .sdram_0_s1_readdata_from_sa                                                      (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                                   (sdram_0_s1_waitrequest_from_sa),
      .sram_0_avalon_sram_slave_readdata_from_sa                                        (sram_0_avalon_sram_slave_readdata_from_sa)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clocks_0_sys_clk_out),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clocks_0_sys_clk_out_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clocks_0_sys_clk_out),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  sdram_0_s1_arbitrator the_sdram_0_s1
    (
      .clk                                                                (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sdram_0_s1                            (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_dbs_address                                      (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                     (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sdram_0_s1                               (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_no_byte_enables_and_last_term                    (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_sdram_0_s1                     (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                       (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register        (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_sdram_0_s1                              (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_waitrequest                                      (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sdram_0_s1                        (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1              (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_sdram_0_s1                       (cpu_0_instruction_master_requests_sdram_0_s1),
      .d1_sdram_0_s1_end_xfer                                             (d1_sdram_0_s1_end_xfer),
      .reset_n                                                            (clocks_0_sys_clk_out_reset_n),
      .sdram_0_s1_address                                                 (sdram_0_s1_address),
      .sdram_0_s1_byteenable_n                                            (sdram_0_s1_byteenable_n),
      .sdram_0_s1_chipselect                                              (sdram_0_s1_chipselect),
      .sdram_0_s1_read_n                                                  (sdram_0_s1_read_n),
      .sdram_0_s1_readdata                                                (sdram_0_s1_readdata),
      .sdram_0_s1_readdata_from_sa                                        (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_readdatavalid                                           (sdram_0_s1_readdatavalid),
      .sdram_0_s1_reset_n                                                 (sdram_0_s1_reset_n),
      .sdram_0_s1_waitrequest                                             (sdram_0_s1_waitrequest),
      .sdram_0_s1_waitrequest_from_sa                                     (sdram_0_s1_waitrequest_from_sa),
      .sdram_0_s1_write_n                                                 (sdram_0_s1_write_n),
      .sdram_0_s1_writedata                                               (sdram_0_s1_writedata)
    );

  sdram_0 the_sdram_0
    (
      .az_addr        (sdram_0_s1_address),
      .az_be_n        (sdram_0_s1_byteenable_n),
      .az_cs          (sdram_0_s1_chipselect),
      .az_data        (sdram_0_s1_writedata),
      .az_rd_n        (sdram_0_s1_read_n),
      .az_wr_n        (sdram_0_s1_write_n),
      .clk            (clocks_0_sys_clk_out),
      .reset_n        (sdram_0_s1_reset_n),
      .za_data        (sdram_0_s1_readdata),
      .za_valid       (sdram_0_s1_readdatavalid),
      .za_waitrequest (sdram_0_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram_0),
      .zs_ba          (zs_ba_from_the_sdram_0),
      .zs_cas_n       (zs_cas_n_from_the_sdram_0),
      .zs_cke         (zs_cke_from_the_sdram_0),
      .zs_cs_n        (zs_cs_n_from_the_sdram_0),
      .zs_dq          (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm         (zs_dqm_from_the_sdram_0),
      .zs_ras_n       (zs_ras_n_from_the_sdram_0),
      .zs_we_n        (zs_we_n_from_the_sdram_0)
    );

  sounds_ids_s1_arbitrator the_sounds_ids_s1
    (
      .clk                                               (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sounds_ids_s1           (cpu_0_data_master_granted_sounds_ids_s1),
      .cpu_0_data_master_qualified_request_sounds_ids_s1 (cpu_0_data_master_qualified_request_sounds_ids_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sounds_ids_s1   (cpu_0_data_master_read_data_valid_sounds_ids_s1),
      .cpu_0_data_master_requests_sounds_ids_s1          (cpu_0_data_master_requests_sounds_ids_s1),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .d1_sounds_ids_s1_end_xfer                         (d1_sounds_ids_s1_end_xfer),
      .reset_n                                           (clocks_0_sys_clk_out_reset_n),
      .sounds_ids_s1_address                             (sounds_ids_s1_address),
      .sounds_ids_s1_readdata                            (sounds_ids_s1_readdata),
      .sounds_ids_s1_readdata_from_sa                    (sounds_ids_s1_readdata_from_sa),
      .sounds_ids_s1_reset_n                             (sounds_ids_s1_reset_n)
    );

  sounds_ids the_sounds_ids
    (
      .address  (sounds_ids_s1_address),
      .clk      (clocks_0_sys_clk_out),
      .in_port  (in_port_to_the_sounds_ids),
      .readdata (sounds_ids_s1_readdata),
      .reset_n  (sounds_ids_s1_reset_n)
    );

  sram_0_avalon_sram_slave_arbitrator the_sram_0_avalon_sram_slave
    (
      .clk                                                                              (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                                               (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                     (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sram_0_avalon_sram_slave                            (cpu_0_data_master_byteenable_sram_0_avalon_sram_slave),
      .cpu_0_data_master_dbs_address                                                    (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                                   (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sram_0_avalon_sram_slave                               (cpu_0_data_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_data_master_no_byte_enables_and_last_term                                  (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave                     (cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_data_master_read                                                           (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave                       (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register        (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register),
      .cpu_0_data_master_requests_sram_0_avalon_sram_slave                              (cpu_0_data_master_requests_sram_0_avalon_sram_slave),
      .cpu_0_data_master_waitrequest                                                    (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                          (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                                        (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                                             (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sram_0_avalon_sram_slave                        (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave              (cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_read                                                    (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave                (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register),
      .cpu_0_instruction_master_requests_sram_0_avalon_sram_slave                       (cpu_0_instruction_master_requests_sram_0_avalon_sram_slave),
      .d1_sram_0_avalon_sram_slave_end_xfer                                             (d1_sram_0_avalon_sram_slave_end_xfer),
      .reset_n                                                                          (clocks_0_sys_clk_out_reset_n),
      .sram_0_avalon_sram_slave_address                                                 (sram_0_avalon_sram_slave_address),
      .sram_0_avalon_sram_slave_byteenable                                              (sram_0_avalon_sram_slave_byteenable),
      .sram_0_avalon_sram_slave_read                                                    (sram_0_avalon_sram_slave_read),
      .sram_0_avalon_sram_slave_readdata                                                (sram_0_avalon_sram_slave_readdata),
      .sram_0_avalon_sram_slave_readdata_from_sa                                        (sram_0_avalon_sram_slave_readdata_from_sa),
      .sram_0_avalon_sram_slave_readdatavalid                                           (sram_0_avalon_sram_slave_readdatavalid),
      .sram_0_avalon_sram_slave_reset                                                   (sram_0_avalon_sram_slave_reset),
      .sram_0_avalon_sram_slave_write                                                   (sram_0_avalon_sram_slave_write),
      .sram_0_avalon_sram_slave_writedata                                               (sram_0_avalon_sram_slave_writedata)
    );

  sram_0 the_sram_0
    (
      .SRAM_ADDR     (SRAM_ADDR_from_the_sram_0),
      .SRAM_CE_N     (SRAM_CE_N_from_the_sram_0),
      .SRAM_DQ       (SRAM_DQ_to_and_from_the_sram_0),
      .SRAM_LB_N     (SRAM_LB_N_from_the_sram_0),
      .SRAM_OE_N     (SRAM_OE_N_from_the_sram_0),
      .SRAM_UB_N     (SRAM_UB_N_from_the_sram_0),
      .SRAM_WE_N     (SRAM_WE_N_from_the_sram_0),
      .address       (sram_0_avalon_sram_slave_address),
      .byteenable    (sram_0_avalon_sram_slave_byteenable),
      .clk           (clocks_0_sys_clk_out),
      .read          (sram_0_avalon_sram_slave_read),
      .readdata      (sram_0_avalon_sram_slave_readdata),
      .readdatavalid (sram_0_avalon_sram_slave_readdatavalid),
      .reset         (sram_0_avalon_sram_slave_reset),
      .write         (sram_0_avalon_sram_slave_write),
      .writedata     (sram_0_avalon_sram_slave_writedata)
    );

  start_sound_s1_arbitrator the_start_sound_s1
    (
      .clk                                                (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_start_sound_s1           (cpu_0_data_master_granted_start_sound_s1),
      .cpu_0_data_master_qualified_request_start_sound_s1 (cpu_0_data_master_qualified_request_start_sound_s1),
      .cpu_0_data_master_read                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_start_sound_s1   (cpu_0_data_master_read_data_valid_start_sound_s1),
      .cpu_0_data_master_requests_start_sound_s1          (cpu_0_data_master_requests_start_sound_s1),
      .cpu_0_data_master_write                            (cpu_0_data_master_write),
      .d1_start_sound_s1_end_xfer                         (d1_start_sound_s1_end_xfer),
      .reset_n                                            (clocks_0_sys_clk_out_reset_n),
      .start_sound_s1_address                             (start_sound_s1_address),
      .start_sound_s1_readdata                            (start_sound_s1_readdata),
      .start_sound_s1_readdata_from_sa                    (start_sound_s1_readdata_from_sa),
      .start_sound_s1_reset_n                             (start_sound_s1_reset_n)
    );

  start_sound the_start_sound
    (
      .address  (start_sound_s1_address),
      .clk      (clocks_0_sys_clk_out),
      .in_port  (in_port_to_the_start_sound),
      .readdata (start_sound_s1_readdata),
      .reset_n  (start_sound_s1_reset_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                     (clocks_0_sys_clk_out),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sysid_control_slave           (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_qualified_request_sysid_control_slave (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sysid_control_slave   (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_requests_sysid_control_slave          (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .d1_sysid_control_slave_end_xfer                         (d1_sysid_control_slave_end_xfer),
      .reset_n                                                 (clocks_0_sys_clk_out_reset_n),
      .sysid_control_slave_address                             (sysid_control_slave_address),
      .sysid_control_slave_readdata                            (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                    (sysid_control_slave_readdata_from_sa)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .readdata (sysid_control_slave_readdata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  AUDIO_SOPC_reset_clocks_0_sys_clk_out_domain_synch_module AUDIO_SOPC_reset_clocks_0_sys_clk_out_domain_synch
    (
      .clk      (clocks_0_sys_clk_out),
      .data_in  (1'b1),
      .data_out (clocks_0_sys_clk_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa);

  //reset is asserted asynchronously and deasserted synchronously
  AUDIO_SOPC_reset_clk_50_domain_synch_module AUDIO_SOPC_reset_clk_50_domain_synch
    (
      .clk      (clk_50),
      .data_in  (1'b1),
      .data_out (clk_50_reset_n),
      .reset_n  (reset_n_sources)
    );

  //AUDIO_SOPC_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign AUDIO_SOPC_clock_0_out_endofpacket = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "d:/altera/91sp2/quartus/eda/sim_lib/altera_mf.v"
`include "d:/altera/91sp2/quartus/eda/sim_lib/220model.v"
`include "d:/altera/91sp2/quartus/eda/sim_lib/sgate.v"
`include "sram_0.v"
`include "audio_and_video_config_0.v"
`include "clocks_0.v"
`include "audio_0.v"
`include "audio.v"
// SDCARD.vhd
`include "sdram_0.v"
`include "sdram_0_test_component.v"
`include "sysid.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "AUDIO_SOPC_clock_0.v"
`include "sounds_ids.v"
`include "jtag_uart_0.v"
`include "start_sound.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             AUDIO_SOPC_clock_0_in_endofpacket_from_sa;
  wire             AUDIO_SOPC_clock_0_out_endofpacket;
  wire             AUDIO_SOPC_clock_0_out_nativeaddress;
  wire             AUD_ADCDAT_to_the_audio;
  wire             AUD_ADCLRCK_to_and_from_the_audio;
  wire             AUD_BCLK_to_and_from_the_audio;
  wire             AUD_DACDAT_from_the_audio;
  wire             AUD_DACLRCK_to_and_from_the_audio;
  wire             I2C_SCLK_from_the_audio_and_video_config_0;
  wire             I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_0;
  wire             SRAM_CE_N_from_the_sram_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  wire             SRAM_LB_N_from_the_sram_0;
  wire             SRAM_OE_N_from_the_sram_0;
  wire             SRAM_UB_N_from_the_sram_0;
  wire             SRAM_WE_N_from_the_sram_0;
  wire             b_SD_cmd_to_and_from_the_SDCARD;
  wire             b_SD_dat3_to_and_from_the_SDCARD;
  wire             b_SD_dat_to_and_from_the_SDCARD;
  wire             clk;
  reg              clk_27;
  reg              clk_50;
  wire             clocks_0_AUD_CLK_out;
  wire             clocks_0_SDRAM_CLK_out;
  wire             clocks_0_sys_clk_out;
  wire    [  3: 0] in_port_to_the_sounds_ids;
  wire             in_port_to_the_start_sound;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             o_SD_clock_from_the_SDCARD;
  reg              reset_n;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  AUDIO_SOPC DUT
    (
      .AUD_ADCDAT_to_the_audio                           (AUD_ADCDAT_to_the_audio),
      .AUD_ADCLRCK_to_and_from_the_audio                 (AUD_ADCLRCK_to_and_from_the_audio),
      .AUD_BCLK_to_and_from_the_audio                    (AUD_BCLK_to_and_from_the_audio),
      .AUD_DACDAT_from_the_audio                         (AUD_DACDAT_from_the_audio),
      .AUD_DACLRCK_to_and_from_the_audio                 (AUD_DACLRCK_to_and_from_the_audio),
      .I2C_SCLK_from_the_audio_and_video_config_0        (I2C_SCLK_from_the_audio_and_video_config_0),
      .I2C_SDAT_to_and_from_the_audio_and_video_config_0 (I2C_SDAT_to_and_from_the_audio_and_video_config_0),
      .SRAM_ADDR_from_the_sram_0                         (SRAM_ADDR_from_the_sram_0),
      .SRAM_CE_N_from_the_sram_0                         (SRAM_CE_N_from_the_sram_0),
      .SRAM_DQ_to_and_from_the_sram_0                    (SRAM_DQ_to_and_from_the_sram_0),
      .SRAM_LB_N_from_the_sram_0                         (SRAM_LB_N_from_the_sram_0),
      .SRAM_OE_N_from_the_sram_0                         (SRAM_OE_N_from_the_sram_0),
      .SRAM_UB_N_from_the_sram_0                         (SRAM_UB_N_from_the_sram_0),
      .SRAM_WE_N_from_the_sram_0                         (SRAM_WE_N_from_the_sram_0),
      .b_SD_cmd_to_and_from_the_SDCARD                   (b_SD_cmd_to_and_from_the_SDCARD),
      .b_SD_dat3_to_and_from_the_SDCARD                  (b_SD_dat3_to_and_from_the_SDCARD),
      .b_SD_dat_to_and_from_the_SDCARD                   (b_SD_dat_to_and_from_the_SDCARD),
      .clk_27                                            (clk_27),
      .clk_50                                            (clk_50),
      .clocks_0_AUD_CLK_out                              (clocks_0_AUD_CLK_out),
      .clocks_0_SDRAM_CLK_out                            (clocks_0_SDRAM_CLK_out),
      .clocks_0_sys_clk_out                              (clocks_0_sys_clk_out),
      .in_port_to_the_sounds_ids                         (in_port_to_the_sounds_ids),
      .in_port_to_the_start_sound                        (in_port_to_the_start_sound),
      .o_SD_clock_from_the_SDCARD                        (o_SD_clock_from_the_SDCARD),
      .reset_n                                           (reset_n),
      .zs_addr_from_the_sdram_0                          (zs_addr_from_the_sdram_0),
      .zs_ba_from_the_sdram_0                            (zs_ba_from_the_sdram_0),
      .zs_cas_n_from_the_sdram_0                         (zs_cas_n_from_the_sdram_0),
      .zs_cke_from_the_sdram_0                           (zs_cke_from_the_sdram_0),
      .zs_cs_n_from_the_sdram_0                          (zs_cs_n_from_the_sdram_0),
      .zs_dq_to_and_from_the_sdram_0                     (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm_from_the_sdram_0                           (zs_dqm_from_the_sdram_0),
      .zs_ras_n_from_the_sdram_0                         (zs_ras_n_from_the_sdram_0),
      .zs_we_n_from_the_sdram_0                          (zs_we_n_from_the_sdram_0)
    );

  sdram_0_test_component the_sdram_0_test_component
    (
      .clk      (clocks_0_sys_clk_out),
      .zs_addr  (zs_addr_from_the_sdram_0),
      .zs_ba    (zs_ba_from_the_sdram_0),
      .zs_cas_n (zs_cas_n_from_the_sdram_0),
      .zs_cke   (zs_cke_from_the_sdram_0),
      .zs_cs_n  (zs_cs_n_from_the_sdram_0),
      .zs_dq    (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm   (zs_dqm_from_the_sdram_0),
      .zs_ras_n (zs_ras_n_from_the_sdram_0),
      .zs_we_n  (zs_we_n_from_the_sdram_0)
    );

  initial
    clk_27 = 1'b0;
  always
     if (clk_27 == 1'b1) 
    #18 clk_27 <= ~clk_27;
     else 
    #19 clk_27 <= ~clk_27;
  
  initial
    clk_50 = 1'b0;
  always
    #10 clk_50 <= ~clk_50;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on