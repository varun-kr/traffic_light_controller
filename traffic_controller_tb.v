// Code your testbench here
// or browse Examples

module test;
  reg clk,rst;
  wire [2:0] n_light, s_light, e_light , w_light;
  wire [2:0] count ;
  traffic DUT(n_light, s_light, e_light,w_light,rst,clk,count);
  initial 
    begin clk=1;
	       rst = 1;
         #15 rst = 0;
    end
  always #5 clk = ~clk;  
  initial
    begin
      $dumpfile("varun.vcd");
      $dumpvars(0,test);
		end
endmodule