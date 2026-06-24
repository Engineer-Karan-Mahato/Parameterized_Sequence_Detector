module sequence_detector #(
    parameter SEQ_LENGTH = 8,
    parameter [SEQ_LENGTH-1 : 0] SEQUENCE = 8'b01100001
  )(
    input clk, rst,
    input seq_in,
    output reg detect
  );
  
  reg [SEQ_LENGTH-1 : 0] shift_reg;
  wire [SEQ_LENGTH-1 : 0] next_shift;
  
  assign next_shift = (SEQ_LENGTH == 1) ? seq_in : {shift_reg[SEQ_LENGTH-2 : 0], seq_in};
  
  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      detect <= 1'b0;
      shift_reg <= {SEQ_LENGTH{1'b0}};
    end
    else begin
      shift_reg <= next_shift;
      detect <= (next_shift == SEQUENCE);
    end
  end
endmodule