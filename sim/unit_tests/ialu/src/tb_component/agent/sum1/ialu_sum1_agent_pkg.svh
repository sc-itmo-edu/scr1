

package ialu_sum1_agent_pkg;

  import uvm_pkg::*;
  import ialu_sum1_agent_config_pkg::*;
  import ialu_sum1_monitor_pkg::*;
  import ialu_sum1_sequencer_config_pkg::*;
  import ialu_sum1_sequencer_pkg::*;
  import ialu_sum1_driver_pkg::*;
  import ialu_sum1_seq_item_pkg::*;

  import ialu_base_agent_pkg::*;

  `include "ialu_sum1_agent.svh"

  // Constructor
  function ialu_sum1_agent::new(string name = "ialu_sum1_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  function void ialu_sum1_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

  endfunction : build_phase


  // Connect Phase
  function void ialu_sum1_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

  endfunction : connect_phase

endpackage : ialu_sum1_agent_pkg

