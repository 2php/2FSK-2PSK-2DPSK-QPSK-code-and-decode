module counter(clk,reset_n,clk1);
  input        clk,reset_n;
  output       clk1;

  reg          clk1;
  reg[7:0]     count;
  
    always @ (posedge clk or negedge reset_n )
      if(! reset_n)
        begin
          count <= 1'b0;
          clk1 <= 1'b0;
        end
          
        else    if ( count < 127)
		
          begin         
            count <= count + 1'b1;           
          end
        else
          begin       
            count <= 1'b0;
            clk1 <= ~clk1;     
          end
endmodule
