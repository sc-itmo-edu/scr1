`ifndef IALU_BASE_SEQUENCER
`define IALU_BASE_SEQUENCER

virtual class ialu_base_sequencer #(
  type T_seq_item = ialu_base_seq_item,
  type T_sequencer_config = ialu_base_sequencer_config
  )
  extends uvm_sequencer #(T_seq_item);

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  T_sequencer_config cfg;
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_base_sequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);


endclass : ialu_base_sequencer

`endif
