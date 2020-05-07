`ifndef IALU_SCOREBOARD_CONFIG_PKG
`define IALU_SCOREBOARD_CONFIG_PKG

package ialu_scoreboard_config_pkg;

  import uvm_pkg::*;

  `include "ialu_scoreboard_config.svh"

  //
  // Constructor
  //
  // Creates config object
  function ialu_scoreboard_config::new(string name = "ialu_scoreboard_config");
    super.new(name);
  endfunction


endpackage : ialu_scoreboard_config_pkg

`endif