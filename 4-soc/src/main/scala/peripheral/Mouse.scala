// src/main/scala/peripheral/Mouse.scala

package peripheral

import chisel3._
import chisel3.util._
import bus.AXI4LiteChannels
import bus.AXI4LiteSlave
import riscv.Parameters

/**
 * Mouse Input Controller
 * * Memory Map:
 * 0x00: X Coordinate (Low 16 bits) - Read Only
 * 0x04: Y Coordinate (Low 16 bits) - Read Only
 * 0x08: Buttons      (Bit 0: Left, Bit 1: Right) - Read Only
 */
class Mouse extends Module {
  val io = IO(new Bundle {
    // AXI4-Lite Slave Interface (連接 CPU)
    val channels = Flipped(new AXI4LiteChannels(Parameters.AddrBits, Parameters.DataBits))
    
    // Hardware Inputs (連接 C++ 模擬器)
    val x = Input(UInt(16.W))
    val y = Input(UInt(16.W))
    val leftButton  = Input(Bool())
    val rightButton = Input(Bool())
    val middleButton = Input(Bool())
  })

  // 建立 AXI4-Lite Slave 模組
  val slave = Module(new AXI4LiteSlave(Parameters.AddrBits, Parameters.DataBits))
  slave.io.channels <> io.channels

  // 定義暫存器位址偏移量 (Offset)
  val REG_X       = 0x00.U
  val REG_Y       = 0x04.U
  val REG_BUTTONS = 0x08.U

  // 取得目前的讀取位址 (只看低 8 bits 即可，因為暫存器不多)
  val addr = slave.io.bundle.address & 0xFF.U

  // 準備回傳給 CPU 的資料
  val readData = WireDefault(0.U(32.W))

  // 根據位址決定回傳什麼資料
  switch(addr) {
    is(REG_X) {
      readData := io.x
    }
    is(REG_Y) {
      readData := io.y
    }
    is(REG_BUTTONS) {
      // Bit 0: Left, Bit 1: Right, Bit 2: Middle
      readData := Cat(0.U(29.W), io.middleButton, io.rightButton, io.leftButton)
    }
  }

  // --- AXI4-Lite Read Logic ---
  // 當 slave 收到讀取請求 (read = true) 時，立刻回傳資料
  slave.io.bundle.read_valid := slave.io.bundle.read
  slave.io.bundle.read_data  := readData

  // --- AXI4-Lite Write Logic ---
  // Mouse 是唯讀裝置 (Input Device)，CPU 寫入時我們不做任何事，直接忽略
  // 但為了符合協定，我們必須假裝準備好了 (WREADY = true)
  // AXI4LiteSlave 模組已經幫我們處理了握手訊號，所以這裡不需要額外寫邏輯
}
