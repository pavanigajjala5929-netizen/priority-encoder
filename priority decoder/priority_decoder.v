module priority_decoder (
    input  wire D3,
    input  wire D2,
    input  wire D1,
    input  wire D0,
    output reg  Y1,
    output reg  Y0,
    output reg  Valid
);

always @(*) begin
    if (D3) begin
        Y1 = 1'b1;
        Y0 = 1'b1;
        Valid = 1'b1;
    end
    else if (D2) begin
        Y1 = 1'b1;
        Y0 = 1'b0;
        Valid = 1'b1;
    end
    else if (D1) begin
        Y1 = 1'b0;
        Y0 = 1'b1;
        Valid = 1'b1;
    end
    else if (D0) begin
        Y1 = 1'b0;
        Y0 = 1'b0;
        Valid = 1'b1;
    end
    else begin
        Y1 = 1'b0;
        Y0 = 1'b0;
        Valid = 1'b0;
    end
end

