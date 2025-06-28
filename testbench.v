`include "DATA_PATH.V"
`include "CTRL_PATH.v"

module testbench;
  reg [15:0]data_in;
  reg clk,start;
  wire ldA,ldB,sel1,sel2,sel_in,done,gt,lt,eq;
  
DATA_PATH DUT1 (
  .lt(lt),
  .gt(gt),
  .eq(eq),
  .ldA(ldA),
  .ldB(ldB),
  .sel1(sel1),
  .sel2(sel2),
  .sel_in(sel_in),
  .data_in(data_in),
  .clk(clk)
);

CTRL_PATH DUT2 (
  .lt(lt),
  .gt(gt),
  .eq(eq),
  .ldA(ldA),
  .ldB(ldB),
  .sel1(sel1),
  .sel2(sel2),
  .sel_in(sel_in),
  .clk(clk),
  .done(done),
  .start(start)
);

  
  initial begin
       clk = 1'b0;
    #3 start = 1'b1;
    #600 $finish;
  end
    
    always #5 clk = ~clk;
  
  initial begin
    #22 data_in = 8'd78;
    #10 data_in = 8'd15;
  end
  
  initial begin
    $monitor($time, " aOut = %d, bOut = %d, done = %b", DUT1.aOut, DUT1.bOut,done);
    $dumpfile("dump.vcd");
    $dumpvars(0,testbench);
end

endmodule
    
    
  
