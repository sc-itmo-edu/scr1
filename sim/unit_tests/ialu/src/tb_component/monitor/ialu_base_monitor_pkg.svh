`ifndef IALU_BASE_MONITOR_PKG
`define IALU_BASE_MONITOR_PKG

package ialu_base_monitor_pkg;

  import uvm_pkg::*;
  import ialu_base_seq_item_pkg::*;


  `include "ialu_base_monitor.svh"

  // Constructor
  //
  // Creates config object
  function ialu_base_monitor::new(string name = "ialu_base_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  //
  function void ialu_base_monitor::build_phase (uvm_phase phase);
    super.build_phase(phase);
    // Create an instance of the declared analysis port
    ap_in      = new("ap_in", this);
    ap_out     = new("ap_out", this);

    // FIXME uncomment for monitor_config
    // // Get monitor config
    // if(!uvm_config_db#(T_monitor_config)::get(this, "", "monitor_cfg", cfg))
    //   `uvm_fatal("build_phase", "Unable to get T_monitor_config")
  endfunction : build_phase


  // Connect Phase
  //
  // Connect different components' ports
  function void ialu_base_monitor::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction : connect_phase


  // Connect Phase
  //
  // Connect different components' ports
  task ialu_base_monitor::main_phase(uvm_phase phase);
    super.main_phase(phase);
  endtask : main_phase


endpackage : ialu_base_monitor_pkg

`endif
