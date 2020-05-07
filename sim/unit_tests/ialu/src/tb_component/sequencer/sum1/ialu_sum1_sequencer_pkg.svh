`ifndef IALU_SUM1_SEQUENCER_PKG
`define IALU_SUM1_SEQUENCER_PKG

package ialu_sum1_sequencer_pkg;

  import uvm_pkg::*;
  import ialu_sum1_seq_item_pkg::*;
  import ialu_sum1_sequencer_config_pkg::*;

  import ialu_base_sequencer_pkg::*;

  `include "ialu_sum1_sequencer.svh"

  // Constructor
  function ialu_sum1_sequencer::new(string name = "ialu_sum1_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  function void ialu_sum1_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase


endpackage : ialu_sum1_sequencer_pkg

`endif