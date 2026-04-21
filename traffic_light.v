module fsm (
    input  wire clk,
    input  wire reset,
    output reg  red,
    output reg  green,
    output reg  yellow
);
parameter RED_STATE    = 2'b00;
parameter GREEN_STATE  = 2'b10;
parameter YELLOW_STATE = 2'b01;
parameter RED_TIME    = 6;
parameter GREEN_TIME  = 4;
parameter YELLOW_TIME = 2;
reg [1:0] state;    
reg [2:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state   <= RED_STATE;
        counter <= 0;
    end
    else begin
        case (state)

            RED_STATE: begin
                if (counter == RED_TIME - 1) begin
                    state   <= GREEN_STATE;
                    counter <= 0;           
                end
                else begin
                    counter <= counter + 1; 
                end
            end

            GREEN_STATE: begin
                if (counter == GREEN_TIME - 1) begin
                    state   <= YELLOW_STATE;
                    counter <= 0;
                end
                else begin
                    counter <= counter + 1;
                end
            end

            YELLOW_STATE: begin
                if (counter == YELLOW_TIME - 1) begin
                    state   <= RED_STATE;
                    counter <= 0;
                end
                else begin
                    counter <= counter + 1;
                end
            end

           
            default: begin
                state   <= RED_STATE;
                counter <= 0;
            end

        endcase
    end
end
always @(*) begin
    red    = 0;
    green  = 0;
    yellow = 0;

    case (state)
        RED_STATE:    red    = 1;
        GREEN_STATE:  green  = 1;
        YELLOW_STATE: yellow = 1;
    endcase
end

endmodule


