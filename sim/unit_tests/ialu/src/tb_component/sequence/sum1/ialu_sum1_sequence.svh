class ialu_sum1_sequence extends ialu_base_sequence #(
  .T_seq_item(ialu_sum1_seq_item),
  .T_sequencer_config(ialu_sum1_sequencer_config)
);
  `uvm_object_utils(ialu_sum1_sequence)
  `uvm_declare_p_sequencer(ialu_sum1_sequencer)

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
  extern function new(string name = "ialu_sum1_sequence");
  extern  task body();
  extern  task post_body();

endclass : ialu_sum1_sequence

