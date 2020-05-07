`ifndef IALU_BASE_SEQUENCER_PKG
`define IALU_BASE_SEQUENCER_PKG

package ialu_base_sequencer_pkg;

  import uvm_pkg::*;
  import ialu_base_seq_item_pkg::*;
  import ialu_base_sequencer_config_pkg::*;


  `include "ialu_base_sequencer.svh"

  // Constructor
  function ialu_base_sequencer::new(string name = "ialu_base_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  function void ialu_base_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Get sqnc_cfg handle from agent
    if(!uvm_config_db#(T_sequencer_config)::get(this, "", "cfg", cfg))
      `uvm_fatal(get_name(), "Can't get sequencer_cfg from agent")
  endfunction : build_phase


endpackage : ialu_base_sequencer_pkg

`endif