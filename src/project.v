/*
 * Copyright (c) 2026 'singular.droid'
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Black box for the analog tile. The circuit is in GlobalFoundries/xschem/
// (top schematic tt_um_singulardroid_davis.sch); the layout goes in gds/ and lef/.
module tt_um_singulardroid_davis (
    input  wire       VGND,
    input  wire       VDPWR,    // 3.3v core power supply
//    input  wire       VAPWR,    // second analog power supply (VAA), not used
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

endmodule
