module register(input clk,
				input rw,
				input [7:0]data_in, 
				output reg [7:0] data_out);

reg [7:0] stored_data;

always @ (posedge clk)
begin 
if (rw == 1) stored_data <= data_in;
if (rw == 0) data_out <= stored_data;
end

endmodule 