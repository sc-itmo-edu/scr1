class ialu_scoreboard_config extends uvm_object;
  `uvm_object_utils(ialu_scoreboard_config)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  //
  // ---------------------------------------------------------------------------
  // Class Methods
  // ---------------------------------------------------------------------------
  //
  // extern task wait_for_interrupt;
  // extern function bit is_interrupt_cleared;
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_scoreboard_config");

endclass : ialu_scoreboard_config