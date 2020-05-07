`ifndef IALU_SUM1_SEQ_ITEM_PKG
`define IALU_SUM1_SEQ_ITEM_PKG

package ialu_sum1_seq_item_pkg;

  import uvm_pkg::*;

  import ialu_base_seq_item_pkg::*;

  `include "ialu_sum1_seq_item.svh"

  // Constructor
  function ialu_sum1_seq_item::new(string name = "ialu_sum1_seq_item");
    super.new(name);
  endfunction : new


  // Copy
  function void ialu_sum1_seq_item::copy(ialu_sum1_seq_item rhs);
    // TODO
    this.op_delay            = rhs.op_delay;
    this.ialu_op1            = rhs.ialu_op1;
    this.ialu_op2            = rhs.ialu_op2;
    this.ialu_cmd            = rhs.ialu_cmd;
    this.ialu_res            = rhs.ialu_res;
    this.ialu_cmp            = rhs.ialu_cmp;
  endfunction : copy


  // Clone
  function ialu_sum1_seq_item ialu_sum1_seq_item::clone();
    ialu_sum1_seq_item new_item = new();
    new_item.copy(this);
    return new_item;
  endfunction : clone


  // Display
  function void ialu_sum1_seq_item::display();
    //
  endfunction : display


  function string ialu_sum1_seq_item::convert2str_req();
    string msg;

    msg = "\nSUM1 request:\n";
    msg = {msg, $sformatf("ialu_op1: 0x%h\n", this.ialu_op1)};
    msg = {msg, $sformatf("ialu_op2: 0x%h\n", this.ialu_op2)};
    msg = {msg, $sformatf("ialu_cmd: %s\n", this.ialu_cmd.name())};

    return msg;
  endfunction : convert2str_req


  function string ialu_sum1_seq_item::convert2str_resp();
    string msg;

    msg = "\nSUM1 response:\n";
    msg = {msg, $sformatf("ialu_op1: 0x%h\n", this.ialu_op1)};
    msg = {msg, $sformatf("ialu_op2: 0x%h\n", this.ialu_op2)};
    msg = {msg, $sformatf("ialu_cmd: %s\n", this.ialu_cmd.name())};
    msg = {msg, $sformatf("ialu_res: 0x%h\n", this.ialu_res)};
    msg = {msg, $sformatf("ialu_cmp: 0x%h\n", this.ialu_cmp)};

    return msg;
  endfunction : convert2str_resp

endpackage : ialu_sum1_seq_item_pkg

`endif