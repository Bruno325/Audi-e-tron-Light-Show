// creates a 1 second clock, cout
module ClockDivider(cin,cout);

	input cin;
	 output reg cout;
	 reg[31:0] count; 
	 parameter D = 32'd12500000;
	 always @(posedge cin)
	 begin
		 count <= count + 32'd1;
		 if (count >= (D-1)) begin
			 cout <= ~cout;
			 count <= 32'd0;
		 end
	end

endmodule