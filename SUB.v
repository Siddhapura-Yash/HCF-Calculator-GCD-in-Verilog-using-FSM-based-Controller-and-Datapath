module SUB(in0,in1,out);
  input [15:0]in0,in1;
  output reg [15:0]out;
  
  always@(*) begin
    out <= in0 - in1;
  end
endmodule
  
