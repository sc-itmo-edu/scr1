class ialu_sum1_seq_item extends ialu_base_seq_item;
  `uvm_object_utils(ialu_sum1_seq_item)

  import ialu_tb_pkg::*;
  // ---------------------------------------------------------------------------
  // Data
  // ---------------------------------------------------------------------------
  //
  rand logic signed [`SCR1_XLEN-1:0]                ialu_op1;
  rand logic signed [`SCR1_XLEN-1:0]                ialu_op2;
  rand ialu_tb_pkg::type_scr1_ialu_cmd_sel_e        ialu_cmd;

  logic signed [`SCR1_XLEN-1:0]                     ialu_res;
  logic                                             ialu_cmp;

//   typedef enum logic [SCR1_IALU_CMD_WIDTH_E-1:0] {
//     SCR1_IALU_CMD_NONE  = '0,   // IALU disable
//     SCR1_IALU_CMD_AND,          // op1 & op2
//     SCR1_IALU_CMD_OR,           // op1 | op2
//     SCR1_IALU_CMD_XOR,          // op1 ^ op2
//     SCR1_IALU_CMD_ADD,          // op1 + op2
//     SCR1_IALU_CMD_SUB,          // op1 - op2
//     SCR1_IALU_CMD_SUB_LT,       // op1 < op2
//     SCR1_IALU_CMD_SUB_LTU,      // op1 u< op2
//     SCR1_IALU_CMD_SUB_EQ,       // op1 = op2
//     SCR1_IALU_CMD_SUB_NE,       // op1 != op2
//     SCR1_IALU_CMD_SUB_GE,       // op1 >= op2
//     SCR1_IALU_CMD_SUB_GEU,      // op1 u>= op2
//     SCR1_IALU_CMD_SLL,          // op1 << op2
//     SCR1_IALU_CMD_SRL,          // op1 >> op2
//     SCR1_IALU_CMD_SRA           // op1 >>> op2
// `ifdef SCR1_RVM_EXT
//     ,
//     SCR1_IALU_CMD_MUL,          // low(unsig(op1) * unsig(op2))
//     SCR1_IALU_CMD_MULHU,        // high(unsig(op1) * unsig(op2))
//     SCR1_IALU_CMD_MULHSU,       // high(op1 * unsig(op2))
//     SCR1_IALU_CMD_MULH,         // high(op1 * op2)
//     SCR1_IALU_CMD_DIV,          // op1 / op2
//     SCR1_IALU_CMD_DIVU,         // op1 u/ op2
//     SCR1_IALU_CMD_REM,          // op1 % op2
//     SCR1_IALU_CMD_REMU          // op1 u% op2
// `endif  // SCR1_RVM_EXT
// } type_scr1_ialu_cmd_sel_e;
  // ---------------------------------------------------------------------------
  // Constraints
  // ---------------------------------------------------------------------------
  //
  constraint c_op_delay {
    // TODO: change op_delay range
    op_delay inside {[0:10]};
  }

  constraint c_op {
    ialu_op1 inside {[-10:5]};
    ialu_op2 inside {[-10:10]};
  }

  constraint c_op_cmd {
    ialu_cmd inside {ialu_tb_pkg::SCR1_IALU_CMD_ADD,
                     ialu_tb_pkg::SCR1_IALU_CMD_SUB};
  }
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_sum1_seq_item");
  extern function void copy(ialu_sum1_seq_item rhs);
  extern function ialu_sum1_seq_item clone();
  extern function void display();
  extern function string convert2str_req();
  extern function string convert2str_resp();

endclass : ialu_sum1_seq_item