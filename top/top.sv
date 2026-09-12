module top ();

  import uvm_pkg::*;
  import router_pkg::*;

  bit clk;

  always #5 clk = ~clk;

  source_if in (clk);
  dest_if in0 (clk);
  dest_if in1 (clk);
  dest_if in2 (clk);

  router_top duv (

      .clk(clk),
      .resetn(in.resetn),

      // Connected to the source interface
      .pkt_valid(in.pkt_valid),
      .data_in(in.data_in),
      .err(in.err),
      .busy(in.busy),

      // Connected to the destination interface 0
      .read_en_0  (in0.read_en),
      .valid_out_0(in0.valid_out),
      .data_out_0 (in0.data_out),

      // Connected to the destination interface 1
      .read_en_1  (in1.read_en),
      .valid_out_1(in1.valid_out),
      .data_out_1 (in1.data_out),

      // Connected to the destination interface 2
      .read_en_2  (in2.read_en),
      .valid_out_2(in2.valid_out),
      .data_out_2 (in2.data_out)

  );

  initial begin

    uvm_config_db#(virtual source_if)::set(null, "*", "in", in);

    uvm_config_db#(virtual dest_if)::set(null, "*", "in0", in0);
    uvm_config_db#(virtual dest_if)::set(null, "*", "in1", in1);
    uvm_config_db#(virtual dest_if)::set(null, "*", "in2", in2);

    run_test();  // NOTE: +UVM_TESTNAME="test class name"

  end



endmodule

