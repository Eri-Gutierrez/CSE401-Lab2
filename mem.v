// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

module memory (
   output reg [31:0] data,       // Output of Instruction Memory
   input wire [31:0] addr        // Input of Instruction Memory
   );

// Register Declarations
   reg [31:0] MEM[0:127];  // 128 words of 32-bit memory

// Initialize Registers
   initial begin
   MEM[0] <= 'hA00000AA;
   MEM[1] <= 'h10000011;
   MEM[2] <= 'h20000022;
   MEM[3] <= 'h30000033;
   MEM[4] <= 'h40000044;
   MEM[5] <= 'h50000055;
   MEM[6] <= 'h60000066;
   MEM[7] <= 'h70000077;
   MEM[8] <= 'h80000088;
   MEM[9] <= 'h90000099;
   end

   always @ (addr) data <= MEM[addr];
endmodule // mem
