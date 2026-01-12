// src/main/scala/peripheral/Mouse.scala

package peripheral

import chisel3._
import chisel3.util._
import bus.AXI4LiteChannels
import bus.AXI4LiteSlave
import riscv.Parameters

/**
 * Mouse Input Controller (Relative Mode)
 * * Memory Map:
 * 0x00: Delta X (16-bit signed, sign-extended to 32-bit) - Read to Clear
 * 0x04: Delta Y (16-bit signed, sign-extended to 32-bit) - Read to Clear
 * 0x08: Buttons (Bit 0: Left, Bit 1: Right, Bit 2: Middle) - Read Only
 */
class Mouse extends Module {
  val io = IO(new Bundle {
    // AXI4-Lite Slave Interface (Connects to CPU)
    val channels = Flipped(new AXI4LiteChannels(Parameters.AddrBits, Parameters.DataBits))
    
    // Hardware Inputs
    val x = Input(UInt(16.W))
    val y = Input(UInt(16.W))
    val leftButton   = Input(Bool())
    val rightButton  = Input(Bool())
    val middleButton = Input(Bool())
  })

  // Create AXI4-Lite Slave Module
  val slave = Module(new AXI4LiteSlave(Parameters.AddrBits, Parameters.DataBits))
  slave.io.channels <> io.channels

  // Define Register Address Offsets
  val REG_X       = 0x00.U
  val REG_Y       = 0x04.U
  val REG_BUTTONS = 0x08.U

  // Get current read address (masked to lower 8 bits)
  val addr = slave.io.bundle.address & 0xFF.U

  // --- Relative Coordinate Core Logic ---
  
  // Initial value set to 0, or could be set to io.x on reset (depending on requirements)
  val reg_last_x = RegInit(0.U(16.W))
  val reg_last_y = RegInit(0.U(16.W))

  // Calculate Difference (Delta)
  val delta_x_raw = io.x - reg_last_x
  val delta_y_raw = io.y - reg_last_y

  // Sign Extension
  val delta_x_ext = Wire(UInt(32.W))
  val delta_y_ext = Wire(UInt(32.W))
  
  delta_x_ext := delta_x_raw.asSInt.pad(32).asUInt
  delta_y_ext := delta_y_raw.asSInt.pad(32).asUInt

  // Prepare data to return to CPU
  val readData = WireDefault(0.U(32.W))

  // Determine return data based on address
  switch(addr) {
    is(REG_X) {
      readData := delta_x_ext
    }
    is(REG_Y) {
      readData := delta_y_ext
    }
    is(REG_BUTTONS) {
      // Bit 0: Left, Bit 1: Right, Bit 2: Middle
      readData := Cat(0.U(29.W), io.middleButton, io.rightButton, io.leftButton)
    }
  }

  // --- Update Logic (Read Side Effect) ---
  when(slave.io.bundle.read) {
    switch(addr) {
      is(REG_X) {
        reg_last_x := io.x
      }
      is(REG_Y) {
        reg_last_y := io.y
      }
    }
  }

  // --- AXI4-Lite Read Logic ---
  slave.io.bundle.read_valid := slave.io.bundle.read
  slave.io.bundle.read_data  := readData
}
