
class ialu_sum1_driver extends ialu_base_driver #(
  .T_seq_item(ialu_sum1_seq_item),
  .T_intf(virtual ialu_sum1_if)
);
`uvm_component_utils(ialu_sum1_driver)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // Reset DUT at reset_phase
  extern task drive_reset();
  // Drive stimuli at main_phase
  extern task drive(T_seq_item item);
  // Drive: before sending stimuli to intf
  extern task pre_drive(T_seq_item item);
  // Drive: send stimuli
  extern task drive_item(T_seq_item item);
  // Drive: after method
  extern task post_drive(T_seq_item item);

  extern task wait_ready();
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_sum1_driver", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern task reset_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);
  extern task shutdown_phase(uvm_phase phase);

endclass : ialu_sum1_driver