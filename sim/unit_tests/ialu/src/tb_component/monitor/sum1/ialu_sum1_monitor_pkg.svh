
package ialu_sum1_monitor_pkg;

  import uvm_pkg::*;
  import ialu_sum1_seq_item_pkg::*;

  import ialu_base_monitor_pkg::*;

  `include "ialu_sum1_monitor.svh"

  // Constructor
  //
  // Creates config object
  function ialu_sum1_monitor::new(string name = "ialu_sum1_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new


  // Build Phase
  //
  function void ialu_sum1_monitor::build_phase (uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase


  // Connect Phase
  //
  // Connect different components' ports
  function void ialu_sum1_monitor::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction : connect_phase


  // Connect Phase
  //
  // Connect different components' ports
  task ialu_sum1_monitor::main_phase(uvm_phase phase);
    ialu_sum1_seq_item item = new();
    bit collect_out = 0;
    forever begin
      @(negedge vif.clk);
      collect_out = 0;
      // TODO: change clk to gate signal
      // in
      if (vif.ialu_vd) begin
        // Collect item from interface
        collect_item_in(item);
        // Check collected data
        check_protocol_in(item);
        // Send data object through the analysis port
        ap_in.write(item);
        collect_out = 1;
      end

      // out
      if (collect_out) begin
        // Collect item from interface
        collect_item_out(item);
        // Check collected data
        check_protocol_out(item);
        // Send data object through the analysis port
        ap_out.write(item);
    end

  end
  endtask : main_phase

  // Collect Item In
  function void ialu_sum1_monitor::collect_item_in(ialu_sum1_seq_item item);
    // TODO
    item.ialu_op1         = vif.ialu_op1;
    item.ialu_op2         = vif.ialu_op2;
    item.ialu_cmd         = vif.ialu_cmd;
  endfunction : collect_item_in


  // Check_protocol for collected  data
  function void ialu_sum1_monitor::check_protocol_in(ialu_sum1_seq_item item);
    // TODO add check
    if (!vif.ialu_rdy)
      `uvm_fatal(get_name(), "ALU is not in ready state when driven")
  endfunction : check_protocol_in


  // Collect Item Out
  function void ialu_sum1_monitor::collect_item_out(ialu_sum1_seq_item item);
    item.ialu_res         = vif.ialu_res;
    item.ialu_cmp         = vif.ialu_cmp;
  endfunction : collect_item_out


  // Check_protocol for collected  data
  function void ialu_sum1_monitor::check_protocol_out(ialu_sum1_seq_item item);
    // TODO add check
  endfunction : check_protocol_out



endpackage : ialu_sum1_monitor_pkg

