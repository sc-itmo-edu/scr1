class ialu_env_config extends uvm_object;
  `uvm_object_utils(ialu_env_config)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // Parameters
  // localparam string s_my_config_id = "ialu_env_config";
  // localparam string s_no_config_id = "no config";
  // localparam string s_my_config_type_error_id = "config type error";

  // Virtual Interfaces
  // Interrupt Virtual Interface — used in the wait for interrupt task
  // virtual intr_if i_intr;

  // Knobs to enable env analysis components
  // TODO: add if needed for all agents
  // bit has_functional_coverage = 0;
  bit has_scoreboard             = 1;
  // Knobs to enable agents
  bit has_sum1_agent             = 1;

  // Configurations for the sub-components
  ialu_scoreboard_config        scoreboard_cfg;
  ialu_sum1_agent_config        sum1_agent_cfg;
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
  extern function new(string name = "ialu_env_config");

endclass : ialu_env_config