module finalProject(input clk , input rst , output reg [2:0] light_A , output reg [2:0] light_B);
  
  reg[5:0] state;
  reg[3:0] ctr;

  localparam S0 = 6'b000001 , S1 = 6'b000010 , S2 = 6'b000100 ,
         S3 = 6'b001000 ,S4 = 6'b010000 , S5 = 6'b100000;
  
  localparam D1 = 4'd1 , D2 = 4'd6;

  always @(posedge clk or posedge rst or negedge clk )
    if(rst == 1) begin
      state <= S0;
      ctr <= 0;
    end
    else
      case(state)
      S0 : 
      if(ctr < D2) begin
        state <= S0;
        ctr <= ctr + 1;
      end 
      else begin 
        state <= S1;
        ctr <= 1;
      end
      S1 : 
      if(ctr < D1) begin
        state <= S1;
        ctr <= ctr + 1;
      end
      else begin
        state <= S2;
        ctr <= 1;
      end
      S2 : 
	if(ctr < D1) begin
          state <= S2;
          ctr <= ctr + 1;
      end
      else begin
        state <= S3;
        ctr <= 1;
      end
      S3 : 
      if(ctr < D2) begin
        state <= S3;
        ctr <= ctr + 1;
      end
      else begin
        state <= S4;
        ctr <= 1;
      end
      S4 : 
      if(ctr < D1) begin
        state <= S4;
        ctr <= 1;
      end
      else begin
        state <= S5;
        ctr <= 1;
      end
      S5 : 
      if(ctr < D1) begin
        state <=S5;
        ctr <= ctr + 1;
      end
      else begin
        state <= S0;
        ctr <= 1;
      end

      default begin 
	state <= S0;
      end
  endcase
  always @(*)
  begin
    case(state)  // 001 => red , 010 => yellow , 100 => green
      S0 : begin light_A <= 3'b001; light_B <= 3'b100; end  // light a is red & light b is green 
      S1 : begin light_A <= 6'b001; light_B <= 3'b010; end  // light a is red & light b is yellow
      S2 : begin light_A <= 6'b001; light_B <= 3'b001; end  // light a is red & light b is red
      S3 : begin light_A <= 6'b100; light_B <= 3'b001; end  // light a is green & light b is red
      S4 : begin light_A <= 6'b010; light_B <= 3'b001; end  // light a is yellow & light b is red
      S5 : begin light_A <= 6'b001; light_B <= 3'b001; end  // light a is red & light b is red
      default begin light_A <= 6'b100; light_B <= 3'b100; end
    endcase
  end
endmodule