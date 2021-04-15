// Code your design here
module traffic(n_light,s_light,e_light,w_light,rst,clk,count);
  input clk,rst;
  output reg [2:0] n_light, s_light, e_light,w_light;
  output reg [2:0] count;
  reg [2:0] state;
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
 always@(posedge clk)
 begin
 count <= count + 1;
	  	 begin
	    if(rst)
		 begin
		 count <= 0;
		 state <= s0;
		end
		else if(state == s0 &&  count == 3'b111)
		begin
		state <= s1;
		count <= 0;
		end
		else if(state == s1 && count == 3'b011)
		begin
		state <= s2;
		count <= 0;
		end
		else if(state == s2 && count == 3'b111)
		begin
		state <= s3;
		count <= 0;
		end
		else if(state == s3 && count == 3'b011)
		begin
		state <= s4;
		count <= 0;
		end
		else if(state == s4 && count == 3'b111)
		begin
		state <= s5;
		count <= 0;
		end
		else if(state == s5 && count == 3'b011)
		begin
		state <= s6;
		count <= 0;
		end
		else if(state == s6 && count == 3'b111)
		begin
	   state <= s7;
		count <= 0;
		end
		else if(state == s7 && count == 3'b011)
		begin
		state <= s0;
		count <= 0;
		end
		end
end
		always@(state)
		case(state)
		s0:
		begin
		 n_light <= 3'b001;
       s_light <= 3'b100;		 
		 e_light <= 3'b100;
		 w_light	<= 3'b100;
		 end
		 s1:
		 begin
       n_light <= 3'b010;
       s_light <= 3'b100;		 
		 e_light <= 3'b100;
		 w_light	<= 3'b100;
		 end
		 s2:
		 begin
       n_light <= 3'b100;
       s_light <= 3'b001;		 
		 e_light <= 3'b100;
		 w_light	<= 3'b100;
		 end
		 s3:
		 begin
       n_light <= 3'b100;
       s_light <= 3'b010;		 
		 e_light <= 3'b100;
		 w_light	<= 3'b100;
		 end
		 s4:
		 begin
		n_light <= 3'b100;
		s_light <= 3'b100;
		e_light <= 3'b001;
		w_light <= 3'b100;
 		end
		s5:
		begin
		n_light <= 3'b100;
		s_light <= 3'b100;
		e_light <= 3'b010;
		w_light <= 3'b100;
      end
		s6:
		begin
		n_light <= 3'b100;
		s_light <= 3'b100;
		e_light <= 3'b100;
		w_light <= 3'b001;
		end
		s7:
		begin
		n_light <= 3'b100;
		s_light <= 3'b100;
		e_light <= 3'b100;
		w_light <= 3'b010;
		end
		endcase
endmodule