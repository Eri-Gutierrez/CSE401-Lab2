// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

module incrementer (
   input  wire [31:0] pcin,      // Input of incrementer
   output wire [31:0] pcout      // Output of incrementer
   );
   assign pcout = pcin + 1;  // Increment PC by 1, *See Comments above
endmodule // incr
