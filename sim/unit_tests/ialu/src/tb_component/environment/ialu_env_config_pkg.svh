`ifndef IALU_ENV_CONFIG_PKG
`define IALU_ENV_CONFIG_PKG

package ialu_env_config_pkg;

  import uvm_pkg::*;
  import ialu_scoreboard_config_pkg::*;
  import ialu_sum1_agent_config_pkg::*;

  `include "ialu_env_config.svh"

  //
  // Constructor
  //
  // Creates config object
  function ialu_env_config::new(string name = "ialu_env_config");
    super.new(name);
  endfunction

endpackage : ialu_env_config_pkg

`endif