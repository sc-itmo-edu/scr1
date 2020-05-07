`ifndef IALU_SUM1_AGENT_CONFIG_PKG
`define IALU_SUM1_AGENT_CONFIG_PKG

package ialu_sum1_agent_config_pkg;

  import uvm_pkg::*;

  import ialu_base_agent_config_pkg::*;

  `include "ialu_sum1_agent_config.svh"

  // Constructor
  function ialu_sum1_agent_config::new(string name = "ialu_sum1_agent_config");
    super.new(name);
  endfunction

endpackage : ialu_sum1_agent_config_pkg

`endif