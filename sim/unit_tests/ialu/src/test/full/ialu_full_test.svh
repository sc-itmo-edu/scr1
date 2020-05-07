
class ialu_full_test extends ialu_base_test;
  // Register with the factory
  `uvm_component_utils(ialu_full_test)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  // Sequences
  ialu_sum1_sequence                       sum1_seq;
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  // Constructor
  extern function new(string name = "ialu_full_test", uvm_component parent = null);
  // Phases
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern task reset_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);

endclass : ialu_full_test