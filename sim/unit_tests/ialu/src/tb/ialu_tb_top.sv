module ialu_tb_top;
  `timescale 1ns/1ps

  import uvm_pkg::*;

  import ialu_full_test_pkg::*;

  // Clock generator
  bit clk = '1;
  always
    #5 clk = ~clk;

  ialu_sum1_if         sum1_if(clk);

  ialu_wrapper ialu_wr(
    .sum1_if           (sum1_if)
  );

  initial begin
    uvm_config_db#(virtual ialu_sum1_if)::set(null, "uvm_test_top", "ialu_sum1_vif", sum1_if);
  end

  initial begin
    run_test("ialu_full_test");
  end

endmodule : ialu_tb_top