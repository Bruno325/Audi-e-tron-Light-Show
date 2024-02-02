// outputs the repeat count and appropriate pattern to display based on time elapsed so far
module ledPattern(input sw0, sw9, clk, resetBtn, output reg [9:0] ledToDisp, output reg [5:0] countOut, input enable, output reg [3:0] REPEAT_COUNT);

	reg [9:0] pattern; // pattern to display on LEDs
	reg [5:0] count; // row counter - keeps track of what "frame of the animation" we are on
	reg [3:0] tempRepCount = 9; // what the repeat counter starts at (how many times the pattern will repeat) - can be easily changed to any number you desire
	
	initial begin
		count = 0;
	end
	
	always @(*) begin
		REPEAT_COUNT = tempRepCount;
	end
	
	always @(posedge clk or negedge resetBtn) begin
	
		// start pattern over if reset button pressed
		if (~resetBtn) begin
			count <= 0;
			pattern <= 10'b0000000000;
		end
	
		// display nothing if repeat counter has reached 0
		else if (tempRepCount == 0) begin
			
			pattern <= 10'b0000000000;
			
			if (sw0 && sw9) begin
				ledToDisp = pattern;
			end
			else if (sw0 && ~sw9) begin
				ledToDisp = pattern & 10'b0000011111;
			end
			else if (~sw0 && sw9) begin
				ledToDisp = pattern & 10'b1111100000;
			end
			else begin
				ledToDisp = pattern & 10'b0000000000;
			end
		
		
			countOut <= count;
			
		end
		
		// if start button has been pressed, begin displaying the pattern
		else if (enable) begin
		
			if (count > 43) begin
				count <= 0;
				tempRepCount <= tempRepCount - 1;
			end
			else if (tempRepCount == 0) begin
				pattern <= 10'b0000000000;
			end
			else begin
				count <= count + 1;
				
				if (count == 0 || count == 6 || count == 36) begin
					pattern <= 10'b0000110000;
				end
				
				else if (count == 1 || count == 7 || count == 37) begin
					pattern <= 10'b0001111000;
				end
				
				else if (count == 2 || count == 8) begin
					pattern <= 10'b0011111100;
				end
				
				else if (count == 3 || count == 9) begin
					pattern <=10'b0111111110;
				end
				
				else if (count == 4 || count == 10 || count == 35) begin
					pattern <=10'b1111111111;
				end
				
				else if (count == 5 || count == 42 || count == 43) begin
					pattern <= 10'b0000000000;
				end
				
				else if (count == 11 || count== 21 || count == 31 || count == 41) begin
					pattern <= 10'b1000000001;
				end
				
				else if (count == 12 || count == 30) begin
					pattern <= 10'b1100000001;
				end
				
				else if (count == 13 || count == 29) begin
					pattern <= 10'b1110000001;
				end
				
				else if (count == 14 || count == 28) begin
					pattern <= 10'b1011000001;
				end
				
				else if (count == 15 || count == 27) begin
					pattern <= 10'b1001100001;
				end
				
				else if (count == 16 || count == 26) begin
					pattern <= 10'b1000110001;
				end
				
				else if (count == 17 || count == 25) begin
					pattern <= 10'b1000011001;
				end
				
				else if (count == 18 || count == 24) begin
					pattern <= 10'b1000001101;
				end
				
				else if (count == 19 || count == 23) begin
					pattern <= 10'b1000000111;
				end
				
				else if (count == 20 || count == 22) begin
					pattern <= 10'b1000000011;
				end
				
				else if (count == 32) begin
					pattern <= 10'b1100000011;
				end
				
				else if (count == 33) begin
					pattern <= 10'b1110000111;
				end
				
				else if (count == 34) begin
					pattern <= 10'b1111001111;
				end
				
				else if (count == 38) begin
					pattern <= 10'b0011001100;
				end
				
				else if (count == 39) begin
					pattern <= 10'b0110000110;
				end
				
				else begin
					pattern <= 10'b1100000011;
				end
			
			end
			
			if ( sw0 && sw9  ) begin
				ledToDisp = pattern;
			end
			else if (sw0 && ~sw9) begin
				ledToDisp = pattern & 10'b0000011111;
			end
			else if (~sw0 && sw9) begin
				ledToDisp = pattern & 10'b1111100000;
			end
			else begin
				ledToDisp = pattern & 10'b0000000000;
			end
			
			countOut <= count;	
					
			end
		
			else begin
			
				if ( sw0 && sw9 ) begin
					ledToDisp = pattern;
				end
				else if (sw0 && ~sw9) begin
					ledToDisp = pattern & 10'b0000011111;
				end
				else if (~sw0 && sw9) begin
					ledToDisp = pattern & 10'b1111100000;
				end
				else begin
					ledToDisp = pattern & 10'b0000000000;
				end
				
				countOut <= count;
			
			end
		
	end

endmodule
