class ialu_scoreboard extends uvm_scoreboard;
  // UVM automation macros for general components
  `uvm_component_utils(ialu_scoreboard)

  // Tells UVM infrastructure that <_data> will be used as a suffix
  // for the uvm_analysis_imp function
  `uvm_analysis_imp_decl(_sum1_in)
  `uvm_analysis_imp_decl(_sum1_out)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  ialu_scoreboard_config                   cfg;

  // Declare and create a TLM Analysis Port to receive data objects from other TB components
  uvm_analysis_imp_sum1_in#(ialu_sum1_seq_item, ialu_scoreboard)    sum1_in_item_export;
  uvm_analysis_imp_sum1_out#(ialu_sum1_seq_item, ialu_scoreboard)   sum1_out_item_export;

  ialu_sum1_seq_item   sum1_item;

  // Queues
  ialu_sum1_seq_item ialu_sum1_res_q [$];

  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  extern function void compute_sum1_res(ialu_sum1_seq_item item);
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new (string name = "ialu_scoreboard", uvm_component parent = null);
  extern function void build_phase (uvm_phase phase);
  extern function void check_phase (uvm_phase phase);

  // Write functions: process data from monitors
  extern function void write_sum1_in(ialu_sum1_seq_item item);
  extern function void write_sum1_out(ialu_sum1_seq_item item);

endclass : ialu_scoreboard