`ifndef IALU_SUM1_SEQUENCER_CONFIG_PKG
`define IALU_SUM1_SEQUENCER_CONFIG_PKG

package ialu_sum1_sequencer_config_pkg;

  import uvm_pkg::*;
  import ialu_sum1_seq_item_pkg::*;

  import ialu_base_sequencer_config_pkg::*;

  `include "ialu_sum1_sequencer_config.svh"

  //
  // Constructor
  //
  function ialu_sum1_sequencer_config::new(string name = "ialu_sum1_sequencer_config");
    super.new(name);
  endfunction : new

endpackage : ialu_sum1_sequencer_config_pkg

`endif