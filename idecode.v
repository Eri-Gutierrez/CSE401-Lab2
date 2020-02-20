// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps
/* IDECODE.v  */

/* This is the second stage fully instantiated and wired.
   This is the last time a fully wired stage will be provided.
   Take notes.
*/

module IDECODE(
	input		wire  [31:0]	IF_ID_instrout,
   input		wire  [31:0]	IF_ID_npcout,
	input		wire	[4:0]		MEM_WB_rd,
	input		wire				MEM_WB_regwrite,
	input		wire	[31:0]	WB_mux5_writedata,
	output	wire	[1:0]		wb_ctlout,
	output	wire	[2:0]		m_ctlout,
	output	wire				regdst, alusrc,
	output	wire	[1:0]		aluop,
	output	wire	[31:0]	npcout, rdata1out, rdata2out, s_extendout,
	output	wire	[4:0]		instrout_2016, instrout_1511
	 );

	// signals
	wire [3:0]	ctlex_out;
	wire [2:0]	ctlm_out;
	wire [1:0]	ctlwb_out;
	wire [31:0]	readdat1, readdat2, signext_out;

	// instantiations
	control control2		(.opcode(IF_ID_instrout[31:26]),
								.EX(ctlex_out),
								.M(ctlm_out),
								.WB(ctlwb_out));

	register register2	(.rs(IF_ID_instrout[25:21]),
								.rt(IF_ID_instrout[20:16]),
								.rd(MEM_WB_rd),
								.writedata(WB_mux5_writedata),
								.regwrite(MEM_WB_regwrite),
								.A(readdat1),
								.B(readdat2));

	s_extend s_extend2	(.nextend(IF_ID_instrout[15:0]),
								.extend(signext_out));

	id_ex id_ex2 	(.ctlwb_out(ctlwb_out),
								.ctlm_out(ctlm_out),
								.ctlex_out(ctlex_out),
								.npc(IF_ID_npcout),
								.readdat1(readdat1),
								.readdat2(readdat2),
								.signext_out(signext_out),
								.instr_2016(IF_ID_instrout[20:16]),
								.instr_1511(IF_ID_instrout[15:11]),
								.wb_ctlout(wb_ctlout),
								.m_ctlout(m_ctlout),
								.regdst(regdst),
								.alusrc(alusrc),
								.aluop(aluop),
								.npcout(npcout),
								.rdata1out(rdata1out),
								.rdata2out(rdata2out),
								.s_extendout(s_extendout),
								.instrout_2016(instrout_2016),
								.instrout_1511(instrout_1511));

endmodule // idecode
