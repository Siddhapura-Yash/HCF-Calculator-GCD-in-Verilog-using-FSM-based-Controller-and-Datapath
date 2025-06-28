module CTRL_PATH (lt,gt,eq,ldA,ldB,sel1,sel2,sel_in,clk,done,start);
  input lt,gt,eq,clk,start;
  output reg ldA,ldB,sel1,sel2,sel_in,done;
  
  reg [2:0] state,next_state;
  localparam S0=3'b000,
  			 S1=3'b001,
  			 S2=3'b010,
  			 S3=3'b011,
  			 S4=3'b100,
  			 S5=3'b101;
  
  always@(posedge clk) begin
    state <= next_state;
  end
  
  always@(posedge clk) begin
    case(next_state) 
      S0 : if(start) next_state <= S1;
      
      S1 : next_state <= S2;
      
      S2 :#2 if(eq) next_state <= S5;
      else if(lt) next_state <= S3;
      else if(gt) next_state <= S4;
      
      S3 :#2 if(eq) next_state <= S5;
      else if(lt) next_state <= S3;
      else if(gt) next_state <= S4;
      
      S4 :#2 if(eq) next_state <= S5;
      else if(lt) next_state <= S3;
      else if(gt) next_state <= S4;
      
      S5 : next_state <= S5;
      
      default : next_state = S0;
      
    endcase
  end
  
  always@(*) begin
    
// Default all control signals
  ldA = 0;
  ldB = 0;
  sel1 = 0;
  sel2 = 0;
  sel_in = 0;
  done = 0;

    case(state)
    S0 : begin 
      ldA = 1'b1; ldB = 1'b0; sel_in=1'b1; done = 1'b0; 
    	 end 	//enables A Load
    
    S1 : begin 
      ldA = 1'b0; ldB = 1'b1; sel_in=1'b1; done = 1'b0; 
    	 end	 //enables B Load
    
    S2 : begin 
    if(eq) done = 1'b1; 
    else if(lt) begin sel1 = 1'b1; sel2 = 1'b0; sel_in = 1'b0; ldB = 1'b1; ldA = 1'b0; done = 1'b0; end
    else if(gt) begin sel1 = 1'b0; sel2 = 1'b1; sel_in = 1'b0; ldB = 1'b0; ldA = 1'b1; done = 1'b0; end
    end
    
	S3 : begin
    if(eq) done = 1'b1; 
    else if(lt) begin sel1 = 1'b1; sel2 = 1'b0; sel_in = 1'b0; ldB = 1'b1; ldA = 1'b0; done = 1'b0; end
    else if(gt) begin sel1 = 1'b0; sel2 = 1'b1; sel_in = 1'b0; ldB = 1'b0; ldA = 1'b1; done = 1'b0; end
    end
    
    S4 : begin
    if(eq) done = 1'b1; 
    else if(lt) begin sel1 = 1'b1; sel2 = 1'b0; sel_in = 1'b0; ldB = 1'b1; ldA = 1'b0; done = 1'b0; end
    else if(gt) begin sel1 = 1'b0; sel2 = 1'b1; sel_in = 1'b0; ldB = 1'b0; ldA = 1'b1; done = 1'b0; end
    end
  
  	S5 : done = 1'b1;
    
    endcase
  end
  
endmodule
  
  
      
  
  
