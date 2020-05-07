`ifndef IALU_BASE_AGENT_CONFIG_PKG
`define IALU_BASE_AGENT_CONFIG_PKG

package ialu_base_agent_config_pkg;

  import uvm_pkg::*;


  `include "ialu_base_agent_config.svh"

  // Constructor
  function ialu_base_agent_config::new(string name = "ialu_base_agent_config");
    super.new(name);
  endfunction

endpackage : ialu_base_agent_config_pkg

`endif