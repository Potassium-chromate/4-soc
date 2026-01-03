// SPDX-License-Identifier: MIT
// MyCPU is freely redistributable under the MIT License. See the file
// "LICENSE" for information on usage and redistribution of this file.
// Timer peripheral: memory-mapped timer with configurable interrupt generation
//
// Features:
// - 32-bit auto-reloading counter
// - Configurable interrupt threshold (limit register)
// - Enable/disable control for interrupt generation
// - Interrupts asserted when (count >= limit) and enabled
//
// Memory-mapped registers:
// - 0x4: limit - Interrupt threshold value (default: 100000000)
// - 0x8: enable - Interrupt enable flag (default: true)
//
// Behavior:
// - Counter increments every cycle
// - Counter resets to 0 when reaching limit
// - Interrupt signal remains high while (count >= limit) and enabled
// SPDX-License-Identifier: MIT

package peripheral

import chisel3._
import chisel3.util._
import bus.AXI4LiteSlave
import bus.AXI4LiteChannels
import riscv.Parameters

class Timer extends Module {
  val io = IO(new Bundle {
    // 1. AXI4-Lite 介面 (連接 CPU/Bus)
    val channels = Flipped(new AXI4LiteChannels(Parameters.AddrBits, Parameters.DataBits))
    // 2. 中斷訊號 (直連 CPU)
    val signal_interrupt = Output(Bool())
  })

  // AXI Slave Helper
  val slave = Module(new AXI4LiteSlave(Parameters.AddrBits, Parameters.DataBits))
  slave.io.channels <> io.channels

  // --- Registers ---
  val count   = RegInit(0.U(32.W)) // current time
  val limit   = RegInit(0.U(32.W)) // alarm colck setting, 0 stands for disable
  val enabled = RegInit(true.B)    // default as enable

  // --- 計數邏輯 ---
  when(enabled) {
    // 鬧鐘模式：如果有設定 limit 且數到了，就歸零
    when(limit =/= 0.U && count >= limit) {
      count := 0.U
    }.otherwise {
      // 手錶模式：一直往上加
      count := count + 1.U
    }
  }

  // --- 中斷輸出 ---
  io.signal_interrupt := enabled && (limit =/= 0.U) && (count >= limit)

  // --- AXI 讀取邏輯 (CPU 讀取資料) ---
  // 這裡使用 slave.io.bundle 而不是 io.bundle
  slave.io.bundle.read_valid := true.B
  slave.io.bundle.read_data := MuxLookup(slave.io.bundle.address(3, 0), 0.U)(
    IndexedSeq(
      0x0.U -> count,   // 0x40000000: 讀取時間 (給 Fenster 用)
      0x4.U -> limit,   // 0x40000004: 讀取鬧鐘
      0x8.U -> enabled.asUInt // 0x40000008: 讀取開關
    )
  )

  // --- AXI 寫入邏輯 (CPU 寫入設定) ---
  when(slave.io.bundle.write) {
    val wdata = slave.io.bundle.write_data
    // 判斷寫入哪個位址
    when(slave.io.bundle.address(3, 0) === 0x4.U) {
      limit := wdata
      count := 0.U // 修改鬧鐘時重置時間
    }.elsewhen(slave.io.bundle.address(3, 0) === 0x8.U) {
      enabled := wdata =/= 0.U
    }
  }
}
