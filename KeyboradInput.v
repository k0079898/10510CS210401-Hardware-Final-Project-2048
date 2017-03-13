module KeyboradInput(
	output reg up,
	output reg down,
	output reg left,
	output reg right,
	output reg Enter,
	inout wire PS2_DATA,
	inout wire PS2_CLK,
	input wire rst,
	input wire clk
	);
	
	
	parameter [8:0] KEY_CODES [0:4] = {
		9'b0_0001_1101,	// W => 1D
		9'b0_0001_1100,	// A => 1C
		9'b0_0001_1011,	// S => 1B
		9'b0_0010_0011,	// D => 23
		9'b0_0101_1010	// Enter => 5A
	};
	
	reg [15:0] nums;
	reg [3:0] key_num;
	reg [9:0] last_key;
	
	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;
		
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	always @ (posedge clk) begin
	    if (been_ready && key_down[last_change] == 1'b1) begin
	        case (last_change)
	            KEY_CODES[0] : up    = 1'b1;
	            KEY_CODES[1] : left  = 1'b1;
	            KEY_CODES[2] : down  = 1'b1;
	            KEY_CODES[3] : right = 1'b1;
	            KEY_CODES[4] : Enter = 1'b1;
	        endcase
	    end else if (been_ready && key_down[last_change] == 1'b0) begin
	        case (last_change)
                KEY_CODES[0] : up    = 1'b0;
                KEY_CODES[1] : left  = 1'b0;
                KEY_CODES[2] : down  = 1'b0;
                KEY_CODES[3] : right = 1'b0;
                KEY_CODES[4] : Enter = 1'b0;
            endcase
        end
	    
	end
	
endmodule
