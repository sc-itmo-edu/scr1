
class ialu_base_test extends uvm_test;
  // Register with the factory
  `uvm_component_utils(ialu_base_test)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  // TODO: env, if, agent_cfg, sequence
  // Environment
  ialu_env                                 env;

  // Configurations for the sub-components
  ialu_env_config                          env_cfg;

  ialu_sum1_agent_config                  sum1_agent_cfg;

  ialu_scoreboard_config                  scoreboard_cfg;
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                       Configuration Methods
  // ---------------------------------------------------------------------------
  extern virtual function void configure_env(ialu_env_config cfg);

  extern virtual function void configure_sum1_agent(ialu_sum1_agent_config cfg);
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  // Constructor
  extern function new(string name = "ialu_base_test", uvm_component parent = null);
  // Phases
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task main_phase(uvm_phase phase);

endclass : ialu_base_test