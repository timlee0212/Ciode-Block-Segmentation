module cb_seg(
    input wire tb_in,
    input wire wreq_data,        //Write Request of the Input TB buffer
    input wire tb_size_in,  
    input wire wreq_size,
    //TODO: A signal from Transfer Layer to initilize the computation?

    //Control Signals
    output wire filling,
    output wire crc,
    output wire start,
    output wire stop,

    output wire cb_size,  //1-bit 2 possible size
    output wire cb_data,  //Serial Data Output
);

//Data Path

//Block Size Computation

endmodule