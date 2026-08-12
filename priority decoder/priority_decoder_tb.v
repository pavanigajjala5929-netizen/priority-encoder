`timescale 1ns/1ps

module priority_decoder_tb;

reg D3, D2, D1, D0;
wire Y1, Y0, Valid;

priority_decoder uut (
    .D3(D3),
    .D2(D2),
    .D1(D1),
    .D0(D0),
    .Y1(Y1),
    .Y0(Y0),
    .Valid(Valid)
);

initial begin

    $dumpfile("priority_decoder.vcd");
    $dumpvars(0, priority_decoder_tb);

    $monitor("Time=%0t | D3=%b D2=%b D1=%b D0=%b | Y1=%b Y0=%b Valid=%b",
             $time, D3, D2, D1, D0, Y1, Y0, Valid);

    // No input
    D3=0; D2=0; D1=0; D0=0;
    #10;

    // D0 has priority
    D3=0; D2=0; D1=0; D0=1;
    #10;

    // D1 has priority
    D3=0; D2=0; D1=1; D0=0;
    #10;

    // D2 has priority
    D3=0; D2=1; D1=0; D0=0;
    #10;

    // D3 has highest priority
    D3=1; D2=0; D1=0; D0=0;
    #10;

    // Multiple inputs: D3 wins
    D3=1; D2=1; D1=1; D0=1;
    #10;

    // Multiple inputs: D2 wins
    D3=0; D2=1; D1=1; D0=1;
    #10;

    // Multiple inputs: D1 wins
    D3=0; D2=0; D1=1; D0=1;
    #10;

    $finish;

end

