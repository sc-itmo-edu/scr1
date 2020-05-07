virtual class ialu_base_sequence #(
  type T_seq_item = ialu_base_seq_item,
  type T_sequencer_config = ialu_base_sequencer_config
  )
  extends uvm_sequence #(T_seq_item);

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  T_seq_item       item;
  int unsigned     num_times = 1000; //TODO: change or set externaly
  bit              run_forever = 0;  //TODO: change or set externaly
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_base_sequence");
  extern virtual task body();
  extern virtual task post_body();

endclass : ialu_base_sequence

`endif
