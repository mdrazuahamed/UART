module uart_top_tb;
	bit    clk;
	logic  rx;
	logic  rst;
	logic tx;

    uart_top ins1(
	   	.clk(clk),
      	.rx_t(rx),
	   	.rst(rst),
      	.tx_t(tx)
	   );
	 always #5 clk = ~ clk;
  	initial begin
    	clk=0;
        tx =1;
      repeat (5) @(negedge clk);
      	tx = 0;
      @(negedge clk);
      	tx = 0;
      @(negedge clk);
      	tx = 0;
      @(negedge clk);
      	tx = 1;
      @(negedge clk);
      	tx = 1;
      @(negedge clk);
      	tx = 1;
      #400 $finish;
     end 
  	initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
  
  	end

endmodule 

