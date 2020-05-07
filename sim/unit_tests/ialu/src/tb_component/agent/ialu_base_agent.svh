`ifndef IALU_BASE_AGENT
`define IALU_BASE_AGENT

virtual class ialu_base_agent #(
  type T_seq_item = ialu_base_seq_item,
  type T_intf = virtual ialu_sum1_if,
  type T_monitor = ialu_base_monitor,
  type T_sequencer = ialu_base_sequencer,
  type T_driver = ialu_base_driver,
  type T_sequencer_config = ialu_base_sequencer_config,
  type T_agent_config = ialu_base_agent_config
  )
  extends uvm_agent;

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  T_agent_config          cfg;
  T_sequencer_config      sequencer_cfg;
  // SCR-REVIEW: uncomment if needed
  // ialu_base_monitor_config monitor_cfg;

  T_monitor               monitor;
  T_sequencer             sequencer;
  T_driver                driver;
  // TODO: implement later
  // ialu_master_coverage_monitor m_fcov_monitor;
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  extern function new(string name = "ialu_base_agent", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : ialu_base_agent

`endif
