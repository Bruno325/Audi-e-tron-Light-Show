// converts a 4 bit decimal number into binary for easy assignment to HEX displays
module dec_to_display(input [3:0] num, output reg [7:0] display);

	always @(*) begin
	
		case (num)
			
			4'd0: display = 8'b11000000;
			4'd1: display = 8'b11111001;
			4'd2: display = 8'b10100100;
			4'd3: display = 8'b10110000;
			4'd4: display = 8'b10011001;
			4'd5: display = 8'b10010010;
			4'd6: display = 8'b10000010;
			4'd7: display = 8'b11111000;
			4'd8: display = 8'b10000000;
			4'd9: display = 8'b10010000;
			
			
		endcase
	
	end

endmodule