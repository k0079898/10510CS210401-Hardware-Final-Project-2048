module SevenSegment(
	output reg [6:0] display,
	output reg [3:0] digit,
	input wire clk
    );
    
    reg [15:0] clk_divider;
    reg [6:0] display_num[0:3] = {
        7'b0100100, // 2
        7'b1000000, // 0
        7'b0011001, // 4
        7'b0000000  // 8
    };
    
    always @ (posedge clk) begin
    	clk_divider <= clk_divider + 15'b1;
    end
    
    always @ (posedge clk_divider[15]) begin
    		case (digit)
    			4'b1110 : begin
    					display <= display_num[2];
    					digit <= 4'b1101;
    				end
    			4'b1101 : begin
						display <= display_num[1];
						digit <= 4'b1011;
					end
    			4'b1011 : begin
						display <= display_num[0];
						digit <= 4'b0111;
					end
    			4'b0111 : begin
						display <= display_num[3];
						digit <= 4'b1110;
					end
    			default : begin
						display <= display_num[3];
						digit <= 4'b1110;
					end				
    		endcase
    end
    
endmodule
