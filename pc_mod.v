// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

module pc_mod (
   output reg [31:0] PC,             // Output of pc_mod
   input wire [31:0] npc             // Input of pc_mod
   );

   initial begin
      PC <= 0;
   end
   always @ ( npc) begin
      #1 PC <= npc;
   end

endmodule // pc_mod
