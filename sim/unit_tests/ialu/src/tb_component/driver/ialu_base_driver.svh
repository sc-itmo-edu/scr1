`ifndef IALU_BASE_DRIVER
`define IALU_BASE_DRIVER

virtual class ialu_base_driver #(
  type T_seq_item = ialu_base_seq_item,
  type T_intf = virtual ialu_sum1_if
) extends uvm_driver #(T_seq_item);

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  T_seq_item item;
  T_intf     vif;
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // Reset DUT at reset_phase
  pure virtual task drive_reset();
  // Drive stimuli at main_phase
  pure virtual task drive(T_seq_item item);
  // Drive: before sending stimuli to intf
  pure virtual task pre_drive(T_seq_item item);
  // Drive: send stimuli
  pure virtual task drive_item(T_seq_item item);
  // Drive: after method
  pure virtual task post_drive(T_seq_item item);

  extern virtual task delay_before_drive(int unsigned delay_cycles);
  pure virtual task wait_ready();
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_base_driver", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task reset_phase(uvm_phase phase);
  extern virtual task main_phase(uvm_phase phase);
  extern virtual task shutdown_phase(uvm_phase phase);

endclass : ialu_base_driver

`endif
