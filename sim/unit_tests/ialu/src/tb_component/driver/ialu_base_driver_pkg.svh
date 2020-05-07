`ifndef IALU_BASE_DRIVER_PKG
`define IALU_BASE_DRIVER_PKG

package ialu_base_driver_pkg;

  import uvm_pkg::*;
  import ialu_base_seq_item_pkg::*;


  `include "ialu_base_driver.svh"

  // ---------------------------------------------------------------------------
  // UVM Phases
  // ---------------------------------------------------------------------------
  //
  // Constructor
  function ialu_base_driver::new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction


  // Build Phase
  function void ialu_base_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction


  // Reset Phase
  task ialu_base_driver::reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    phase.raise_objection(phase);
    `uvm_info(get_name(), $sformatf("Applying initial reset"), UVM_HIGH);
    drive_reset();
    `uvm_info(get_name(), $sformatf("End of reset"), UVM_HIGH);
    phase.drop_objection(phase);
  endtask


  // Main Phase
  task ialu_base_driver::main_phase(uvm_phase phase);
    `uvm_info(get_name(), $sformatf("Main phase"), UVM_HIGH);
    forever begin
      // Get the next data item from sequencer (may block)
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done(); // Consume the request
    end
  endtask


  // Shutdown Phase
  task ialu_base_driver::shutdown_phase(uvm_phase phase);
    super.shutdown_phase (phase);
    `uvm_info (get_name(), "Finished DUT drive", UVM_HIGH)
  endtask

  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //



  //  Pre-Drive: Delay before drive
  task ialu_base_driver::delay_before_drive(int unsigned delay_cycles);
    // TODO: check if correct/needed
    repeat(delay_cycles)
      @(posedge vif.clk);
  endtask : delay_before_drive

endpackage : ialu_base_driver_pkg

`endif
