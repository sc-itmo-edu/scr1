class ialu_env extends uvm_env;
  `uvm_component_utils(ialu_env)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // Environment config
  ialu_env_config      cfg;

  // Agents
  ialu_sum1_agent     sum1_agent;

  // Scoreboard
  ialu_scoreboard     scoreboard;

  // ---------------------------------------------------------------------------
  // Class Methods
  // ---------------------------------------------------------------------------
  //
  // Buld Phase Methods
  extern function void configure_sum1_agent();

  extern function void configure_scoreboard();

  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_env", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern function void check_phase(uvm_phase phase);

endclass : ialu_env