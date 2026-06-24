module sequence_detector_tb;
    parameter SEQ_LENGTH = 8;
    parameter [SEQ_LENGTH-1 : 0] SEQUENCE = 8'b10110111;

    reg clk, rst;
    reg seq_in;
    wire detect;

    integer i;
    reg [15:0] seq_reg;

    sequence_detector #(
            .SEQ_LENGTH(SEQ_LENGTH),
            .SEQUENCE(SEQUENCE)
        ) dut (
            .clk(clk),
            .rst(rst),
            .seq_in(seq_in),
            .detect(detect)
        );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        seq_in = 0;
        seq_reg = 16'b1011011110110111;
        #20;
        rst = 1;

        for (i=15; i>=0; i=i-1) begin
            @(negedge clk);
            seq_in = seq_reg[i];
        end

        #20;
        $finish(2);
    end

    initial begin
        $dumpfile("sequence_detector_dump.vcd");
        $dumpvars(0, sequence_detector_tb);
    end
endmodule
