
class ialu_sum1_monitor extends ialu_base_monitor #(
  // FIXME: uncomment for monitor_config
  // .T_monitor_config(ialu_sum1_monitor_config),
  .T_seq_item(ialu_sum1_seq_item),
  .T_intf(virtual ialu_sum1_if)
);
  `uvm_component_utils(ialu_sum1_monitor)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  // Collect item from DUT's interface
  extern function void collect_item_in(T_seq_item item);
  extern function void collect_item_out(T_seq_item item);
// Check collected item if check is enabled
  extern function void check_protocol_in(T_seq_item item);
  extern function void check_protocol_out(T_seq_item item);
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  extern function new(string name = "ialu_sum1_monitor", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);

endclass : ialu_sum1_monitor

