`ifndef IALU_ENV_PKG
`define IALU_ENV_PKG

package ialu_env_pkg;

  import uvm_pkg::*;
  import ialu_env_config_pkg::*;

  import ialu_scoreboard_config_pkg::*;
  import ialu_scoreboard_pkg::*;

  import ialu_sum1_agent_config_pkg::*;
  import ialu_sum1_agent_pkg::*;

  `include "ialu_env.svh"

  // Constructor
  function ialu_env::new(string name = "ialu_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  function void ialu_env::build_phase (uvm_phase phase);
    super.build_phase(phase);

    // Get env config
    if(!uvm_config_db#(ialu_env_config)::get(this, "", "ialu_env_config", cfg))
      `uvm_fatal("build_phase", "Unable to get ialu_env_config")

    if(cfg.has_sum1_agent)
      configure_sum1_agent();

    if(cfg.has_scoreboard)
      configure_scoreboard();

    // TODO: add if needed for all agents
    // Create functional coverage monitor if needed
    // if(cfg.has_functional_coverage)
    //   reg_cov_monitor = ialu_register_coverage::type_id::create("reg_cov_monitor", this);

  endfunction : build_phase

  // Configure SUM1 Agent
  function void ialu_env::configure_sum1_agent();
      // Set agent config in env config
      uvm_config_db#(ialu_sum1_agent_config)::set(this, "sum1_agent", "cfg", cfg.sum1_agent_cfg);
      // Create agent
      sum1_agent = ialu_sum1_agent::type_id::create("sum1_agent", this);
  endfunction : configure_sum1_agent


  // Configure  Scoreboard
  function void ialu_env::configure_scoreboard();
      // Set scoreboard config in env config
      uvm_config_db#(ialu_scoreboard_config)::set(this, "scoreboard", "cfg", cfg.scoreboard_cfg);
      // Create scoreboard
      scoreboard = ialu_scoreboard::type_id::create("scoreboard", this);
  endfunction : configure_scoreboard


  // Connect Phase
  function void ialu_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // Connect agents' analysis ports to coverage_monitor.analysis_exports
    // TODO: add if needed for all agents
    // if(cfg.has_functional_coverage)
      // TODO: add connection from agent.interface to coverage_monitor.analysis_export

    // Connect agents' analysis ports to scoreboards
    // TODO: delete unwanted connections
    if(cfg.has_scoreboard) begin
      sum1_agent.monitor.ap_in.connect(scoreboard.sum1_in_item_export);
      sum1_agent.monitor.ap_out.connect(scoreboard.sum1_out_item_export);
    end

  endfunction : connect_phase


  // Run Phase
  task ialu_env::run_phase(uvm_phase phase);
    `uvm_info(get_name(), $sformatf ("Simulation has started."), UVM_HIGH);
  endtask : run_phase


  // Check Phase
  function void ialu_env::check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info(get_name(), "Start of check phase", UVM_HIGH)
  endfunction : check_phase


endpackage : ialu_env_pkg

`endif