package ialu_base_test_pkg;

  import uvm_pkg::*;

  import ialu_env_config_pkg::*;
  import ialu_env_pkg::*;

  import ialu_scoreboard_config_pkg::*;

  import ialu_sum1_agent_config_pkg::*;

  `include "ialu_base_test.svh"


  // Constructor
  function ialu_base_test::new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction


  // Build_phase
  function void ialu_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create environment configuration object
    env_cfg = ialu_env_config::type_id::create("env_cfg");
    // Call function to configure the env
    configure_env(env_cfg);
    uvm_config_db#(ialu_env_config)::set(this, "env", "ialu_env_config", env_cfg);

    // Configure SUM1 agent for IALU
    sum1_agent_cfg = ialu_sum1_agent_config::type_id::create("sum1_agent_cfg");
    configure_sum1_agent(sum1_agent_cfg);
    if (!uvm_config_db#(virtual ialu_sum1_if)::get(this, "" , "ialu_sum1_vif", sum1_agent_cfg.vif))
      `uvm_fatal(get_full_name(), "SUM1 Virtual Interface is not found!")
    env_cfg.sum1_agent_cfg = sum1_agent_cfg;


    // Scoreboard

    // Now env config is complete set it into config space:
    // uvm_config_db#(ialu_env_config)::set(this , "* ialu_agent*", "ialu_env_config", env_cfg);
    // Now we are ready to build the ialu_env:
    env = ialu_env::type_id::create("env", this);

  endfunction : build_phase

  // Convenience function to configure the environment
  function void ialu_base_test::configure_env(ialu_env_config cfg);
    // TODO
  endfunction : configure_env


  // Configure the Sum1 agent
  function void ialu_base_test::configure_sum1_agent(ialu_sum1_agent_config cfg);
    // TODO
    cfg.active = UVM_ACTIVE;
  endfunction : configure_sum1_agent




  // End of Elaboration Phase
  function void ialu_base_test::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    // SCR-REVIEW: uncomment if you want to print topology at test start
    // uvm_top.print_topology();
  endfunction : end_of_elaboration_phase

  // Start of Simulation Phase
  function void ialu_base_test::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase (phase);
    // SCR-REVIEW: uncomment to dump signals (although I'm not sure it dump MDA and etc
    // uvm_config_db#(int)::dump();
  endfunction




  // Main Phase
  task ialu_base_test::main_phase(uvm_phase phase);
    super.main_phase(phase);
  endtask : main_phase


endpackage: ialu_base_test_pkg