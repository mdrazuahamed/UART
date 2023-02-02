
module uart_top (
	input 	logic clk,
	input 	logic rst,
	input 	logic tx_t,
	output  logic rx_t 
);
	logic txrx_connection;

	uart master (
		.clk	(clk),
		.rx		(),
		.rst	(rst),
      	.tx_temp(tx_t),
      	.tx		(txrx_connection),
      	.rx_temp()
    	);
	uart slave (
		.clk	(clk),
		.rx		(txrx_connection),
      	.tx_temp(),
		.rst	(rst),
      	.tx		(),
      	.rx_temp(rx_t)
    	);
endmodule

