module uart #(
  	parameter DEPTH = 5
)
(
	input logic  clk,
	input logic  rx,
	input logic  rst,
  	input logic  tx_in,
	output logic tx,
  	//output logic [DEPTH-1:0]rx_out
 );
  	
    logic [2:0]count;
	typedef enum {IDLE, START, DATA,STOP} state_t;
	state_t pstate,nstate;
	
  	assign tx = tx_in;
  	assign rx_out = rx;
	always_comb 
		begin
	
		case(pstate)
	
		IDLE: 
		begin
	 		if(~rx) 
	 		begin
	 		    nstate = START;
	 		end
	 		
	 		else    
	 		begin
	 		    nstate = IDLE;
	 		end
		end
	
		START: 
		begin
			nstate = DATA;
		end
	
		DATA: 
		begin
			if(count==5) nstate = STOP;
			else         nstate = DATA;
		end
		STOP: if(rx)	     nstate = IDLE;
		      else 	         nstate = STOP;
		endcase
	end
		
	always_ff@(posedge clk) 
	begin
		if(pstate==IDLE | pstate == START) 
		begin
			count<=0;
		end	
	
		else
		begin
			count<=count+1;
		end
	end
	
	always_ff@(posedge clk or negedge rst) 
	begin
		if(!rst) 
		begin 
			pstate <= IDLE;
		end
		
		else
		begin
			pstate <= nstate;
		end
	end
endmodule

