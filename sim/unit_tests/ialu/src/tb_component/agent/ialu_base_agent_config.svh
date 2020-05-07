`ifndef IALU_BASE_AGENT_CONFIG
`define IALU_BASE_AGENT_CONFIG

class ialu_base_agent_config #(
  type T_intf = virtual ialu_sum1_if
  )
  extends uvm_object;

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // Virtual Interfaces
  T_intf vif;

  // Is the agent active or passive (active – sequencer and driver are
  // constructed)
  uvm_active_passive_enum active = UVM_ACTIVE;

  // Verbosity level
  uvm_verbosity verbosity;

  // Include functional coverage monitor
  bit has_functional_coverage = 0;

  // Include scoreboard
  bit has_scoreboard = 0;
  //
  // ---------------------------------------------------------------------------
  // Class Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new (string name = "ialu_base_agent_config");

endclass : ialu_base_agent_config

`endif
