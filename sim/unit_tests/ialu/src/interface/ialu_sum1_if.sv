interface ialu_sum1_if
(
  input bit clk
);
  // TODO: don't forget to import neede packages!
  import ialu_tb_pkg::*;

  //TODO: Put interfaces here
  // Common
  logic                           rst_n;
  logic                           ialu_vd;
  logic                           ialu_rdy;

  // IALU input
  logic [`SCR1_XLEN-1:0]          ialu_op1;
  logic [`SCR1_XLEN-1:0]          ialu_op2;
  type_scr1_ialu_cmd_sel_e        ialu_cmd;
  // IALU output
  logic [`SCR1_XLEN-1:0]          ialu_res;
  logic                           ialu_cmp;

endinterface : ialu_sum1_if