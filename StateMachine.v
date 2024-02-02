// A Finite State Machine
module StateMachine(input clk, input [5:0] count, input wire reset, startBtn, input wire [9:0] ledPattern, output reg [1:0] state, output reg enable, resetPressed, input [3:0] repCount);

	// the three states (based on the period of clocks that should be used in each state)
	parameter delay2 = 2'b00;
	parameter delayPoint1 = 2'b01;
	parameter delay1 = 2'b10;
	
	reg [1:0] currentState, nextState;
	
	initial begin
		enable = 0;
		resetPressed = 0;
	end
	
	// resets internal, local state and warns program we have pressed the button (resetPressed <= 1)
	always @ (posedge clk or negedge reset) begin
	
		if (~reset) begin
			currentState <= delay2;
			resetPressed <= 1;
		end
		else begin
			currentState <= nextState;
		end
	
	end

	// resets program's state
	always @ (posedge clk or negedge reset) begin
	
		if (~reset) begin
			state <= delay2;
		end
		else begin
			state <= currentState;
		end
	
	end
	
	// warns program if we have pressed the start button
	always @(negedge startBtn) begin
	
		if (~startBtn) begin
			enable <= 1;	
		end
	
	end

	// handle state transitions
	always @(*) begin
	
		nextState <= currentState;
		
		case (currentState)
		
			delay2: if (enable) nextState <= delayPoint1;

			delayPoint1: if (enable && repCount == 0) nextState <= delay1;
			
			delay1: nextState <= delay1;
			
		endcase
		
	end



endmodule