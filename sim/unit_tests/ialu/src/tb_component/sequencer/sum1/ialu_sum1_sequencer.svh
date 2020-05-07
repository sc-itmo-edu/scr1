
class ialu_sum1_sequencer extends ialu_base_sequencer #(
  .T_seq_item(ialu_sum1_seq_item),
  .T_sequencer_config(ialu_sum1_sequencer_config)
  );
  `uvm_sequencer_utils(ialu_sum1_sequencer)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_sum1_sequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);


endclass : ialu_sum1_sequencer

