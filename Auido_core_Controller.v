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

module Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arbitrator (
                                                                             // inputs:
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest,
                                                                              Auido_core_Controller_clock_1_out_address_to_slave,
                                                                              Auido_core_Controller_clock_1_out_byteenable,
                                                                              Auido_core_Controller_clock_1_out_read,
                                                                              Auido_core_Controller_clock_1_out_write,
                                                                              Auido_core_Controller_clock_1_out_writedata,
                                                                              clk,
                                                                              reset_n,

                                                                             // outputs:
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write,
                                                                              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata,
                                                                              Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                                              Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                                              Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                                              Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                                              d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer
                                                                           )
;

  output  [  7: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address;
  output  [  3: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable;
  output           Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect;
  output           Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read;
  output  [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa;
  output           Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n;
  output           Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa;
  output           Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write;
  output  [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata;
  output           Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  output           Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  output           Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  output           Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  output           d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
  input   [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata;
  input            Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest;
  input   [  9: 0] Auido_core_Controller_clock_1_out_address_to_slave;
  input   [  3: 0] Auido_core_Controller_clock_1_out_byteenable;
  input            Auido_core_Controller_clock_1_out_read;
  input            Auido_core_Controller_clock_1_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_1_out_writedata;
  input            clk;
  input            reset_n;

  wire    [  7: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_allgrants;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_allow_new_arb_cycle;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_bursting_master_saved_grant;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_continuerequest;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_counter_enable;
  reg              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter_next_value;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_set_values;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_beginbursttransfer_internal;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_begins_xfer;
  wire    [  3: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_firsttransfer;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_grant_vector;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_read_cycle;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_write_cycle;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_master_qreq_vector;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_non_bursting_master_requests;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read;
  wire    [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa;
  reg              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reg_firsttransfer;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n;
  reg              Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable2;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_unreg_firsttransfer;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_read;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_write;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write;
  wire    [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata;
  wire             Auido_core_Controller_clock_1_out_arbiterlock;
  wire             Auido_core_Controller_clock_1_out_arbiterlock2;
  wire             Auido_core_Controller_clock_1_out_continuerequest;
  wire             Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             Auido_core_Controller_clock_1_out_saved_grant_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  reg              d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  9: 0] shifted_address_to_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_from_Auido_core_Controller_clock_1_out;
  wire             wait_for_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
    end


  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_begins_xfer = ~d1_reasons_to_wait & ((Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave));
  //assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata;

  assign Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave = (1) & (Auido_core_Controller_clock_1_out_read | Auido_core_Controller_clock_1_out_write);
  //assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter set values, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_set_values = 1;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_non_bursting_master_requests mux, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_non_bursting_master_requests = Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_bursting_master_saved_grant = 0;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter_next_value = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_firsttransfer ? (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_set_values - 1) : |Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter ? (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter - 1) : 0;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_allgrants all slave grants, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_allgrants = |Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_grant_vector;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer assignment, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer = ~(Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_read | Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer & (~Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_allgrants) | (end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & ~Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_non_bursting_master_requests);

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter <= 0;
      else if (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_counter_enable)
          Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter <= Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter_next_value;
    end


  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable <= 0;
      else if ((|Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave) | (end_xfer_arb_share_counter_term_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & ~Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_non_bursting_master_requests))
          Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable <= |Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter_next_value;
    end


  //Auido_core_Controller_clock_1/out Altera_UP_SD_Card_Avalon_Interface_0/avalon_sdcard_slave arbiterlock, which is an e_assign
  assign Auido_core_Controller_clock_1_out_arbiterlock = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable & Auido_core_Controller_clock_1_out_continuerequest;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable2 = |Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arb_share_counter_next_value;

  //Auido_core_Controller_clock_1/out Altera_UP_SD_Card_Avalon_Interface_0/avalon_sdcard_slave arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_1_out_arbiterlock2 = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable2 & Auido_core_Controller_clock_1_out_continuerequest;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_continuerequest = 1;

  //Auido_core_Controller_clock_1_out_continuerequest continued request, which is an e_assign
  assign Auido_core_Controller_clock_1_out_continuerequest = 1;

  assign Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave = Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata mux, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata = Auido_core_Controller_clock_1_out_writedata;

  //master is always granted when requested
  assign Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave = Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;

  //Auido_core_Controller_clock_1/out saved-grant Altera_UP_SD_Card_Avalon_Interface_0/avalon_sdcard_slave, which is an e_assign
  assign Auido_core_Controller_clock_1_out_saved_grant_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave = Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;

  //allow new arb cycle for Altera_UP_SD_Card_Avalon_Interface_0/avalon_sdcard_slave, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_master_qreq_vector = 1;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n assignment, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n = reset_n;

  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect = Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_firsttransfer first transaction, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_firsttransfer = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_begins_xfer ? Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_unreg_firsttransfer : Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reg_firsttransfer;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_unreg_firsttransfer = ~(Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_slavearbiterlockenable & Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_any_continuerequest);

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reg_firsttransfer <= 1'b1;
      else if (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_begins_xfer)
          Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reg_firsttransfer <= Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_unreg_firsttransfer;
    end


  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_beginbursttransfer_internal = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_begins_xfer;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read assignment, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read = Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & Auido_core_Controller_clock_1_out_read;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write assignment, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write = Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & Auido_core_Controller_clock_1_out_write;

  assign shifted_address_to_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_from_Auido_core_Controller_clock_1_out = Auido_core_Controller_clock_1_out_address_to_slave;
  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address mux, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address = shifted_address_to_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_from_Auido_core_Controller_clock_1_out >> 2;

  //d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer <= 1;
      else 
        d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer <= Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
    end


  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_read in a cycle, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_read = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_read_cycle & Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_read_cycle assignment, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_read_cycle = Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & Auido_core_Controller_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_read_cycle;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_write in a cycle, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waits_for_write = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_write_cycle & Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa;

  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_write_cycle assignment, which is an e_assign
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_write_cycle = Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave & Auido_core_Controller_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_in_a_write_cycle;

  assign wait_for_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_counter = 0;
  //Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable byte enable port mux, which is an e_mux
  assign Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable = (Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave)? Auido_core_Controller_clock_1_out_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Altera_UP_SD_Card_Avalon_Interface_0/avalon_sdcard_slave enable non-zero assertions, which is an e_register
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

module Auido_core_Controller_clock_0_in_arbitrator (
                                                     // inputs:
                                                      Auido_core_Controller_clock_0_in_endofpacket,
                                                      Auido_core_Controller_clock_0_in_readdata,
                                                      Auido_core_Controller_clock_0_in_waitrequest,
                                                      clk,
                                                      cpu_0_data_master_address_to_slave,
                                                      cpu_0_data_master_byteenable,
                                                      cpu_0_data_master_read,
                                                      cpu_0_data_master_waitrequest,
                                                      cpu_0_data_master_write,
                                                      cpu_0_data_master_writedata,
                                                      reset_n,

                                                     // outputs:
                                                      Auido_core_Controller_clock_0_in_address,
                                                      Auido_core_Controller_clock_0_in_byteenable,
                                                      Auido_core_Controller_clock_0_in_endofpacket_from_sa,
                                                      Auido_core_Controller_clock_0_in_nativeaddress,
                                                      Auido_core_Controller_clock_0_in_read,
                                                      Auido_core_Controller_clock_0_in_readdata_from_sa,
                                                      Auido_core_Controller_clock_0_in_reset_n,
                                                      Auido_core_Controller_clock_0_in_waitrequest_from_sa,
                                                      Auido_core_Controller_clock_0_in_write,
                                                      Auido_core_Controller_clock_0_in_writedata,
                                                      cpu_0_data_master_granted_Auido_core_Controller_clock_0_in,
                                                      cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in,
                                                      cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in,
                                                      cpu_0_data_master_requests_Auido_core_Controller_clock_0_in,
                                                      d1_Auido_core_Controller_clock_0_in_end_xfer
                                                   )
;

  output  [  3: 0] Auido_core_Controller_clock_0_in_address;
  output  [  3: 0] Auido_core_Controller_clock_0_in_byteenable;
  output           Auido_core_Controller_clock_0_in_endofpacket_from_sa;
  output  [  1: 0] Auido_core_Controller_clock_0_in_nativeaddress;
  output           Auido_core_Controller_clock_0_in_read;
  output  [ 31: 0] Auido_core_Controller_clock_0_in_readdata_from_sa;
  output           Auido_core_Controller_clock_0_in_reset_n;
  output           Auido_core_Controller_clock_0_in_waitrequest_from_sa;
  output           Auido_core_Controller_clock_0_in_write;
  output  [ 31: 0] Auido_core_Controller_clock_0_in_writedata;
  output           cpu_0_data_master_granted_Auido_core_Controller_clock_0_in;
  output           cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in;
  output           cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in;
  output           cpu_0_data_master_requests_Auido_core_Controller_clock_0_in;
  output           d1_Auido_core_Controller_clock_0_in_end_xfer;
  input            Auido_core_Controller_clock_0_in_endofpacket;
  input   [ 31: 0] Auido_core_Controller_clock_0_in_readdata;
  input            Auido_core_Controller_clock_0_in_waitrequest;
  input            clk;
  input   [ 20: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  3: 0] Auido_core_Controller_clock_0_in_address;
  wire             Auido_core_Controller_clock_0_in_allgrants;
  wire             Auido_core_Controller_clock_0_in_allow_new_arb_cycle;
  wire             Auido_core_Controller_clock_0_in_any_bursting_master_saved_grant;
  wire             Auido_core_Controller_clock_0_in_any_continuerequest;
  wire             Auido_core_Controller_clock_0_in_arb_counter_enable;
  reg     [  2: 0] Auido_core_Controller_clock_0_in_arb_share_counter;
  wire    [  2: 0] Auido_core_Controller_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] Auido_core_Controller_clock_0_in_arb_share_set_values;
  wire             Auido_core_Controller_clock_0_in_beginbursttransfer_internal;
  wire             Auido_core_Controller_clock_0_in_begins_xfer;
  wire    [  3: 0] Auido_core_Controller_clock_0_in_byteenable;
  wire             Auido_core_Controller_clock_0_in_end_xfer;
  wire             Auido_core_Controller_clock_0_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_0_in_firsttransfer;
  wire             Auido_core_Controller_clock_0_in_grant_vector;
  wire             Auido_core_Controller_clock_0_in_in_a_read_cycle;
  wire             Auido_core_Controller_clock_0_in_in_a_write_cycle;
  wire             Auido_core_Controller_clock_0_in_master_qreq_vector;
  wire    [  1: 0] Auido_core_Controller_clock_0_in_nativeaddress;
  wire             Auido_core_Controller_clock_0_in_non_bursting_master_requests;
  wire             Auido_core_Controller_clock_0_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_0_in_readdata_from_sa;
  reg              Auido_core_Controller_clock_0_in_reg_firsttransfer;
  wire             Auido_core_Controller_clock_0_in_reset_n;
  reg              Auido_core_Controller_clock_0_in_slavearbiterlockenable;
  wire             Auido_core_Controller_clock_0_in_slavearbiterlockenable2;
  wire             Auido_core_Controller_clock_0_in_unreg_firsttransfer;
  wire             Auido_core_Controller_clock_0_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_0_in_waits_for_read;
  wire             Auido_core_Controller_clock_0_in_waits_for_write;
  wire             Auido_core_Controller_clock_0_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_0_in_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_requests_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_saved_grant_Auido_core_Controller_clock_0_in;
  reg              d1_Auido_core_Controller_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Auido_core_Controller_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Auido_core_Controller_clock_0_in_end_xfer;
    end


  assign Auido_core_Controller_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in));
  //assign Auido_core_Controller_clock_0_in_readdata_from_sa = Auido_core_Controller_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_0_in_readdata_from_sa = Auido_core_Controller_clock_0_in_readdata;

  assign cpu_0_data_master_requests_Auido_core_Controller_clock_0_in = ({cpu_0_data_master_address_to_slave[20 : 4] , 4'b0} == 21'h101400) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign Auido_core_Controller_clock_0_in_waitrequest_from_sa = Auido_core_Controller_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_0_in_waitrequest_from_sa = Auido_core_Controller_clock_0_in_waitrequest;

  //Auido_core_Controller_clock_0_in_arb_share_counter set values, which is an e_mux
  assign Auido_core_Controller_clock_0_in_arb_share_set_values = 1;

  //Auido_core_Controller_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign Auido_core_Controller_clock_0_in_non_bursting_master_requests = cpu_0_data_master_requests_Auido_core_Controller_clock_0_in;

  //Auido_core_Controller_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Auido_core_Controller_clock_0_in_any_bursting_master_saved_grant = 0;

  //Auido_core_Controller_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_in_arb_share_counter_next_value = Auido_core_Controller_clock_0_in_firsttransfer ? (Auido_core_Controller_clock_0_in_arb_share_set_values - 1) : |Auido_core_Controller_clock_0_in_arb_share_counter ? (Auido_core_Controller_clock_0_in_arb_share_counter - 1) : 0;

  //Auido_core_Controller_clock_0_in_allgrants all slave grants, which is an e_mux
  assign Auido_core_Controller_clock_0_in_allgrants = |Auido_core_Controller_clock_0_in_grant_vector;

  //Auido_core_Controller_clock_0_in_end_xfer assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_in_end_xfer = ~(Auido_core_Controller_clock_0_in_waits_for_read | Auido_core_Controller_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in = Auido_core_Controller_clock_0_in_end_xfer & (~Auido_core_Controller_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Auido_core_Controller_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Auido_core_Controller_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in & Auido_core_Controller_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in & ~Auido_core_Controller_clock_0_in_non_bursting_master_requests);

  //Auido_core_Controller_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_in_arb_share_counter <= 0;
      else if (Auido_core_Controller_clock_0_in_arb_counter_enable)
          Auido_core_Controller_clock_0_in_arb_share_counter <= Auido_core_Controller_clock_0_in_arb_share_counter_next_value;
    end


  //Auido_core_Controller_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|Auido_core_Controller_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_0_in & ~Auido_core_Controller_clock_0_in_non_bursting_master_requests))
          Auido_core_Controller_clock_0_in_slavearbiterlockenable <= |Auido_core_Controller_clock_0_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master Auido_core_Controller_clock_0/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = Auido_core_Controller_clock_0_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //Auido_core_Controller_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_0_in_slavearbiterlockenable2 = |Auido_core_Controller_clock_0_in_arb_share_counter_next_value;

  //cpu_0/data_master Auido_core_Controller_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = Auido_core_Controller_clock_0_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //Auido_core_Controller_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Auido_core_Controller_clock_0_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in = cpu_0_data_master_requests_Auido_core_Controller_clock_0_in & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //Auido_core_Controller_clock_0_in_writedata mux, which is an e_mux
  assign Auido_core_Controller_clock_0_in_writedata = cpu_0_data_master_writedata;

  //assign Auido_core_Controller_clock_0_in_endofpacket_from_sa = Auido_core_Controller_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_0_in_endofpacket_from_sa = Auido_core_Controller_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_Auido_core_Controller_clock_0_in = cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in;

  //cpu_0/data_master saved-grant Auido_core_Controller_clock_0/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_Auido_core_Controller_clock_0_in = cpu_0_data_master_requests_Auido_core_Controller_clock_0_in;

  //allow new arb cycle for Auido_core_Controller_clock_0/in, which is an e_assign
  assign Auido_core_Controller_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Auido_core_Controller_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Auido_core_Controller_clock_0_in_master_qreq_vector = 1;

  //Auido_core_Controller_clock_0_in_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_in_reset_n = reset_n;

  //Auido_core_Controller_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_0_in_firsttransfer = Auido_core_Controller_clock_0_in_begins_xfer ? Auido_core_Controller_clock_0_in_unreg_firsttransfer : Auido_core_Controller_clock_0_in_reg_firsttransfer;

  //Auido_core_Controller_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_0_in_unreg_firsttransfer = ~(Auido_core_Controller_clock_0_in_slavearbiterlockenable & Auido_core_Controller_clock_0_in_any_continuerequest);

  //Auido_core_Controller_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (Auido_core_Controller_clock_0_in_begins_xfer)
          Auido_core_Controller_clock_0_in_reg_firsttransfer <= Auido_core_Controller_clock_0_in_unreg_firsttransfer;
    end


  //Auido_core_Controller_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Auido_core_Controller_clock_0_in_beginbursttransfer_internal = Auido_core_Controller_clock_0_in_begins_xfer;

  //Auido_core_Controller_clock_0_in_read assignment, which is an e_mux
  assign Auido_core_Controller_clock_0_in_read = cpu_0_data_master_granted_Auido_core_Controller_clock_0_in & cpu_0_data_master_read;

  //Auido_core_Controller_clock_0_in_write assignment, which is an e_mux
  assign Auido_core_Controller_clock_0_in_write = cpu_0_data_master_granted_Auido_core_Controller_clock_0_in & cpu_0_data_master_write;

  //Auido_core_Controller_clock_0_in_address mux, which is an e_mux
  assign Auido_core_Controller_clock_0_in_address = cpu_0_data_master_address_to_slave;

  //slaveid Auido_core_Controller_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Auido_core_Controller_clock_0_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_Auido_core_Controller_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Auido_core_Controller_clock_0_in_end_xfer <= 1;
      else 
        d1_Auido_core_Controller_clock_0_in_end_xfer <= Auido_core_Controller_clock_0_in_end_xfer;
    end


  //Auido_core_Controller_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_0_in_waits_for_read = Auido_core_Controller_clock_0_in_in_a_read_cycle & Auido_core_Controller_clock_0_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_in_in_a_read_cycle = cpu_0_data_master_granted_Auido_core_Controller_clock_0_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Auido_core_Controller_clock_0_in_in_a_read_cycle;

  //Auido_core_Controller_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_0_in_waits_for_write = Auido_core_Controller_clock_0_in_in_a_write_cycle & Auido_core_Controller_clock_0_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_in_in_a_write_cycle = cpu_0_data_master_granted_Auido_core_Controller_clock_0_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Auido_core_Controller_clock_0_in_in_a_write_cycle;

  assign wait_for_Auido_core_Controller_clock_0_in_counter = 0;
  //Auido_core_Controller_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign Auido_core_Controller_clock_0_in_byteenable = (cpu_0_data_master_granted_Auido_core_Controller_clock_0_in)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_0/in enable non-zero assertions, which is an e_register
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

module Auido_core_Controller_clock_0_out_arbitrator (
                                                      // inputs:
                                                       Auido_core_Controller_clock_0_out_address,
                                                       Auido_core_Controller_clock_0_out_byteenable,
                                                       Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave,
                                                       Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave,
                                                       Auido_core_Controller_clock_0_out_read,
                                                       Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave,
                                                       Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave,
                                                       Auido_core_Controller_clock_0_out_write,
                                                       Auido_core_Controller_clock_0_out_writedata,
                                                       audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa,
                                                       audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa,
                                                       clk,
                                                       d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer,
                                                       reset_n,

                                                      // outputs:
                                                       Auido_core_Controller_clock_0_out_address_to_slave,
                                                       Auido_core_Controller_clock_0_out_readdata,
                                                       Auido_core_Controller_clock_0_out_reset_n,
                                                       Auido_core_Controller_clock_0_out_waitrequest
                                                    )
;

  output  [  3: 0] Auido_core_Controller_clock_0_out_address_to_slave;
  output  [ 31: 0] Auido_core_Controller_clock_0_out_readdata;
  output           Auido_core_Controller_clock_0_out_reset_n;
  output           Auido_core_Controller_clock_0_out_waitrequest;
  input   [  3: 0] Auido_core_Controller_clock_0_out_address;
  input   [  3: 0] Auido_core_Controller_clock_0_out_byteenable;
  input            Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave;
  input            Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  input            Auido_core_Controller_clock_0_out_read;
  input            Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  input            Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave;
  input            Auido_core_Controller_clock_0_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_0_out_writedata;
  input   [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;
  input            audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;
  input            clk;
  input            d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  input            reset_n;

  reg     [  3: 0] Auido_core_Controller_clock_0_out_address_last_time;
  wire    [  3: 0] Auido_core_Controller_clock_0_out_address_to_slave;
  reg     [  3: 0] Auido_core_Controller_clock_0_out_byteenable_last_time;
  reg              Auido_core_Controller_clock_0_out_read_last_time;
  wire    [ 31: 0] Auido_core_Controller_clock_0_out_readdata;
  wire             Auido_core_Controller_clock_0_out_reset_n;
  wire             Auido_core_Controller_clock_0_out_run;
  wire             Auido_core_Controller_clock_0_out_waitrequest;
  reg              Auido_core_Controller_clock_0_out_write_last_time;
  reg     [ 31: 0] Auido_core_Controller_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave | Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave | ~Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave) & ((~Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave | ~Auido_core_Controller_clock_0_out_read | (Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave & Auido_core_Controller_clock_0_out_read))) & ((~Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave | ~(Auido_core_Controller_clock_0_out_read | Auido_core_Controller_clock_0_out_write) | (1 & ~audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa & (Auido_core_Controller_clock_0_out_read | Auido_core_Controller_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign Auido_core_Controller_clock_0_out_address_to_slave = Auido_core_Controller_clock_0_out_address;

  //Auido_core_Controller_clock_0/out readdata mux, which is an e_mux
  assign Auido_core_Controller_clock_0_out_readdata = audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Auido_core_Controller_clock_0_out_waitrequest = ~Auido_core_Controller_clock_0_out_run;

  //Auido_core_Controller_clock_0_out_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_out_address_last_time <= 0;
      else 
        Auido_core_Controller_clock_0_out_address_last_time <= Auido_core_Controller_clock_0_out_address;
    end


  //Auido_core_Controller_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Auido_core_Controller_clock_0_out_waitrequest & (Auido_core_Controller_clock_0_out_read | Auido_core_Controller_clock_0_out_write);
    end


  //Auido_core_Controller_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_0_out_address != Auido_core_Controller_clock_0_out_address_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_out_byteenable_last_time <= 0;
      else 
        Auido_core_Controller_clock_0_out_byteenable_last_time <= Auido_core_Controller_clock_0_out_byteenable;
    end


  //Auido_core_Controller_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_0_out_byteenable != Auido_core_Controller_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_out_read_last_time <= 0;
      else 
        Auido_core_Controller_clock_0_out_read_last_time <= Auido_core_Controller_clock_0_out_read;
    end


  //Auido_core_Controller_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_0_out_read != Auido_core_Controller_clock_0_out_read_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_out_write_last_time <= 0;
      else 
        Auido_core_Controller_clock_0_out_write_last_time <= Auido_core_Controller_clock_0_out_write;
    end


  //Auido_core_Controller_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_0_out_write != Auido_core_Controller_clock_0_out_write_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_out_writedata_last_time <= 0;
      else 
        Auido_core_Controller_clock_0_out_writedata_last_time <= Auido_core_Controller_clock_0_out_writedata;
    end


  //Auido_core_Controller_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_0_out_writedata != Auido_core_Controller_clock_0_out_writedata_last_time) & Auido_core_Controller_clock_0_out_write)
        begin
          $write("%0d ns: Auido_core_Controller_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Auido_core_Controller_clock_1_in_arbitrator (
                                                     // inputs:
                                                      Auido_core_Controller_clock_1_in_endofpacket,
                                                      Auido_core_Controller_clock_1_in_readdata,
                                                      Auido_core_Controller_clock_1_in_waitrequest,
                                                      clk,
                                                      cpu_0_data_master_address_to_slave,
                                                      cpu_0_data_master_byteenable,
                                                      cpu_0_data_master_read,
                                                      cpu_0_data_master_waitrequest,
                                                      cpu_0_data_master_write,
                                                      cpu_0_data_master_writedata,
                                                      reset_n,

                                                     // outputs:
                                                      Auido_core_Controller_clock_1_in_address,
                                                      Auido_core_Controller_clock_1_in_byteenable,
                                                      Auido_core_Controller_clock_1_in_endofpacket_from_sa,
                                                      Auido_core_Controller_clock_1_in_nativeaddress,
                                                      Auido_core_Controller_clock_1_in_read,
                                                      Auido_core_Controller_clock_1_in_readdata_from_sa,
                                                      Auido_core_Controller_clock_1_in_reset_n,
                                                      Auido_core_Controller_clock_1_in_waitrequest_from_sa,
                                                      Auido_core_Controller_clock_1_in_write,
                                                      Auido_core_Controller_clock_1_in_writedata,
                                                      cpu_0_data_master_granted_Auido_core_Controller_clock_1_in,
                                                      cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in,
                                                      cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in,
                                                      cpu_0_data_master_requests_Auido_core_Controller_clock_1_in,
                                                      d1_Auido_core_Controller_clock_1_in_end_xfer
                                                   )
;

  output  [  9: 0] Auido_core_Controller_clock_1_in_address;
  output  [  3: 0] Auido_core_Controller_clock_1_in_byteenable;
  output           Auido_core_Controller_clock_1_in_endofpacket_from_sa;
  output  [  7: 0] Auido_core_Controller_clock_1_in_nativeaddress;
  output           Auido_core_Controller_clock_1_in_read;
  output  [ 31: 0] Auido_core_Controller_clock_1_in_readdata_from_sa;
  output           Auido_core_Controller_clock_1_in_reset_n;
  output           Auido_core_Controller_clock_1_in_waitrequest_from_sa;
  output           Auido_core_Controller_clock_1_in_write;
  output  [ 31: 0] Auido_core_Controller_clock_1_in_writedata;
  output           cpu_0_data_master_granted_Auido_core_Controller_clock_1_in;
  output           cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in;
  output           cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in;
  output           cpu_0_data_master_requests_Auido_core_Controller_clock_1_in;
  output           d1_Auido_core_Controller_clock_1_in_end_xfer;
  input            Auido_core_Controller_clock_1_in_endofpacket;
  input   [ 31: 0] Auido_core_Controller_clock_1_in_readdata;
  input            Auido_core_Controller_clock_1_in_waitrequest;
  input            clk;
  input   [ 20: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  9: 0] Auido_core_Controller_clock_1_in_address;
  wire             Auido_core_Controller_clock_1_in_allgrants;
  wire             Auido_core_Controller_clock_1_in_allow_new_arb_cycle;
  wire             Auido_core_Controller_clock_1_in_any_bursting_master_saved_grant;
  wire             Auido_core_Controller_clock_1_in_any_continuerequest;
  wire             Auido_core_Controller_clock_1_in_arb_counter_enable;
  reg     [  2: 0] Auido_core_Controller_clock_1_in_arb_share_counter;
  wire    [  2: 0] Auido_core_Controller_clock_1_in_arb_share_counter_next_value;
  wire    [  2: 0] Auido_core_Controller_clock_1_in_arb_share_set_values;
  wire             Auido_core_Controller_clock_1_in_beginbursttransfer_internal;
  wire             Auido_core_Controller_clock_1_in_begins_xfer;
  wire    [  3: 0] Auido_core_Controller_clock_1_in_byteenable;
  wire             Auido_core_Controller_clock_1_in_end_xfer;
  wire             Auido_core_Controller_clock_1_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_1_in_firsttransfer;
  wire             Auido_core_Controller_clock_1_in_grant_vector;
  wire             Auido_core_Controller_clock_1_in_in_a_read_cycle;
  wire             Auido_core_Controller_clock_1_in_in_a_write_cycle;
  wire             Auido_core_Controller_clock_1_in_master_qreq_vector;
  wire    [  7: 0] Auido_core_Controller_clock_1_in_nativeaddress;
  wire             Auido_core_Controller_clock_1_in_non_bursting_master_requests;
  wire             Auido_core_Controller_clock_1_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_1_in_readdata_from_sa;
  reg              Auido_core_Controller_clock_1_in_reg_firsttransfer;
  wire             Auido_core_Controller_clock_1_in_reset_n;
  reg              Auido_core_Controller_clock_1_in_slavearbiterlockenable;
  wire             Auido_core_Controller_clock_1_in_slavearbiterlockenable2;
  wire             Auido_core_Controller_clock_1_in_unreg_firsttransfer;
  wire             Auido_core_Controller_clock_1_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_1_in_waits_for_read;
  wire             Auido_core_Controller_clock_1_in_waits_for_write;
  wire             Auido_core_Controller_clock_1_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_1_in_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_requests_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_saved_grant_Auido_core_Controller_clock_1_in;
  reg              d1_Auido_core_Controller_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Auido_core_Controller_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Auido_core_Controller_clock_1_in_end_xfer;
    end


  assign Auido_core_Controller_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in));
  //assign Auido_core_Controller_clock_1_in_readdata_from_sa = Auido_core_Controller_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_1_in_readdata_from_sa = Auido_core_Controller_clock_1_in_readdata;

  assign cpu_0_data_master_requests_Auido_core_Controller_clock_1_in = ({cpu_0_data_master_address_to_slave[20 : 10] , 10'b0} == 21'h101000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign Auido_core_Controller_clock_1_in_waitrequest_from_sa = Auido_core_Controller_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_1_in_waitrequest_from_sa = Auido_core_Controller_clock_1_in_waitrequest;

  //Auido_core_Controller_clock_1_in_arb_share_counter set values, which is an e_mux
  assign Auido_core_Controller_clock_1_in_arb_share_set_values = 1;

  //Auido_core_Controller_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign Auido_core_Controller_clock_1_in_non_bursting_master_requests = cpu_0_data_master_requests_Auido_core_Controller_clock_1_in;

  //Auido_core_Controller_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Auido_core_Controller_clock_1_in_any_bursting_master_saved_grant = 0;

  //Auido_core_Controller_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_in_arb_share_counter_next_value = Auido_core_Controller_clock_1_in_firsttransfer ? (Auido_core_Controller_clock_1_in_arb_share_set_values - 1) : |Auido_core_Controller_clock_1_in_arb_share_counter ? (Auido_core_Controller_clock_1_in_arb_share_counter - 1) : 0;

  //Auido_core_Controller_clock_1_in_allgrants all slave grants, which is an e_mux
  assign Auido_core_Controller_clock_1_in_allgrants = |Auido_core_Controller_clock_1_in_grant_vector;

  //Auido_core_Controller_clock_1_in_end_xfer assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_in_end_xfer = ~(Auido_core_Controller_clock_1_in_waits_for_read | Auido_core_Controller_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in = Auido_core_Controller_clock_1_in_end_xfer & (~Auido_core_Controller_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Auido_core_Controller_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Auido_core_Controller_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in & Auido_core_Controller_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in & ~Auido_core_Controller_clock_1_in_non_bursting_master_requests);

  //Auido_core_Controller_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_in_arb_share_counter <= 0;
      else if (Auido_core_Controller_clock_1_in_arb_counter_enable)
          Auido_core_Controller_clock_1_in_arb_share_counter <= Auido_core_Controller_clock_1_in_arb_share_counter_next_value;
    end


  //Auido_core_Controller_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|Auido_core_Controller_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_1_in & ~Auido_core_Controller_clock_1_in_non_bursting_master_requests))
          Auido_core_Controller_clock_1_in_slavearbiterlockenable <= |Auido_core_Controller_clock_1_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master Auido_core_Controller_clock_1/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = Auido_core_Controller_clock_1_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //Auido_core_Controller_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_1_in_slavearbiterlockenable2 = |Auido_core_Controller_clock_1_in_arb_share_counter_next_value;

  //cpu_0/data_master Auido_core_Controller_clock_1/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = Auido_core_Controller_clock_1_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //Auido_core_Controller_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Auido_core_Controller_clock_1_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in = cpu_0_data_master_requests_Auido_core_Controller_clock_1_in & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //Auido_core_Controller_clock_1_in_writedata mux, which is an e_mux
  assign Auido_core_Controller_clock_1_in_writedata = cpu_0_data_master_writedata;

  //assign Auido_core_Controller_clock_1_in_endofpacket_from_sa = Auido_core_Controller_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_1_in_endofpacket_from_sa = Auido_core_Controller_clock_1_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_Auido_core_Controller_clock_1_in = cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in;

  //cpu_0/data_master saved-grant Auido_core_Controller_clock_1/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_Auido_core_Controller_clock_1_in = cpu_0_data_master_requests_Auido_core_Controller_clock_1_in;

  //allow new arb cycle for Auido_core_Controller_clock_1/in, which is an e_assign
  assign Auido_core_Controller_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Auido_core_Controller_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Auido_core_Controller_clock_1_in_master_qreq_vector = 1;

  //Auido_core_Controller_clock_1_in_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_in_reset_n = reset_n;

  //Auido_core_Controller_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_1_in_firsttransfer = Auido_core_Controller_clock_1_in_begins_xfer ? Auido_core_Controller_clock_1_in_unreg_firsttransfer : Auido_core_Controller_clock_1_in_reg_firsttransfer;

  //Auido_core_Controller_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_1_in_unreg_firsttransfer = ~(Auido_core_Controller_clock_1_in_slavearbiterlockenable & Auido_core_Controller_clock_1_in_any_continuerequest);

  //Auido_core_Controller_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (Auido_core_Controller_clock_1_in_begins_xfer)
          Auido_core_Controller_clock_1_in_reg_firsttransfer <= Auido_core_Controller_clock_1_in_unreg_firsttransfer;
    end


  //Auido_core_Controller_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Auido_core_Controller_clock_1_in_beginbursttransfer_internal = Auido_core_Controller_clock_1_in_begins_xfer;

  //Auido_core_Controller_clock_1_in_read assignment, which is an e_mux
  assign Auido_core_Controller_clock_1_in_read = cpu_0_data_master_granted_Auido_core_Controller_clock_1_in & cpu_0_data_master_read;

  //Auido_core_Controller_clock_1_in_write assignment, which is an e_mux
  assign Auido_core_Controller_clock_1_in_write = cpu_0_data_master_granted_Auido_core_Controller_clock_1_in & cpu_0_data_master_write;

  //Auido_core_Controller_clock_1_in_address mux, which is an e_mux
  assign Auido_core_Controller_clock_1_in_address = cpu_0_data_master_address_to_slave;

  //slaveid Auido_core_Controller_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Auido_core_Controller_clock_1_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_Auido_core_Controller_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Auido_core_Controller_clock_1_in_end_xfer <= 1;
      else 
        d1_Auido_core_Controller_clock_1_in_end_xfer <= Auido_core_Controller_clock_1_in_end_xfer;
    end


  //Auido_core_Controller_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_1_in_waits_for_read = Auido_core_Controller_clock_1_in_in_a_read_cycle & Auido_core_Controller_clock_1_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_in_in_a_read_cycle = cpu_0_data_master_granted_Auido_core_Controller_clock_1_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Auido_core_Controller_clock_1_in_in_a_read_cycle;

  //Auido_core_Controller_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_1_in_waits_for_write = Auido_core_Controller_clock_1_in_in_a_write_cycle & Auido_core_Controller_clock_1_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_in_in_a_write_cycle = cpu_0_data_master_granted_Auido_core_Controller_clock_1_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Auido_core_Controller_clock_1_in_in_a_write_cycle;

  assign wait_for_Auido_core_Controller_clock_1_in_counter = 0;
  //Auido_core_Controller_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign Auido_core_Controller_clock_1_in_byteenable = (cpu_0_data_master_granted_Auido_core_Controller_clock_1_in)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_1/in enable non-zero assertions, which is an e_register
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

module Auido_core_Controller_clock_1_out_arbitrator (
                                                      // inputs:
                                                       Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa,
                                                       Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa,
                                                       Auido_core_Controller_clock_1_out_address,
                                                       Auido_core_Controller_clock_1_out_byteenable,
                                                       Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                       Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                       Auido_core_Controller_clock_1_out_read,
                                                       Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                       Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave,
                                                       Auido_core_Controller_clock_1_out_write,
                                                       Auido_core_Controller_clock_1_out_writedata,
                                                       clk,
                                                       d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer,
                                                       reset_n,

                                                      // outputs:
                                                       Auido_core_Controller_clock_1_out_address_to_slave,
                                                       Auido_core_Controller_clock_1_out_readdata,
                                                       Auido_core_Controller_clock_1_out_reset_n,
                                                       Auido_core_Controller_clock_1_out_waitrequest
                                                    )
;

  output  [  9: 0] Auido_core_Controller_clock_1_out_address_to_slave;
  output  [ 31: 0] Auido_core_Controller_clock_1_out_readdata;
  output           Auido_core_Controller_clock_1_out_reset_n;
  output           Auido_core_Controller_clock_1_out_waitrequest;
  input   [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa;
  input            Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa;
  input   [  9: 0] Auido_core_Controller_clock_1_out_address;
  input   [  3: 0] Auido_core_Controller_clock_1_out_byteenable;
  input            Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  input            Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  input            Auido_core_Controller_clock_1_out_read;
  input            Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  input            Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  input            Auido_core_Controller_clock_1_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_1_out_writedata;
  input            clk;
  input            d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
  input            reset_n;

  reg     [  9: 0] Auido_core_Controller_clock_1_out_address_last_time;
  wire    [  9: 0] Auido_core_Controller_clock_1_out_address_to_slave;
  reg     [  3: 0] Auido_core_Controller_clock_1_out_byteenable_last_time;
  reg              Auido_core_Controller_clock_1_out_read_last_time;
  wire    [ 31: 0] Auido_core_Controller_clock_1_out_readdata;
  wire             Auido_core_Controller_clock_1_out_reset_n;
  wire             Auido_core_Controller_clock_1_out_run;
  wire             Auido_core_Controller_clock_1_out_waitrequest;
  reg              Auido_core_Controller_clock_1_out_write_last_time;
  reg     [ 31: 0] Auido_core_Controller_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave | ~(Auido_core_Controller_clock_1_out_read | Auido_core_Controller_clock_1_out_write) | (1 & ~Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa & (Auido_core_Controller_clock_1_out_read | Auido_core_Controller_clock_1_out_write)))) & ((~Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave | ~(Auido_core_Controller_clock_1_out_read | Auido_core_Controller_clock_1_out_write) | (1 & ~Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa & (Auido_core_Controller_clock_1_out_read | Auido_core_Controller_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign Auido_core_Controller_clock_1_out_address_to_slave = Auido_core_Controller_clock_1_out_address;

  //Auido_core_Controller_clock_1/out readdata mux, which is an e_mux
  assign Auido_core_Controller_clock_1_out_readdata = Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Auido_core_Controller_clock_1_out_waitrequest = ~Auido_core_Controller_clock_1_out_run;

  //Auido_core_Controller_clock_1_out_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_out_address_last_time <= 0;
      else 
        Auido_core_Controller_clock_1_out_address_last_time <= Auido_core_Controller_clock_1_out_address;
    end


  //Auido_core_Controller_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Auido_core_Controller_clock_1_out_waitrequest & (Auido_core_Controller_clock_1_out_read | Auido_core_Controller_clock_1_out_write);
    end


  //Auido_core_Controller_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_1_out_address != Auido_core_Controller_clock_1_out_address_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_out_byteenable_last_time <= 0;
      else 
        Auido_core_Controller_clock_1_out_byteenable_last_time <= Auido_core_Controller_clock_1_out_byteenable;
    end


  //Auido_core_Controller_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_1_out_byteenable != Auido_core_Controller_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_out_read_last_time <= 0;
      else 
        Auido_core_Controller_clock_1_out_read_last_time <= Auido_core_Controller_clock_1_out_read;
    end


  //Auido_core_Controller_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_1_out_read != Auido_core_Controller_clock_1_out_read_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_out_write_last_time <= 0;
      else 
        Auido_core_Controller_clock_1_out_write_last_time <= Auido_core_Controller_clock_1_out_write;
    end


  //Auido_core_Controller_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_1_out_write != Auido_core_Controller_clock_1_out_write_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_1_out_writedata_last_time <= 0;
      else 
        Auido_core_Controller_clock_1_out_writedata_last_time <= Auido_core_Controller_clock_1_out_writedata;
    end


  //Auido_core_Controller_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_1_out_writedata != Auido_core_Controller_clock_1_out_writedata_last_time) & Auido_core_Controller_clock_1_out_write)
        begin
          $write("%0d ns: Auido_core_Controller_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Auido_core_Controller_clock_2_in_arbitrator (
                                                     // inputs:
                                                      Auido_core_Controller_clock_2_in_endofpacket,
                                                      Auido_core_Controller_clock_2_in_readdata,
                                                      Auido_core_Controller_clock_2_in_waitrequest,
                                                      clk,
                                                      cpu_0_instruction_master_address_to_slave,
                                                      cpu_0_instruction_master_read,
                                                      reset_n,

                                                     // outputs:
                                                      Auido_core_Controller_clock_2_in_address,
                                                      Auido_core_Controller_clock_2_in_byteenable,
                                                      Auido_core_Controller_clock_2_in_endofpacket_from_sa,
                                                      Auido_core_Controller_clock_2_in_nativeaddress,
                                                      Auido_core_Controller_clock_2_in_read,
                                                      Auido_core_Controller_clock_2_in_readdata_from_sa,
                                                      Auido_core_Controller_clock_2_in_reset_n,
                                                      Auido_core_Controller_clock_2_in_waitrequest_from_sa,
                                                      Auido_core_Controller_clock_2_in_write,
                                                      cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in,
                                                      cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in,
                                                      cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in,
                                                      cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in,
                                                      d1_Auido_core_Controller_clock_2_in_end_xfer
                                                   )
;

  output  [ 11: 0] Auido_core_Controller_clock_2_in_address;
  output  [  3: 0] Auido_core_Controller_clock_2_in_byteenable;
  output           Auido_core_Controller_clock_2_in_endofpacket_from_sa;
  output  [  9: 0] Auido_core_Controller_clock_2_in_nativeaddress;
  output           Auido_core_Controller_clock_2_in_read;
  output  [ 31: 0] Auido_core_Controller_clock_2_in_readdata_from_sa;
  output           Auido_core_Controller_clock_2_in_reset_n;
  output           Auido_core_Controller_clock_2_in_waitrequest_from_sa;
  output           Auido_core_Controller_clock_2_in_write;
  output           cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in;
  output           cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in;
  output           cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in;
  output           cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;
  output           d1_Auido_core_Controller_clock_2_in_end_xfer;
  input            Auido_core_Controller_clock_2_in_endofpacket;
  input   [ 31: 0] Auido_core_Controller_clock_2_in_readdata;
  input            Auido_core_Controller_clock_2_in_waitrequest;
  input            clk;
  input   [ 20: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input            reset_n;

  wire    [ 11: 0] Auido_core_Controller_clock_2_in_address;
  wire             Auido_core_Controller_clock_2_in_allgrants;
  wire             Auido_core_Controller_clock_2_in_allow_new_arb_cycle;
  wire             Auido_core_Controller_clock_2_in_any_bursting_master_saved_grant;
  wire             Auido_core_Controller_clock_2_in_any_continuerequest;
  wire             Auido_core_Controller_clock_2_in_arb_counter_enable;
  reg              Auido_core_Controller_clock_2_in_arb_share_counter;
  wire             Auido_core_Controller_clock_2_in_arb_share_counter_next_value;
  wire             Auido_core_Controller_clock_2_in_arb_share_set_values;
  wire             Auido_core_Controller_clock_2_in_beginbursttransfer_internal;
  wire             Auido_core_Controller_clock_2_in_begins_xfer;
  wire    [  3: 0] Auido_core_Controller_clock_2_in_byteenable;
  wire             Auido_core_Controller_clock_2_in_end_xfer;
  wire             Auido_core_Controller_clock_2_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_2_in_firsttransfer;
  wire             Auido_core_Controller_clock_2_in_grant_vector;
  wire             Auido_core_Controller_clock_2_in_in_a_read_cycle;
  wire             Auido_core_Controller_clock_2_in_in_a_write_cycle;
  wire             Auido_core_Controller_clock_2_in_master_qreq_vector;
  wire    [  9: 0] Auido_core_Controller_clock_2_in_nativeaddress;
  wire             Auido_core_Controller_clock_2_in_non_bursting_master_requests;
  wire             Auido_core_Controller_clock_2_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_2_in_readdata_from_sa;
  reg              Auido_core_Controller_clock_2_in_reg_firsttransfer;
  wire             Auido_core_Controller_clock_2_in_reset_n;
  reg              Auido_core_Controller_clock_2_in_slavearbiterlockenable;
  wire             Auido_core_Controller_clock_2_in_slavearbiterlockenable2;
  wire             Auido_core_Controller_clock_2_in_unreg_firsttransfer;
  wire             Auido_core_Controller_clock_2_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_2_in_waits_for_read;
  wire             Auido_core_Controller_clock_2_in_waits_for_write;
  wire             Auido_core_Controller_clock_2_in_write;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_saved_grant_Auido_core_Controller_clock_2_in;
  reg              d1_Auido_core_Controller_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Auido_core_Controller_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Auido_core_Controller_clock_2_in_end_xfer;
    end


  assign Auido_core_Controller_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in));
  //assign Auido_core_Controller_clock_2_in_readdata_from_sa = Auido_core_Controller_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_2_in_readdata_from_sa = Auido_core_Controller_clock_2_in_readdata;

  assign cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in = (({cpu_0_instruction_master_address_to_slave[20 : 12] , 12'b0} == 21'h1000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //assign Auido_core_Controller_clock_2_in_waitrequest_from_sa = Auido_core_Controller_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_2_in_waitrequest_from_sa = Auido_core_Controller_clock_2_in_waitrequest;

  //Auido_core_Controller_clock_2_in_arb_share_counter set values, which is an e_mux
  assign Auido_core_Controller_clock_2_in_arb_share_set_values = 1;

  //Auido_core_Controller_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign Auido_core_Controller_clock_2_in_non_bursting_master_requests = cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;

  //Auido_core_Controller_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Auido_core_Controller_clock_2_in_any_bursting_master_saved_grant = 0;

  //Auido_core_Controller_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_in_arb_share_counter_next_value = Auido_core_Controller_clock_2_in_firsttransfer ? (Auido_core_Controller_clock_2_in_arb_share_set_values - 1) : |Auido_core_Controller_clock_2_in_arb_share_counter ? (Auido_core_Controller_clock_2_in_arb_share_counter - 1) : 0;

  //Auido_core_Controller_clock_2_in_allgrants all slave grants, which is an e_mux
  assign Auido_core_Controller_clock_2_in_allgrants = |Auido_core_Controller_clock_2_in_grant_vector;

  //Auido_core_Controller_clock_2_in_end_xfer assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_in_end_xfer = ~(Auido_core_Controller_clock_2_in_waits_for_read | Auido_core_Controller_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in = Auido_core_Controller_clock_2_in_end_xfer & (~Auido_core_Controller_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Auido_core_Controller_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Auido_core_Controller_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in & Auido_core_Controller_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in & ~Auido_core_Controller_clock_2_in_non_bursting_master_requests);

  //Auido_core_Controller_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_in_arb_share_counter <= 0;
      else if (Auido_core_Controller_clock_2_in_arb_counter_enable)
          Auido_core_Controller_clock_2_in_arb_share_counter <= Auido_core_Controller_clock_2_in_arb_share_counter_next_value;
    end


  //Auido_core_Controller_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|Auido_core_Controller_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_2_in & ~Auido_core_Controller_clock_2_in_non_bursting_master_requests))
          Auido_core_Controller_clock_2_in_slavearbiterlockenable <= |Auido_core_Controller_clock_2_in_arb_share_counter_next_value;
    end


  //cpu_0/instruction_master Auido_core_Controller_clock_2/in arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = Auido_core_Controller_clock_2_in_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //Auido_core_Controller_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_2_in_slavearbiterlockenable2 = |Auido_core_Controller_clock_2_in_arb_share_counter_next_value;

  //cpu_0/instruction_master Auido_core_Controller_clock_2/in arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = Auido_core_Controller_clock_2_in_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //Auido_core_Controller_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Auido_core_Controller_clock_2_in_any_continuerequest = 1;

  //cpu_0_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_0_instruction_master_continuerequest = 1;

  assign cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in = cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;
  //assign Auido_core_Controller_clock_2_in_endofpacket_from_sa = Auido_core_Controller_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_2_in_endofpacket_from_sa = Auido_core_Controller_clock_2_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in = cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in;

  //cpu_0/instruction_master saved-grant Auido_core_Controller_clock_2/in, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_Auido_core_Controller_clock_2_in = cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;

  //allow new arb cycle for Auido_core_Controller_clock_2/in, which is an e_assign
  assign Auido_core_Controller_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Auido_core_Controller_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Auido_core_Controller_clock_2_in_master_qreq_vector = 1;

  //Auido_core_Controller_clock_2_in_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_in_reset_n = reset_n;

  //Auido_core_Controller_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_2_in_firsttransfer = Auido_core_Controller_clock_2_in_begins_xfer ? Auido_core_Controller_clock_2_in_unreg_firsttransfer : Auido_core_Controller_clock_2_in_reg_firsttransfer;

  //Auido_core_Controller_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_2_in_unreg_firsttransfer = ~(Auido_core_Controller_clock_2_in_slavearbiterlockenable & Auido_core_Controller_clock_2_in_any_continuerequest);

  //Auido_core_Controller_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (Auido_core_Controller_clock_2_in_begins_xfer)
          Auido_core_Controller_clock_2_in_reg_firsttransfer <= Auido_core_Controller_clock_2_in_unreg_firsttransfer;
    end


  //Auido_core_Controller_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Auido_core_Controller_clock_2_in_beginbursttransfer_internal = Auido_core_Controller_clock_2_in_begins_xfer;

  //Auido_core_Controller_clock_2_in_read assignment, which is an e_mux
  assign Auido_core_Controller_clock_2_in_read = cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in & cpu_0_instruction_master_read;

  //Auido_core_Controller_clock_2_in_write assignment, which is an e_mux
  assign Auido_core_Controller_clock_2_in_write = 0;

  //Auido_core_Controller_clock_2_in_address mux, which is an e_mux
  assign Auido_core_Controller_clock_2_in_address = cpu_0_instruction_master_address_to_slave;

  //slaveid Auido_core_Controller_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Auido_core_Controller_clock_2_in_nativeaddress = cpu_0_instruction_master_address_to_slave >> 2;

  //d1_Auido_core_Controller_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Auido_core_Controller_clock_2_in_end_xfer <= 1;
      else 
        d1_Auido_core_Controller_clock_2_in_end_xfer <= Auido_core_Controller_clock_2_in_end_xfer;
    end


  //Auido_core_Controller_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_2_in_waits_for_read = Auido_core_Controller_clock_2_in_in_a_read_cycle & Auido_core_Controller_clock_2_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_in_in_a_read_cycle = cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in & cpu_0_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Auido_core_Controller_clock_2_in_in_a_read_cycle;

  //Auido_core_Controller_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_2_in_waits_for_write = Auido_core_Controller_clock_2_in_in_a_write_cycle & Auido_core_Controller_clock_2_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_in_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Auido_core_Controller_clock_2_in_in_a_write_cycle;

  assign wait_for_Auido_core_Controller_clock_2_in_counter = 0;
  //Auido_core_Controller_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign Auido_core_Controller_clock_2_in_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_2/in enable non-zero assertions, which is an e_register
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

module Auido_core_Controller_clock_2_out_arbitrator (
                                                      // inputs:
                                                       Auido_core_Controller_clock_2_out_address,
                                                       Auido_core_Controller_clock_2_out_byteenable,
                                                       Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_2_out_read,
                                                       Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_2_out_write,
                                                       Auido_core_Controller_clock_2_out_writedata,
                                                       clk,
                                                       d1_onchip_memory2_0_s1_end_xfer,
                                                       onchip_memory2_0_s1_readdata_from_sa,
                                                       reset_n,

                                                      // outputs:
                                                       Auido_core_Controller_clock_2_out_address_to_slave,
                                                       Auido_core_Controller_clock_2_out_readdata,
                                                       Auido_core_Controller_clock_2_out_reset_n,
                                                       Auido_core_Controller_clock_2_out_waitrequest
                                                    )
;

  output  [ 11: 0] Auido_core_Controller_clock_2_out_address_to_slave;
  output  [ 31: 0] Auido_core_Controller_clock_2_out_readdata;
  output           Auido_core_Controller_clock_2_out_reset_n;
  output           Auido_core_Controller_clock_2_out_waitrequest;
  input   [ 11: 0] Auido_core_Controller_clock_2_out_address;
  input   [  3: 0] Auido_core_Controller_clock_2_out_byteenable;
  input            Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_2_out_read;
  input            Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_2_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_2_out_writedata;
  input            clk;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input            reset_n;

  reg     [ 11: 0] Auido_core_Controller_clock_2_out_address_last_time;
  wire    [ 11: 0] Auido_core_Controller_clock_2_out_address_to_slave;
  reg     [  3: 0] Auido_core_Controller_clock_2_out_byteenable_last_time;
  reg              Auido_core_Controller_clock_2_out_read_last_time;
  wire    [ 31: 0] Auido_core_Controller_clock_2_out_readdata;
  wire             Auido_core_Controller_clock_2_out_reset_n;
  wire             Auido_core_Controller_clock_2_out_run;
  wire             Auido_core_Controller_clock_2_out_waitrequest;
  reg              Auido_core_Controller_clock_2_out_write_last_time;
  reg     [ 31: 0] Auido_core_Controller_clock_2_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 | Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1 | ~Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1) & (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 | ~Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1) & ((~Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 | ~Auido_core_Controller_clock_2_out_read | (Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1 & Auido_core_Controller_clock_2_out_read))) & ((~Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 | ~(Auido_core_Controller_clock_2_out_read | Auido_core_Controller_clock_2_out_write) | (1 & (Auido_core_Controller_clock_2_out_read | Auido_core_Controller_clock_2_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Auido_core_Controller_clock_2_out_address_to_slave = Auido_core_Controller_clock_2_out_address;

  //Auido_core_Controller_clock_2/out readdata mux, which is an e_mux
  assign Auido_core_Controller_clock_2_out_readdata = onchip_memory2_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Auido_core_Controller_clock_2_out_waitrequest = ~Auido_core_Controller_clock_2_out_run;

  //Auido_core_Controller_clock_2_out_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_out_address_last_time <= 0;
      else 
        Auido_core_Controller_clock_2_out_address_last_time <= Auido_core_Controller_clock_2_out_address;
    end


  //Auido_core_Controller_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Auido_core_Controller_clock_2_out_waitrequest & (Auido_core_Controller_clock_2_out_read | Auido_core_Controller_clock_2_out_write);
    end


  //Auido_core_Controller_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_2_out_address != Auido_core_Controller_clock_2_out_address_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_out_byteenable_last_time <= 0;
      else 
        Auido_core_Controller_clock_2_out_byteenable_last_time <= Auido_core_Controller_clock_2_out_byteenable;
    end


  //Auido_core_Controller_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_2_out_byteenable != Auido_core_Controller_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_out_read_last_time <= 0;
      else 
        Auido_core_Controller_clock_2_out_read_last_time <= Auido_core_Controller_clock_2_out_read;
    end


  //Auido_core_Controller_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_2_out_read != Auido_core_Controller_clock_2_out_read_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_out_write_last_time <= 0;
      else 
        Auido_core_Controller_clock_2_out_write_last_time <= Auido_core_Controller_clock_2_out_write;
    end


  //Auido_core_Controller_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_2_out_write != Auido_core_Controller_clock_2_out_write_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_out_writedata_last_time <= 0;
      else 
        Auido_core_Controller_clock_2_out_writedata_last_time <= Auido_core_Controller_clock_2_out_writedata;
    end


  //Auido_core_Controller_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_2_out_writedata != Auido_core_Controller_clock_2_out_writedata_last_time) & Auido_core_Controller_clock_2_out_write)
        begin
          $write("%0d ns: Auido_core_Controller_clock_2_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Auido_core_Controller_clock_3_in_arbitrator (
                                                     // inputs:
                                                      Auido_core_Controller_clock_3_in_endofpacket,
                                                      Auido_core_Controller_clock_3_in_readdata,
                                                      Auido_core_Controller_clock_3_in_waitrequest,
                                                      clk,
                                                      cpu_0_data_master_address_to_slave,
                                                      cpu_0_data_master_byteenable,
                                                      cpu_0_data_master_read,
                                                      cpu_0_data_master_waitrequest,
                                                      cpu_0_data_master_write,
                                                      cpu_0_data_master_writedata,
                                                      reset_n,

                                                     // outputs:
                                                      Auido_core_Controller_clock_3_in_address,
                                                      Auido_core_Controller_clock_3_in_byteenable,
                                                      Auido_core_Controller_clock_3_in_endofpacket_from_sa,
                                                      Auido_core_Controller_clock_3_in_nativeaddress,
                                                      Auido_core_Controller_clock_3_in_read,
                                                      Auido_core_Controller_clock_3_in_readdata_from_sa,
                                                      Auido_core_Controller_clock_3_in_reset_n,
                                                      Auido_core_Controller_clock_3_in_waitrequest_from_sa,
                                                      Auido_core_Controller_clock_3_in_write,
                                                      Auido_core_Controller_clock_3_in_writedata,
                                                      cpu_0_data_master_granted_Auido_core_Controller_clock_3_in,
                                                      cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in,
                                                      cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in,
                                                      cpu_0_data_master_requests_Auido_core_Controller_clock_3_in,
                                                      d1_Auido_core_Controller_clock_3_in_end_xfer
                                                   )
;

  output  [ 11: 0] Auido_core_Controller_clock_3_in_address;
  output  [  3: 0] Auido_core_Controller_clock_3_in_byteenable;
  output           Auido_core_Controller_clock_3_in_endofpacket_from_sa;
  output  [  9: 0] Auido_core_Controller_clock_3_in_nativeaddress;
  output           Auido_core_Controller_clock_3_in_read;
  output  [ 31: 0] Auido_core_Controller_clock_3_in_readdata_from_sa;
  output           Auido_core_Controller_clock_3_in_reset_n;
  output           Auido_core_Controller_clock_3_in_waitrequest_from_sa;
  output           Auido_core_Controller_clock_3_in_write;
  output  [ 31: 0] Auido_core_Controller_clock_3_in_writedata;
  output           cpu_0_data_master_granted_Auido_core_Controller_clock_3_in;
  output           cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in;
  output           cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in;
  output           cpu_0_data_master_requests_Auido_core_Controller_clock_3_in;
  output           d1_Auido_core_Controller_clock_3_in_end_xfer;
  input            Auido_core_Controller_clock_3_in_endofpacket;
  input   [ 31: 0] Auido_core_Controller_clock_3_in_readdata;
  input            Auido_core_Controller_clock_3_in_waitrequest;
  input            clk;
  input   [ 20: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [ 11: 0] Auido_core_Controller_clock_3_in_address;
  wire             Auido_core_Controller_clock_3_in_allgrants;
  wire             Auido_core_Controller_clock_3_in_allow_new_arb_cycle;
  wire             Auido_core_Controller_clock_3_in_any_bursting_master_saved_grant;
  wire             Auido_core_Controller_clock_3_in_any_continuerequest;
  wire             Auido_core_Controller_clock_3_in_arb_counter_enable;
  reg     [  2: 0] Auido_core_Controller_clock_3_in_arb_share_counter;
  wire    [  2: 0] Auido_core_Controller_clock_3_in_arb_share_counter_next_value;
  wire    [  2: 0] Auido_core_Controller_clock_3_in_arb_share_set_values;
  wire             Auido_core_Controller_clock_3_in_beginbursttransfer_internal;
  wire             Auido_core_Controller_clock_3_in_begins_xfer;
  wire    [  3: 0] Auido_core_Controller_clock_3_in_byteenable;
  wire             Auido_core_Controller_clock_3_in_end_xfer;
  wire             Auido_core_Controller_clock_3_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_3_in_firsttransfer;
  wire             Auido_core_Controller_clock_3_in_grant_vector;
  wire             Auido_core_Controller_clock_3_in_in_a_read_cycle;
  wire             Auido_core_Controller_clock_3_in_in_a_write_cycle;
  wire             Auido_core_Controller_clock_3_in_master_qreq_vector;
  wire    [  9: 0] Auido_core_Controller_clock_3_in_nativeaddress;
  wire             Auido_core_Controller_clock_3_in_non_bursting_master_requests;
  wire             Auido_core_Controller_clock_3_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_3_in_readdata_from_sa;
  reg              Auido_core_Controller_clock_3_in_reg_firsttransfer;
  wire             Auido_core_Controller_clock_3_in_reset_n;
  reg              Auido_core_Controller_clock_3_in_slavearbiterlockenable;
  wire             Auido_core_Controller_clock_3_in_slavearbiterlockenable2;
  wire             Auido_core_Controller_clock_3_in_unreg_firsttransfer;
  wire             Auido_core_Controller_clock_3_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_3_in_waits_for_read;
  wire             Auido_core_Controller_clock_3_in_waits_for_write;
  wire             Auido_core_Controller_clock_3_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_3_in_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_requests_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_saved_grant_Auido_core_Controller_clock_3_in;
  reg              d1_Auido_core_Controller_clock_3_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Auido_core_Controller_clock_3_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Auido_core_Controller_clock_3_in_end_xfer;
    end


  assign Auido_core_Controller_clock_3_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in));
  //assign Auido_core_Controller_clock_3_in_readdata_from_sa = Auido_core_Controller_clock_3_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_3_in_readdata_from_sa = Auido_core_Controller_clock_3_in_readdata;

  assign cpu_0_data_master_requests_Auido_core_Controller_clock_3_in = ({cpu_0_data_master_address_to_slave[20 : 12] , 12'b0} == 21'h1000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign Auido_core_Controller_clock_3_in_waitrequest_from_sa = Auido_core_Controller_clock_3_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_3_in_waitrequest_from_sa = Auido_core_Controller_clock_3_in_waitrequest;

  //Auido_core_Controller_clock_3_in_arb_share_counter set values, which is an e_mux
  assign Auido_core_Controller_clock_3_in_arb_share_set_values = 1;

  //Auido_core_Controller_clock_3_in_non_bursting_master_requests mux, which is an e_mux
  assign Auido_core_Controller_clock_3_in_non_bursting_master_requests = cpu_0_data_master_requests_Auido_core_Controller_clock_3_in;

  //Auido_core_Controller_clock_3_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Auido_core_Controller_clock_3_in_any_bursting_master_saved_grant = 0;

  //Auido_core_Controller_clock_3_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_in_arb_share_counter_next_value = Auido_core_Controller_clock_3_in_firsttransfer ? (Auido_core_Controller_clock_3_in_arb_share_set_values - 1) : |Auido_core_Controller_clock_3_in_arb_share_counter ? (Auido_core_Controller_clock_3_in_arb_share_counter - 1) : 0;

  //Auido_core_Controller_clock_3_in_allgrants all slave grants, which is an e_mux
  assign Auido_core_Controller_clock_3_in_allgrants = |Auido_core_Controller_clock_3_in_grant_vector;

  //Auido_core_Controller_clock_3_in_end_xfer assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_in_end_xfer = ~(Auido_core_Controller_clock_3_in_waits_for_read | Auido_core_Controller_clock_3_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in = Auido_core_Controller_clock_3_in_end_xfer & (~Auido_core_Controller_clock_3_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Auido_core_Controller_clock_3_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Auido_core_Controller_clock_3_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in & Auido_core_Controller_clock_3_in_allgrants) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in & ~Auido_core_Controller_clock_3_in_non_bursting_master_requests);

  //Auido_core_Controller_clock_3_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_in_arb_share_counter <= 0;
      else if (Auido_core_Controller_clock_3_in_arb_counter_enable)
          Auido_core_Controller_clock_3_in_arb_share_counter <= Auido_core_Controller_clock_3_in_arb_share_counter_next_value;
    end


  //Auido_core_Controller_clock_3_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_in_slavearbiterlockenable <= 0;
      else if ((|Auido_core_Controller_clock_3_in_master_qreq_vector & end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in) | (end_xfer_arb_share_counter_term_Auido_core_Controller_clock_3_in & ~Auido_core_Controller_clock_3_in_non_bursting_master_requests))
          Auido_core_Controller_clock_3_in_slavearbiterlockenable <= |Auido_core_Controller_clock_3_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master Auido_core_Controller_clock_3/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = Auido_core_Controller_clock_3_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //Auido_core_Controller_clock_3_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_3_in_slavearbiterlockenable2 = |Auido_core_Controller_clock_3_in_arb_share_counter_next_value;

  //cpu_0/data_master Auido_core_Controller_clock_3/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = Auido_core_Controller_clock_3_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //Auido_core_Controller_clock_3_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Auido_core_Controller_clock_3_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in = cpu_0_data_master_requests_Auido_core_Controller_clock_3_in & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //Auido_core_Controller_clock_3_in_writedata mux, which is an e_mux
  assign Auido_core_Controller_clock_3_in_writedata = cpu_0_data_master_writedata;

  //assign Auido_core_Controller_clock_3_in_endofpacket_from_sa = Auido_core_Controller_clock_3_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Auido_core_Controller_clock_3_in_endofpacket_from_sa = Auido_core_Controller_clock_3_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_Auido_core_Controller_clock_3_in = cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in;

  //cpu_0/data_master saved-grant Auido_core_Controller_clock_3/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_Auido_core_Controller_clock_3_in = cpu_0_data_master_requests_Auido_core_Controller_clock_3_in;

  //allow new arb cycle for Auido_core_Controller_clock_3/in, which is an e_assign
  assign Auido_core_Controller_clock_3_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Auido_core_Controller_clock_3_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Auido_core_Controller_clock_3_in_master_qreq_vector = 1;

  //Auido_core_Controller_clock_3_in_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_in_reset_n = reset_n;

  //Auido_core_Controller_clock_3_in_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_3_in_firsttransfer = Auido_core_Controller_clock_3_in_begins_xfer ? Auido_core_Controller_clock_3_in_unreg_firsttransfer : Auido_core_Controller_clock_3_in_reg_firsttransfer;

  //Auido_core_Controller_clock_3_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Auido_core_Controller_clock_3_in_unreg_firsttransfer = ~(Auido_core_Controller_clock_3_in_slavearbiterlockenable & Auido_core_Controller_clock_3_in_any_continuerequest);

  //Auido_core_Controller_clock_3_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_in_reg_firsttransfer <= 1'b1;
      else if (Auido_core_Controller_clock_3_in_begins_xfer)
          Auido_core_Controller_clock_3_in_reg_firsttransfer <= Auido_core_Controller_clock_3_in_unreg_firsttransfer;
    end


  //Auido_core_Controller_clock_3_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Auido_core_Controller_clock_3_in_beginbursttransfer_internal = Auido_core_Controller_clock_3_in_begins_xfer;

  //Auido_core_Controller_clock_3_in_read assignment, which is an e_mux
  assign Auido_core_Controller_clock_3_in_read = cpu_0_data_master_granted_Auido_core_Controller_clock_3_in & cpu_0_data_master_read;

  //Auido_core_Controller_clock_3_in_write assignment, which is an e_mux
  assign Auido_core_Controller_clock_3_in_write = cpu_0_data_master_granted_Auido_core_Controller_clock_3_in & cpu_0_data_master_write;

  //Auido_core_Controller_clock_3_in_address mux, which is an e_mux
  assign Auido_core_Controller_clock_3_in_address = cpu_0_data_master_address_to_slave;

  //slaveid Auido_core_Controller_clock_3_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Auido_core_Controller_clock_3_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_Auido_core_Controller_clock_3_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Auido_core_Controller_clock_3_in_end_xfer <= 1;
      else 
        d1_Auido_core_Controller_clock_3_in_end_xfer <= Auido_core_Controller_clock_3_in_end_xfer;
    end


  //Auido_core_Controller_clock_3_in_waits_for_read in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_3_in_waits_for_read = Auido_core_Controller_clock_3_in_in_a_read_cycle & Auido_core_Controller_clock_3_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_3_in_in_a_read_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_in_in_a_read_cycle = cpu_0_data_master_granted_Auido_core_Controller_clock_3_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Auido_core_Controller_clock_3_in_in_a_read_cycle;

  //Auido_core_Controller_clock_3_in_waits_for_write in a cycle, which is an e_mux
  assign Auido_core_Controller_clock_3_in_waits_for_write = Auido_core_Controller_clock_3_in_in_a_write_cycle & Auido_core_Controller_clock_3_in_waitrequest_from_sa;

  //Auido_core_Controller_clock_3_in_in_a_write_cycle assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_in_in_a_write_cycle = cpu_0_data_master_granted_Auido_core_Controller_clock_3_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Auido_core_Controller_clock_3_in_in_a_write_cycle;

  assign wait_for_Auido_core_Controller_clock_3_in_counter = 0;
  //Auido_core_Controller_clock_3_in_byteenable byte enable port mux, which is an e_mux
  assign Auido_core_Controller_clock_3_in_byteenable = (cpu_0_data_master_granted_Auido_core_Controller_clock_3_in)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_3/in enable non-zero assertions, which is an e_register
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

module Auido_core_Controller_clock_3_out_arbitrator (
                                                      // inputs:
                                                       Auido_core_Controller_clock_3_out_address,
                                                       Auido_core_Controller_clock_3_out_byteenable,
                                                       Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_3_out_read,
                                                       Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1,
                                                       Auido_core_Controller_clock_3_out_write,
                                                       Auido_core_Controller_clock_3_out_writedata,
                                                       clk,
                                                       d1_onchip_memory2_0_s1_end_xfer,
                                                       onchip_memory2_0_s1_readdata_from_sa,
                                                       reset_n,

                                                      // outputs:
                                                       Auido_core_Controller_clock_3_out_address_to_slave,
                                                       Auido_core_Controller_clock_3_out_readdata,
                                                       Auido_core_Controller_clock_3_out_reset_n,
                                                       Auido_core_Controller_clock_3_out_waitrequest
                                                    )
;

  output  [ 11: 0] Auido_core_Controller_clock_3_out_address_to_slave;
  output  [ 31: 0] Auido_core_Controller_clock_3_out_readdata;
  output           Auido_core_Controller_clock_3_out_reset_n;
  output           Auido_core_Controller_clock_3_out_waitrequest;
  input   [ 11: 0] Auido_core_Controller_clock_3_out_address;
  input   [  3: 0] Auido_core_Controller_clock_3_out_byteenable;
  input            Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_3_out_read;
  input            Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;
  input            Auido_core_Controller_clock_3_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_3_out_writedata;
  input            clk;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input            reset_n;

  reg     [ 11: 0] Auido_core_Controller_clock_3_out_address_last_time;
  wire    [ 11: 0] Auido_core_Controller_clock_3_out_address_to_slave;
  reg     [  3: 0] Auido_core_Controller_clock_3_out_byteenable_last_time;
  reg              Auido_core_Controller_clock_3_out_read_last_time;
  wire    [ 31: 0] Auido_core_Controller_clock_3_out_readdata;
  wire             Auido_core_Controller_clock_3_out_reset_n;
  wire             Auido_core_Controller_clock_3_out_run;
  wire             Auido_core_Controller_clock_3_out_waitrequest;
  reg              Auido_core_Controller_clock_3_out_write_last_time;
  reg     [ 31: 0] Auido_core_Controller_clock_3_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1 | Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1 | ~Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1) & (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 | ~Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1) & ((~Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1 | ~Auido_core_Controller_clock_3_out_read | (Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1 & Auido_core_Controller_clock_3_out_read))) & ((~Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1 | ~(Auido_core_Controller_clock_3_out_read | Auido_core_Controller_clock_3_out_write) | (1 & (Auido_core_Controller_clock_3_out_read | Auido_core_Controller_clock_3_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Auido_core_Controller_clock_3_out_address_to_slave = Auido_core_Controller_clock_3_out_address;

  //Auido_core_Controller_clock_3/out readdata mux, which is an e_mux
  assign Auido_core_Controller_clock_3_out_readdata = onchip_memory2_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Auido_core_Controller_clock_3_out_waitrequest = ~Auido_core_Controller_clock_3_out_run;

  //Auido_core_Controller_clock_3_out_reset_n assignment, which is an e_assign
  assign Auido_core_Controller_clock_3_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Auido_core_Controller_clock_3_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_out_address_last_time <= 0;
      else 
        Auido_core_Controller_clock_3_out_address_last_time <= Auido_core_Controller_clock_3_out_address;
    end


  //Auido_core_Controller_clock_3/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Auido_core_Controller_clock_3_out_waitrequest & (Auido_core_Controller_clock_3_out_read | Auido_core_Controller_clock_3_out_write);
    end


  //Auido_core_Controller_clock_3_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_3_out_address != Auido_core_Controller_clock_3_out_address_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_3_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_3_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_out_byteenable_last_time <= 0;
      else 
        Auido_core_Controller_clock_3_out_byteenable_last_time <= Auido_core_Controller_clock_3_out_byteenable;
    end


  //Auido_core_Controller_clock_3_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_3_out_byteenable != Auido_core_Controller_clock_3_out_byteenable_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_3_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_3_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_out_read_last_time <= 0;
      else 
        Auido_core_Controller_clock_3_out_read_last_time <= Auido_core_Controller_clock_3_out_read;
    end


  //Auido_core_Controller_clock_3_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_3_out_read != Auido_core_Controller_clock_3_out_read_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_3_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_3_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_out_write_last_time <= 0;
      else 
        Auido_core_Controller_clock_3_out_write_last_time <= Auido_core_Controller_clock_3_out_write;
    end


  //Auido_core_Controller_clock_3_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_3_out_write != Auido_core_Controller_clock_3_out_write_last_time))
        begin
          $write("%0d ns: Auido_core_Controller_clock_3_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Auido_core_Controller_clock_3_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_out_writedata_last_time <= 0;
      else 
        Auido_core_Controller_clock_3_out_writedata_last_time <= Auido_core_Controller_clock_3_out_writedata;
    end


  //Auido_core_Controller_clock_3_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Auido_core_Controller_clock_3_out_writedata != Auido_core_Controller_clock_3_out_writedata_last_time) & Auido_core_Controller_clock_3_out_write)
        begin
          $write("%0d ns: Auido_core_Controller_clock_3_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module audio_and_video_config_0_avalon_av_config_slave_arbitrator (
                                                                    // inputs:
                                                                     Auido_core_Controller_clock_0_out_address_to_slave,
                                                                     Auido_core_Controller_clock_0_out_byteenable,
                                                                     Auido_core_Controller_clock_0_out_read,
                                                                     Auido_core_Controller_clock_0_out_write,
                                                                     Auido_core_Controller_clock_0_out_writedata,
                                                                     audio_and_video_config_0_avalon_av_config_slave_readdata,
                                                                     audio_and_video_config_0_avalon_av_config_slave_waitrequest,
                                                                     clk,
                                                                     reset_n,

                                                                    // outputs:
                                                                     Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave,
                                                                     Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave,
                                                                     Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave,
                                                                     Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave,
                                                                     audio_and_video_config_0_avalon_av_config_slave_address,
                                                                     audio_and_video_config_0_avalon_av_config_slave_byteenable,
                                                                     audio_and_video_config_0_avalon_av_config_slave_read,
                                                                     audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa,
                                                                     audio_and_video_config_0_avalon_av_config_slave_reset,
                                                                     audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa,
                                                                     audio_and_video_config_0_avalon_av_config_slave_write,
                                                                     audio_and_video_config_0_avalon_av_config_slave_writedata,
                                                                     d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer
                                                                  )
;

  output           Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave;
  output           Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  output           Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  output           Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave;
  output  [  1: 0] audio_and_video_config_0_avalon_av_config_slave_address;
  output  [  3: 0] audio_and_video_config_0_avalon_av_config_slave_byteenable;
  output           audio_and_video_config_0_avalon_av_config_slave_read;
  output  [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa;
  output           audio_and_video_config_0_avalon_av_config_slave_reset;
  output           audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;
  output           audio_and_video_config_0_avalon_av_config_slave_write;
  output  [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_writedata;
  output           d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  input   [  3: 0] Auido_core_Controller_clock_0_out_address_to_slave;
  input   [  3: 0] Auido_core_Controller_clock_0_out_byteenable;
  input            Auido_core_Controller_clock_0_out_read;
  input            Auido_core_Controller_clock_0_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_0_out_writedata;
  input   [ 31: 0] audio_and_video_config_0_avalon_av_config_slave_readdata;
  input            audio_and_video_config_0_avalon_av_config_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             Auido_core_Controller_clock_0_out_arbiterlock;
  wire             Auido_core_Controller_clock_0_out_arbiterlock2;
  wire             Auido_core_Controller_clock_0_out_continuerequest;
  wire             Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave;
  wire             Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  wire             Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  reg              Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;
  wire             Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in;
  wire             Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave;
  wire             Auido_core_Controller_clock_0_out_saved_grant_audio_and_video_config_0_avalon_av_config_slave;
  wire    [  1: 0] audio_and_video_config_0_avalon_av_config_slave_address;
  wire             audio_and_video_config_0_avalon_av_config_slave_allgrants;
  wire             audio_and_video_config_0_avalon_av_config_slave_allow_new_arb_cycle;
  wire             audio_and_video_config_0_avalon_av_config_slave_any_bursting_master_saved_grant;
  wire             audio_and_video_config_0_avalon_av_config_slave_any_continuerequest;
  wire             audio_and_video_config_0_avalon_av_config_slave_arb_counter_enable;
  reg              audio_and_video_config_0_avalon_av_config_slave_arb_share_counter;
  wire             audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value;
  wire             audio_and_video_config_0_avalon_av_config_slave_arb_share_set_values;
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
  reg              d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_av_config_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;
  wire    [  3: 0] shifted_address_to_audio_and_video_config_0_avalon_av_config_slave_from_Auido_core_Controller_clock_0_out;
  wire             wait_for_audio_and_video_config_0_avalon_av_config_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~audio_and_video_config_0_avalon_av_config_slave_end_xfer;
    end


  assign audio_and_video_config_0_avalon_av_config_slave_begins_xfer = ~d1_reasons_to_wait & ((Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave));
  //assign audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa = audio_and_video_config_0_avalon_av_config_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa = audio_and_video_config_0_avalon_av_config_slave_readdata;

  assign Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave = (1) & (Auido_core_Controller_clock_0_out_read | Auido_core_Controller_clock_0_out_write);
  //assign audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa = audio_and_video_config_0_avalon_av_config_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa = audio_and_video_config_0_avalon_av_config_slave_waitrequest;

  //audio_and_video_config_0_avalon_av_config_slave_arb_share_counter set values, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_arb_share_set_values = 1;

  //audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_non_bursting_master_requests = Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave;

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


  //Auido_core_Controller_clock_0/out audio_and_video_config_0/avalon_av_config_slave arbiterlock, which is an e_assign
  assign Auido_core_Controller_clock_0_out_arbiterlock = audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable & Auido_core_Controller_clock_0_out_continuerequest;

  //audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2 = |audio_and_video_config_0_avalon_av_config_slave_arb_share_counter_next_value;

  //Auido_core_Controller_clock_0/out audio_and_video_config_0/avalon_av_config_slave arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_0_out_arbiterlock2 = audio_and_video_config_0_avalon_av_config_slave_slavearbiterlockenable2 & Auido_core_Controller_clock_0_out_continuerequest;

  //audio_and_video_config_0_avalon_av_config_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_any_continuerequest = 1;

  //Auido_core_Controller_clock_0_out_continuerequest continued request, which is an e_assign
  assign Auido_core_Controller_clock_0_out_continuerequest = 1;

  assign Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave = Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave & ~((Auido_core_Controller_clock_0_out_read & ((|Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register))));
  //Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in = Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave & Auido_core_Controller_clock_0_out_read & ~audio_and_video_config_0_avalon_av_config_slave_waits_for_read & ~(|Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register);

  //shift register p1 Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register = {Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register, Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register_in};

  //Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register <= 0;
      else 
        Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register <= p1_Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;
    end


  //local readdatavalid Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave, which is an e_mux
  assign Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave = Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave_shift_register;

  //audio_and_video_config_0_avalon_av_config_slave_writedata mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_writedata = Auido_core_Controller_clock_0_out_writedata;

  //master is always granted when requested
  assign Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave = Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave;

  //Auido_core_Controller_clock_0/out saved-grant audio_and_video_config_0/avalon_av_config_slave, which is an e_assign
  assign Auido_core_Controller_clock_0_out_saved_grant_audio_and_video_config_0_avalon_av_config_slave = Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave;

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
  assign audio_and_video_config_0_avalon_av_config_slave_read = Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave & Auido_core_Controller_clock_0_out_read;

  //audio_and_video_config_0_avalon_av_config_slave_write assignment, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_write = Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave & Auido_core_Controller_clock_0_out_write;

  assign shifted_address_to_audio_and_video_config_0_avalon_av_config_slave_from_Auido_core_Controller_clock_0_out = Auido_core_Controller_clock_0_out_address_to_slave;
  //audio_and_video_config_0_avalon_av_config_slave_address mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_address = shifted_address_to_audio_and_video_config_0_avalon_av_config_slave_from_Auido_core_Controller_clock_0_out >> 2;

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
  assign audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle = Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave & Auido_core_Controller_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = audio_and_video_config_0_avalon_av_config_slave_in_a_read_cycle;

  //audio_and_video_config_0_avalon_av_config_slave_waits_for_write in a cycle, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_waits_for_write = audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle & audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa;

  //audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle = Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave & Auido_core_Controller_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = audio_and_video_config_0_avalon_av_config_slave_in_a_write_cycle;

  assign wait_for_audio_and_video_config_0_avalon_av_config_slave_counter = 0;
  //audio_and_video_config_0_avalon_av_config_slave_byteenable byte enable port mux, which is an e_mux
  assign audio_and_video_config_0_avalon_av_config_slave_byteenable = (Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave)? Auido_core_Controller_clock_0_out_byteenable :
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
                                                  clk,
                                                  clocks_0_avalon_clocks_slave_readdata,
                                                  cpu_0_data_master_address_to_slave,
                                                  cpu_0_data_master_dbs_address,
                                                  cpu_0_data_master_read,
                                                  cpu_0_data_master_write,
                                                  reset_n,

                                                 // outputs:
                                                  clocks_0_avalon_clocks_slave_address,
                                                  clocks_0_avalon_clocks_slave_readdata_from_sa,
                                                  cpu_0_data_master_granted_clocks_0_avalon_clocks_slave,
                                                  cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave,
                                                  cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave,
                                                  cpu_0_data_master_requests_clocks_0_avalon_clocks_slave,
                                                  d1_clocks_0_avalon_clocks_slave_end_xfer,
                                                  registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave
                                               )
;

  output           clocks_0_avalon_clocks_slave_address;
  output  [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  output           cpu_0_data_master_granted_clocks_0_avalon_clocks_slave;
  output           cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave;
  output           cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  output           cpu_0_data_master_requests_clocks_0_avalon_clocks_slave;
  output           d1_clocks_0_avalon_clocks_slave_end_xfer;
  output           registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  input            clk;
  input   [  7: 0] clocks_0_avalon_clocks_slave_readdata;
  input   [ 20: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;

  wire             clocks_0_avalon_clocks_slave_address;
  wire             clocks_0_avalon_clocks_slave_allgrants;
  wire             clocks_0_avalon_clocks_slave_allow_new_arb_cycle;
  wire             clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant;
  wire             clocks_0_avalon_clocks_slave_any_continuerequest;
  wire             clocks_0_avalon_clocks_slave_arb_counter_enable;
  reg     [  2: 0] clocks_0_avalon_clocks_slave_arb_share_counter;
  wire    [  2: 0] clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
  wire    [  2: 0] clocks_0_avalon_clocks_slave_arb_share_set_values;
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
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  reg              cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in;
  wire             cpu_0_data_master_requests_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_saved_grant_clocks_0_avalon_clocks_slave;
  reg              d1_clocks_0_avalon_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  wire             wait_for_clocks_0_avalon_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clocks_0_avalon_clocks_slave_end_xfer;
    end


  assign clocks_0_avalon_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave));
  //assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata;

  assign cpu_0_data_master_requests_clocks_0_avalon_clocks_slave = (({cpu_0_data_master_address_to_slave[20 : 1] , 1'b0} == 21'h101410) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave = cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in;

  //clocks_0_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  assign clocks_0_avalon_clocks_slave_arb_share_set_values = (cpu_0_data_master_granted_clocks_0_avalon_clocks_slave)? 4 :
    1;

  //clocks_0_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_non_bursting_master_requests = cpu_0_data_master_requests_clocks_0_avalon_clocks_slave;

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


  //cpu_0/data_master clocks_0/avalon_clocks_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = clocks_0_avalon_clocks_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //clocks_0_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clocks_0_avalon_clocks_slave_slavearbiterlockenable2 = |clocks_0_avalon_clocks_slave_arb_share_counter_next_value;

  //cpu_0/data_master clocks_0/avalon_clocks_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = clocks_0_avalon_clocks_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //clocks_0_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign clocks_0_avalon_clocks_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave = cpu_0_data_master_requests_clocks_0_avalon_clocks_slave & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register))));
  //cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in = cpu_0_data_master_granted_clocks_0_avalon_clocks_slave & cpu_0_data_master_read & ~clocks_0_avalon_clocks_slave_waits_for_read & ~(|cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register = {cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register, cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave = cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;

  //master is always granted when requested
  assign cpu_0_data_master_granted_clocks_0_avalon_clocks_slave = cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave;

  //cpu_0/data_master saved-grant clocks_0/avalon_clocks_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_clocks_0_avalon_clocks_slave = cpu_0_data_master_requests_clocks_0_avalon_clocks_slave;

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
  assign clocks_0_avalon_clocks_slave_address = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1 : 0]};

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
  assign clocks_0_avalon_clocks_slave_in_a_read_cycle = cpu_0_data_master_granted_clocks_0_avalon_clocks_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clocks_0_avalon_clocks_slave_in_a_read_cycle;

  //clocks_0_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign clocks_0_avalon_clocks_slave_waits_for_write = clocks_0_avalon_clocks_slave_in_a_write_cycle & 0;

  //clocks_0_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_in_a_write_cycle = cpu_0_data_master_granted_clocks_0_avalon_clocks_slave & cpu_0_data_master_write;

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
  input   [ 20: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 20: 0] cpu_0_instruction_master_address_to_slave;
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
  wire    [ 20: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 20: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
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

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[20 : 11] , 11'b0} == 21'h100800) & (cpu_0_data_master_read | cpu_0_data_master_write);
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

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[20 : 11] , 11'b0} == 21'h100800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
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
                                       Auido_core_Controller_clock_0_in_readdata_from_sa,
                                       Auido_core_Controller_clock_0_in_waitrequest_from_sa,
                                       Auido_core_Controller_clock_1_in_readdata_from_sa,
                                       Auido_core_Controller_clock_1_in_waitrequest_from_sa,
                                       Auido_core_Controller_clock_3_in_readdata_from_sa,
                                       Auido_core_Controller_clock_3_in_waitrequest_from_sa,
                                       clk,
                                       clocks_0_avalon_clocks_slave_readdata_from_sa,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_granted_Auido_core_Controller_clock_0_in,
                                       cpu_0_data_master_granted_Auido_core_Controller_clock_1_in,
                                       cpu_0_data_master_granted_Auido_core_Controller_clock_3_in,
                                       cpu_0_data_master_granted_clocks_0_avalon_clocks_slave,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in,
                                       cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in,
                                       cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in,
                                       cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in,
                                       cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in,
                                       cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in,
                                       cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_Auido_core_Controller_clock_0_in,
                                       cpu_0_data_master_requests_Auido_core_Controller_clock_1_in,
                                       cpu_0_data_master_requests_Auido_core_Controller_clock_3_in,
                                       cpu_0_data_master_requests_clocks_0_avalon_clocks_slave,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_write,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_Auido_core_Controller_clock_0_in_end_xfer,
                                       d1_Auido_core_Controller_clock_1_in_end_xfer,
                                       d1_Auido_core_Controller_clock_3_in_end_xfer,
                                       d1_clocks_0_avalon_clocks_slave_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 20: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input   [ 31: 0] Auido_core_Controller_clock_0_in_readdata_from_sa;
  input            Auido_core_Controller_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] Auido_core_Controller_clock_1_in_readdata_from_sa;
  input            Auido_core_Controller_clock_1_in_waitrequest_from_sa;
  input   [ 31: 0] Auido_core_Controller_clock_3_in_readdata_from_sa;
  input            Auido_core_Controller_clock_3_in_waitrequest_from_sa;
  input            clk;
  input   [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  input   [ 20: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_granted_Auido_core_Controller_clock_0_in;
  input            cpu_0_data_master_granted_Auido_core_Controller_clock_1_in;
  input            cpu_0_data_master_granted_Auido_core_Controller_clock_3_in;
  input            cpu_0_data_master_granted_clocks_0_avalon_clocks_slave;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in;
  input            cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in;
  input            cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in;
  input            cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in;
  input            cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in;
  input            cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in;
  input            cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_Auido_core_Controller_clock_0_in;
  input            cpu_0_data_master_requests_Auido_core_Controller_clock_1_in;
  input            cpu_0_data_master_requests_Auido_core_Controller_clock_3_in;
  input            cpu_0_data_master_requests_clocks_0_avalon_clocks_slave;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_Auido_core_Controller_clock_0_in_end_xfer;
  input            d1_Auido_core_Controller_clock_1_in_end_xfer;
  input            d1_Auido_core_Controller_clock_3_in_end_xfer;
  input            d1_clocks_0_avalon_clocks_slave_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  input            reset_n;

  wire    [ 20: 0] cpu_0_data_master_address_to_slave;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_cpu_0_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] registered_cpu_0_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in | ~cpu_0_data_master_requests_Auido_core_Controller_clock_0_in) & ((~cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~Auido_core_Controller_clock_0_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~Auido_core_Controller_clock_0_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in | ~cpu_0_data_master_requests_Auido_core_Controller_clock_1_in) & ((~cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~Auido_core_Controller_clock_1_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~Auido_core_Controller_clock_1_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in | ~cpu_0_data_master_requests_Auido_core_Controller_clock_3_in) & ((~cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~Auido_core_Controller_clock_3_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~Auido_core_Controller_clock_3_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & ((cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave | (registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave & cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) | ~cpu_0_data_master_requests_clocks_0_avalon_clocks_slave)) & ((~cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write);

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = {cpu_0_data_master_address[20],
    7'b0,
    cpu_0_data_master_address[12 : 0]};

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_0_data_master_readdata <= 0;
      else 
        registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_Auido_core_Controller_clock_0_in}} | Auido_core_Controller_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_Auido_core_Controller_clock_1_in}} | Auido_core_Controller_clock_1_in_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_Auido_core_Controller_clock_3_in}} | Auido_core_Controller_clock_3_in_readdata_from_sa);

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_Auido_core_Controller_clock_0_in}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_Auido_core_Controller_clock_1_in}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_Auido_core_Controller_clock_3_in}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_clocks_0_avalon_clocks_slave}} | {clocks_0_avalon_clocks_slave_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = clocks_0_avalon_clocks_slave_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = clocks_0_avalon_clocks_slave_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = clocks_0_avalon_clocks_slave_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_clocks_0_avalon_clocks_slave)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_0_data_master_requests_clocks_0_avalon_clocks_slave & ~cpu_0_data_master_waitrequest & cpu_0_data_master_write));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave |
    (cpu_0_data_master_granted_clocks_0_avalon_clocks_slave & cpu_0_data_master_write & 1 & 1);


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              Auido_core_Controller_clock_2_in_readdata_from_sa,
                                              Auido_core_Controller_clock_2_in_waitrequest_from_sa,
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_Auido_core_Controller_clock_2_in_end_xfer,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 20: 0] cpu_0_instruction_master_address_to_slave;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_waitrequest;
  input   [ 31: 0] Auido_core_Controller_clock_2_in_readdata_from_sa;
  input            Auido_core_Controller_clock_2_in_waitrequest_from_sa;
  input            clk;
  input   [ 20: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_Auido_core_Controller_clock_2_in_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 20: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 20: 0] cpu_0_instruction_master_address_to_slave;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in | ~(cpu_0_instruction_master_read) | (1 & ~Auido_core_Controller_clock_2_in_waitrequest_from_sa & (cpu_0_instruction_master_read)))) & 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read);

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = {cpu_0_instruction_master_address[20],
    7'b0,
    cpu_0_instruction_master_address[12 : 0]};

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in}} | Auido_core_Controller_clock_2_in_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;


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

module onchip_memory2_0_s1_arbitrator (
                                        // inputs:
                                         Auido_core_Controller_clock_2_out_address_to_slave,
                                         Auido_core_Controller_clock_2_out_byteenable,
                                         Auido_core_Controller_clock_2_out_read,
                                         Auido_core_Controller_clock_2_out_write,
                                         Auido_core_Controller_clock_2_out_writedata,
                                         Auido_core_Controller_clock_3_out_address_to_slave,
                                         Auido_core_Controller_clock_3_out_byteenable,
                                         Auido_core_Controller_clock_3_out_read,
                                         Auido_core_Controller_clock_3_out_write,
                                         Auido_core_Controller_clock_3_out_writedata,
                                         clk,
                                         onchip_memory2_0_s1_readdata,
                                         reset_n,

                                        // outputs:
                                         Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1,
                                         Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1,
                                         d1_onchip_memory2_0_s1_end_xfer,
                                         onchip_memory2_0_s1_address,
                                         onchip_memory2_0_s1_byteenable,
                                         onchip_memory2_0_s1_chipselect,
                                         onchip_memory2_0_s1_clken,
                                         onchip_memory2_0_s1_readdata_from_sa,
                                         onchip_memory2_0_s1_write,
                                         onchip_memory2_0_s1_writedata
                                      )
;

  output           Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1;
  output           Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;
  output           d1_onchip_memory2_0_s1_end_xfer;
  output  [  9: 0] onchip_memory2_0_s1_address;
  output  [  3: 0] onchip_memory2_0_s1_byteenable;
  output           onchip_memory2_0_s1_chipselect;
  output           onchip_memory2_0_s1_clken;
  output  [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  output           onchip_memory2_0_s1_write;
  output  [ 31: 0] onchip_memory2_0_s1_writedata;
  input   [ 11: 0] Auido_core_Controller_clock_2_out_address_to_slave;
  input   [  3: 0] Auido_core_Controller_clock_2_out_byteenable;
  input            Auido_core_Controller_clock_2_out_read;
  input            Auido_core_Controller_clock_2_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_2_out_writedata;
  input   [ 11: 0] Auido_core_Controller_clock_3_out_address_to_slave;
  input   [  3: 0] Auido_core_Controller_clock_3_out_byteenable;
  input            Auido_core_Controller_clock_3_out_read;
  input            Auido_core_Controller_clock_3_out_write;
  input   [ 31: 0] Auido_core_Controller_clock_3_out_writedata;
  input            clk;
  input   [ 31: 0] onchip_memory2_0_s1_readdata;
  input            reset_n;

  wire             Auido_core_Controller_clock_2_out_arbiterlock;
  wire             Auido_core_Controller_clock_2_out_arbiterlock2;
  wire             Auido_core_Controller_clock_2_out_continuerequest;
  wire             Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1;
  reg              Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_2_out_saved_grant_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_3_out_arbiterlock;
  wire             Auido_core_Controller_clock_3_out_arbiterlock2;
  wire             Auido_core_Controller_clock_3_out_continuerequest;
  wire             Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1;
  reg              Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_3_out_saved_grant_onchip_memory2_0_s1;
  reg              d1_onchip_memory2_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory2_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_Auido_core_Controller_clock_2_out_granted_slave_onchip_memory2_0_s1;
  reg              last_cycle_Auido_core_Controller_clock_3_out_granted_slave_onchip_memory2_0_s1;
  wire    [  9: 0] onchip_memory2_0_s1_address;
  wire             onchip_memory2_0_s1_allgrants;
  wire             onchip_memory2_0_s1_allow_new_arb_cycle;
  wire             onchip_memory2_0_s1_any_bursting_master_saved_grant;
  wire             onchip_memory2_0_s1_any_continuerequest;
  reg     [  1: 0] onchip_memory2_0_s1_arb_addend;
  wire             onchip_memory2_0_s1_arb_counter_enable;
  reg              onchip_memory2_0_s1_arb_share_counter;
  wire             onchip_memory2_0_s1_arb_share_counter_next_value;
  wire             onchip_memory2_0_s1_arb_share_set_values;
  wire    [  1: 0] onchip_memory2_0_s1_arb_winner;
  wire             onchip_memory2_0_s1_arbitration_holdoff_internal;
  wire             onchip_memory2_0_s1_beginbursttransfer_internal;
  wire             onchip_memory2_0_s1_begins_xfer;
  wire    [  3: 0] onchip_memory2_0_s1_byteenable;
  wire             onchip_memory2_0_s1_chipselect;
  wire    [  3: 0] onchip_memory2_0_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_memory2_0_s1_chosen_master_rot_left;
  wire             onchip_memory2_0_s1_clken;
  wire             onchip_memory2_0_s1_end_xfer;
  wire             onchip_memory2_0_s1_firsttransfer;
  wire    [  1: 0] onchip_memory2_0_s1_grant_vector;
  wire             onchip_memory2_0_s1_in_a_read_cycle;
  wire             onchip_memory2_0_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_memory2_0_s1_master_qreq_vector;
  wire             onchip_memory2_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  reg              onchip_memory2_0_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_memory2_0_s1_saved_chosen_master_vector;
  reg              onchip_memory2_0_s1_slavearbiterlockenable;
  wire             onchip_memory2_0_s1_slavearbiterlockenable2;
  wire             onchip_memory2_0_s1_unreg_firsttransfer;
  wire             onchip_memory2_0_s1_waits_for_read;
  wire             onchip_memory2_0_s1_waits_for_write;
  wire             onchip_memory2_0_s1_write;
  wire    [ 31: 0] onchip_memory2_0_s1_writedata;
  wire             p1_Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             p1_Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire    [ 11: 0] shifted_address_to_onchip_memory2_0_s1_from_Auido_core_Controller_clock_2_out;
  wire    [ 11: 0] shifted_address_to_onchip_memory2_0_s1_from_Auido_core_Controller_clock_3_out;
  wire             wait_for_onchip_memory2_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory2_0_s1_end_xfer;
    end


  assign onchip_memory2_0_s1_begins_xfer = ~d1_reasons_to_wait & ((Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 | Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1));
  //assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata;

  assign Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1 = (1) & (Auido_core_Controller_clock_2_out_read | Auido_core_Controller_clock_2_out_write);
  //onchip_memory2_0_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory2_0_s1_arb_share_set_values = 1;

  //onchip_memory2_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory2_0_s1_non_bursting_master_requests = Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1 |
    Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1 |
    Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1 |
    Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;

  //onchip_memory2_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory2_0_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory2_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory2_0_s1_arb_share_counter_next_value = onchip_memory2_0_s1_firsttransfer ? (onchip_memory2_0_s1_arb_share_set_values - 1) : |onchip_memory2_0_s1_arb_share_counter ? (onchip_memory2_0_s1_arb_share_counter - 1) : 0;

  //onchip_memory2_0_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory2_0_s1_allgrants = (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector);

  //onchip_memory2_0_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory2_0_s1_end_xfer = ~(onchip_memory2_0_s1_waits_for_read | onchip_memory2_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory2_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory2_0_s1 = onchip_memory2_0_s1_end_xfer & (~onchip_memory2_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory2_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory2_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & onchip_memory2_0_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & ~onchip_memory2_0_s1_non_bursting_master_requests);

  //onchip_memory2_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_arb_share_counter <= 0;
      else if (onchip_memory2_0_s1_arb_counter_enable)
          onchip_memory2_0_s1_arb_share_counter <= onchip_memory2_0_s1_arb_share_counter_next_value;
    end


  //onchip_memory2_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory2_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory2_0_s1) | (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & ~onchip_memory2_0_s1_non_bursting_master_requests))
          onchip_memory2_0_s1_slavearbiterlockenable <= |onchip_memory2_0_s1_arb_share_counter_next_value;
    end


  //Auido_core_Controller_clock_2/out onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign Auido_core_Controller_clock_2_out_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & Auido_core_Controller_clock_2_out_continuerequest;

  //onchip_memory2_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory2_0_s1_slavearbiterlockenable2 = |onchip_memory2_0_s1_arb_share_counter_next_value;

  //Auido_core_Controller_clock_2/out onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_2_out_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & Auido_core_Controller_clock_2_out_continuerequest;

  //Auido_core_Controller_clock_3/out onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign Auido_core_Controller_clock_3_out_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & Auido_core_Controller_clock_3_out_continuerequest;

  //Auido_core_Controller_clock_3/out onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign Auido_core_Controller_clock_3_out_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & Auido_core_Controller_clock_3_out_continuerequest;

  //Auido_core_Controller_clock_3/out granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_Auido_core_Controller_clock_3_out_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_Auido_core_Controller_clock_3_out_granted_slave_onchip_memory2_0_s1 <= Auido_core_Controller_clock_3_out_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1) ? 0 : last_cycle_Auido_core_Controller_clock_3_out_granted_slave_onchip_memory2_0_s1;
    end


  //Auido_core_Controller_clock_3_out_continuerequest continued request, which is an e_mux
  assign Auido_core_Controller_clock_3_out_continuerequest = last_cycle_Auido_core_Controller_clock_3_out_granted_slave_onchip_memory2_0_s1 & Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;

  //onchip_memory2_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory2_0_s1_any_continuerequest = Auido_core_Controller_clock_3_out_continuerequest |
    Auido_core_Controller_clock_2_out_continuerequest;

  assign Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 = Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1 & ~((Auido_core_Controller_clock_2_out_read & ((|Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register))) | Auido_core_Controller_clock_3_out_arbiterlock);
  //Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register_in = Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_2_out_read & ~onchip_memory2_0_s1_waits_for_read & ~(|Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register);

  //shift register p1 Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register = {Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register, Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1 = Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1_shift_register;

  //onchip_memory2_0_s1_writedata mux, which is an e_mux
  assign onchip_memory2_0_s1_writedata = (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1)? Auido_core_Controller_clock_2_out_writedata :
    Auido_core_Controller_clock_3_out_writedata;

  //mux onchip_memory2_0_s1_clken, which is an e_mux
  assign onchip_memory2_0_s1_clken = 1'b1;

  assign Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1 = (1) & (Auido_core_Controller_clock_3_out_read | Auido_core_Controller_clock_3_out_write);
  //Auido_core_Controller_clock_2/out granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_Auido_core_Controller_clock_2_out_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_Auido_core_Controller_clock_2_out_granted_slave_onchip_memory2_0_s1 <= Auido_core_Controller_clock_2_out_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1) ? 0 : last_cycle_Auido_core_Controller_clock_2_out_granted_slave_onchip_memory2_0_s1;
    end


  //Auido_core_Controller_clock_2_out_continuerequest continued request, which is an e_mux
  assign Auido_core_Controller_clock_2_out_continuerequest = last_cycle_Auido_core_Controller_clock_2_out_granted_slave_onchip_memory2_0_s1 & Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1;

  assign Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1 = Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1 & ~((Auido_core_Controller_clock_3_out_read & ((|Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register))) | Auido_core_Controller_clock_2_out_arbiterlock);
  //Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register_in = Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_3_out_read & ~onchip_memory2_0_s1_waits_for_read & ~(|Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register);

  //shift register p1 Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register = {Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register, Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1 = Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1_shift_register;

  //allow new arb cycle for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_allow_new_arb_cycle = ~Auido_core_Controller_clock_2_out_arbiterlock & ~Auido_core_Controller_clock_3_out_arbiterlock;

  //Auido_core_Controller_clock_3/out assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[0] = Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1;

  //Auido_core_Controller_clock_3/out grant onchip_memory2_0/s1, which is an e_assign
  assign Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[0];

  //Auido_core_Controller_clock_3/out saved-grant onchip_memory2_0/s1, which is an e_assign
  assign Auido_core_Controller_clock_3_out_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[0] && Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;

  //Auido_core_Controller_clock_2/out assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[1] = Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1;

  //Auido_core_Controller_clock_2/out grant onchip_memory2_0/s1, which is an e_assign
  assign Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[1];

  //Auido_core_Controller_clock_2/out saved-grant onchip_memory2_0/s1, which is an e_assign
  assign Auido_core_Controller_clock_2_out_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[1] && Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1;

  //onchip_memory2_0/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory2_0_s1_chosen_master_double_vector = {onchip_memory2_0_s1_master_qreq_vector, onchip_memory2_0_s1_master_qreq_vector} & ({~onchip_memory2_0_s1_master_qreq_vector, ~onchip_memory2_0_s1_master_qreq_vector} + onchip_memory2_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory2_0_s1_arb_winner = (onchip_memory2_0_s1_allow_new_arb_cycle & | onchip_memory2_0_s1_grant_vector) ? onchip_memory2_0_s1_grant_vector : onchip_memory2_0_s1_saved_chosen_master_vector;

  //saved onchip_memory2_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory2_0_s1_allow_new_arb_cycle)
          onchip_memory2_0_s1_saved_chosen_master_vector <= |onchip_memory2_0_s1_grant_vector ? onchip_memory2_0_s1_grant_vector : onchip_memory2_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory2_0_s1_grant_vector = {(onchip_memory2_0_s1_chosen_master_double_vector[1] | onchip_memory2_0_s1_chosen_master_double_vector[3]),
    (onchip_memory2_0_s1_chosen_master_double_vector[0] | onchip_memory2_0_s1_chosen_master_double_vector[2])};

  //onchip_memory2_0/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory2_0_s1_chosen_master_rot_left = (onchip_memory2_0_s1_arb_winner << 1) ? (onchip_memory2_0_s1_arb_winner << 1) : 1;

  //onchip_memory2_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_arb_addend <= 1;
      else if (|onchip_memory2_0_s1_grant_vector)
          onchip_memory2_0_s1_arb_addend <= onchip_memory2_0_s1_end_xfer? onchip_memory2_0_s1_chosen_master_rot_left : onchip_memory2_0_s1_grant_vector;
    end


  assign onchip_memory2_0_s1_chipselect = Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 | Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1;
  //onchip_memory2_0_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_0_s1_firsttransfer = onchip_memory2_0_s1_begins_xfer ? onchip_memory2_0_s1_unreg_firsttransfer : onchip_memory2_0_s1_reg_firsttransfer;

  //onchip_memory2_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_0_s1_unreg_firsttransfer = ~(onchip_memory2_0_s1_slavearbiterlockenable & onchip_memory2_0_s1_any_continuerequest);

  //onchip_memory2_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory2_0_s1_begins_xfer)
          onchip_memory2_0_s1_reg_firsttransfer <= onchip_memory2_0_s1_unreg_firsttransfer;
    end


  //onchip_memory2_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory2_0_s1_beginbursttransfer_internal = onchip_memory2_0_s1_begins_xfer;

  //onchip_memory2_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory2_0_s1_arbitration_holdoff_internal = onchip_memory2_0_s1_begins_xfer & onchip_memory2_0_s1_firsttransfer;

  //onchip_memory2_0_s1_write assignment, which is an e_mux
  assign onchip_memory2_0_s1_write = (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_2_out_write) | (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_3_out_write);

  assign shifted_address_to_onchip_memory2_0_s1_from_Auido_core_Controller_clock_2_out = Auido_core_Controller_clock_2_out_address_to_slave;
  //onchip_memory2_0_s1_address mux, which is an e_mux
  assign onchip_memory2_0_s1_address = (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1)? (shifted_address_to_onchip_memory2_0_s1_from_Auido_core_Controller_clock_2_out >> 2) :
    (shifted_address_to_onchip_memory2_0_s1_from_Auido_core_Controller_clock_3_out >> 2);

  assign shifted_address_to_onchip_memory2_0_s1_from_Auido_core_Controller_clock_3_out = Auido_core_Controller_clock_3_out_address_to_slave;
  //d1_onchip_memory2_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory2_0_s1_end_xfer <= 1;
      else 
        d1_onchip_memory2_0_s1_end_xfer <= onchip_memory2_0_s1_end_xfer;
    end


  //onchip_memory2_0_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory2_0_s1_waits_for_read = onchip_memory2_0_s1_in_a_read_cycle & 0;

  //onchip_memory2_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory2_0_s1_in_a_read_cycle = (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_2_out_read) | (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_3_out_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory2_0_s1_in_a_read_cycle;

  //onchip_memory2_0_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory2_0_s1_waits_for_write = onchip_memory2_0_s1_in_a_write_cycle & 0;

  //onchip_memory2_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory2_0_s1_in_a_write_cycle = (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_2_out_write) | (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 & Auido_core_Controller_clock_3_out_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory2_0_s1_in_a_write_cycle;

  assign wait_for_onchip_memory2_0_s1_counter = 0;
  //onchip_memory2_0_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory2_0_s1_byteenable = (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1)? Auido_core_Controller_clock_2_out_byteenable :
    (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1)? Auido_core_Controller_clock_3_out_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory2_0/s1 enable non-zero assertions, which is an e_register
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
      if (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1 + Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (Auido_core_Controller_clock_2_out_saved_grant_onchip_memory2_0_s1 + Auido_core_Controller_clock_3_out_saved_grant_onchip_memory2_0_s1 > 1)
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

module Auido_core_Controller_reset_clocks_0_sys_clk_out_domain_synch_module (
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

module Auido_core_Controller_reset_clk_0_domain_synch_module (
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

module Auido_core_Controller (
                               // 1) global signals:
                                clk_0,
                                clocks_0_AUD_CLK_out,
                                clocks_0_SDRAM_CLK_out,
                                clocks_0_sys_clk_out,
                                reset_n,

                               // the_Altera_UP_SD_Card_Avalon_Interface_0
                                b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0,
                                b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0,
                                b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0,
                                o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0,

                               // the_audio_and_video_config_0
                                I2C_SCLK_from_the_audio_and_video_config_0,
                                I2C_SDAT_to_and_from_the_audio_and_video_config_0
                             )
;

  output           I2C_SCLK_from_the_audio_and_video_config_0;
  inout            I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  inout            b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  inout            b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  inout            b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  output           clocks_0_AUD_CLK_out;
  output           clocks_0_SDRAM_CLK_out;
  output           clocks_0_sys_clk_out;
  output           o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  input            clk_0;
  input            reset_n;

  wire    [  7: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address;
  wire    [  3: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read;
  wire    [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata;
  wire    [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa;
  wire             Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write;
  wire    [ 31: 0] Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata;
  wire    [  3: 0] Auido_core_Controller_clock_0_in_address;
  wire    [  3: 0] Auido_core_Controller_clock_0_in_byteenable;
  wire             Auido_core_Controller_clock_0_in_endofpacket;
  wire             Auido_core_Controller_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] Auido_core_Controller_clock_0_in_nativeaddress;
  wire             Auido_core_Controller_clock_0_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_0_in_readdata;
  wire    [ 31: 0] Auido_core_Controller_clock_0_in_readdata_from_sa;
  wire             Auido_core_Controller_clock_0_in_reset_n;
  wire             Auido_core_Controller_clock_0_in_waitrequest;
  wire             Auido_core_Controller_clock_0_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_0_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_0_in_writedata;
  wire    [  3: 0] Auido_core_Controller_clock_0_out_address;
  wire    [  3: 0] Auido_core_Controller_clock_0_out_address_to_slave;
  wire    [  3: 0] Auido_core_Controller_clock_0_out_byteenable;
  wire             Auido_core_Controller_clock_0_out_endofpacket;
  wire             Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave;
  wire    [  1: 0] Auido_core_Controller_clock_0_out_nativeaddress;
  wire             Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave;
  wire             Auido_core_Controller_clock_0_out_read;
  wire             Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave;
  wire    [ 31: 0] Auido_core_Controller_clock_0_out_readdata;
  wire             Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave;
  wire             Auido_core_Controller_clock_0_out_reset_n;
  wire             Auido_core_Controller_clock_0_out_waitrequest;
  wire             Auido_core_Controller_clock_0_out_write;
  wire    [ 31: 0] Auido_core_Controller_clock_0_out_writedata;
  wire    [  9: 0] Auido_core_Controller_clock_1_in_address;
  wire    [  3: 0] Auido_core_Controller_clock_1_in_byteenable;
  wire             Auido_core_Controller_clock_1_in_endofpacket;
  wire             Auido_core_Controller_clock_1_in_endofpacket_from_sa;
  wire    [  7: 0] Auido_core_Controller_clock_1_in_nativeaddress;
  wire             Auido_core_Controller_clock_1_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_1_in_readdata;
  wire    [ 31: 0] Auido_core_Controller_clock_1_in_readdata_from_sa;
  wire             Auido_core_Controller_clock_1_in_reset_n;
  wire             Auido_core_Controller_clock_1_in_waitrequest;
  wire             Auido_core_Controller_clock_1_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_1_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_1_in_writedata;
  wire    [  9: 0] Auido_core_Controller_clock_1_out_address;
  wire    [  9: 0] Auido_core_Controller_clock_1_out_address_to_slave;
  wire    [  3: 0] Auido_core_Controller_clock_1_out_byteenable;
  wire             Auido_core_Controller_clock_1_out_endofpacket;
  wire             Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire    [  7: 0] Auido_core_Controller_clock_1_out_nativeaddress;
  wire             Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             Auido_core_Controller_clock_1_out_read;
  wire             Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire    [ 31: 0] Auido_core_Controller_clock_1_out_readdata;
  wire             Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave;
  wire             Auido_core_Controller_clock_1_out_reset_n;
  wire             Auido_core_Controller_clock_1_out_waitrequest;
  wire             Auido_core_Controller_clock_1_out_write;
  wire    [ 31: 0] Auido_core_Controller_clock_1_out_writedata;
  wire    [ 11: 0] Auido_core_Controller_clock_2_in_address;
  wire    [  3: 0] Auido_core_Controller_clock_2_in_byteenable;
  wire             Auido_core_Controller_clock_2_in_endofpacket;
  wire             Auido_core_Controller_clock_2_in_endofpacket_from_sa;
  wire    [  9: 0] Auido_core_Controller_clock_2_in_nativeaddress;
  wire             Auido_core_Controller_clock_2_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_2_in_readdata;
  wire    [ 31: 0] Auido_core_Controller_clock_2_in_readdata_from_sa;
  wire             Auido_core_Controller_clock_2_in_reset_n;
  wire             Auido_core_Controller_clock_2_in_waitrequest;
  wire             Auido_core_Controller_clock_2_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_2_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_2_in_writedata;
  wire    [ 11: 0] Auido_core_Controller_clock_2_out_address;
  wire    [ 11: 0] Auido_core_Controller_clock_2_out_address_to_slave;
  wire    [  3: 0] Auido_core_Controller_clock_2_out_byteenable;
  wire             Auido_core_Controller_clock_2_out_endofpacket;
  wire             Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1;
  wire    [  9: 0] Auido_core_Controller_clock_2_out_nativeaddress;
  wire             Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_2_out_read;
  wire             Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1;
  wire    [ 31: 0] Auido_core_Controller_clock_2_out_readdata;
  wire             Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_2_out_reset_n;
  wire             Auido_core_Controller_clock_2_out_waitrequest;
  wire             Auido_core_Controller_clock_2_out_write;
  wire    [ 31: 0] Auido_core_Controller_clock_2_out_writedata;
  wire    [ 11: 0] Auido_core_Controller_clock_3_in_address;
  wire    [  3: 0] Auido_core_Controller_clock_3_in_byteenable;
  wire             Auido_core_Controller_clock_3_in_endofpacket;
  wire             Auido_core_Controller_clock_3_in_endofpacket_from_sa;
  wire    [  9: 0] Auido_core_Controller_clock_3_in_nativeaddress;
  wire             Auido_core_Controller_clock_3_in_read;
  wire    [ 31: 0] Auido_core_Controller_clock_3_in_readdata;
  wire    [ 31: 0] Auido_core_Controller_clock_3_in_readdata_from_sa;
  wire             Auido_core_Controller_clock_3_in_reset_n;
  wire             Auido_core_Controller_clock_3_in_waitrequest;
  wire             Auido_core_Controller_clock_3_in_waitrequest_from_sa;
  wire             Auido_core_Controller_clock_3_in_write;
  wire    [ 31: 0] Auido_core_Controller_clock_3_in_writedata;
  wire    [ 11: 0] Auido_core_Controller_clock_3_out_address;
  wire    [ 11: 0] Auido_core_Controller_clock_3_out_address_to_slave;
  wire    [  3: 0] Auido_core_Controller_clock_3_out_byteenable;
  wire             Auido_core_Controller_clock_3_out_endofpacket;
  wire             Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1;
  wire    [  9: 0] Auido_core_Controller_clock_3_out_nativeaddress;
  wire             Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_3_out_read;
  wire             Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1;
  wire    [ 31: 0] Auido_core_Controller_clock_3_out_readdata;
  wire             Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1;
  wire             Auido_core_Controller_clock_3_out_reset_n;
  wire             Auido_core_Controller_clock_3_out_waitrequest;
  wire             Auido_core_Controller_clock_3_out_write;
  wire    [ 31: 0] Auido_core_Controller_clock_3_out_writedata;
  wire             I2C_SCLK_from_the_audio_and_video_config_0;
  wire             I2C_SDAT_to_and_from_the_audio_and_video_config_0;
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
  wire             b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire             b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire             b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire             clk_0_reset_n;
  wire             clocks_0_AUD_CLK_out;
  wire             clocks_0_SDRAM_CLK_out;
  wire             clocks_0_avalon_clocks_slave_address;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  wire             clocks_0_sys_clk_out;
  wire             clocks_0_sys_clk_out_reset_n;
  wire    [ 20: 0] cpu_0_data_master_address;
  wire    [ 20: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_granted_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_granted_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_granted_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_Auido_core_Controller_clock_0_in;
  wire             cpu_0_data_master_requests_Auido_core_Controller_clock_1_in;
  wire             cpu_0_data_master_requests_Auido_core_Controller_clock_3_in;
  wire             cpu_0_data_master_requests_clocks_0_avalon_clocks_slave;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 20: 0] cpu_0_instruction_master_address;
  wire    [ 20: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
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
  wire             d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer;
  wire             d1_Auido_core_Controller_clock_0_in_end_xfer;
  wire             d1_Auido_core_Controller_clock_1_in_end_xfer;
  wire             d1_Auido_core_Controller_clock_2_in_end_xfer;
  wire             d1_Auido_core_Controller_clock_3_in_end_xfer;
  wire             d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer;
  wire             d1_clocks_0_avalon_clocks_slave_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_onchip_memory2_0_s1_end_xfer;
  wire             o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire    [  9: 0] onchip_memory2_0_s1_address;
  wire    [  3: 0] onchip_memory2_0_s1_byteenable;
  wire             onchip_memory2_0_s1_chipselect;
  wire             onchip_memory2_0_s1_clken;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  wire             onchip_memory2_0_s1_write;
  wire    [ 31: 0] onchip_memory2_0_s1_writedata;
  wire             out_clk_clocks_0_AUD_CLK;
  wire             out_clk_clocks_0_SDRAM_CLK;
  wire             out_clk_clocks_0_sys_clk;
  wire             registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave;
  wire             reset_n_sources;
  Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_arbitrator the_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave
    (
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address                                             (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable                                          (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect                                          (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read                                                (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata                                            (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa                                    (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n                                             (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest                                         (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa                                 (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write                                               (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata                                           (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata),
      .Auido_core_Controller_clock_1_out_address_to_slave                                                           (Auido_core_Controller_clock_1_out_address_to_slave),
      .Auido_core_Controller_clock_1_out_byteenable                                                                 (Auido_core_Controller_clock_1_out_byteenable),
      .Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave           (Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave (Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_read                                                                       (Auido_core_Controller_clock_1_out_read),
      .Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave   (Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave          (Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_write                                                                      (Auido_core_Controller_clock_1_out_write),
      .Auido_core_Controller_clock_1_out_writedata                                                                  (Auido_core_Controller_clock_1_out_writedata),
      .clk                                                                                                          (clocks_0_sys_clk_out),
      .d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer                                         (d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer),
      .reset_n                                                                                                      (clocks_0_sys_clk_out_reset_n)
    );

  Altera_UP_SD_Card_Avalon_Interface_0 the_Altera_UP_SD_Card_Avalon_Interface_0
    (
      .b_SD_cmd             (b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .b_SD_dat             (b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .b_SD_dat3            (b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .i_avalon_address     (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_address),
      .i_avalon_byteenable  (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_byteenable),
      .i_avalon_chip_select (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_chipselect),
      .i_avalon_read        (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_read),
      .i_avalon_write       (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_write),
      .i_avalon_writedata   (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_writedata),
      .i_clock              (clocks_0_sys_clk_out),
      .i_reset_n            (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_reset_n),
      .o_SD_clock           (o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .o_avalon_readdata    (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata),
      .o_avalon_waitrequest (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest)
    );

  Auido_core_Controller_clock_0_in_arbitrator the_Auido_core_Controller_clock_0_in
    (
      .Auido_core_Controller_clock_0_in_address                             (Auido_core_Controller_clock_0_in_address),
      .Auido_core_Controller_clock_0_in_byteenable                          (Auido_core_Controller_clock_0_in_byteenable),
      .Auido_core_Controller_clock_0_in_endofpacket                         (Auido_core_Controller_clock_0_in_endofpacket),
      .Auido_core_Controller_clock_0_in_endofpacket_from_sa                 (Auido_core_Controller_clock_0_in_endofpacket_from_sa),
      .Auido_core_Controller_clock_0_in_nativeaddress                       (Auido_core_Controller_clock_0_in_nativeaddress),
      .Auido_core_Controller_clock_0_in_read                                (Auido_core_Controller_clock_0_in_read),
      .Auido_core_Controller_clock_0_in_readdata                            (Auido_core_Controller_clock_0_in_readdata),
      .Auido_core_Controller_clock_0_in_readdata_from_sa                    (Auido_core_Controller_clock_0_in_readdata_from_sa),
      .Auido_core_Controller_clock_0_in_reset_n                             (Auido_core_Controller_clock_0_in_reset_n),
      .Auido_core_Controller_clock_0_in_waitrequest                         (Auido_core_Controller_clock_0_in_waitrequest),
      .Auido_core_Controller_clock_0_in_waitrequest_from_sa                 (Auido_core_Controller_clock_0_in_waitrequest_from_sa),
      .Auido_core_Controller_clock_0_in_write                               (Auido_core_Controller_clock_0_in_write),
      .Auido_core_Controller_clock_0_in_writedata                           (Auido_core_Controller_clock_0_in_writedata),
      .clk                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                         (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_Auido_core_Controller_clock_0_in           (cpu_0_data_master_granted_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_read                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in   (cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_requests_Auido_core_Controller_clock_0_in          (cpu_0_data_master_requests_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_waitrequest                                        (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                          (cpu_0_data_master_writedata),
      .d1_Auido_core_Controller_clock_0_in_end_xfer                         (d1_Auido_core_Controller_clock_0_in_end_xfer),
      .reset_n                                                              (clk_0_reset_n)
    );

  Auido_core_Controller_clock_0_out_arbitrator the_Auido_core_Controller_clock_0_out
    (
      .Auido_core_Controller_clock_0_out_address                                                           (Auido_core_Controller_clock_0_out_address),
      .Auido_core_Controller_clock_0_out_address_to_slave                                                  (Auido_core_Controller_clock_0_out_address_to_slave),
      .Auido_core_Controller_clock_0_out_byteenable                                                        (Auido_core_Controller_clock_0_out_byteenable),
      .Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave           (Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave (Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_read                                                              (Auido_core_Controller_clock_0_out_read),
      .Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave   (Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_readdata                                                          (Auido_core_Controller_clock_0_out_readdata),
      .Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave          (Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_reset_n                                                           (Auido_core_Controller_clock_0_out_reset_n),
      .Auido_core_Controller_clock_0_out_waitrequest                                                       (Auido_core_Controller_clock_0_out_waitrequest),
      .Auido_core_Controller_clock_0_out_write                                                             (Auido_core_Controller_clock_0_out_write),
      .Auido_core_Controller_clock_0_out_writedata                                                         (Auido_core_Controller_clock_0_out_writedata),
      .audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa                                    (audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa                                 (audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa),
      .clk                                                                                                 (clocks_0_sys_clk_out),
      .d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer                                         (d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer),
      .reset_n                                                                                             (clocks_0_sys_clk_out_reset_n)
    );

  Auido_core_Controller_clock_0 the_Auido_core_Controller_clock_0
    (
      .master_address       (Auido_core_Controller_clock_0_out_address),
      .master_byteenable    (Auido_core_Controller_clock_0_out_byteenable),
      .master_clk           (clocks_0_sys_clk_out),
      .master_endofpacket   (Auido_core_Controller_clock_0_out_endofpacket),
      .master_nativeaddress (Auido_core_Controller_clock_0_out_nativeaddress),
      .master_read          (Auido_core_Controller_clock_0_out_read),
      .master_readdata      (Auido_core_Controller_clock_0_out_readdata),
      .master_reset_n       (Auido_core_Controller_clock_0_out_reset_n),
      .master_waitrequest   (Auido_core_Controller_clock_0_out_waitrequest),
      .master_write         (Auido_core_Controller_clock_0_out_write),
      .master_writedata     (Auido_core_Controller_clock_0_out_writedata),
      .slave_address        (Auido_core_Controller_clock_0_in_address),
      .slave_byteenable     (Auido_core_Controller_clock_0_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (Auido_core_Controller_clock_0_in_endofpacket),
      .slave_nativeaddress  (Auido_core_Controller_clock_0_in_nativeaddress),
      .slave_read           (Auido_core_Controller_clock_0_in_read),
      .slave_readdata       (Auido_core_Controller_clock_0_in_readdata),
      .slave_reset_n        (Auido_core_Controller_clock_0_in_reset_n),
      .slave_waitrequest    (Auido_core_Controller_clock_0_in_waitrequest),
      .slave_write          (Auido_core_Controller_clock_0_in_write),
      .slave_writedata      (Auido_core_Controller_clock_0_in_writedata)
    );

  Auido_core_Controller_clock_1_in_arbitrator the_Auido_core_Controller_clock_1_in
    (
      .Auido_core_Controller_clock_1_in_address                             (Auido_core_Controller_clock_1_in_address),
      .Auido_core_Controller_clock_1_in_byteenable                          (Auido_core_Controller_clock_1_in_byteenable),
      .Auido_core_Controller_clock_1_in_endofpacket                         (Auido_core_Controller_clock_1_in_endofpacket),
      .Auido_core_Controller_clock_1_in_endofpacket_from_sa                 (Auido_core_Controller_clock_1_in_endofpacket_from_sa),
      .Auido_core_Controller_clock_1_in_nativeaddress                       (Auido_core_Controller_clock_1_in_nativeaddress),
      .Auido_core_Controller_clock_1_in_read                                (Auido_core_Controller_clock_1_in_read),
      .Auido_core_Controller_clock_1_in_readdata                            (Auido_core_Controller_clock_1_in_readdata),
      .Auido_core_Controller_clock_1_in_readdata_from_sa                    (Auido_core_Controller_clock_1_in_readdata_from_sa),
      .Auido_core_Controller_clock_1_in_reset_n                             (Auido_core_Controller_clock_1_in_reset_n),
      .Auido_core_Controller_clock_1_in_waitrequest                         (Auido_core_Controller_clock_1_in_waitrequest),
      .Auido_core_Controller_clock_1_in_waitrequest_from_sa                 (Auido_core_Controller_clock_1_in_waitrequest_from_sa),
      .Auido_core_Controller_clock_1_in_write                               (Auido_core_Controller_clock_1_in_write),
      .Auido_core_Controller_clock_1_in_writedata                           (Auido_core_Controller_clock_1_in_writedata),
      .clk                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                         (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_Auido_core_Controller_clock_1_in           (cpu_0_data_master_granted_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_read                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in   (cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_requests_Auido_core_Controller_clock_1_in          (cpu_0_data_master_requests_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_waitrequest                                        (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                          (cpu_0_data_master_writedata),
      .d1_Auido_core_Controller_clock_1_in_end_xfer                         (d1_Auido_core_Controller_clock_1_in_end_xfer),
      .reset_n                                                              (clk_0_reset_n)
    );

  Auido_core_Controller_clock_1_out_arbitrator the_Auido_core_Controller_clock_1_out
    (
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa                                    (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_readdata_from_sa),
      .Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa                                 (Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_waitrequest_from_sa),
      .Auido_core_Controller_clock_1_out_address                                                                    (Auido_core_Controller_clock_1_out_address),
      .Auido_core_Controller_clock_1_out_address_to_slave                                                           (Auido_core_Controller_clock_1_out_address_to_slave),
      .Auido_core_Controller_clock_1_out_byteenable                                                                 (Auido_core_Controller_clock_1_out_byteenable),
      .Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave           (Auido_core_Controller_clock_1_out_granted_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave (Auido_core_Controller_clock_1_out_qualified_request_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_read                                                                       (Auido_core_Controller_clock_1_out_read),
      .Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave   (Auido_core_Controller_clock_1_out_read_data_valid_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_readdata                                                                   (Auido_core_Controller_clock_1_out_readdata),
      .Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave          (Auido_core_Controller_clock_1_out_requests_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave),
      .Auido_core_Controller_clock_1_out_reset_n                                                                    (Auido_core_Controller_clock_1_out_reset_n),
      .Auido_core_Controller_clock_1_out_waitrequest                                                                (Auido_core_Controller_clock_1_out_waitrequest),
      .Auido_core_Controller_clock_1_out_write                                                                      (Auido_core_Controller_clock_1_out_write),
      .Auido_core_Controller_clock_1_out_writedata                                                                  (Auido_core_Controller_clock_1_out_writedata),
      .clk                                                                                                          (clocks_0_sys_clk_out),
      .d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer                                         (d1_Altera_UP_SD_Card_Avalon_Interface_0_avalon_sdcard_slave_end_xfer),
      .reset_n                                                                                                      (clocks_0_sys_clk_out_reset_n)
    );

  Auido_core_Controller_clock_1 the_Auido_core_Controller_clock_1
    (
      .master_address       (Auido_core_Controller_clock_1_out_address),
      .master_byteenable    (Auido_core_Controller_clock_1_out_byteenable),
      .master_clk           (clocks_0_sys_clk_out),
      .master_endofpacket   (Auido_core_Controller_clock_1_out_endofpacket),
      .master_nativeaddress (Auido_core_Controller_clock_1_out_nativeaddress),
      .master_read          (Auido_core_Controller_clock_1_out_read),
      .master_readdata      (Auido_core_Controller_clock_1_out_readdata),
      .master_reset_n       (Auido_core_Controller_clock_1_out_reset_n),
      .master_waitrequest   (Auido_core_Controller_clock_1_out_waitrequest),
      .master_write         (Auido_core_Controller_clock_1_out_write),
      .master_writedata     (Auido_core_Controller_clock_1_out_writedata),
      .slave_address        (Auido_core_Controller_clock_1_in_address),
      .slave_byteenable     (Auido_core_Controller_clock_1_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (Auido_core_Controller_clock_1_in_endofpacket),
      .slave_nativeaddress  (Auido_core_Controller_clock_1_in_nativeaddress),
      .slave_read           (Auido_core_Controller_clock_1_in_read),
      .slave_readdata       (Auido_core_Controller_clock_1_in_readdata),
      .slave_reset_n        (Auido_core_Controller_clock_1_in_reset_n),
      .slave_waitrequest    (Auido_core_Controller_clock_1_in_waitrequest),
      .slave_write          (Auido_core_Controller_clock_1_in_write),
      .slave_writedata      (Auido_core_Controller_clock_1_in_writedata)
    );

  Auido_core_Controller_clock_2_in_arbitrator the_Auido_core_Controller_clock_2_in
    (
      .Auido_core_Controller_clock_2_in_address                                    (Auido_core_Controller_clock_2_in_address),
      .Auido_core_Controller_clock_2_in_byteenable                                 (Auido_core_Controller_clock_2_in_byteenable),
      .Auido_core_Controller_clock_2_in_endofpacket                                (Auido_core_Controller_clock_2_in_endofpacket),
      .Auido_core_Controller_clock_2_in_endofpacket_from_sa                        (Auido_core_Controller_clock_2_in_endofpacket_from_sa),
      .Auido_core_Controller_clock_2_in_nativeaddress                              (Auido_core_Controller_clock_2_in_nativeaddress),
      .Auido_core_Controller_clock_2_in_read                                       (Auido_core_Controller_clock_2_in_read),
      .Auido_core_Controller_clock_2_in_readdata                                   (Auido_core_Controller_clock_2_in_readdata),
      .Auido_core_Controller_clock_2_in_readdata_from_sa                           (Auido_core_Controller_clock_2_in_readdata_from_sa),
      .Auido_core_Controller_clock_2_in_reset_n                                    (Auido_core_Controller_clock_2_in_reset_n),
      .Auido_core_Controller_clock_2_in_waitrequest                                (Auido_core_Controller_clock_2_in_waitrequest),
      .Auido_core_Controller_clock_2_in_waitrequest_from_sa                        (Auido_core_Controller_clock_2_in_waitrequest_from_sa),
      .Auido_core_Controller_clock_2_in_write                                      (Auido_core_Controller_clock_2_in_write),
      .clk                                                                         (clk_0),
      .cpu_0_instruction_master_address_to_slave                                   (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in           (cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in (cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_read                                               (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in   (cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in          (cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in),
      .d1_Auido_core_Controller_clock_2_in_end_xfer                                (d1_Auido_core_Controller_clock_2_in_end_xfer),
      .reset_n                                                                     (clk_0_reset_n)
    );

  Auido_core_Controller_clock_2_out_arbitrator the_Auido_core_Controller_clock_2_out
    (
      .Auido_core_Controller_clock_2_out_address                               (Auido_core_Controller_clock_2_out_address),
      .Auido_core_Controller_clock_2_out_address_to_slave                      (Auido_core_Controller_clock_2_out_address_to_slave),
      .Auido_core_Controller_clock_2_out_byteenable                            (Auido_core_Controller_clock_2_out_byteenable),
      .Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1           (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 (Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_read                                  (Auido_core_Controller_clock_2_out_read),
      .Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1   (Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_readdata                              (Auido_core_Controller_clock_2_out_readdata),
      .Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1          (Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_reset_n                               (Auido_core_Controller_clock_2_out_reset_n),
      .Auido_core_Controller_clock_2_out_waitrequest                           (Auido_core_Controller_clock_2_out_waitrequest),
      .Auido_core_Controller_clock_2_out_write                                 (Auido_core_Controller_clock_2_out_write),
      .Auido_core_Controller_clock_2_out_writedata                             (Auido_core_Controller_clock_2_out_writedata),
      .clk                                                                     (clocks_0_sys_clk_out),
      .d1_onchip_memory2_0_s1_end_xfer                                         (d1_onchip_memory2_0_s1_end_xfer),
      .onchip_memory2_0_s1_readdata_from_sa                                    (onchip_memory2_0_s1_readdata_from_sa),
      .reset_n                                                                 (clocks_0_sys_clk_out_reset_n)
    );

  Auido_core_Controller_clock_2 the_Auido_core_Controller_clock_2
    (
      .master_address       (Auido_core_Controller_clock_2_out_address),
      .master_byteenable    (Auido_core_Controller_clock_2_out_byteenable),
      .master_clk           (clocks_0_sys_clk_out),
      .master_endofpacket   (Auido_core_Controller_clock_2_out_endofpacket),
      .master_nativeaddress (Auido_core_Controller_clock_2_out_nativeaddress),
      .master_read          (Auido_core_Controller_clock_2_out_read),
      .master_readdata      (Auido_core_Controller_clock_2_out_readdata),
      .master_reset_n       (Auido_core_Controller_clock_2_out_reset_n),
      .master_waitrequest   (Auido_core_Controller_clock_2_out_waitrequest),
      .master_write         (Auido_core_Controller_clock_2_out_write),
      .master_writedata     (Auido_core_Controller_clock_2_out_writedata),
      .slave_address        (Auido_core_Controller_clock_2_in_address),
      .slave_byteenable     (Auido_core_Controller_clock_2_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (Auido_core_Controller_clock_2_in_endofpacket),
      .slave_nativeaddress  (Auido_core_Controller_clock_2_in_nativeaddress),
      .slave_read           (Auido_core_Controller_clock_2_in_read),
      .slave_readdata       (Auido_core_Controller_clock_2_in_readdata),
      .slave_reset_n        (Auido_core_Controller_clock_2_in_reset_n),
      .slave_waitrequest    (Auido_core_Controller_clock_2_in_waitrequest),
      .slave_write          (Auido_core_Controller_clock_2_in_write),
      .slave_writedata      (Auido_core_Controller_clock_2_in_writedata)
    );

  Auido_core_Controller_clock_3_in_arbitrator the_Auido_core_Controller_clock_3_in
    (
      .Auido_core_Controller_clock_3_in_address                             (Auido_core_Controller_clock_3_in_address),
      .Auido_core_Controller_clock_3_in_byteenable                          (Auido_core_Controller_clock_3_in_byteenable),
      .Auido_core_Controller_clock_3_in_endofpacket                         (Auido_core_Controller_clock_3_in_endofpacket),
      .Auido_core_Controller_clock_3_in_endofpacket_from_sa                 (Auido_core_Controller_clock_3_in_endofpacket_from_sa),
      .Auido_core_Controller_clock_3_in_nativeaddress                       (Auido_core_Controller_clock_3_in_nativeaddress),
      .Auido_core_Controller_clock_3_in_read                                (Auido_core_Controller_clock_3_in_read),
      .Auido_core_Controller_clock_3_in_readdata                            (Auido_core_Controller_clock_3_in_readdata),
      .Auido_core_Controller_clock_3_in_readdata_from_sa                    (Auido_core_Controller_clock_3_in_readdata_from_sa),
      .Auido_core_Controller_clock_3_in_reset_n                             (Auido_core_Controller_clock_3_in_reset_n),
      .Auido_core_Controller_clock_3_in_waitrequest                         (Auido_core_Controller_clock_3_in_waitrequest),
      .Auido_core_Controller_clock_3_in_waitrequest_from_sa                 (Auido_core_Controller_clock_3_in_waitrequest_from_sa),
      .Auido_core_Controller_clock_3_in_write                               (Auido_core_Controller_clock_3_in_write),
      .Auido_core_Controller_clock_3_in_writedata                           (Auido_core_Controller_clock_3_in_writedata),
      .clk                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                         (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_Auido_core_Controller_clock_3_in           (cpu_0_data_master_granted_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_read                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in   (cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_requests_Auido_core_Controller_clock_3_in          (cpu_0_data_master_requests_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_waitrequest                                        (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                              (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                          (cpu_0_data_master_writedata),
      .d1_Auido_core_Controller_clock_3_in_end_xfer                         (d1_Auido_core_Controller_clock_3_in_end_xfer),
      .reset_n                                                              (clk_0_reset_n)
    );

  Auido_core_Controller_clock_3_out_arbitrator the_Auido_core_Controller_clock_3_out
    (
      .Auido_core_Controller_clock_3_out_address                               (Auido_core_Controller_clock_3_out_address),
      .Auido_core_Controller_clock_3_out_address_to_slave                      (Auido_core_Controller_clock_3_out_address_to_slave),
      .Auido_core_Controller_clock_3_out_byteenable                            (Auido_core_Controller_clock_3_out_byteenable),
      .Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1           (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1 (Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_read                                  (Auido_core_Controller_clock_3_out_read),
      .Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1   (Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_readdata                              (Auido_core_Controller_clock_3_out_readdata),
      .Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1          (Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_reset_n                               (Auido_core_Controller_clock_3_out_reset_n),
      .Auido_core_Controller_clock_3_out_waitrequest                           (Auido_core_Controller_clock_3_out_waitrequest),
      .Auido_core_Controller_clock_3_out_write                                 (Auido_core_Controller_clock_3_out_write),
      .Auido_core_Controller_clock_3_out_writedata                             (Auido_core_Controller_clock_3_out_writedata),
      .clk                                                                     (clocks_0_sys_clk_out),
      .d1_onchip_memory2_0_s1_end_xfer                                         (d1_onchip_memory2_0_s1_end_xfer),
      .onchip_memory2_0_s1_readdata_from_sa                                    (onchip_memory2_0_s1_readdata_from_sa),
      .reset_n                                                                 (clocks_0_sys_clk_out_reset_n)
    );

  Auido_core_Controller_clock_3 the_Auido_core_Controller_clock_3
    (
      .master_address       (Auido_core_Controller_clock_3_out_address),
      .master_byteenable    (Auido_core_Controller_clock_3_out_byteenable),
      .master_clk           (clocks_0_sys_clk_out),
      .master_endofpacket   (Auido_core_Controller_clock_3_out_endofpacket),
      .master_nativeaddress (Auido_core_Controller_clock_3_out_nativeaddress),
      .master_read          (Auido_core_Controller_clock_3_out_read),
      .master_readdata      (Auido_core_Controller_clock_3_out_readdata),
      .master_reset_n       (Auido_core_Controller_clock_3_out_reset_n),
      .master_waitrequest   (Auido_core_Controller_clock_3_out_waitrequest),
      .master_write         (Auido_core_Controller_clock_3_out_write),
      .master_writedata     (Auido_core_Controller_clock_3_out_writedata),
      .slave_address        (Auido_core_Controller_clock_3_in_address),
      .slave_byteenable     (Auido_core_Controller_clock_3_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (Auido_core_Controller_clock_3_in_endofpacket),
      .slave_nativeaddress  (Auido_core_Controller_clock_3_in_nativeaddress),
      .slave_read           (Auido_core_Controller_clock_3_in_read),
      .slave_readdata       (Auido_core_Controller_clock_3_in_readdata),
      .slave_reset_n        (Auido_core_Controller_clock_3_in_reset_n),
      .slave_waitrequest    (Auido_core_Controller_clock_3_in_waitrequest),
      .slave_write          (Auido_core_Controller_clock_3_in_write),
      .slave_writedata      (Auido_core_Controller_clock_3_in_writedata)
    );

  audio_and_video_config_0_avalon_av_config_slave_arbitrator the_audio_and_video_config_0_avalon_av_config_slave
    (
      .Auido_core_Controller_clock_0_out_address_to_slave                                                  (Auido_core_Controller_clock_0_out_address_to_slave),
      .Auido_core_Controller_clock_0_out_byteenable                                                        (Auido_core_Controller_clock_0_out_byteenable),
      .Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave           (Auido_core_Controller_clock_0_out_granted_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave (Auido_core_Controller_clock_0_out_qualified_request_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_read                                                              (Auido_core_Controller_clock_0_out_read),
      .Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave   (Auido_core_Controller_clock_0_out_read_data_valid_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave          (Auido_core_Controller_clock_0_out_requests_audio_and_video_config_0_avalon_av_config_slave),
      .Auido_core_Controller_clock_0_out_write                                                             (Auido_core_Controller_clock_0_out_write),
      .Auido_core_Controller_clock_0_out_writedata                                                         (Auido_core_Controller_clock_0_out_writedata),
      .audio_and_video_config_0_avalon_av_config_slave_address                                             (audio_and_video_config_0_avalon_av_config_slave_address),
      .audio_and_video_config_0_avalon_av_config_slave_byteenable                                          (audio_and_video_config_0_avalon_av_config_slave_byteenable),
      .audio_and_video_config_0_avalon_av_config_slave_read                                                (audio_and_video_config_0_avalon_av_config_slave_read),
      .audio_and_video_config_0_avalon_av_config_slave_readdata                                            (audio_and_video_config_0_avalon_av_config_slave_readdata),
      .audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa                                    (audio_and_video_config_0_avalon_av_config_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_reset                                               (audio_and_video_config_0_avalon_av_config_slave_reset),
      .audio_and_video_config_0_avalon_av_config_slave_waitrequest                                         (audio_and_video_config_0_avalon_av_config_slave_waitrequest),
      .audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa                                 (audio_and_video_config_0_avalon_av_config_slave_waitrequest_from_sa),
      .audio_and_video_config_0_avalon_av_config_slave_write                                               (audio_and_video_config_0_avalon_av_config_slave_write),
      .audio_and_video_config_0_avalon_av_config_slave_writedata                                           (audio_and_video_config_0_avalon_av_config_slave_writedata),
      .clk                                                                                                 (clocks_0_sys_clk_out),
      .d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer                                         (d1_audio_and_video_config_0_avalon_av_config_slave_end_xfer),
      .reset_n                                                                                             (clocks_0_sys_clk_out_reset_n)
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
      .clk                                                                       (clk_0),
      .clocks_0_avalon_clocks_slave_address                                      (clocks_0_avalon_clocks_slave_address),
      .clocks_0_avalon_clocks_slave_readdata                                     (clocks_0_avalon_clocks_slave_readdata),
      .clocks_0_avalon_clocks_slave_readdata_from_sa                             (clocks_0_avalon_clocks_slave_readdata_from_sa),
      .cpu_0_data_master_address_to_slave                                        (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_dbs_address                                             (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_granted_clocks_0_avalon_clocks_slave                    (cpu_0_data_master_granted_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave          (cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_read                                                    (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave            (cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_requests_clocks_0_avalon_clocks_slave                   (cpu_0_data_master_requests_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_write                                                   (cpu_0_data_master_write),
      .d1_clocks_0_avalon_clocks_slave_end_xfer                                  (d1_clocks_0_avalon_clocks_slave_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave (registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave),
      .reset_n                                                                   (clk_0_reset_n)
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
      .CLOCK_27  (clk_0),
      .CLOCK_50  (clk_0),
      .SDRAM_CLK (out_clk_clocks_0_SDRAM_CLK),
      .address   (clocks_0_avalon_clocks_slave_address),
      .readdata  (clocks_0_avalon_clocks_slave_readdata),
      .sys_clk   (out_clk_clocks_0_sys_clk)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk_0),
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
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .Auido_core_Controller_clock_0_in_readdata_from_sa                         (Auido_core_Controller_clock_0_in_readdata_from_sa),
      .Auido_core_Controller_clock_0_in_waitrequest_from_sa                      (Auido_core_Controller_clock_0_in_waitrequest_from_sa),
      .Auido_core_Controller_clock_1_in_readdata_from_sa                         (Auido_core_Controller_clock_1_in_readdata_from_sa),
      .Auido_core_Controller_clock_1_in_waitrequest_from_sa                      (Auido_core_Controller_clock_1_in_waitrequest_from_sa),
      .Auido_core_Controller_clock_3_in_readdata_from_sa                         (Auido_core_Controller_clock_3_in_readdata_from_sa),
      .Auido_core_Controller_clock_3_in_waitrequest_from_sa                      (Auido_core_Controller_clock_3_in_waitrequest_from_sa),
      .clk                                                                       (clk_0),
      .clocks_0_avalon_clocks_slave_readdata_from_sa                             (clocks_0_avalon_clocks_slave_readdata_from_sa),
      .cpu_0_data_master_address                                                 (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                        (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_dbs_address                                             (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_granted_Auido_core_Controller_clock_0_in                (cpu_0_data_master_granted_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_granted_Auido_core_Controller_clock_1_in                (cpu_0_data_master_granted_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_granted_Auido_core_Controller_clock_3_in                (cpu_0_data_master_granted_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_granted_clocks_0_avalon_clocks_slave                    (cpu_0_data_master_granted_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                         (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in      (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in      (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in      (cpu_0_data_master_qualified_request_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave          (cpu_0_data_master_qualified_request_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module               (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                                    (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in        (cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in        (cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in        (cpu_0_data_master_read_data_valid_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave            (cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module                 (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_readdata                                                (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_Auido_core_Controller_clock_0_in               (cpu_0_data_master_requests_Auido_core_Controller_clock_0_in),
      .cpu_0_data_master_requests_Auido_core_Controller_clock_1_in               (cpu_0_data_master_requests_Auido_core_Controller_clock_1_in),
      .cpu_0_data_master_requests_Auido_core_Controller_clock_3_in               (cpu_0_data_master_requests_Auido_core_Controller_clock_3_in),
      .cpu_0_data_master_requests_clocks_0_avalon_clocks_slave                   (cpu_0_data_master_requests_clocks_0_avalon_clocks_slave),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                        (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                                             (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                   (cpu_0_data_master_write),
      .cpu_0_jtag_debug_module_readdata_from_sa                                  (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_Auido_core_Controller_clock_0_in_end_xfer                              (d1_Auido_core_Controller_clock_0_in_end_xfer),
      .d1_Auido_core_Controller_clock_1_in_end_xfer                              (d1_Auido_core_Controller_clock_1_in_end_xfer),
      .d1_Auido_core_Controller_clock_3_in_end_xfer                              (d1_Auido_core_Controller_clock_3_in_end_xfer),
      .d1_clocks_0_avalon_clocks_slave_end_xfer                                  (d1_clocks_0_avalon_clocks_slave_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                       (d1_cpu_0_jtag_debug_module_end_xfer),
      .registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave (registered_cpu_0_data_master_read_data_valid_clocks_0_avalon_clocks_slave),
      .reset_n                                                                   (clk_0_reset_n)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .Auido_core_Controller_clock_2_in_readdata_from_sa                           (Auido_core_Controller_clock_2_in_readdata_from_sa),
      .Auido_core_Controller_clock_2_in_waitrequest_from_sa                        (Auido_core_Controller_clock_2_in_waitrequest_from_sa),
      .clk                                                                         (clk_0),
      .cpu_0_instruction_master_address                                            (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                                   (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in           (cpu_0_instruction_master_granted_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module                    (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in (cpu_0_instruction_master_qualified_request_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module          (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                               (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in   (cpu_0_instruction_master_read_data_valid_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module            (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_readdata                                           (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in          (cpu_0_instruction_master_requests_Auido_core_Controller_clock_2_in),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module                   (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_waitrequest                                        (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                                    (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_Auido_core_Controller_clock_2_in_end_xfer                                (d1_Auido_core_Controller_clock_2_in_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                         (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                                     (clk_0_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
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

  onchip_memory2_0_s1_arbitrator the_onchip_memory2_0_s1
    (
      .Auido_core_Controller_clock_2_out_address_to_slave                      (Auido_core_Controller_clock_2_out_address_to_slave),
      .Auido_core_Controller_clock_2_out_byteenable                            (Auido_core_Controller_clock_2_out_byteenable),
      .Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1           (Auido_core_Controller_clock_2_out_granted_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1 (Auido_core_Controller_clock_2_out_qualified_request_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_read                                  (Auido_core_Controller_clock_2_out_read),
      .Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1   (Auido_core_Controller_clock_2_out_read_data_valid_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1          (Auido_core_Controller_clock_2_out_requests_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_2_out_write                                 (Auido_core_Controller_clock_2_out_write),
      .Auido_core_Controller_clock_2_out_writedata                             (Auido_core_Controller_clock_2_out_writedata),
      .Auido_core_Controller_clock_3_out_address_to_slave                      (Auido_core_Controller_clock_3_out_address_to_slave),
      .Auido_core_Controller_clock_3_out_byteenable                            (Auido_core_Controller_clock_3_out_byteenable),
      .Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1           (Auido_core_Controller_clock_3_out_granted_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1 (Auido_core_Controller_clock_3_out_qualified_request_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_read                                  (Auido_core_Controller_clock_3_out_read),
      .Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1   (Auido_core_Controller_clock_3_out_read_data_valid_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1          (Auido_core_Controller_clock_3_out_requests_onchip_memory2_0_s1),
      .Auido_core_Controller_clock_3_out_write                                 (Auido_core_Controller_clock_3_out_write),
      .Auido_core_Controller_clock_3_out_writedata                             (Auido_core_Controller_clock_3_out_writedata),
      .clk                                                                     (clocks_0_sys_clk_out),
      .d1_onchip_memory2_0_s1_end_xfer                                         (d1_onchip_memory2_0_s1_end_xfer),
      .onchip_memory2_0_s1_address                                             (onchip_memory2_0_s1_address),
      .onchip_memory2_0_s1_byteenable                                          (onchip_memory2_0_s1_byteenable),
      .onchip_memory2_0_s1_chipselect                                          (onchip_memory2_0_s1_chipselect),
      .onchip_memory2_0_s1_clken                                               (onchip_memory2_0_s1_clken),
      .onchip_memory2_0_s1_readdata                                            (onchip_memory2_0_s1_readdata),
      .onchip_memory2_0_s1_readdata_from_sa                                    (onchip_memory2_0_s1_readdata_from_sa),
      .onchip_memory2_0_s1_write                                               (onchip_memory2_0_s1_write),
      .onchip_memory2_0_s1_writedata                                           (onchip_memory2_0_s1_writedata),
      .reset_n                                                                 (clocks_0_sys_clk_out_reset_n)
    );

  onchip_memory2_0 the_onchip_memory2_0
    (
      .address    (onchip_memory2_0_s1_address),
      .byteenable (onchip_memory2_0_s1_byteenable),
      .chipselect (onchip_memory2_0_s1_chipselect),
      .clk        (clocks_0_sys_clk_out),
      .clken      (onchip_memory2_0_s1_clken),
      .readdata   (onchip_memory2_0_s1_readdata),
      .write      (onchip_memory2_0_s1_write),
      .writedata  (onchip_memory2_0_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  Auido_core_Controller_reset_clocks_0_sys_clk_out_domain_synch_module Auido_core_Controller_reset_clocks_0_sys_clk_out_domain_synch
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
  Auido_core_Controller_reset_clk_0_domain_synch_module Auido_core_Controller_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //Auido_core_Controller_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Auido_core_Controller_clock_0_out_endofpacket = 0;

  //Auido_core_Controller_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Auido_core_Controller_clock_1_out_endofpacket = 0;

  //Auido_core_Controller_clock_2_in_writedata of type writedata does not connect to anything so wire it to default (0)
  assign Auido_core_Controller_clock_2_in_writedata = 0;

  //Auido_core_Controller_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Auido_core_Controller_clock_2_out_endofpacket = 0;

  //Auido_core_Controller_clock_3_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Auido_core_Controller_clock_3_out_endofpacket = 0;

  //cpu_0_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_0_data_master_irq = 0;


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

`include "f:/altera/91sp2/quartus/eda/sim_lib/altera_mf.v"
`include "f:/altera/91sp2/quartus/eda/sim_lib/220model.v"
`include "f:/altera/91sp2/quartus/eda/sim_lib/sgate.v"
`include "audio_and_video_config_0.v"
`include "clocks_0.v"
// Altera_UP_SD_Card_Avalon_Interface_0.vhd
`include "Auido_core_Controller_clock_2.v"
`include "Auido_core_Controller_clock_1.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "Auido_core_Controller_clock_0.v"
`include "onchip_memory2_0.v"
`include "Auido_core_Controller_clock_3.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             Auido_core_Controller_clock_0_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_0_out_endofpacket;
  wire    [  1: 0] Auido_core_Controller_clock_0_out_nativeaddress;
  wire             Auido_core_Controller_clock_1_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_1_out_endofpacket;
  wire    [  7: 0] Auido_core_Controller_clock_1_out_nativeaddress;
  wire             Auido_core_Controller_clock_2_in_endofpacket_from_sa;
  wire    [ 31: 0] Auido_core_Controller_clock_2_in_writedata;
  wire             Auido_core_Controller_clock_2_out_endofpacket;
  wire    [  9: 0] Auido_core_Controller_clock_2_out_nativeaddress;
  wire             Auido_core_Controller_clock_3_in_endofpacket_from_sa;
  wire             Auido_core_Controller_clock_3_out_endofpacket;
  wire    [  9: 0] Auido_core_Controller_clock_3_out_nativeaddress;
  wire             I2C_SCLK_from_the_audio_and_video_config_0;
  wire             I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  wire             b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire             b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire             b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  wire             clk;
  reg              clk_0;
  wire             clocks_0_AUD_CLK_out;
  wire             clocks_0_SDRAM_CLK_out;
  wire             clocks_0_sys_clk_out;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  Auido_core_Controller DUT
    (
      .I2C_SCLK_from_the_audio_and_video_config_0                     (I2C_SCLK_from_the_audio_and_video_config_0),
      .I2C_SDAT_to_and_from_the_audio_and_video_config_0              (I2C_SDAT_to_and_from_the_audio_and_video_config_0),
      .b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0  (b_SD_cmd_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0 (b_SD_dat3_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0  (b_SD_dat_to_and_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .clk_0                                                          (clk_0),
      .clocks_0_AUD_CLK_out                                           (clocks_0_AUD_CLK_out),
      .clocks_0_SDRAM_CLK_out                                         (clocks_0_SDRAM_CLK_out),
      .clocks_0_sys_clk_out                                           (clocks_0_sys_clk_out),
      .o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0       (o_SD_clock_from_the_Altera_UP_SD_Card_Avalon_Interface_0),
      .reset_n                                                        (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on