`ifndef IALU_BASE_MONITOR
`define IALU_BASE_MONITOR

virtual class ialu_base_monitor #(
  type T_seq_item = ialu_base_seq_item,
  // FIXME uncomment for monitor_config
  // type T_monitor_config = ialu_base_monitor_config,
  type T_intf = virtual ialu_sum1_if
) extends uvm_monitor;

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  uvm_analysis_port#(T_seq_item) ap_in;
  uvm_analysis_port#(T_seq_item) ap_out;
  T_intf                         vif;
  T_seq_item                     item;
  // FIXME uncomment for monitor_config
  // T_monitor_config               cfg;

  bit enable_check;
  bit enable_coverage;
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // Collect item from DUT's interface
  pure virtual function void collect_item_in(T_seq_item item);
  pure virtual function void collect_item_out(T_seq_item item);
// Check collected item if check is enabled
  pure virtual function void check_protocol_in(T_seq_item item);
  pure virtual function void check_protocol_out(T_seq_item item);
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  extern function new(string name = "ialu_base_monitor", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual task main_phase(uvm_phase phase);

endclass : ialu_base_monitor

`endif
