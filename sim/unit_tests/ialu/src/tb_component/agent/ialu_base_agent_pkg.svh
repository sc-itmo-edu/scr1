`ifndef IALU_BASE_AGENT_PKG
`define IALU_BASE_AGENT_PKG


package ialu_base_agent_pkg;

  import uvm_pkg::*;
  import ialu_base_agent_config_pkg::*;
  import ialu_base_monitor_pkg::*;
  import ialu_base_sequencer_config_pkg::*;
  import ialu_base_sequencer_pkg::*;
  import ialu_base_driver_pkg::*;
  import ialu_base_seq_item_pkg::*;


  `include "ialu_base_agent.svh"

  // Constructor
  function ialu_base_agent::new(string name = "ialu_base_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  function void ialu_base_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Get agent's config from env
    if(!uvm_config_db#(T_agent_config)::get(this, "", "cfg", cfg))
      `uvm_fatal(get_full_name(), "Cannot get T_agent_config");
    // Get and place interface in config
    uvm_config_db#(T_intf)::set(this, "*", "vif", cfg.vif);

    // Monitor is always present
    monitor = T_monitor::type_id::create("monitor", this);
    uvm_config_db#(T_intf)::set(this, "monitor", "vif", cfg.vif);

    // FIXME: uncomment if needed
    // if(cfg.has_functional_coverage) begin
      // m_fcov_monitor = ialu_ifu_coverage_monitor::type_id::create("m_fcov_monitor", this);
    // end

    // Driver and sequencer are built only if agent is ACTIVE
    if(cfg.active == UVM_ACTIVE) begin
      driver = T_driver::type_id::create("driver", this);
      sequencer = T_sequencer::type_id::create("sequencer", this);
      uvm_config_db#(T_sequencer_config)::set(this, "sequencer", "cfg", sequencer_cfg);
    end
  endfunction : build_phase


  // Connect Phase
  function void ialu_base_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    monitor.vif = cfg.vif;

    // Only connect sequencer and driver if agent is ACTIVE
    if(cfg.active == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
      driver.vif = cfg.vif;
    end
    // FIXME: uncomment if needed
    // if(cfg.has_functional_coverage) begin
    //   monitor.ap.connect(m_fcov_monitor.analysis_export);
    // end
  endfunction : connect_phase

endpackage : ialu_base_agent_pkg

`endif
