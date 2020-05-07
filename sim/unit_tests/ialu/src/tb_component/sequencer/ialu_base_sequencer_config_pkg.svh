`ifndef IALU_BASE_SEQUENCER_CONFIG_PKG
`define IALU_BASE_SEQUENCER_CONFIG_PKG

package ialu_base_sequencer_config_pkg;

  import uvm_pkg::*;
  import ialu_base_seq_item_pkg::*;


  `include "ialu_base_sequencer_config.svh"

  //
  // Constructor
  //
  function ialu_base_sequencer_config::new(string name = "ialu_base_sequencer_config");
    super.new(name);
  endfunction : new

endpackage : ialu_base_sequencer_config_pkg

`endif