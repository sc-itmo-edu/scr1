
class ialu_sum1_agent extends ialu_base_agent #(
  .T_seq_item(ialu_sum1_seq_item),
  .T_intf(virtual ialu_sum1_if),
  .T_monitor(ialu_sum1_monitor),
  .T_sequencer(ialu_sum1_sequencer),
  .T_driver(ialu_sum1_driver),
  .T_sequencer_config(ialu_sum1_sequencer_config),
  .T_agent_config(ialu_sum1_agent_config)
);
`uvm_component_utils(ialu_sum1_agent)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  extern function new(string name = "ialu_sum1_agent", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : ialu_sum1_agent

