FIRRTL version 1.2.0
circuit Top :
  module AXI4LiteSlave :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4]}} @[src/main/scala/bus/AXI4Lite.scala 111:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 116:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 118:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 119:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 122:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 123:18]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 124:26]
    io.channels.read_data_channel.RDATA <= read_data @[src/main/scala/bus/AXI4Lite.scala 125:39]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 127:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 128:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 129:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 130:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 131:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 132:39]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 135:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 136:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 138:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 139:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 140:26]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 142:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 143:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 144:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 145:41]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 147:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 148:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 149:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:13]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 154:13]
      when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 158:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 159:17]
      else :
        when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 160:61]
          state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 162:17]
          AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 163:17]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 168:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 170:17]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 171:17]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 172:17]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 173:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when io.bundle.read_valid : @[src/main/scala/bus/AXI4Lite.scala 178:34]
            read_data <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 180:19]
            RVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 181:19]
            RRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 182:19]
            read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 183:19]
          node _T_10 = and(RVALID, io.channels.read_data_channel.RREADY) @[src/main/scala/bus/AXI4Lite.scala 186:19]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 186:60]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 188:16]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 194:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 194:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 196:17]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 197:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:17]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 199:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 204:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 204:61]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 206:22]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                wire _WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                write_strobe <= _WIRE @[src/main/scala/bus/AXI4Lite.scala 207:22]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 209:22]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 210:22]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
                write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 215:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 216:14]
                BRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 217:14]
                node _T_26 = and(BVALID, io.channels.write_response_channel.BREADY) @[src/main/scala/bus/AXI4Lite.scala 219:19]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 219:65]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 221:16]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 222:16]


  extmodule TrueDualPortRAM32 :
    input clka : Clock
    input wea : UInt<1>
    input addra : UInt<13>
    input dina : UInt<32>
    input clkb : Clock
    input addrb : UInt<13>
    output doutb : UInt<32>
    defname = TrueDualPortRAM32
    parameter ADDR_WIDTH = 13
    parameter DEPTH = 6144

  module AXI4LiteSlave_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { address : UInt<8>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4]}} @[src/main/scala/bus/AXI4Lite.scala 111:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 116:22]
    reg addr : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/bus/AXI4Lite.scala 118:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 119:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 122:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 123:18]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 124:26]
    io.channels.read_data_channel.RDATA <= read_data @[src/main/scala/bus/AXI4Lite.scala 125:39]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 127:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 128:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 129:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 130:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 131:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 132:39]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 135:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 136:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 138:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 139:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 140:26]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 142:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 143:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 144:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 145:41]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 147:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 148:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 149:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:13]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 154:13]
      when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 158:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 159:17]
      else :
        when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 160:61]
          state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 162:17]
          AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 163:17]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 168:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 170:17]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 171:17]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 172:17]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 173:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when io.bundle.read_valid : @[src/main/scala/bus/AXI4Lite.scala 178:34]
            read_data <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 180:19]
            RVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 181:19]
            RRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 182:19]
            read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 183:19]
          node _T_10 = and(RVALID, io.channels.read_data_channel.RREADY) @[src/main/scala/bus/AXI4Lite.scala 186:19]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 186:60]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 188:16]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 194:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 194:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 196:17]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 197:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:17]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 199:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 204:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 204:61]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 206:22]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                wire _WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                write_strobe <= _WIRE @[src/main/scala/bus/AXI4Lite.scala 207:22]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 209:22]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 210:22]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
                write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 215:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 216:14]
                BRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 217:14]
                node _T_26 = and(BVALID, io.channels.write_response_channel.BREADY) @[src/main/scala/bus/AXI4Lite.scala 219:19]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 219:65]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 221:16]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 222:16]


  module VGA :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip pixClock : Clock, hsync : UInt<1>, vsync : UInt<1>, rrggbb : UInt<6>, activevideo : UInt<1>, intr : UInt<1>, x_pos : UInt<10>, y_pos : UInt<10>, flip cursor_x : UInt<10>, flip cursor_y : UInt<10>} @[src/main/scala/peripheral/VGA.scala 29:14]

    inst framebuffer of TrueDualPortRAM32 @[src/main/scala/peripheral/VGA.scala 91:27]
    inst slave of AXI4LiteSlave_1 @[src/main/scala/peripheral/VGA.scala 94:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/VGA.scala 95:21]
    reg ctrlReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/VGA.scala 101:30]
    reg intrStatusReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/VGA.scala 102:30]
    reg uploadAddrReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/VGA.scala 103:30]
    wire _paletteReg_WIRE : UInt<6>[16] @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[0] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[1] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[2] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[3] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[4] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[5] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[6] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[7] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[8] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[9] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[10] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[11] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[12] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[13] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[14] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    _paletteReg_WIRE[15] <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 104:38]
    reg paletteReg : UInt<6>[16], clock with :
      reset => (reset, _paletteReg_WIRE) @[src/main/scala/peripheral/VGA.scala 104:30]
    node ctrl_en = bits(ctrlReg, 0, 0) @[src/main/scala/peripheral/VGA.scala 107:31]
    node ctrl_blank = bits(ctrlReg, 1, 1) @[src/main/scala/peripheral/VGA.scala 108:31]
    node ctrl_swap_req = bits(ctrlReg, 2, 2) @[src/main/scala/peripheral/VGA.scala 109:31]
    node ctrl_frame_sel = bits(ctrlReg, 7, 4) @[src/main/scala/peripheral/VGA.scala 110:31]
    node ctrl_vblank_ie = bits(ctrlReg, 8, 8) @[src/main/scala/peripheral/VGA.scala 111:31]
    wire wire_in_vblank : UInt<1> @[src/main/scala/peripheral/VGA.scala 114:29]
    wire wire_curr_frame : UInt<4> @[src/main/scala/peripheral/VGA.scala 115:29]
    node upload_pix_addr = bits(uploadAddrReg, 15, 0) @[src/main/scala/peripheral/VGA.scala 119:41]
    node upload_frame_raw = bits(uploadAddrReg, 19, 16) @[src/main/scala/peripheral/VGA.scala 120:41]
    node _upload_frame_T = geq(upload_frame_raw, UInt<4>("hc")) @[src/main/scala/peripheral/VGA.scala 121:49]
    node upload_frame = mux(_upload_frame_T, UInt<4>("hb"), upload_frame_raw) @[src/main/scala/peripheral/VGA.scala 121:31]
    reg vblank_sync1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), vblank_sync1) @[src/main/scala/peripheral/VGA.scala 124:36]
    vblank_sync1 <= wire_in_vblank @[src/main/scala/peripheral/VGA.scala 124:36]
    reg vblank_synced : UInt<1>, clock with :
      reset => (UInt<1>("h0"), vblank_synced) @[src/main/scala/peripheral/VGA.scala 125:36]
    vblank_synced <= vblank_sync1 @[src/main/scala/peripheral/VGA.scala 125:36]
    reg curr_frame_sync1 : UInt, clock with :
      reset => (UInt<1>("h0"), curr_frame_sync1) @[src/main/scala/peripheral/VGA.scala 126:36]
    curr_frame_sync1 <= wire_curr_frame @[src/main/scala/peripheral/VGA.scala 126:36]
    reg curr_frame_synced : UInt, clock with :
      reset => (UInt<1>("h0"), curr_frame_synced) @[src/main/scala/peripheral/VGA.scala 127:36]
    curr_frame_synced <= curr_frame_sync1 @[src/main/scala/peripheral/VGA.scala 127:36]
    reg vblank_prev : UInt<1>, clock with :
      reset => (UInt<1>("h0"), vblank_prev) @[src/main/scala/peripheral/VGA.scala 136:37]
    vblank_prev <= vblank_synced @[src/main/scala/peripheral/VGA.scala 136:37]
    node _vblank_rising_edge_T = eq(vblank_prev, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 137:47]
    node vblank_rising_edge = and(vblank_synced, _vblank_rising_edge_T) @[src/main/scala/peripheral/VGA.scala 137:44]
    node _T = and(vblank_rising_edge, ctrl_vblank_ie) @[src/main/scala/peripheral/VGA.scala 139:29]
    when _T : @[src/main/scala/peripheral/VGA.scala 139:48]
      intrStatusReg <= UInt<1>("h1") @[src/main/scala/peripheral/VGA.scala 140:21]
    node _io_intr_T = neq(intrStatusReg, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 143:31]
    node _io_intr_T_1 = and(_io_intr_T, ctrl_vblank_ie) @[src/main/scala/peripheral/VGA.scala 143:40]
    io.intr <= _io_intr_T_1 @[src/main/scala/peripheral/VGA.scala 143:13]
    node addr = and(slave.io.bundle.address, UInt<8>("hff")) @[src/main/scala/peripheral/VGA.scala 146:52]
    node addr_id = eq(addr, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 147:33]
    node addr_status = eq(addr, UInt<3>("h4")) @[src/main/scala/peripheral/VGA.scala 148:33]
    node addr_intr_status = eq(addr, UInt<4>("h8")) @[src/main/scala/peripheral/VGA.scala 149:33]
    node addr_upload_addr = eq(addr, UInt<5>("h10")) @[src/main/scala/peripheral/VGA.scala 150:33]
    node addr_stream_data = eq(addr, UInt<5>("h14")) @[src/main/scala/peripheral/VGA.scala 151:33]
    node addr_ctrl = eq(addr, UInt<6>("h20")) @[src/main/scala/peripheral/VGA.scala 152:33]
    node _addr_palette_T = geq(addr, UInt<6>("h24")) @[src/main/scala/peripheral/VGA.scala 153:34]
    node _addr_palette_T_1 = lt(addr, UInt<7>("h60")) @[src/main/scala/peripheral/VGA.scala 153:66]
    node addr_palette = and(_addr_palette_T, _addr_palette_T_1) @[src/main/scala/peripheral/VGA.scala 153:57]
    node _palette_idx_T = sub(addr, UInt<6>("h24")) @[src/main/scala/peripheral/VGA.scala 154:34]
    node _palette_idx_T_1 = tail(_palette_idx_T, 1) @[src/main/scala/peripheral/VGA.scala 154:34]
    node palette_idx = shr(_palette_idx_T_1, 2) @[src/main/scala/peripheral/VGA.scala 154:56]
    wire read_data_prepared : UInt<32> @[src/main/scala/peripheral/VGA.scala 170:41]
    read_data_prepared <= UInt<32>("h0") @[src/main/scala/peripheral/VGA.scala 170:41]
    when addr_id : @[src/main/scala/peripheral/VGA.scala 172:19]
      read_data_prepared <= UInt<31>("h56474131") @[src/main/scala/peripheral/VGA.scala 173:26]
    else :
      when addr_ctrl : @[src/main/scala/peripheral/VGA.scala 174:27]
        read_data_prepared <= ctrlReg @[src/main/scala/peripheral/VGA.scala 175:26]
      else :
        when addr_status : @[src/main/scala/peripheral/VGA.scala 176:29]
          node read_data_prepared_lo_hi = cat(UInt<1>("h0"), vblank_synced) @[src/main/scala/peripheral/VGA.scala 177:32]
          node read_data_prepared_lo = cat(read_data_prepared_lo_hi, vblank_synced) @[src/main/scala/peripheral/VGA.scala 177:32]
          node read_data_prepared_hi_hi = cat(UInt<24>("h0"), curr_frame_synced) @[src/main/scala/peripheral/VGA.scala 177:32]
          node read_data_prepared_hi = cat(read_data_prepared_hi_hi, UInt<2>("h0")) @[src/main/scala/peripheral/VGA.scala 177:32]
          node _read_data_prepared_T = cat(read_data_prepared_hi, read_data_prepared_lo) @[src/main/scala/peripheral/VGA.scala 177:32]
          read_data_prepared <= _read_data_prepared_T @[src/main/scala/peripheral/VGA.scala 177:26]
        else :
          when addr_intr_status : @[src/main/scala/peripheral/VGA.scala 185:34]
            read_data_prepared <= intrStatusReg @[src/main/scala/peripheral/VGA.scala 186:26]
          else :
            when addr_upload_addr : @[src/main/scala/peripheral/VGA.scala 187:34]
              read_data_prepared <= uploadAddrReg @[src/main/scala/peripheral/VGA.scala 188:26]
            else :
              when addr_palette : @[src/main/scala/peripheral/VGA.scala 189:30]
                node _read_data_prepared_T_1 = bits(palette_idx, 3, 0)
                read_data_prepared <= paletteReg[_read_data_prepared_T_1] @[src/main/scala/peripheral/VGA.scala 190:26]
    slave.io.bundle.read_valid <= slave.io.bundle.read @[src/main/scala/peripheral/VGA.scala 195:32]
    slave.io.bundle.read_data <= read_data_prepared @[src/main/scala/peripheral/VGA.scala 196:32]
    framebuffer.clka <= clock @[src/main/scala/peripheral/VGA.scala 199:25]
    wire fb_write_en : UInt<1> @[src/main/scala/peripheral/VGA.scala 201:36]
    fb_write_en <= UInt<1>("h0") @[src/main/scala/peripheral/VGA.scala 201:36]
    wire fb_write_addr : UInt<13> @[src/main/scala/peripheral/VGA.scala 202:36]
    fb_write_addr <= UInt<13>("h0") @[src/main/scala/peripheral/VGA.scala 202:36]
    wire fb_write_data : UInt<32> @[src/main/scala/peripheral/VGA.scala 203:36]
    fb_write_data <= UInt<32>("h0") @[src/main/scala/peripheral/VGA.scala 203:36]
    when slave.io.bundle.write : @[src/main/scala/peripheral/VGA.scala 206:33]
      when addr_ctrl : @[src/main/scala/peripheral/VGA.scala 207:23]
        node requested_frame = bits(slave.io.bundle.write_data, 7, 4) @[src/main/scala/peripheral/VGA.scala 208:57]
        node display_enable = bits(slave.io.bundle.write_data, 0, 0) @[src/main/scala/peripheral/VGA.scala 209:57]
        node _T_1 = lt(requested_frame, UInt<4>("hc")) @[src/main/scala/peripheral/VGA.scala 210:30]
        when _T_1 : @[src/main/scala/peripheral/VGA.scala 210:38]
          ctrlReg <= slave.io.bundle.write_data @[src/main/scala/peripheral/VGA.scala 211:19]
        else :
          node _ctrlReg_T = bits(ctrlReg, 31, 8) @[src/main/scala/peripheral/VGA.scala 213:33]
          node _ctrlReg_T_1 = bits(ctrlReg, 7, 4) @[src/main/scala/peripheral/VGA.scala 213:49]
          node _ctrlReg_T_2 = cat(UInt<3>("h0"), display_enable) @[src/main/scala/peripheral/VGA.scala 213:60]
          node ctrlReg_hi = cat(_ctrlReg_T, _ctrlReg_T_1) @[src/main/scala/peripheral/VGA.scala 213:25]
          node _ctrlReg_T_3 = cat(ctrlReg_hi, _ctrlReg_T_2) @[src/main/scala/peripheral/VGA.scala 213:25]
          ctrlReg <= _ctrlReg_T_3 @[src/main/scala/peripheral/VGA.scala 213:19]
      else :
        when addr_intr_status : @[src/main/scala/peripheral/VGA.scala 215:36]
          node _intrStatusReg_T = not(slave.io.bundle.write_data) @[src/main/scala/peripheral/VGA.scala 216:42]
          node _intrStatusReg_T_1 = and(intrStatusReg, _intrStatusReg_T) @[src/main/scala/peripheral/VGA.scala 216:40]
          intrStatusReg <= _intrStatusReg_T_1 @[src/main/scala/peripheral/VGA.scala 216:23]
        else :
          when addr_upload_addr : @[src/main/scala/peripheral/VGA.scala 217:36]
            uploadAddrReg <= slave.io.bundle.write_data @[src/main/scala/peripheral/VGA.scala 218:23]
          else :
            when addr_stream_data : @[src/main/scala/peripheral/VGA.scala 219:36]
              node word_offset = shr(upload_pix_addr, 3) @[src/main/scala/peripheral/VGA.scala 221:51]
              node frame_base = mul(upload_frame, UInt<10>("h200")) @[src/main/scala/peripheral/VGA.scala 222:46]
              node _fb_addr_T = add(frame_base, word_offset) @[src/main/scala/peripheral/VGA.scala 223:44]
              node fb_addr = tail(_fb_addr_T, 1) @[src/main/scala/peripheral/VGA.scala 223:44]
              fb_write_en <= UInt<1>("h1") @[src/main/scala/peripheral/VGA.scala 225:23]
              fb_write_addr <= fb_addr @[src/main/scala/peripheral/VGA.scala 226:23]
              fb_write_data <= slave.io.bundle.write_data @[src/main/scala/peripheral/VGA.scala 227:23]
              node _next_addr_T = add(upload_pix_addr, UInt<4>("h8")) @[src/main/scala/peripheral/VGA.scala 229:44]
              node next_addr = tail(_next_addr_T, 1) @[src/main/scala/peripheral/VGA.scala 229:44]
              node _wrapped_addr_T = geq(next_addr, UInt<13>("h1000")) @[src/main/scala/peripheral/VGA.scala 230:42]
              node wrapped_addr = mux(_wrapped_addr_T, UInt<1>("h0"), next_addr) @[src/main/scala/peripheral/VGA.scala 230:31]
              node _uploadAddrReg_T = cat(upload_frame, wrapped_addr) @[src/main/scala/peripheral/VGA.scala 231:29]
              uploadAddrReg <= _uploadAddrReg_T @[src/main/scala/peripheral/VGA.scala 231:23]
            else :
              when addr_palette : @[src/main/scala/peripheral/VGA.scala 232:32]
                node _T_2 = bits(palette_idx, 3, 0)
                node _paletteReg_T = bits(slave.io.bundle.write_data, 5, 0) @[src/main/scala/peripheral/VGA.scala 233:62]
                paletteReg[_T_2] <= _paletteReg_T @[src/main/scala/peripheral/VGA.scala 233:33]
    framebuffer.wea <= fb_write_en @[src/main/scala/peripheral/VGA.scala 237:26]
    framebuffer.addra <= fb_write_addr @[src/main/scala/peripheral/VGA.scala 238:26]
    framebuffer.dina <= fb_write_data @[src/main/scala/peripheral/VGA.scala 239:26]
    reg h_count : UInt<10>, io.pixClock with :
      reset => (reset, UInt<10>("h0")) @[src/main/scala/peripheral/VGA.scala 244:26]
    reg v_count : UInt<10>, io.pixClock with :
      reset => (reset, UInt<10>("h0")) @[src/main/scala/peripheral/VGA.scala 245:26]
    node _T_3 = eq(h_count, UInt<10>("h33f")) @[src/main/scala/peripheral/VGA.scala 247:18]
    when _T_3 : @[src/main/scala/peripheral/VGA.scala 247:39]
      h_count <= UInt<1>("h0") @[src/main/scala/peripheral/VGA.scala 248:15]
      node _T_4 = eq(v_count, UInt<10>("h207")) @[src/main/scala/peripheral/VGA.scala 249:20]
      when _T_4 : @[src/main/scala/peripheral/VGA.scala 249:41]
        v_count <= UInt<1>("h0") @[src/main/scala/peripheral/VGA.scala 250:17]
      else :
        node _v_count_T = add(v_count, UInt<1>("h1")) @[src/main/scala/peripheral/VGA.scala 252:28]
        node _v_count_T_1 = tail(_v_count_T, 1) @[src/main/scala/peripheral/VGA.scala 252:28]
        v_count <= _v_count_T_1 @[src/main/scala/peripheral/VGA.scala 252:17]
    else :
      node _h_count_T = add(h_count, UInt<1>("h1")) @[src/main/scala/peripheral/VGA.scala 255:26]
      node _h_count_T_1 = tail(_h_count_T, 1) @[src/main/scala/peripheral/VGA.scala 255:26]
      h_count <= _h_count_T_1 @[src/main/scala/peripheral/VGA.scala 255:15]
    node _h_sync_pulse_T = geq(h_count, UInt<10>("h298")) @[src/main/scala/peripheral/VGA.scala 258:33]
    node _h_sync_pulse_T_1 = lt(h_count, UInt<10>("h2c0")) @[src/main/scala/peripheral/VGA.scala 258:69]
    node h_sync_pulse = and(_h_sync_pulse_T, _h_sync_pulse_T_1) @[src/main/scala/peripheral/VGA.scala 258:57]
    node _v_sync_pulse_T = geq(v_count, UInt<9>("h1e9")) @[src/main/scala/peripheral/VGA.scala 259:33]
    node _v_sync_pulse_T_1 = lt(v_count, UInt<9>("h1ec")) @[src/main/scala/peripheral/VGA.scala 259:69]
    node v_sync_pulse = and(_v_sync_pulse_T, _v_sync_pulse_T_1) @[src/main/scala/peripheral/VGA.scala 259:57]
    node _hsync_d1_T = eq(h_sync_pulse, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 260:32]
    reg hsync_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), hsync_d1) @[src/main/scala/peripheral/VGA.scala 260:31]
    hsync_d1 <= _hsync_d1_T @[src/main/scala/peripheral/VGA.scala 260:31]
    node _vsync_d1_T = eq(v_sync_pulse, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 261:32]
    reg vsync_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), vsync_d1) @[src/main/scala/peripheral/VGA.scala 261:31]
    vsync_d1 <= _vsync_d1_T @[src/main/scala/peripheral/VGA.scala 261:31]
    reg io_hsync_REG : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), io_hsync_REG) @[src/main/scala/peripheral/VGA.scala 262:24]
    io_hsync_REG <= hsync_d1 @[src/main/scala/peripheral/VGA.scala 262:24]
    io.hsync <= io_hsync_REG @[src/main/scala/peripheral/VGA.scala 262:14]
    reg io_vsync_REG : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), io_vsync_REG) @[src/main/scala/peripheral/VGA.scala 263:24]
    io_vsync_REG <= vsync_d1 @[src/main/scala/peripheral/VGA.scala 263:24]
    io.vsync <= io_vsync_REG @[src/main/scala/peripheral/VGA.scala 263:14]
    node h_active = lt(h_count, UInt<10>("h280")) @[src/main/scala/peripheral/VGA.scala 265:28]
    node v_active = lt(v_count, UInt<9>("h1e0")) @[src/main/scala/peripheral/VGA.scala 266:28]
    reg x_px : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), x_px) @[src/main/scala/peripheral/VGA.scala 268:23]
    x_px <= h_count @[src/main/scala/peripheral/VGA.scala 268:23]
    reg y_px : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), y_px) @[src/main/scala/peripheral/VGA.scala 269:23]
    y_px <= v_count @[src/main/scala/peripheral/VGA.scala 269:23]
    node _in_display_x_T = geq(x_px, UInt<8>("h80")) @[src/main/scala/peripheral/VGA.scala 271:30]
    node _in_display_x_T_1 = lt(x_px, UInt<10>("h200")) @[src/main/scala/peripheral/VGA.scala 271:57]
    node in_display_x = and(_in_display_x_T, _in_display_x_T_1) @[src/main/scala/peripheral/VGA.scala 271:48]
    node _in_display_y_T = geq(y_px, UInt<6>("h30")) @[src/main/scala/peripheral/VGA.scala 272:30]
    node _in_display_y_T_1 = lt(y_px, UInt<9>("h1b0")) @[src/main/scala/peripheral/VGA.scala 272:56]
    node in_display_y = and(_in_display_y_T, _in_display_y_T_1) @[src/main/scala/peripheral/VGA.scala 272:47]
    node in_display = and(in_display_x, in_display_y) @[src/main/scala/peripheral/VGA.scala 273:37]
    node _rel_x_T = geq(x_px, UInt<8>("h80")) @[src/main/scala/peripheral/VGA.scala 275:26]
    node _rel_x_T_1 = sub(x_px, UInt<8>("h80")) @[src/main/scala/peripheral/VGA.scala 275:49]
    node _rel_x_T_2 = tail(_rel_x_T_1, 1) @[src/main/scala/peripheral/VGA.scala 275:49]
    node rel_x = mux(_rel_x_T, _rel_x_T_2, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 275:20]
    node _rel_y_T = geq(y_px, UInt<6>("h30")) @[src/main/scala/peripheral/VGA.scala 276:26]
    node _rel_y_T_1 = sub(y_px, UInt<6>("h30")) @[src/main/scala/peripheral/VGA.scala 276:48]
    node _rel_y_T_2 = tail(_rel_y_T_1, 1) @[src/main/scala/peripheral/VGA.scala 276:48]
    node rel_y = mux(_rel_y_T, _rel_y_T_2, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 276:20]
    node frame_x_mult = mul(rel_x, UInt<14>("h2aab")) @[src/main/scala/peripheral/VGA.scala 278:30]
    node frame_x_div = bits(frame_x_mult, 23, 16) @[src/main/scala/peripheral/VGA.scala 279:36]
    node frame_y_mult = mul(rel_y, UInt<14>("h2aab")) @[src/main/scala/peripheral/VGA.scala 280:30]
    node frame_y_div = bits(frame_y_mult, 23, 16) @[src/main/scala/peripheral/VGA.scala 281:36]
    node _frame_x_T = geq(frame_x_div, UInt<7>("h40")) @[src/main/scala/peripheral/VGA.scala 282:40]
    node _frame_x_T_1 = bits(frame_x_div, 5, 0) @[src/main/scala/peripheral/VGA.scala 282:90]
    node frame_x = mux(_frame_x_T, UInt<6>("h3f"), _frame_x_T_1) @[src/main/scala/peripheral/VGA.scala 282:27]
    node _frame_y_T = geq(frame_y_div, UInt<7>("h40")) @[src/main/scala/peripheral/VGA.scala 283:40]
    node _frame_y_T_1 = bits(frame_y_div, 5, 0) @[src/main/scala/peripheral/VGA.scala 283:92]
    node frame_y = mux(_frame_y_T, UInt<6>("h3f"), _frame_y_T_1) @[src/main/scala/peripheral/VGA.scala 283:27]
    reg curr_frame_sync1_1 : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), curr_frame_sync1_1) @[src/main/scala/peripheral/VGA.scala 286:35]
    curr_frame_sync1_1 <= ctrl_frame_sel @[src/main/scala/peripheral/VGA.scala 286:35]
    reg curr_frame : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), curr_frame) @[src/main/scala/peripheral/VGA.scala 287:35]
    curr_frame <= curr_frame_sync1_1 @[src/main/scala/peripheral/VGA.scala 287:35]
    reg display_enabled_sync1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), display_enabled_sync1) @[src/main/scala/peripheral/VGA.scala 289:40]
    display_enabled_sync1 <= ctrl_en @[src/main/scala/peripheral/VGA.scala 289:40]
    reg display_enabled : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), display_enabled) @[src/main/scala/peripheral/VGA.scala 290:40]
    display_enabled <= display_enabled_sync1 @[src/main/scala/peripheral/VGA.scala 290:40]
    reg blanking_sync1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), blanking_sync1) @[src/main/scala/peripheral/VGA.scala 292:33]
    blanking_sync1 <= ctrl_blank @[src/main/scala/peripheral/VGA.scala 292:33]
    reg blanking : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), blanking) @[src/main/scala/peripheral/VGA.scala 293:33]
    blanking <= blanking_sync1 @[src/main/scala/peripheral/VGA.scala 293:33]
    reg palette_sync1 : UInt<6>[16], io.pixClock with :
      reset => (UInt<1>("h0"), palette_sync1) @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1 <= paletteReg @[src/main/scala/peripheral/VGA.scala 295:32]
    reg palette_sync : UInt<6>[16], io.pixClock with :
      reset => (UInt<1>("h0"), palette_sync) @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync <= palette_sync1 @[src/main/scala/peripheral/VGA.scala 296:32]
    reg frame_x_d1 : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), frame_x_d1) @[src/main/scala/peripheral/VGA.scala 299:37]
    frame_x_d1 <= frame_x @[src/main/scala/peripheral/VGA.scala 299:37]
    reg frame_y_d1 : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), frame_y_d1) @[src/main/scala/peripheral/VGA.scala 300:37]
    frame_y_d1 <= frame_y @[src/main/scala/peripheral/VGA.scala 300:37]
    reg in_display_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), in_display_d1) @[src/main/scala/peripheral/VGA.scala 301:37]
    in_display_d1 <= in_display @[src/main/scala/peripheral/VGA.scala 301:37]
    reg in_display_d2 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), in_display_d2) @[src/main/scala/peripheral/VGA.scala 302:37]
    in_display_d2 <= in_display_d1 @[src/main/scala/peripheral/VGA.scala 302:37]
    reg display_enabled_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), display_enabled_d1) @[src/main/scala/peripheral/VGA.scala 303:37]
    display_enabled_d1 <= display_enabled @[src/main/scala/peripheral/VGA.scala 303:37]
    reg display_enabled_d2 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), display_enabled_d2) @[src/main/scala/peripheral/VGA.scala 304:37]
    display_enabled_d2 <= display_enabled_d1 @[src/main/scala/peripheral/VGA.scala 304:37]
    reg blanking_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), blanking_d1) @[src/main/scala/peripheral/VGA.scala 305:37]
    blanking_d1 <= blanking @[src/main/scala/peripheral/VGA.scala 305:37]
    reg blanking_d2 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), blanking_d2) @[src/main/scala/peripheral/VGA.scala 306:37]
    blanking_d2 <= blanking_d1 @[src/main/scala/peripheral/VGA.scala 306:37]
    reg h_active_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), h_active_d1) @[src/main/scala/peripheral/VGA.scala 308:30]
    h_active_d1 <= h_active @[src/main/scala/peripheral/VGA.scala 308:30]
    reg v_active_d1 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), v_active_d1) @[src/main/scala/peripheral/VGA.scala 309:30]
    v_active_d1 <= v_active @[src/main/scala/peripheral/VGA.scala 309:30]
    reg h_active_d2 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), h_active_d2) @[src/main/scala/peripheral/VGA.scala 310:30]
    h_active_d2 <= h_active_d1 @[src/main/scala/peripheral/VGA.scala 310:30]
    reg v_active_d2 : UInt<1>, io.pixClock with :
      reset => (UInt<1>("h0"), v_active_d2) @[src/main/scala/peripheral/VGA.scala 311:30]
    v_active_d2 <= v_active_d1 @[src/main/scala/peripheral/VGA.scala 311:30]
    node _pixel_idx_T = mul(frame_y, UInt<7>("h40")) @[src/main/scala/peripheral/VGA.scala 313:33]
    node _pixel_idx_T_1 = add(_pixel_idx_T, frame_x) @[src/main/scala/peripheral/VGA.scala 313:49]
    node pixel_idx = tail(_pixel_idx_T_1, 1) @[src/main/scala/peripheral/VGA.scala 313:49]
    node word_offset_1 = shr(pixel_idx, 3) @[src/main/scala/peripheral/VGA.scala 314:35]
    node pixel_in_word = bits(pixel_idx, 2, 0) @[src/main/scala/peripheral/VGA.scala 315:34]
    node frame_base_1 = mul(curr_frame, UInt<10>("h200")) @[src/main/scala/peripheral/VGA.scala 316:36]
    node _fb_read_addr_T = add(frame_base_1, word_offset_1) @[src/main/scala/peripheral/VGA.scala 317:36]
    node fb_read_addr = tail(_fb_read_addr_T, 1) @[src/main/scala/peripheral/VGA.scala 317:36]
    framebuffer.clkb <= io.pixClock @[src/main/scala/peripheral/VGA.scala 319:26]
    framebuffer.addrb <= fb_read_addr @[src/main/scala/peripheral/VGA.scala 320:26]
    reg pixel_in_word_d1 : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 322:35]
    pixel_in_word_d1 <= pixel_in_word @[src/main/scala/peripheral/VGA.scala 322:35]
    wire pixel_4bit : UInt<4> @[src/main/scala/peripheral/VGA.scala 325:33]
    pixel_4bit <= UInt<4>("h0") @[src/main/scala/peripheral/VGA.scala 325:33]
    node _pixel_4bit_T = bits(framebuffer.doutb, 3, 0) @[src/main/scala/peripheral/VGA.scala 328:23]
    node _pixel_4bit_T_1 = bits(framebuffer.doutb, 7, 4) @[src/main/scala/peripheral/VGA.scala 329:23]
    node _pixel_4bit_T_2 = bits(framebuffer.doutb, 11, 8) @[src/main/scala/peripheral/VGA.scala 330:23]
    node _pixel_4bit_T_3 = bits(framebuffer.doutb, 15, 12) @[src/main/scala/peripheral/VGA.scala 331:23]
    node _pixel_4bit_T_4 = bits(framebuffer.doutb, 19, 16) @[src/main/scala/peripheral/VGA.scala 332:23]
    node _pixel_4bit_T_5 = bits(framebuffer.doutb, 23, 20) @[src/main/scala/peripheral/VGA.scala 333:23]
    node _pixel_4bit_T_6 = bits(framebuffer.doutb, 27, 24) @[src/main/scala/peripheral/VGA.scala 334:23]
    node _pixel_4bit_T_7 = bits(framebuffer.doutb, 31, 28) @[src/main/scala/peripheral/VGA.scala 335:23]
    node _pixel_4bit_T_8 = eq(UInt<1>("h0"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_9 = mux(_pixel_4bit_T_8, _pixel_4bit_T, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_10 = eq(UInt<1>("h1"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_11 = mux(_pixel_4bit_T_10, _pixel_4bit_T_1, _pixel_4bit_T_9) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_12 = eq(UInt<2>("h2"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_13 = mux(_pixel_4bit_T_12, _pixel_4bit_T_2, _pixel_4bit_T_11) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_14 = eq(UInt<2>("h3"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_15 = mux(_pixel_4bit_T_14, _pixel_4bit_T_3, _pixel_4bit_T_13) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_16 = eq(UInt<3>("h4"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_17 = mux(_pixel_4bit_T_16, _pixel_4bit_T_4, _pixel_4bit_T_15) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_18 = eq(UInt<3>("h5"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_19 = mux(_pixel_4bit_T_18, _pixel_4bit_T_5, _pixel_4bit_T_17) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_20 = eq(UInt<3>("h6"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_21 = mux(_pixel_4bit_T_20, _pixel_4bit_T_6, _pixel_4bit_T_19) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_22 = eq(UInt<3>("h7"), pixel_in_word_d1) @[src/main/scala/peripheral/VGA.scala 326:51]
    node _pixel_4bit_T_23 = mux(_pixel_4bit_T_22, _pixel_4bit_T_7, _pixel_4bit_T_21) @[src/main/scala/peripheral/VGA.scala 326:51]
    pixel_4bit <= _pixel_4bit_T_23 @[src/main/scala/peripheral/VGA.scala 326:16]
    wire output_color : UInt<6> @[src/main/scala/peripheral/VGA.scala 341:35]
    output_color <= UInt<6>("h0") @[src/main/scala/peripheral/VGA.scala 341:35]
    when blanking : @[src/main/scala/peripheral/VGA.scala 342:20]
      output_color <= UInt<1>("h0") @[src/main/scala/peripheral/VGA.scala 343:20]
    else :
      node _T_5 = and(display_enabled, in_display_d1) @[src/main/scala/peripheral/VGA.scala 344:32]
      when _T_5 : @[src/main/scala/peripheral/VGA.scala 344:50]
        output_color <= palette_sync[pixel_4bit] @[src/main/scala/peripheral/VGA.scala 345:20]
      else :
        output_color <= UInt<1>("h1") @[src/main/scala/peripheral/VGA.scala 347:20]
    reg x_px_d1 : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), x_px_d1) @[src/main/scala/peripheral/VGA.scala 352:26]
    x_px_d1 <= x_px @[src/main/scala/peripheral/VGA.scala 352:26]
    reg y_px_d1 : UInt, io.pixClock with :
      reset => (UInt<1>("h0"), y_px_d1) @[src/main/scala/peripheral/VGA.scala 353:26]
    y_px_d1 <= y_px @[src/main/scala/peripheral/VGA.scala 353:26]
    node _in_cursor_x_T = geq(x_px_d1, io.cursor_x) @[src/main/scala/peripheral/VGA.scala 356:32]
    node _in_cursor_x_T_1 = add(io.cursor_x, UInt<4>("ha")) @[src/main/scala/peripheral/VGA.scala 356:75]
    node _in_cursor_x_T_2 = tail(_in_cursor_x_T_1, 1) @[src/main/scala/peripheral/VGA.scala 356:75]
    node _in_cursor_x_T_3 = lt(x_px_d1, _in_cursor_x_T_2) @[src/main/scala/peripheral/VGA.scala 356:60]
    node in_cursor_x = and(_in_cursor_x_T, _in_cursor_x_T_3) @[src/main/scala/peripheral/VGA.scala 356:48]
    node _in_cursor_y_T = geq(y_px_d1, io.cursor_y) @[src/main/scala/peripheral/VGA.scala 357:32]
    node _in_cursor_y_T_1 = add(io.cursor_y, UInt<4>("ha")) @[src/main/scala/peripheral/VGA.scala 357:75]
    node _in_cursor_y_T_2 = tail(_in_cursor_y_T_1, 1) @[src/main/scala/peripheral/VGA.scala 357:75]
    node _in_cursor_y_T_3 = lt(y_px_d1, _in_cursor_y_T_2) @[src/main/scala/peripheral/VGA.scala 357:60]
    node in_cursor_y = and(_in_cursor_y_T, _in_cursor_y_T_3) @[src/main/scala/peripheral/VGA.scala 357:48]
    node is_cursor = and(in_cursor_x, in_cursor_y) @[src/main/scala/peripheral/VGA.scala 358:35]
    node final_color = mux(is_cursor, UInt<6>("h30"), output_color) @[src/main/scala/peripheral/VGA.scala 361:26]
    node _io_rrggbb_T = and(h_active_d2, v_active_d2) @[src/main/scala/peripheral/VGA.scala 365:39]
    node _io_rrggbb_T_1 = mux(_io_rrggbb_T, final_color, UInt<1>("h0")) @[src/main/scala/peripheral/VGA.scala 365:26]
    io.rrggbb <= _io_rrggbb_T_1 @[src/main/scala/peripheral/VGA.scala 365:20]
    node _io_activevideo_T = and(h_active_d2, v_active_d2) @[src/main/scala/peripheral/VGA.scala 366:35]
    io.activevideo <= _io_activevideo_T @[src/main/scala/peripheral/VGA.scala 366:20]
    io.x_pos <= x_px_d1 @[src/main/scala/peripheral/VGA.scala 369:14]
    io.y_pos <= y_px_d1 @[src/main/scala/peripheral/VGA.scala 370:14]
    node in_vblank = geq(v_count, UInt<9>("h1e0")) @[src/main/scala/peripheral/VGA.scala 372:29]
    wire_in_vblank <= in_vblank @[src/main/scala/peripheral/VGA.scala 374:21]
    wire_curr_frame <= curr_frame @[src/main/scala/peripheral/VGA.scala 375:21]

  module AXI4LiteSlave_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { address : UInt<8>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4]}} @[src/main/scala/bus/AXI4Lite.scala 111:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 116:22]
    reg addr : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/bus/AXI4Lite.scala 118:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 119:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 122:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 123:18]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 124:26]
    io.channels.read_data_channel.RDATA <= read_data @[src/main/scala/bus/AXI4Lite.scala 125:39]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 127:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 128:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 129:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 130:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 131:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 132:39]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 135:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 136:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 138:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 139:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 140:26]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 142:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 143:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 144:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 145:41]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 147:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 148:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 149:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:13]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 154:13]
      when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 158:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 159:17]
      else :
        when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 160:61]
          state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 162:17]
          AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 163:17]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 168:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 170:17]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 171:17]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 172:17]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 173:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when io.bundle.read_valid : @[src/main/scala/bus/AXI4Lite.scala 178:34]
            read_data <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 180:19]
            RVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 181:19]
            RRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 182:19]
            read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 183:19]
          node _T_10 = and(RVALID, io.channels.read_data_channel.RREADY) @[src/main/scala/bus/AXI4Lite.scala 186:19]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 186:60]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 188:16]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 194:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 194:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 196:17]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 197:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:17]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 199:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 204:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 204:61]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 206:22]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                wire _WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                write_strobe <= _WIRE @[src/main/scala/bus/AXI4Lite.scala 207:22]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 209:22]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 210:22]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
                write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 215:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 216:14]
                BRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 217:14]
                node _T_26 = and(BVALID, io.channels.write_response_channel.BREADY) @[src/main/scala/bus/AXI4Lite.scala 219:19]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 219:65]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 221:16]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 222:16]


  module Tx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 21:14]

    reg shiftReg : UInt, clock with :
      reset => (reset, UInt<11>("h7ff")) @[src/main/scala/peripheral/UART.scala 28:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/peripheral/UART.scala 29:25]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/peripheral/UART.scala 30:25]
    node _io_channel_ready_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 32:31]
    node _io_channel_ready_T_1 = eq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 32:52]
    node _io_channel_ready_T_2 = and(_io_channel_ready_T, _io_channel_ready_T_1) @[src/main/scala/peripheral/UART.scala 32:40]
    io.channel.ready <= _io_channel_ready_T_2 @[src/main/scala/peripheral/UART.scala 32:20]
    node _io_txd_T = bits(shiftReg, 0, 0) @[src/main/scala/peripheral/UART.scala 33:31]
    io.txd <= _io_txd_T @[src/main/scala/peripheral/UART.scala 33:20]
    node _T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 35:15]
    when _T : @[src/main/scala/peripheral/UART.scala 35:24]
      cntReg <= UInt<9>("h1b1") @[src/main/scala/peripheral/UART.scala 36:12]
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 37:18]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 37:27]
        node shift = shr(shiftReg, 1) @[src/main/scala/peripheral/UART.scala 38:28]
        node _shiftReg_T = bits(shift, 9, 0) @[src/main/scala/peripheral/UART.scala 39:33]
        node _shiftReg_T_1 = cat(UInt<1>("h1"), _shiftReg_T) @[src/main/scala/peripheral/UART.scala 39:22]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/peripheral/UART.scala 39:16]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 40:27]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/peripheral/UART.scala 40:27]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/peripheral/UART.scala 40:16]
      else :
        when io.channel.valid : @[src/main/scala/peripheral/UART.scala 42:30]
          node _shiftReg_T_2 = cat(UInt<2>("h3"), io.channel.bits) @[src/main/scala/peripheral/UART.scala 43:28]
          node _shiftReg_T_3 = cat(_shiftReg_T_2, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 43:24]
          shiftReg <= _shiftReg_T_3 @[src/main/scala/peripheral/UART.scala 43:18]
          bitsReg <= UInt<4>("hb") @[src/main/scala/peripheral/UART.scala 44:18]
        else :
          shiftReg <= UInt<11>("h7ff") @[src/main/scala/peripheral/UART.scala 46:18]
    else :
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 50:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/peripheral/UART.scala 50:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/peripheral/UART.scala 50:12]


  module Buffer :
    input clock : Clock
    input reset : Reset
    output io : { flip in : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, out : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 102:14]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 108:37]
    reg dataReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/peripheral/UART.scala 109:37]
    node _io_in_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 111:28]
    io.in.ready <= _io_in_ready_T @[src/main/scala/peripheral/UART.scala 111:16]
    node _io_out_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 112:28]
    io.out.valid <= _io_out_valid_T @[src/main/scala/peripheral/UART.scala 112:16]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 114:17]
    when _T : @[src/main/scala/peripheral/UART.scala 114:28]
      when io.in.valid : @[src/main/scala/peripheral/UART.scala 115:23]
        dataReg <= io.in.bits @[src/main/scala/peripheral/UART.scala 116:16]
        stateReg <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 117:16]
    else :
      when io.out.ready : @[src/main/scala/peripheral/UART.scala 120:24]
        stateReg <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 121:16]
    io.out.bits <= dataReg @[src/main/scala/peripheral/UART.scala 124:15]

  module BufferedTx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 131:14]

    inst tx of Tx @[src/main/scala/peripheral/UART.scala 135:19]
    tx.clock <= clock
    tx.reset <= reset
    inst buf of Buffer @[src/main/scala/peripheral/UART.scala 136:19]
    buf.clock <= clock
    buf.reset <= reset
    buf.io.in <= io.channel @[src/main/scala/peripheral/UART.scala 138:13]
    tx.io.channel <= buf.io.out @[src/main/scala/peripheral/UART.scala 139:17]
    io.txd <= tx.io.txd @[src/main/scala/peripheral/UART.scala 140:10]

  module Rx :
    input clock : Clock
    input reset : Reset
    output io : { flip rxd : UInt<1>, channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 60:14]

    reg rxReg_REG : UInt, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 69:30]
    rxReg_REG <= io.rxd @[src/main/scala/peripheral/UART.scala 69:30]
    reg rxReg : UInt, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 69:22]
    rxReg <= rxReg_REG @[src/main/scala/peripheral/UART.scala 69:22]
    reg shiftReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/peripheral/UART.scala 71:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/peripheral/UART.scala 72:25]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/peripheral/UART.scala 73:25]
    reg valReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 74:25]
    node _T = neq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 76:15]
    when _T : @[src/main/scala/peripheral/UART.scala 76:24]
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 77:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/peripheral/UART.scala 77:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/peripheral/UART.scala 77:12]
    else :
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 78:22]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 78:31]
        cntReg <= UInt<9>("h1b1") @[src/main/scala/peripheral/UART.scala 79:14]
        node _shiftReg_T = shr(shiftReg, 1) @[src/main/scala/peripheral/UART.scala 80:37]
        node _shiftReg_T_1 = cat(rxReg, _shiftReg_T) @[src/main/scala/peripheral/UART.scala 80:20]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/peripheral/UART.scala 80:14]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 81:25]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/peripheral/UART.scala 81:25]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/peripheral/UART.scala 81:14]
        node _T_2 = eq(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 82:18]
        when _T_2 : @[src/main/scala/peripheral/UART.scala 82:27]
          valReg <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 83:14]
      else :
        node _T_3 = eq(rxReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 85:20]
        when _T_3 : @[src/main/scala/peripheral/UART.scala 85:29]
          cntReg <= UInt<10>("h28a") @[src/main/scala/peripheral/UART.scala 86:13]
          bitsReg <= UInt<4>("h8") @[src/main/scala/peripheral/UART.scala 87:13]
    node _T_4 = and(valReg, io.channel.ready) @[src/main/scala/peripheral/UART.scala 90:15]
    when _T_4 : @[src/main/scala/peripheral/UART.scala 90:36]
      valReg <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 91:12]
    io.channel.bits <= shiftReg @[src/main/scala/peripheral/UART.scala 94:20]
    io.channel.valid <= valReg @[src/main/scala/peripheral/UART.scala 95:20]

  module Uart :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip rxd : UInt<1>, txd : UInt<1>, signal_interrupt : UInt<1>} @[src/main/scala/peripheral/UART.scala 164:14]

    reg interrupt : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 171:26]
    reg rxData : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 172:26]
    inst slave of AXI4LiteSlave_2 @[src/main/scala/peripheral/UART.scala 173:25]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/UART.scala 174:21]
    inst tx of BufferedTx @[src/main/scala/peripheral/UART.scala 176:18]
    tx.clock <= clock
    tx.reset <= reset
    inst rx of Rx @[src/main/scala/peripheral/UART.scala 177:18]
    rx.clock <= clock
    rx.reset <= reset
    node addr = and(slave.io.bundle.address, UInt<8>("hff")) @[src/main/scala/peripheral/UART.scala 181:48]
    node addr_status = eq(addr, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 182:29]
    node addr_baud_rate = eq(addr, UInt<3>("h4")) @[src/main/scala/peripheral/UART.scala 183:29]
    node addr_interrupt = eq(addr, UInt<4>("h8")) @[src/main/scala/peripheral/UART.scala 184:29]
    node addr_rx_data = eq(addr, UInt<4>("hc")) @[src/main/scala/peripheral/UART.scala 185:29]
    node addr_tx_data = eq(addr, UInt<5>("h10")) @[src/main/scala/peripheral/UART.scala 186:29]
    slave.io.bundle.read_data <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 188:30]
    slave.io.bundle.read_valid <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 189:30]
    when slave.io.bundle.read : @[src/main/scala/peripheral/UART.scala 190:30]
      when addr_status : @[src/main/scala/peripheral/UART.scala 191:23]
        node slave_io_bundle_read_data_hi = cat(UInt<30>("h0"), rx.io.channel.valid) @[src/main/scala/peripheral/UART.scala 193:39]
        node _slave_io_bundle_read_data_T = cat(slave_io_bundle_read_data_hi, tx.io.channel.ready) @[src/main/scala/peripheral/UART.scala 193:39]
        slave.io.bundle.read_data <= _slave_io_bundle_read_data_T @[src/main/scala/peripheral/UART.scala 193:33]
      else :
        when addr_baud_rate : @[src/main/scala/peripheral/UART.scala 194:32]
          slave.io.bundle.read_data <= UInt<17>("h1c200") @[src/main/scala/peripheral/UART.scala 195:33]
        else :
          when addr_rx_data : @[src/main/scala/peripheral/UART.scala 196:30]
            slave.io.bundle.read_data <= rxData @[src/main/scala/peripheral/UART.scala 197:33]
            interrupt <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 198:33]
    tx.io.channel.valid <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 203:23]
    tx.io.channel.bits <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 204:23]
    when slave.io.bundle.write : @[src/main/scala/peripheral/UART.scala 205:31]
      when addr_interrupt : @[src/main/scala/peripheral/UART.scala 206:26]
        node _interrupt_T = neq(slave.io.bundle.write_data, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 207:47]
        interrupt <= _interrupt_T @[src/main/scala/peripheral/UART.scala 207:17]
      else :
        node _T = and(addr_tx_data, tx.io.channel.ready) @[src/main/scala/peripheral/UART.scala 208:29]
        when _T : @[src/main/scala/peripheral/UART.scala 208:53]
          tx.io.channel.valid <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 210:27]
          node _tx_io_channel_bits_T = bits(slave.io.bundle.write_data, 7, 0) @[src/main/scala/peripheral/UART.scala 213:55]
          tx.io.channel.bits <= _tx_io_channel_bits_T @[src/main/scala/peripheral/UART.scala 213:26]
    io.txd <= tx.io.txd @[src/main/scala/peripheral/UART.scala 219:13]
    rx.io.rxd <= io.rxd @[src/main/scala/peripheral/UART.scala 220:13]
    io.signal_interrupt <= interrupt @[src/main/scala/peripheral/UART.scala 222:23]
    rx.io.channel.ready <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 223:23]
    when rx.io.channel.valid : @[src/main/scala/peripheral/UART.scala 224:29]
      rx.io.channel.ready <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 225:25]
      rxData <= rx.io.channel.bits @[src/main/scala/peripheral/UART.scala 226:25]
      interrupt <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 227:25]


  module AXI4LiteSlave_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4]}} @[src/main/scala/bus/AXI4Lite.scala 111:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 116:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 118:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 119:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 122:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 123:18]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 124:26]
    io.channels.read_data_channel.RDATA <= read_data @[src/main/scala/bus/AXI4Lite.scala 125:39]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 127:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 128:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 129:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 130:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 131:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 132:39]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 135:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 136:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 138:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 139:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 140:26]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 142:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 143:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 144:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 145:41]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 147:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 148:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 149:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:13]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 154:13]
      when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 158:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 159:17]
      else :
        when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 160:61]
          state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 162:17]
          AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 163:17]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 168:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 170:17]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 171:17]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 172:17]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 173:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when io.bundle.read_valid : @[src/main/scala/bus/AXI4Lite.scala 178:34]
            read_data <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 180:19]
            RVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 181:19]
            RRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 182:19]
            read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 183:19]
          node _T_10 = and(RVALID, io.channels.read_data_channel.RREADY) @[src/main/scala/bus/AXI4Lite.scala 186:19]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 186:60]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 188:16]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 194:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 194:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 196:17]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 197:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:17]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 199:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 204:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 204:61]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 206:22]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                wire _WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                write_strobe <= _WIRE @[src/main/scala/bus/AXI4Lite.scala 207:22]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 209:22]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 210:22]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
                write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 215:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 216:14]
                BRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 217:14]
                node _T_26 = and(BVALID, io.channels.write_response_channel.BREADY) @[src/main/scala/bus/AXI4Lite.scala 219:19]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 219:65]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 221:16]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 222:16]


  module Mouse :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip x : UInt<16>, flip y : UInt<16>, flip leftButton : UInt<1>, flip rightButton : UInt<1>, flip middleButton : UInt<1>} @[src/main/scala/peripheral/Mouse.scala 19:14]

    inst slave of AXI4LiteSlave_3 @[src/main/scala/peripheral/Mouse.scala 32:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/Mouse.scala 33:21]
    node addr = and(slave.io.bundle.address, UInt<8>("hff")) @[src/main/scala/peripheral/Mouse.scala 41:38]
    wire readData : UInt<32> @[src/main/scala/peripheral/Mouse.scala 44:29]
    readData <= UInt<32>("h0") @[src/main/scala/peripheral/Mouse.scala 44:29]
    node _T = eq(UInt<1>("h0"), addr) @[src/main/scala/peripheral/Mouse.scala 47:16]
    when _T : @[src/main/scala/peripheral/Mouse.scala 47:16]
      readData <= io.x @[src/main/scala/peripheral/Mouse.scala 49:16]
    else :
      node _T_1 = eq(UInt<3>("h4"), addr) @[src/main/scala/peripheral/Mouse.scala 47:16]
      when _T_1 : @[src/main/scala/peripheral/Mouse.scala 47:16]
        readData <= io.y @[src/main/scala/peripheral/Mouse.scala 52:16]
      else :
        node _T_2 = eq(UInt<4>("h8"), addr) @[src/main/scala/peripheral/Mouse.scala 47:16]
        when _T_2 : @[src/main/scala/peripheral/Mouse.scala 47:16]
          node readData_lo = cat(io.rightButton, io.leftButton) @[src/main/scala/peripheral/Mouse.scala 56:22]
          node readData_hi = cat(UInt<29>("h0"), io.middleButton) @[src/main/scala/peripheral/Mouse.scala 56:22]
          node _readData_T = cat(readData_hi, readData_lo) @[src/main/scala/peripheral/Mouse.scala 56:22]
          readData <= _readData_T @[src/main/scala/peripheral/Mouse.scala 56:16]
    slave.io.bundle.read_valid <= slave.io.bundle.read @[src/main/scala/peripheral/Mouse.scala 62:30]
    slave.io.bundle.read_data <= readData @[src/main/scala/peripheral/Mouse.scala 63:30]

  module AXI4LiteSlave_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4]}} @[src/main/scala/bus/AXI4Lite.scala 111:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 116:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 118:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 119:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 122:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 123:18]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 124:26]
    io.channels.read_data_channel.RDATA <= read_data @[src/main/scala/bus/AXI4Lite.scala 125:39]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 127:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 128:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 129:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 130:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 131:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 132:39]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 135:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 136:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 138:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 139:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 139:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 140:26]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 142:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 143:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 144:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 145:41]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 147:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 148:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 149:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 151:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:13]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 154:13]
      when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 158:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 159:17]
      else :
        when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 160:61]
          state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 162:17]
          AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 163:17]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 151:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 168:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 170:17]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 171:17]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 172:17]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 173:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 151:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when io.bundle.read_valid : @[src/main/scala/bus/AXI4Lite.scala 178:34]
            read_data <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 180:19]
            RVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 181:19]
            RRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 182:19]
            read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 183:19]
          node _T_10 = and(RVALID, io.channels.read_data_channel.RREADY) @[src/main/scala/bus/AXI4Lite.scala 186:19]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 186:60]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 188:16]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 151:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 194:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 194:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 196:17]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 197:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:17]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 199:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 151:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 204:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 204:61]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 206:22]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 207:70]
                wire _WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                _WIRE[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 207:32]
                write_strobe <= _WIRE @[src/main/scala/bus/AXI4Lite.scala 207:22]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 209:22]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 210:22]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 151:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 151:17]
                write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 215:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 216:14]
                BRESP <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 217:14]
                node _T_26 = and(BVALID, io.channels.write_response_channel.BREADY) @[src/main/scala/bus/AXI4Lite.scala 219:19]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 219:65]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 221:16]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 222:16]


  module Timer :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, signal_interrupt : UInt<1>} @[src/main/scala/peripheral/Timer.scala 31:14]

    inst slave of AXI4LiteSlave_4 @[src/main/scala/peripheral/Timer.scala 39:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/Timer.scala 40:21]
    reg count : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/Timer.scala 43:24]
    reg limit : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/Timer.scala 44:24]
    reg enabled : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/Timer.scala 45:24]
    when enabled : @[src/main/scala/peripheral/Timer.scala 48:17]
      node _T = neq(limit, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 50:16]
      node _T_1 = geq(count, limit) @[src/main/scala/peripheral/Timer.scala 50:33]
      node _T_2 = and(_T, _T_1) @[src/main/scala/peripheral/Timer.scala 50:24]
      when _T_2 : @[src/main/scala/peripheral/Timer.scala 50:43]
        count <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 51:13]
      else :
        node _count_T = add(count, UInt<1>("h1")) @[src/main/scala/peripheral/Timer.scala 54:22]
        node _count_T_1 = tail(_count_T, 1) @[src/main/scala/peripheral/Timer.scala 54:22]
        count <= _count_T_1 @[src/main/scala/peripheral/Timer.scala 54:13]
    node _io_signal_interrupt_T = neq(limit, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 59:44]
    node _io_signal_interrupt_T_1 = and(enabled, _io_signal_interrupt_T) @[src/main/scala/peripheral/Timer.scala 59:34]
    node _io_signal_interrupt_T_2 = geq(count, limit) @[src/main/scala/peripheral/Timer.scala 59:63]
    node _io_signal_interrupt_T_3 = and(_io_signal_interrupt_T_1, _io_signal_interrupt_T_2) @[src/main/scala/peripheral/Timer.scala 59:53]
    io.signal_interrupt <= _io_signal_interrupt_T_3 @[src/main/scala/peripheral/Timer.scala 59:23]
    slave.io.bundle.read_valid <= UInt<1>("h1") @[src/main/scala/peripheral/Timer.scala 63:30]
    node _slave_io_bundle_read_data_T = bits(slave.io.bundle.address, 3, 0) @[src/main/scala/peripheral/Timer.scala 64:65]
    node _slave_io_bundle_read_data_T_1 = eq(UInt<1>("h0"), _slave_io_bundle_read_data_T) @[src/main/scala/peripheral/Timer.scala 64:77]
    node _slave_io_bundle_read_data_T_2 = mux(_slave_io_bundle_read_data_T_1, count, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 64:77]
    node _slave_io_bundle_read_data_T_3 = eq(UInt<3>("h4"), _slave_io_bundle_read_data_T) @[src/main/scala/peripheral/Timer.scala 64:77]
    node _slave_io_bundle_read_data_T_4 = mux(_slave_io_bundle_read_data_T_3, limit, _slave_io_bundle_read_data_T_2) @[src/main/scala/peripheral/Timer.scala 64:77]
    node _slave_io_bundle_read_data_T_5 = eq(UInt<4>("h8"), _slave_io_bundle_read_data_T) @[src/main/scala/peripheral/Timer.scala 64:77]
    node _slave_io_bundle_read_data_T_6 = mux(_slave_io_bundle_read_data_T_5, enabled, _slave_io_bundle_read_data_T_4) @[src/main/scala/peripheral/Timer.scala 64:77]
    slave.io.bundle.read_data <= _slave_io_bundle_read_data_T_6 @[src/main/scala/peripheral/Timer.scala 64:29]
    when slave.io.bundle.write : @[src/main/scala/peripheral/Timer.scala 73:31]
      node _T_3 = bits(slave.io.bundle.address, 3, 0) @[src/main/scala/peripheral/Timer.scala 76:33]
      node _T_4 = eq(_T_3, UInt<3>("h4")) @[src/main/scala/peripheral/Timer.scala 76:40]
      when _T_4 : @[src/main/scala/peripheral/Timer.scala 76:51]
        limit <= slave.io.bundle.write_data @[src/main/scala/peripheral/Timer.scala 77:13]
        count <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 78:13]
      else :
        node _T_5 = bits(slave.io.bundle.address, 3, 0) @[src/main/scala/peripheral/Timer.scala 79:39]
        node _T_6 = eq(_T_5, UInt<4>("h8")) @[src/main/scala/peripheral/Timer.scala 79:46]
        when _T_6 : @[src/main/scala/peripheral/Timer.scala 79:57]
          node _enabled_T = neq(slave.io.bundle.write_data, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 80:24]
          enabled <= _enabled_T @[src/main/scala/peripheral/Timer.scala 80:15]


  module Control :
    input clock : Clock
    input reset : Reset
    output io : { flip jump_flag : UInt<1>, flip jump_instruction_id : UInt<1>, flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip memory_read_enable_ex : UInt<1>, flip rd_ex : UInt<5>, flip memory_read_enable_mem : UInt<1>, flip rd_mem : UInt<5>, flip memory_write_enable_ex : UInt<1>, flip memory_write_enable_mem : UInt<1>, flip regs_write_enable_ex : UInt<1>, flip regs_write_source_ex : UInt<2>, flip regs_write_source_mem : UInt<2>, flip regs_write_source_wb : UInt<2>, flip rd_wb : UInt<5>, if_flush : UInt<1>, id_flush : UInt<1>, pc_stall : UInt<1>, if_stall : UInt<1>, branch_hazard : UInt<1>, jal_jalr_hazard : UInt<1>} @[src/main/scala/riscv/core/Control.scala 55:14]

    io.if_flush <= UInt<1>("h0") @[src/main/scala/riscv/core/Control.scala 86:22]
    io.id_flush <= UInt<1>("h0") @[src/main/scala/riscv/core/Control.scala 87:22]
    io.pc_stall <= UInt<1>("h0") @[src/main/scala/riscv/core/Control.scala 88:22]
    io.if_stall <= UInt<1>("h0") @[src/main/scala/riscv/core/Control.scala 89:22]
    io.branch_hazard <= UInt<1>("h0") @[src/main/scala/riscv/core/Control.scala 90:22]
    io.jal_jalr_hazard <= UInt<1>("h0") @[src/main/scala/riscv/core/Control.scala 91:22]
    node _ex_hazard_for_branch_T = neq(io.rd_ex, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 96:14]
    node _ex_hazard_for_branch_T_1 = and(io.jump_instruction_id, _ex_hazard_for_branch_T) @[src/main/scala/riscv/core/Control.scala 95:53]
    node _ex_hazard_for_branch_T_2 = eq(io.rd_ex, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 97:15]
    node _ex_hazard_for_branch_T_3 = eq(io.rd_ex, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 97:41]
    node _ex_hazard_for_branch_T_4 = or(_ex_hazard_for_branch_T_2, _ex_hazard_for_branch_T_3) @[src/main/scala/riscv/core/Control.scala 97:29]
    node ex_hazard_for_branch = and(_ex_hazard_for_branch_T_1, _ex_hazard_for_branch_T_4) @[src/main/scala/riscv/core/Control.scala 96:22]
    node store_load_hazard = and(io.memory_write_enable_mem, io.memory_read_enable_ex) @[src/main/scala/riscv/core/Control.scala 111:54]
    node _jal_jalr_hazard_ex_T = eq(io.regs_write_source_ex, UInt<2>("h3")) @[src/main/scala/riscv/core/Control.scala 125:53]
    node _jal_jalr_hazard_ex_T_1 = neq(io.rd_ex, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 126:14]
    node _jal_jalr_hazard_ex_T_2 = and(_jal_jalr_hazard_ex_T, _jal_jalr_hazard_ex_T_1) @[src/main/scala/riscv/core/Control.scala 125:96]
    node _jal_jalr_hazard_ex_T_3 = eq(io.rd_ex, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 127:15]
    node _jal_jalr_hazard_ex_T_4 = eq(io.rd_ex, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 127:41]
    node _jal_jalr_hazard_ex_T_5 = or(_jal_jalr_hazard_ex_T_3, _jal_jalr_hazard_ex_T_4) @[src/main/scala/riscv/core/Control.scala 127:29]
    node jal_jalr_hazard_ex = and(_jal_jalr_hazard_ex_T_2, _jal_jalr_hazard_ex_T_5) @[src/main/scala/riscv/core/Control.scala 126:22]
    node _jal_jalr_hazard_mem_T = eq(io.regs_write_source_mem, UInt<2>("h3")) @[src/main/scala/riscv/core/Control.scala 139:55]
    node _jal_jalr_hazard_mem_T_1 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 140:15]
    node _jal_jalr_hazard_mem_T_2 = and(_jal_jalr_hazard_mem_T, _jal_jalr_hazard_mem_T_1) @[src/main/scala/riscv/core/Control.scala 139:98]
    node _jal_jalr_hazard_mem_T_3 = eq(io.rd_mem, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 141:16]
    node _jal_jalr_hazard_mem_T_4 = eq(io.rd_mem, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 141:43]
    node _jal_jalr_hazard_mem_T_5 = or(_jal_jalr_hazard_mem_T_3, _jal_jalr_hazard_mem_T_4) @[src/main/scala/riscv/core/Control.scala 141:30]
    node jal_jalr_hazard_mem = and(_jal_jalr_hazard_mem_T_2, _jal_jalr_hazard_mem_T_5) @[src/main/scala/riscv/core/Control.scala 140:23]
    node _jal_jalr_hazard_wb_T = eq(io.regs_write_source_wb, UInt<2>("h3")) @[src/main/scala/riscv/core/Control.scala 156:53]
    node _jal_jalr_hazard_wb_T_1 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 157:14]
    node _jal_jalr_hazard_wb_T_2 = and(_jal_jalr_hazard_wb_T, _jal_jalr_hazard_wb_T_1) @[src/main/scala/riscv/core/Control.scala 156:96]
    node _jal_jalr_hazard_wb_T_3 = eq(io.rd_wb, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 158:15]
    node _jal_jalr_hazard_wb_T_4 = eq(io.rd_wb, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 158:41]
    node _jal_jalr_hazard_wb_T_5 = or(_jal_jalr_hazard_wb_T_3, _jal_jalr_hazard_wb_T_4) @[src/main/scala/riscv/core/Control.scala 158:29]
    node jal_jalr_hazard_wb = and(_jal_jalr_hazard_wb_T_2, _jal_jalr_hazard_wb_T_5) @[src/main/scala/riscv/core/Control.scala 157:22]
    node _T = or(io.jump_instruction_id, io.memory_read_enable_ex) @[src/main/scala/riscv/core/Control.scala 166:30]
    node _T_1 = neq(io.rd_ex, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 169:16]
    node _T_2 = and(_T, _T_1) @[src/main/scala/riscv/core/Control.scala 166:59]
    node _T_3 = eq(io.rd_ex, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 170:17]
    node _T_4 = eq(io.rd_ex, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 170:43]
    node _T_5 = or(_T_3, _T_4) @[src/main/scala/riscv/core/Control.scala 170:31]
    node _T_6 = and(_T_2, _T_5) @[src/main/scala/riscv/core/Control.scala 169:24]
    node _T_7 = and(io.jump_instruction_id, io.memory_read_enable_mem) @[src/main/scala/riscv/core/Control.scala 180:33]
    node _T_8 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 182:21]
    node _T_9 = and(_T_7, _T_8) @[src/main/scala/riscv/core/Control.scala 181:37]
    node _T_10 = eq(io.rd_mem, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 183:22]
    node _T_11 = eq(io.rd_mem, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 183:49]
    node _T_12 = or(_T_10, _T_11) @[src/main/scala/riscv/core/Control.scala 183:36]
    node _T_13 = and(_T_9, _T_12) @[src/main/scala/riscv/core/Control.scala 182:29]
    node _T_14 = or(_T_6, _T_13) @[src/main/scala/riscv/core/Control.scala 177:7]
    node _T_15 = or(_T_14, store_load_hazard) @[src/main/scala/riscv/core/Control.scala 189:9]
    node _T_16 = or(_T_15, jal_jalr_hazard_ex) @[src/main/scala/riscv/core/Control.scala 195:9]
    node _T_17 = or(_T_16, jal_jalr_hazard_mem) @[src/main/scala/riscv/core/Control.scala 201:9]
    node _T_18 = or(_T_17, jal_jalr_hazard_wb) @[src/main/scala/riscv/core/Control.scala 207:9]
    when _T_18 : @[src/main/scala/riscv/core/Control.scala 212:5]
      node _is_load_use_hazard_T = neq(io.rd_ex, UInt<1>("h0")) @[src/main/scala/riscv/core/Control.scala 228:16]
      node _is_load_use_hazard_T_1 = and(io.memory_read_enable_ex, _is_load_use_hazard_T) @[src/main/scala/riscv/core/Control.scala 227:55]
      node _is_load_use_hazard_T_2 = eq(io.rd_ex, io.rs1_id) @[src/main/scala/riscv/core/Control.scala 229:17]
      node _is_load_use_hazard_T_3 = eq(io.rd_ex, io.rs2_id) @[src/main/scala/riscv/core/Control.scala 229:43]
      node _is_load_use_hazard_T_4 = or(_is_load_use_hazard_T_2, _is_load_use_hazard_T_3) @[src/main/scala/riscv/core/Control.scala 229:31]
      node is_load_use_hazard = and(_is_load_use_hazard_T_1, _is_load_use_hazard_T_4) @[src/main/scala/riscv/core/Control.scala 228:24]
      node _is_jal_jalr_hazard_T = or(jal_jalr_hazard_ex, jal_jalr_hazard_mem) @[src/main/scala/riscv/core/Control.scala 232:49]
      node is_jal_jalr_hazard = or(_is_jal_jalr_hazard_T, jal_jalr_hazard_wb) @[src/main/scala/riscv/core/Control.scala 232:72]
      node _io_id_flush_T = or(is_load_use_hazard, is_jal_jalr_hazard) @[src/main/scala/riscv/core/Control.scala 233:39]
      io.id_flush <= _io_id_flush_T @[src/main/scala/riscv/core/Control.scala 233:17]
      io.pc_stall <= UInt<1>("h1") @[src/main/scala/riscv/core/Control.scala 234:17]
      io.if_stall <= UInt<1>("h1") @[src/main/scala/riscv/core/Control.scala 235:17]
      io.branch_hazard <= ex_hazard_for_branch @[src/main/scala/riscv/core/Control.scala 238:22]
      io.jal_jalr_hazard <= is_jal_jalr_hazard @[src/main/scala/riscv/core/Control.scala 240:24]
    else :
      when io.jump_flag : @[src/main/scala/riscv/core/Control.scala 242:28]
        io.if_flush <= UInt<1>("h1") @[src/main/scala/riscv/core/Control.scala 246:17]


  module RegisterFile :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip write_address : UInt<5>, flip write_data : UInt<32>, flip read_address1 : UInt<5>, flip read_address2 : UInt<5>, read_data1 : UInt<32>, read_data2 : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>} @[src/main/scala/riscv/core/RegisterFile.scala 22:14]

    reg registers : UInt<32>[31], clock with :
      reset => (UInt<1>("h0"), registers) @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
    node _T = asUInt(reset) @[src/main/scala/riscv/core/RegisterFile.scala 39:15]
    node _T_1 = eq(_T, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 39:8]
    when _T_1 : @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      node _T_2 = neq(io.write_address, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 40:46]
      node _T_3 = and(io.write_enable, _T_2) @[src/main/scala/riscv/core/RegisterFile.scala 40:26]
      when _T_3 : @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        node _T_4 = sub(io.write_address, UInt<1>("h1")) @[src/main/scala/riscv/core/RegisterFile.scala 42:34]
        node _T_5 = tail(_T_4, 1) @[src/main/scala/riscv/core/RegisterFile.scala 42:34]
        registers[_T_5] <= io.write_data @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
    node _io_read_data1_T = eq(io.read_address1, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 50:22]
    node _io_read_data1_T_1 = eq(io.write_address, io.read_address1) @[src/main/scala/riscv/core/RegisterFile.scala 53:43]
    node _io_read_data1_T_2 = and(io.write_enable, _io_read_data1_T_1) @[src/main/scala/riscv/core/RegisterFile.scala 53:23]
    node _io_read_data1_T_3 = sub(io.read_address1, UInt<1>("h1")) @[src/main/scala/riscv/core/RegisterFile.scala 55:34]
    node _io_read_data1_T_4 = tail(_io_read_data1_T_3, 1) @[src/main/scala/riscv/core/RegisterFile.scala 55:34]
    node _io_read_data1_T_5 = mux(_io_read_data1_T_2, io.write_data, registers[_io_read_data1_T_4]) @[src/main/scala/riscv/core/RegisterFile.scala 52:8]
    node _io_read_data1_T_6 = mux(_io_read_data1_T, UInt<1>("h0"), _io_read_data1_T_5) @[src/main/scala/riscv/core/RegisterFile.scala 49:23]
    io.read_data1 <= _io_read_data1_T_6 @[src/main/scala/riscv/core/RegisterFile.scala 49:17]
    node _io_read_data2_T = eq(io.read_address2, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 60:22]
    node _io_read_data2_T_1 = eq(io.write_address, io.read_address2) @[src/main/scala/riscv/core/RegisterFile.scala 63:43]
    node _io_read_data2_T_2 = and(io.write_enable, _io_read_data2_T_1) @[src/main/scala/riscv/core/RegisterFile.scala 63:23]
    node _io_read_data2_T_3 = sub(io.read_address2, UInt<1>("h1")) @[src/main/scala/riscv/core/RegisterFile.scala 65:34]
    node _io_read_data2_T_4 = tail(_io_read_data2_T_3, 1) @[src/main/scala/riscv/core/RegisterFile.scala 65:34]
    node _io_read_data2_T_5 = mux(_io_read_data2_T_2, io.write_data, registers[_io_read_data2_T_4]) @[src/main/scala/riscv/core/RegisterFile.scala 62:8]
    node _io_read_data2_T_6 = mux(_io_read_data2_T, UInt<1>("h0"), _io_read_data2_T_5) @[src/main/scala/riscv/core/RegisterFile.scala 59:23]
    io.read_data2 <= _io_read_data2_T_6 @[src/main/scala/riscv/core/RegisterFile.scala 59:17]
    node _io_debug_read_data_T = eq(io.debug_read_address, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 70:27]
    node _io_debug_read_data_T_1 = eq(io.write_address, io.debug_read_address) @[src/main/scala/riscv/core/RegisterFile.scala 73:43]
    node _io_debug_read_data_T_2 = and(io.write_enable, _io_debug_read_data_T_1) @[src/main/scala/riscv/core/RegisterFile.scala 73:23]
    node _io_debug_read_data_T_3 = sub(io.debug_read_address, UInt<1>("h1")) @[src/main/scala/riscv/core/RegisterFile.scala 75:39]
    node _io_debug_read_data_T_4 = tail(_io_debug_read_data_T_3, 1) @[src/main/scala/riscv/core/RegisterFile.scala 75:39]
    node _io_debug_read_data_T_5 = mux(_io_debug_read_data_T_2, io.write_data, registers[_io_debug_read_data_T_4]) @[src/main/scala/riscv/core/RegisterFile.scala 72:8]
    node _io_debug_read_data_T_6 = mux(_io_debug_read_data_T, UInt<1>("h0"), _io_debug_read_data_T_5) @[src/main/scala/riscv/core/RegisterFile.scala 69:28]
    io.debug_read_data <= _io_debug_read_data_T_6 @[src/main/scala/riscv/core/RegisterFile.scala 69:22]

  module BranchTargetBuffer :
    input clock : Clock
    input reset : Reset
    output io : { flip pc : UInt<32>, predicted_pc : UInt<32>, predicted_taken : UInt<1>, flip update_valid : UInt<1>, flip update_pc : UInt<32>, flip update_target : UInt<32>, flip update_taken : UInt<1>} @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]

    wire _valid_WIRE : UInt<1>[16] @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[4] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[5] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[6] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[7] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[8] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[9] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[10] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[11] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[12] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[13] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[14] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    _valid_WIRE[15] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:32]
    reg valid : UInt<1>[16], clock with :
      reset => (reset, _valid_WIRE) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    reg tags : UInt<26>[16], clock with :
      reset => (UInt<1>("h0"), tags) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
    reg targets : UInt<32>[16], clock with :
      reset => (UInt<1>("h0"), targets) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
    node pred_index = bits(io.pc, 5, 2) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 55:36]
    node pred_tag = bits(io.pc, 31, 6) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 56:36]
    node _hit_T = eq(tags[pred_index], pred_tag) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:59]
    node hit = and(valid[pred_index], _hit_T) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:38]
    io.predicted_taken <= hit @[src/main/scala/riscv/core/BranchTargetBuffer.scala 63:22]
    node _io_predicted_pc_T = add(io.pc, UInt<3>("h4")) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:61]
    node _io_predicted_pc_T_1 = tail(_io_predicted_pc_T, 1) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:61]
    node _io_predicted_pc_T_2 = mux(hit, targets[pred_index], _io_predicted_pc_T_1) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:28]
    io.predicted_pc <= _io_predicted_pc_T_2 @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:22]
    when io.update_valid : @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      node upd_index = bits(io.update_pc, 5, 2) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 55:36]
      node upd_tag = bits(io.update_pc, 31, 6) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 56:36]
      when io.update_taken : @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid[upd_index] <= UInt<1>("h1") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 73:26]
        tags[upd_index] <= upd_tag @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        targets[upd_index] <= io.update_target @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
      else :
        node _T = eq(tags[upd_index], upd_tag) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:49]
        node _T_1 = and(valid[upd_index], _T) @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:29]
        when _T_1 : @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
          valid[upd_index] <= UInt<1>("h0") @[src/main/scala/riscv/core/BranchTargetBuffer.scala 79:26]


  module InstructionFetch :
    input clock : Clock
    input reset : Reset
    output io : { flip stall_flag_ctrl : UInt<1>, flip jump_flag_id : UInt<1>, flip jump_address_id : UInt<32>, flip rom_instruction : UInt<32>, flip instruction_valid : UInt<1>, flip btb_mispredict : UInt<1>, flip btb_correction_addr : UInt<32>, flip btb_correct_prediction : UInt<1>, instruction_address : UInt<32>, id_instruction : UInt<32>, btb_predicted_taken : UInt<1>, btb_predicted_target : UInt<32>, flip btb_update_valid : UInt<1>, flip btb_update_pc : UInt<32>, flip btb_update_target : UInt<32>, flip btb_update_taken : UInt<1>} @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]

    reg pc : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/InstructionFetch.scala 41:19]
    inst btb of BranchTargetBuffer @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
    btb.clock <= clock
    btb.reset <= reset
    btb.io.pc <= pc @[src/main/scala/riscv/core/InstructionFetch.scala 45:13]
    io.btb_predicted_taken <= btb.io.predicted_taken @[src/main/scala/riscv/core/InstructionFetch.scala 49:27]
    io.btb_predicted_target <= btb.io.predicted_pc @[src/main/scala/riscv/core/InstructionFetch.scala 50:27]
    reg pending_jump : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 56:34]
    reg pending_jump_addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 57:34]
    reg prev_jump_flag : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 65:31]
    prev_jump_flag <= io.jump_flag_id @[src/main/scala/riscv/core/InstructionFetch.scala 65:31]
    reg prev_jump_addr : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 66:31]
    prev_jump_addr <= io.jump_address_id @[src/main/scala/riscv/core/InstructionFetch.scala 66:31]
    node _T = or(io.jump_flag_id, prev_jump_flag) @[src/main/scala/riscv/core/InstructionFetch.scala 70:47]
    node _T_1 = and(io.stall_flag_ctrl, _T) @[src/main/scala/riscv/core/InstructionFetch.scala 70:27]
    when _T_1 : @[src/main/scala/riscv/core/InstructionFetch.scala 70:67]
      pending_jump <= UInt<1>("h1") @[src/main/scala/riscv/core/InstructionFetch.scala 71:23]
      node _pending_jump_addr_T = mux(io.jump_flag_id, io.jump_address_id, prev_jump_addr) @[src/main/scala/riscv/core/InstructionFetch.scala 72:29]
      pending_jump_addr <= _pending_jump_addr_T @[src/main/scala/riscv/core/InstructionFetch.scala 72:23]
    else :
      node _T_2 = eq(io.stall_flag_ctrl, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 73:14]
      when _T_2 : @[src/main/scala/riscv/core/InstructionFetch.scala 73:35]
        pending_jump <= UInt<1>("h0") @[src/main/scala/riscv/core/InstructionFetch.scala 75:18]
    node _take_pending_T = eq(io.stall_flag_ctrl, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 79:38]
    node take_pending = and(pending_jump, _take_pending_T) @[src/main/scala/riscv/core/InstructionFetch.scala 79:35]
    node _take_current_T = eq(io.stall_flag_ctrl, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 81:41]
    node _take_current_T_1 = and(io.jump_flag_id, _take_current_T) @[src/main/scala/riscv/core/InstructionFetch.scala 81:38]
    node _take_current_T_2 = eq(pending_jump, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 81:64]
    node _take_current_T_3 = and(_take_current_T_1, _take_current_T_2) @[src/main/scala/riscv/core/InstructionFetch.scala 81:61]
    node _take_current_T_4 = eq(io.btb_correct_prediction, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 81:81]
    node take_current = and(_take_current_T_3, _take_current_T_4) @[src/main/scala/riscv/core/InstructionFetch.scala 81:78]
    node _take_btb_correction_T = eq(io.stall_flag_ctrl, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 83:50]
    node take_btb_correction = and(io.btb_mispredict, _take_btb_correction_T) @[src/main/scala/riscv/core/InstructionFetch.scala 83:47]
    node _next_pc_T = add(pc, UInt<3>("h4")) @[src/main/scala/riscv/core/InstructionFetch.scala 92:49]
    node _next_pc_T_1 = tail(_next_pc_T, 1) @[src/main/scala/riscv/core/InstructionFetch.scala 92:49]
    node _next_pc_T_2 = mux(btb.io.predicted_taken, btb.io.predicted_pc, _next_pc_T_1) @[src/main/scala/riscv/core/InstructionFetch.scala 92:8]
    node _next_pc_T_3 = eq(io.instruction_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionFetch.scala 97:30]
    node _next_pc_T_4 = or(io.stall_flag_ctrl, _next_pc_T_3) @[src/main/scala/riscv/core/InstructionFetch.scala 97:27]
    node _next_pc_T_5 = mux(_next_pc_T_4, pc, _next_pc_T_2) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _next_pc_T_6 = mux(take_current, io.jump_address_id, _next_pc_T_5) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _next_pc_T_7 = mux(take_btb_correction, io.btb_correction_addr, _next_pc_T_6) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node next_pc = mux(take_pending, pending_jump_addr, _next_pc_T_7) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    pc <= next_pc @[src/main/scala/riscv/core/InstructionFetch.scala 101:6]
    io.instruction_address <= pc @[src/main/scala/riscv/core/InstructionFetch.scala 103:26]
    node _io_id_instruction_T = mux(io.instruction_valid, io.rom_instruction, UInt<32>("h13")) @[src/main/scala/riscv/core/InstructionFetch.scala 104:32]
    io.id_instruction <= _io_id_instruction_T @[src/main/scala/riscv/core/InstructionFetch.scala 104:26]
    btb.io.update_valid <= io.btb_update_valid @[src/main/scala/riscv/core/InstructionFetch.scala 107:24]
    btb.io.update_pc <= io.btb_update_pc @[src/main/scala/riscv/core/InstructionFetch.scala 108:24]
    btb.io.update_target <= io.btb_update_target @[src/main/scala/riscv/core/InstructionFetch.scala 109:24]
    btb.io.update_taken <= io.btb_update_taken @[src/main/scala/riscv/core/InstructionFetch.scala 110:24]

  module PipelineRegister :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<32>("h13") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<32>("h13") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<32>("h1000") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<32>("h1000") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module IF2ID :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip interrupt_flag : UInt<32>, flip btb_predicted_taken : UInt<1>, flip btb_predicted_target : UInt<32>, output_instruction : UInt<32>, output_instruction_address : UInt<32>, output_interrupt_flag : UInt<32>, output_btb_predicted_taken : UInt<1>, output_btb_predicted_target : UInt<32>} @[src/main/scala/riscv/core/IF2ID.scala 12:14]

    inst instruction of PipelineRegister @[src/main/scala/riscv/core/IF2ID.scala 28:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/IF2ID.scala 29:25]
    instruction.io.stall <= io.stall @[src/main/scala/riscv/core/IF2ID.scala 30:25]
    instruction.io.flush <= io.flush @[src/main/scala/riscv/core/IF2ID.scala 31:25]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/IF2ID.scala 32:25]
    inst instruction_address of PipelineRegister_1 @[src/main/scala/riscv/core/IF2ID.scala 34:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/IF2ID.scala 35:33]
    instruction_address.io.stall <= io.stall @[src/main/scala/riscv/core/IF2ID.scala 36:33]
    instruction_address.io.flush <= io.flush @[src/main/scala/riscv/core/IF2ID.scala 37:33]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/IF2ID.scala 38:33]
    inst interrupt_flag of PipelineRegister_2 @[src/main/scala/riscv/core/IF2ID.scala 40:30]
    interrupt_flag.clock <= clock
    interrupt_flag.reset <= reset
    interrupt_flag.io.in <= io.interrupt_flag @[src/main/scala/riscv/core/IF2ID.scala 41:28]
    interrupt_flag.io.stall <= io.stall @[src/main/scala/riscv/core/IF2ID.scala 42:28]
    interrupt_flag.io.flush <= io.flush @[src/main/scala/riscv/core/IF2ID.scala 43:28]
    io.output_interrupt_flag <= interrupt_flag.io.out @[src/main/scala/riscv/core/IF2ID.scala 44:28]
    inst btb_predicted_taken of PipelineRegister_3 @[src/main/scala/riscv/core/IF2ID.scala 47:35]
    btb_predicted_taken.clock <= clock
    btb_predicted_taken.reset <= reset
    btb_predicted_taken.io.in <= io.btb_predicted_taken @[src/main/scala/riscv/core/IF2ID.scala 48:33]
    btb_predicted_taken.io.stall <= io.stall @[src/main/scala/riscv/core/IF2ID.scala 49:33]
    btb_predicted_taken.io.flush <= io.flush @[src/main/scala/riscv/core/IF2ID.scala 50:33]
    node _io_output_btb_predicted_taken_T = bits(btb_predicted_taken.io.out, 0, 0) @[src/main/scala/riscv/core/IF2ID.scala 51:63]
    io.output_btb_predicted_taken <= _io_output_btb_predicted_taken_T @[src/main/scala/riscv/core/IF2ID.scala 51:33]
    inst btb_predicted_target of PipelineRegister_4 @[src/main/scala/riscv/core/IF2ID.scala 53:36]
    btb_predicted_target.clock <= clock
    btb_predicted_target.reset <= reset
    btb_predicted_target.io.in <= io.btb_predicted_target @[src/main/scala/riscv/core/IF2ID.scala 54:34]
    btb_predicted_target.io.stall <= io.stall @[src/main/scala/riscv/core/IF2ID.scala 55:34]
    btb_predicted_target.io.flush <= io.flush @[src/main/scala/riscv/core/IF2ID.scala 56:34]
    io.output_btb_predicted_target <= btb_predicted_target.io.out @[src/main/scala/riscv/core/IF2ID.scala 57:34]

  module InstructionDecode :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip forward_from_mem : UInt<32>, flip forward_from_wb : UInt<32>, flip reg1_forward : UInt<2>, flip reg2_forward : UInt<2>, flip interrupt_assert : UInt<1>, flip interrupt_handler_address : UInt<32>, flip branch_hazard : UInt<1>, regs_reg1_read_address : UInt<5>, regs_reg2_read_address : UInt<5>, ex_immediate : UInt<32>, ex_aluop1_source : UInt<1>, ex_aluop2_source : UInt<1>, ex_memory_read_enable : UInt<1>, ex_memory_write_enable : UInt<1>, ex_reg_write_source : UInt<2>, ex_reg_write_enable : UInt<1>, ex_reg_write_address : UInt<5>, ex_csr_address : UInt<12>, ex_csr_write_enable : UInt<1>, ctrl_jump_instruction : UInt<1>, clint_jump_flag : UInt<1>, clint_jump_address : UInt<32>, if_jump_flag : UInt<1>, if_jump_address : UInt<32>} @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]

    node opcode = bits(io.instruction, 6, 0) @[src/main/scala/riscv/core/InstructionDecode.scala 45:30]
    node funct3 = bits(io.instruction, 14, 12) @[src/main/scala/riscv/core/InstructionDecode.scala 46:30]
    node funct7 = bits(io.instruction, 31, 25) @[src/main/scala/riscv/core/InstructionDecode.scala 47:30]
    node rd = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/InstructionDecode.scala 48:30]
    node rs1 = bits(io.instruction, 19, 15) @[src/main/scala/riscv/core/InstructionDecode.scala 49:30]
    node rs2 = bits(io.instruction, 24, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 50:30]
    node _csr_uses_uimm_T = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/InstructionDecode.scala 54:30]
    node _csr_uses_uimm_T_1 = eq(funct3, UInt<3>("h5")) @[src/main/scala/riscv/core/InstructionDecode.scala 55:12]
    node _csr_uses_uimm_T_2 = eq(funct3, UInt<3>("h7")) @[src/main/scala/riscv/core/InstructionDecode.scala 56:14]
    node _csr_uses_uimm_T_3 = or(_csr_uses_uimm_T_1, _csr_uses_uimm_T_2) @[src/main/scala/riscv/core/InstructionDecode.scala 55:43]
    node _csr_uses_uimm_T_4 = eq(funct3, UInt<3>("h6")) @[src/main/scala/riscv/core/InstructionDecode.scala 57:14]
    node _csr_uses_uimm_T_5 = or(_csr_uses_uimm_T_3, _csr_uses_uimm_T_4) @[src/main/scala/riscv/core/InstructionDecode.scala 56:45]
    node csr_uses_uimm = and(_csr_uses_uimm_T, _csr_uses_uimm_T_5) @[src/main/scala/riscv/core/InstructionDecode.scala 54:51]
    node _uses_rs1_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/InstructionDecode.scala 59:26]
    node _uses_rs1_T_1 = eq(opcode, UInt<5>("h13")) @[src/main/scala/riscv/core/InstructionDecode.scala 59:62]
    node _uses_rs1_T_2 = or(_uses_rs1_T, _uses_rs1_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 59:51]
    node _uses_rs1_T_3 = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/InstructionDecode.scala 60:13]
    node _uses_rs1_T_4 = or(_uses_rs1_T_2, _uses_rs1_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 59:86]
    node _uses_rs1_T_5 = eq(opcode, UInt<6>("h23")) @[src/main/scala/riscv/core/InstructionDecode.scala 60:48]
    node _uses_rs1_T_6 = or(_uses_rs1_T_4, _uses_rs1_T_5) @[src/main/scala/riscv/core/InstructionDecode.scala 60:37]
    node _uses_rs1_T_7 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/InstructionDecode.scala 60:83]
    node _uses_rs1_T_8 = or(_uses_rs1_T_6, _uses_rs1_T_7) @[src/main/scala/riscv/core/InstructionDecode.scala 60:72]
    node _uses_rs1_T_9 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/InstructionDecode.scala 61:13]
    node _uses_rs1_T_10 = or(_uses_rs1_T_8, _uses_rs1_T_9) @[src/main/scala/riscv/core/InstructionDecode.scala 60:107]
    node _uses_rs1_T_11 = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/InstructionDecode.scala 61:47]
    node _uses_rs1_T_12 = eq(csr_uses_uimm, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 61:71]
    node _uses_rs1_T_13 = and(_uses_rs1_T_11, _uses_rs1_T_12) @[src/main/scala/riscv/core/InstructionDecode.scala 61:68]
    node uses_rs1 = or(_uses_rs1_T_10, _uses_rs1_T_13) @[src/main/scala/riscv/core/InstructionDecode.scala 61:36]
    node _uses_rs2_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/InstructionDecode.scala 62:26]
    node _uses_rs2_T_1 = eq(opcode, UInt<6>("h23")) @[src/main/scala/riscv/core/InstructionDecode.scala 62:62]
    node _uses_rs2_T_2 = or(_uses_rs2_T, _uses_rs2_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 62:51]
    node _uses_rs2_T_3 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/InstructionDecode.scala 62:97]
    node uses_rs2 = or(_uses_rs2_T_2, _uses_rs2_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 62:86]
    node _io_regs_reg1_read_address_T = mux(uses_rs1, rs1, UInt<5>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 64:35]
    io.regs_reg1_read_address <= _io_regs_reg1_read_address_T @[src/main/scala/riscv/core/InstructionDecode.scala 64:29]
    node _io_regs_reg2_read_address_T = mux(uses_rs2, rs2, UInt<5>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 65:35]
    io.regs_reg2_read_address <= _io_regs_reg2_read_address_T @[src/main/scala/riscv/core/InstructionDecode.scala 65:29]
    node _io_ex_immediate_T = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 68:32]
    node _io_ex_immediate_T_1 = mux(_io_ex_immediate_T, UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 68:13]
    node _io_ex_immediate_T_2 = bits(io.instruction, 31, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 68:53]
    node _io_ex_immediate_T_3 = cat(_io_ex_immediate_T_1, _io_ex_immediate_T_2) @[src/main/scala/riscv/core/InstructionDecode.scala 68:8]
    node _io_ex_immediate_T_4 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 71:56]
    node _io_ex_immediate_T_5 = mux(_io_ex_immediate_T_4, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 71:37]
    node _io_ex_immediate_T_6 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 71:77]
    node _io_ex_immediate_T_7 = cat(_io_ex_immediate_T_5, _io_ex_immediate_T_6) @[src/main/scala/riscv/core/InstructionDecode.scala 71:32]
    node _io_ex_immediate_T_8 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 72:56]
    node _io_ex_immediate_T_9 = mux(_io_ex_immediate_T_8, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 72:37]
    node _io_ex_immediate_T_10 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 72:77]
    node _io_ex_immediate_T_11 = cat(_io_ex_immediate_T_9, _io_ex_immediate_T_10) @[src/main/scala/riscv/core/InstructionDecode.scala 72:32]
    node _io_ex_immediate_T_12 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 73:56]
    node _io_ex_immediate_T_13 = mux(_io_ex_immediate_T_12, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 73:37]
    node _io_ex_immediate_T_14 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 73:77]
    node _io_ex_immediate_T_15 = cat(_io_ex_immediate_T_13, _io_ex_immediate_T_14) @[src/main/scala/riscv/core/InstructionDecode.scala 73:32]
    node _io_ex_immediate_T_16 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 74:56]
    node _io_ex_immediate_T_17 = mux(_io_ex_immediate_T_16, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 74:37]
    node _io_ex_immediate_T_18 = bits(io.instruction, 30, 25) @[src/main/scala/riscv/core/InstructionDecode.scala 74:77]
    node _io_ex_immediate_T_19 = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/InstructionDecode.scala 74:101]
    node io_ex_immediate_hi = cat(_io_ex_immediate_T_17, _io_ex_immediate_T_18) @[src/main/scala/riscv/core/InstructionDecode.scala 74:32]
    node _io_ex_immediate_T_20 = cat(io_ex_immediate_hi, _io_ex_immediate_T_19) @[src/main/scala/riscv/core/InstructionDecode.scala 74:32]
    node _io_ex_immediate_T_21 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 76:32]
    node _io_ex_immediate_T_22 = mux(_io_ex_immediate_T_21, UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 76:13]
    node _io_ex_immediate_T_23 = bits(io.instruction, 7, 7) @[src/main/scala/riscv/core/InstructionDecode.scala 77:23]
    node _io_ex_immediate_T_24 = bits(io.instruction, 30, 25) @[src/main/scala/riscv/core/InstructionDecode.scala 78:23]
    node _io_ex_immediate_T_25 = bits(io.instruction, 11, 8) @[src/main/scala/riscv/core/InstructionDecode.scala 79:23]
    node io_ex_immediate_lo = cat(_io_ex_immediate_T_25, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 75:32]
    node io_ex_immediate_hi_hi = cat(_io_ex_immediate_T_22, _io_ex_immediate_T_23) @[src/main/scala/riscv/core/InstructionDecode.scala 75:32]
    node io_ex_immediate_hi_1 = cat(io_ex_immediate_hi_hi, _io_ex_immediate_T_24) @[src/main/scala/riscv/core/InstructionDecode.scala 75:32]
    node _io_ex_immediate_T_26 = cat(io_ex_immediate_hi_1, io_ex_immediate_lo) @[src/main/scala/riscv/core/InstructionDecode.scala 75:32]
    node _io_ex_immediate_T_27 = bits(io.instruction, 31, 12) @[src/main/scala/riscv/core/InstructionDecode.scala 82:47]
    node _io_ex_immediate_T_28 = cat(_io_ex_immediate_T_27, UInt<12>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 82:32]
    node _io_ex_immediate_T_29 = bits(io.instruction, 31, 12) @[src/main/scala/riscv/core/InstructionDecode.scala 83:47]
    node _io_ex_immediate_T_30 = cat(_io_ex_immediate_T_29, UInt<12>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 83:32]
    node _io_ex_immediate_T_31 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/InstructionDecode.scala 85:32]
    node _io_ex_immediate_T_32 = mux(_io_ex_immediate_T_31, UInt<12>("hfff"), UInt<12>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 85:13]
    node _io_ex_immediate_T_33 = bits(io.instruction, 19, 12) @[src/main/scala/riscv/core/InstructionDecode.scala 86:23]
    node _io_ex_immediate_T_34 = bits(io.instruction, 20, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 87:23]
    node _io_ex_immediate_T_35 = bits(io.instruction, 30, 21) @[src/main/scala/riscv/core/InstructionDecode.scala 88:23]
    node io_ex_immediate_lo_1 = cat(_io_ex_immediate_T_35, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 84:30]
    node io_ex_immediate_hi_hi_1 = cat(_io_ex_immediate_T_32, _io_ex_immediate_T_33) @[src/main/scala/riscv/core/InstructionDecode.scala 84:30]
    node io_ex_immediate_hi_2 = cat(io_ex_immediate_hi_hi_1, _io_ex_immediate_T_34) @[src/main/scala/riscv/core/InstructionDecode.scala 84:30]
    node _io_ex_immediate_T_36 = cat(io_ex_immediate_hi_2, io_ex_immediate_lo_1) @[src/main/scala/riscv/core/InstructionDecode.scala 84:30]
    node _io_ex_immediate_T_37 = eq(UInt<5>("h13"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_38 = mux(_io_ex_immediate_T_37, _io_ex_immediate_T_7, _io_ex_immediate_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_39 = eq(UInt<2>("h3"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_40 = mux(_io_ex_immediate_T_39, _io_ex_immediate_T_11, _io_ex_immediate_T_38) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_41 = eq(UInt<7>("h67"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_42 = mux(_io_ex_immediate_T_41, _io_ex_immediate_T_15, _io_ex_immediate_T_40) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_43 = eq(UInt<6>("h23"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_44 = mux(_io_ex_immediate_T_43, _io_ex_immediate_T_20, _io_ex_immediate_T_42) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_45 = eq(UInt<7>("h63"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_46 = mux(_io_ex_immediate_T_45, _io_ex_immediate_T_26, _io_ex_immediate_T_44) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_47 = eq(UInt<6>("h37"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_48 = mux(_io_ex_immediate_T_47, _io_ex_immediate_T_28, _io_ex_immediate_T_46) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_49 = eq(UInt<5>("h17"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_50 = mux(_io_ex_immediate_T_49, _io_ex_immediate_T_30, _io_ex_immediate_T_48) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_51 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    node _io_ex_immediate_T_52 = mux(_io_ex_immediate_T_51, _io_ex_immediate_T_36, _io_ex_immediate_T_50) @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
    io.ex_immediate <= _io_ex_immediate_T_52 @[src/main/scala/riscv/core/InstructionDecode.scala 66:19]
    node _io_ex_aluop1_source_T = eq(opcode, UInt<5>("h17")) @[src/main/scala/riscv/core/InstructionDecode.scala 94:12]
    node _io_ex_aluop1_source_T_1 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/InstructionDecode.scala 94:45]
    node _io_ex_aluop1_source_T_2 = or(_io_ex_aluop1_source_T, _io_ex_aluop1_source_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 94:35]
    node _io_ex_aluop1_source_T_3 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/InstructionDecode.scala 94:78]
    node _io_ex_aluop1_source_T_4 = or(_io_ex_aluop1_source_T_2, _io_ex_aluop1_source_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 94:68]
    node _io_ex_aluop1_source_T_5 = mux(_io_ex_aluop1_source_T_4, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 93:29]
    io.ex_aluop1_source <= _io_ex_aluop1_source_T_5 @[src/main/scala/riscv/core/InstructionDecode.scala 93:23]
    node _io_ex_aluop2_source_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/InstructionDecode.scala 99:12]
    node _io_ex_aluop2_source_T_1 = mux(_io_ex_aluop2_source_T, UInt<1>("h0"), UInt<1>("h1")) @[src/main/scala/riscv/core/InstructionDecode.scala 98:29]
    io.ex_aluop2_source <= _io_ex_aluop2_source_T_1 @[src/main/scala/riscv/core/InstructionDecode.scala 98:23]
    node _io_ex_memory_read_enable_T = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/InstructionDecode.scala 103:39]
    io.ex_memory_read_enable <= _io_ex_memory_read_enable_T @[src/main/scala/riscv/core/InstructionDecode.scala 103:29]
    node _io_ex_memory_write_enable_T = eq(opcode, UInt<6>("h23")) @[src/main/scala/riscv/core/InstructionDecode.scala 104:39]
    io.ex_memory_write_enable <= _io_ex_memory_write_enable_T @[src/main/scala/riscv/core/InstructionDecode.scala 104:29]
    node _io_ex_reg_write_source_T = eq(UInt<2>("h3"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_1 = mux(_io_ex_reg_write_source_T, UInt<2>("h1"), UInt<2>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_2 = eq(UInt<7>("h73"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_3 = mux(_io_ex_reg_write_source_T_2, UInt<2>("h2"), _io_ex_reg_write_source_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_4 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_5 = mux(_io_ex_reg_write_source_T_4, UInt<2>("h3"), _io_ex_reg_write_source_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_6 = eq(UInt<7>("h67"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    node _io_ex_reg_write_source_T_7 = mux(_io_ex_reg_write_source_T_6, UInt<2>("h3"), _io_ex_reg_write_source_T_5) @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
    io.ex_reg_write_source <= _io_ex_reg_write_source_T_7 @[src/main/scala/riscv/core/InstructionDecode.scala 105:26]
    node _io_ex_reg_write_enable_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/InstructionDecode.scala 116:37]
    node _io_ex_reg_write_enable_T_1 = eq(opcode, UInt<5>("h13")) @[src/main/scala/riscv/core/InstructionDecode.scala 116:73]
    node _io_ex_reg_write_enable_T_2 = or(_io_ex_reg_write_enable_T, _io_ex_reg_write_enable_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 116:62]
    node _io_ex_reg_write_enable_T_3 = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/InstructionDecode.scala 117:13]
    node _io_ex_reg_write_enable_T_4 = or(_io_ex_reg_write_enable_T_2, _io_ex_reg_write_enable_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 116:97]
    node _io_ex_reg_write_enable_T_5 = eq(opcode, UInt<5>("h17")) @[src/main/scala/riscv/core/InstructionDecode.scala 117:48]
    node _io_ex_reg_write_enable_T_6 = or(_io_ex_reg_write_enable_T_4, _io_ex_reg_write_enable_T_5) @[src/main/scala/riscv/core/InstructionDecode.scala 117:37]
    node _io_ex_reg_write_enable_T_7 = eq(opcode, UInt<6>("h37")) @[src/main/scala/riscv/core/InstructionDecode.scala 117:83]
    node _io_ex_reg_write_enable_T_8 = or(_io_ex_reg_write_enable_T_6, _io_ex_reg_write_enable_T_7) @[src/main/scala/riscv/core/InstructionDecode.scala 117:72]
    node _io_ex_reg_write_enable_T_9 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/InstructionDecode.scala 118:13]
    node _io_ex_reg_write_enable_T_10 = or(_io_ex_reg_write_enable_T_8, _io_ex_reg_write_enable_T_9) @[src/main/scala/riscv/core/InstructionDecode.scala 117:105]
    node _io_ex_reg_write_enable_T_11 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/InstructionDecode.scala 118:46]
    node _io_ex_reg_write_enable_T_12 = or(_io_ex_reg_write_enable_T_10, _io_ex_reg_write_enable_T_11) @[src/main/scala/riscv/core/InstructionDecode.scala 118:35]
    node _io_ex_reg_write_enable_T_13 = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/InstructionDecode.scala 118:80]
    node _io_ex_reg_write_enable_T_14 = or(_io_ex_reg_write_enable_T_12, _io_ex_reg_write_enable_T_13) @[src/main/scala/riscv/core/InstructionDecode.scala 118:69]
    io.ex_reg_write_enable <= _io_ex_reg_write_enable_T_14 @[src/main/scala/riscv/core/InstructionDecode.scala 116:26]
    node _io_ex_reg_write_address_T = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/InstructionDecode.scala 119:44]
    io.ex_reg_write_address <= _io_ex_reg_write_address_T @[src/main/scala/riscv/core/InstructionDecode.scala 119:27]
    node _io_ex_csr_address_T = bits(io.instruction, 31, 20) @[src/main/scala/riscv/core/InstructionDecode.scala 120:44]
    io.ex_csr_address <= _io_ex_csr_address_T @[src/main/scala/riscv/core/InstructionDecode.scala 120:27]
    node _io_ex_csr_write_enable_T = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/InstructionDecode.scala 121:37]
    node _io_ex_csr_write_enable_T_1 = eq(funct3, UInt<1>("h1")) @[src/main/scala/riscv/core/InstructionDecode.scala 122:12]
    node _io_ex_csr_write_enable_T_2 = eq(funct3, UInt<3>("h5")) @[src/main/scala/riscv/core/InstructionDecode.scala 122:52]
    node _io_ex_csr_write_enable_T_3 = or(_io_ex_csr_write_enable_T_1, _io_ex_csr_write_enable_T_2) @[src/main/scala/riscv/core/InstructionDecode.scala 122:42]
    node _io_ex_csr_write_enable_T_4 = eq(funct3, UInt<2>("h2")) @[src/main/scala/riscv/core/InstructionDecode.scala 123:14]
    node _io_ex_csr_write_enable_T_5 = or(_io_ex_csr_write_enable_T_3, _io_ex_csr_write_enable_T_4) @[src/main/scala/riscv/core/InstructionDecode.scala 122:83]
    node _io_ex_csr_write_enable_T_6 = eq(funct3, UInt<3>("h6")) @[src/main/scala/riscv/core/InstructionDecode.scala 123:54]
    node _io_ex_csr_write_enable_T_7 = or(_io_ex_csr_write_enable_T_5, _io_ex_csr_write_enable_T_6) @[src/main/scala/riscv/core/InstructionDecode.scala 123:44]
    node _io_ex_csr_write_enable_T_8 = eq(funct3, UInt<2>("h3")) @[src/main/scala/riscv/core/InstructionDecode.scala 124:14]
    node _io_ex_csr_write_enable_T_9 = or(_io_ex_csr_write_enable_T_7, _io_ex_csr_write_enable_T_8) @[src/main/scala/riscv/core/InstructionDecode.scala 123:85]
    node _io_ex_csr_write_enable_T_10 = eq(funct3, UInt<3>("h7")) @[src/main/scala/riscv/core/InstructionDecode.scala 124:54]
    node _io_ex_csr_write_enable_T_11 = or(_io_ex_csr_write_enable_T_9, _io_ex_csr_write_enable_T_10) @[src/main/scala/riscv/core/InstructionDecode.scala 124:44]
    node _io_ex_csr_write_enable_T_12 = and(_io_ex_csr_write_enable_T, _io_ex_csr_write_enable_T_11) @[src/main/scala/riscv/core/InstructionDecode.scala 121:59]
    io.ex_csr_write_enable <= _io_ex_csr_write_enable_T_12 @[src/main/scala/riscv/core/InstructionDecode.scala 121:26]
    node _reg1_data_forwarded_T = eq(UInt<2>("h0"), io.reg1_forward) @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
    node _reg1_data_forwarded_T_1 = mux(_reg1_data_forwarded_T, io.reg1_data, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
    node _reg1_data_forwarded_T_2 = eq(UInt<2>("h2"), io.reg1_forward) @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
    node _reg1_data_forwarded_T_3 = mux(_reg1_data_forwarded_T_2, io.forward_from_wb, _reg1_data_forwarded_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
    node _reg1_data_forwarded_T_4 = eq(UInt<2>("h1"), io.reg1_forward) @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
    node reg1_data_forwarded = mux(_reg1_data_forwarded_T_4, io.forward_from_mem, _reg1_data_forwarded_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
    node _reg2_data_forwarded_T = eq(UInt<2>("h0"), io.reg2_forward) @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
    node _reg2_data_forwarded_T_1 = mux(_reg2_data_forwarded_T, io.reg2_data, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
    node _reg2_data_forwarded_T_2 = eq(UInt<2>("h2"), io.reg2_forward) @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
    node _reg2_data_forwarded_T_3 = mux(_reg2_data_forwarded_T_2, io.forward_from_wb, _reg2_data_forwarded_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
    node _reg2_data_forwarded_T_4 = eq(UInt<2>("h1"), io.reg2_forward) @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
    node reg2_data_forwarded = mux(_reg2_data_forwarded_T_4, io.forward_from_mem, _reg2_data_forwarded_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
    node reg1_data = mux(uses_rs1, reg1_data_forwarded, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 143:22]
    node reg2_data = mux(uses_rs2, reg2_data_forwarded, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 144:22]
    node _io_ctrl_jump_instruction_T = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/InstructionDecode.scala 145:38]
    node _io_ctrl_jump_instruction_T_1 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/InstructionDecode.scala 146:13]
    node _io_ctrl_jump_instruction_T_2 = or(_io_ctrl_jump_instruction_T, _io_ctrl_jump_instruction_T_1) @[src/main/scala/riscv/core/InstructionDecode.scala 145:59]
    node _io_ctrl_jump_instruction_T_3 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/InstructionDecode.scala 147:13]
    node _io_ctrl_jump_instruction_T_4 = or(_io_ctrl_jump_instruction_T_2, _io_ctrl_jump_instruction_T_3) @[src/main/scala/riscv/core/InstructionDecode.scala 146:36]
    io.ctrl_jump_instruction <= _io_ctrl_jump_instruction_T_4 @[src/main/scala/riscv/core/InstructionDecode.scala 145:28]
    node _branch_taken_T = eq(io.branch_hazard, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 154:22]
    node _branch_taken_T_1 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/InstructionDecode.scala 155:12]
    node _branch_taken_T_2 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/InstructionDecode.scala 156:15]
    node _branch_taken_T_3 = or(_branch_taken_T_1, _branch_taken_T_2) @[src/main/scala/riscv/core/InstructionDecode.scala 155:33]
    node _branch_taken_T_4 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/InstructionDecode.scala 157:15]
    node _branch_taken_T_5 = eq(reg1_data, reg2_data) @[src/main/scala/riscv/core/InstructionDecode.scala 162:48]
    node _branch_taken_T_6 = neq(reg1_data, reg2_data) @[src/main/scala/riscv/core/InstructionDecode.scala 163:48]
    node _branch_taken_T_7 = asSInt(reg1_data) @[src/main/scala/riscv/core/InstructionDecode.scala 164:48]
    node _branch_taken_T_8 = asSInt(reg2_data) @[src/main/scala/riscv/core/InstructionDecode.scala 164:67]
    node _branch_taken_T_9 = lt(_branch_taken_T_7, _branch_taken_T_8) @[src/main/scala/riscv/core/InstructionDecode.scala 164:55]
    node _branch_taken_T_10 = asSInt(reg1_data) @[src/main/scala/riscv/core/InstructionDecode.scala 165:48]
    node _branch_taken_T_11 = asSInt(reg2_data) @[src/main/scala/riscv/core/InstructionDecode.scala 165:68]
    node _branch_taken_T_12 = geq(_branch_taken_T_10, _branch_taken_T_11) @[src/main/scala/riscv/core/InstructionDecode.scala 165:55]
    node _branch_taken_T_13 = lt(reg1_data, reg2_data) @[src/main/scala/riscv/core/InstructionDecode.scala 166:55]
    node _branch_taken_T_14 = geq(reg1_data, reg2_data) @[src/main/scala/riscv/core/InstructionDecode.scala 167:55]
    node _branch_taken_T_15 = eq(UInt<1>("h0"), funct3) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_16 = mux(_branch_taken_T_15, _branch_taken_T_5, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_17 = eq(UInt<1>("h1"), funct3) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_18 = mux(_branch_taken_T_17, _branch_taken_T_6, _branch_taken_T_16) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_19 = eq(UInt<3>("h4"), funct3) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_20 = mux(_branch_taken_T_19, _branch_taken_T_9, _branch_taken_T_18) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_21 = eq(UInt<3>("h5"), funct3) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_22 = mux(_branch_taken_T_21, _branch_taken_T_12, _branch_taken_T_20) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_23 = eq(UInt<3>("h6"), funct3) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_24 = mux(_branch_taken_T_23, _branch_taken_T_13, _branch_taken_T_22) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_25 = eq(UInt<3>("h7"), funct3) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_26 = mux(_branch_taken_T_25, _branch_taken_T_14, _branch_taken_T_24) @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
    node _branch_taken_T_27 = and(_branch_taken_T_4, _branch_taken_T_26) @[src/main/scala/riscv/core/InstructionDecode.scala 157:39]
    node _branch_taken_T_28 = or(_branch_taken_T_3, _branch_taken_T_27) @[src/main/scala/riscv/core/InstructionDecode.scala 156:38]
    node branch_taken = and(_branch_taken_T, _branch_taken_T_28) @[src/main/scala/riscv/core/InstructionDecode.scala 154:40]
    node _io_if_jump_flag_T = or(branch_taken, io.interrupt_assert) @[src/main/scala/riscv/core/InstructionDecode.scala 172:35]
    io.if_jump_flag <= _io_if_jump_flag_T @[src/main/scala/riscv/core/InstructionDecode.scala 172:19]
    node _jalr_target_T = add(reg1_data, io.ex_immediate) @[src/main/scala/riscv/core/InstructionDecode.scala 174:36]
    node _jalr_target_T_1 = tail(_jalr_target_T, 1) @[src/main/scala/riscv/core/InstructionDecode.scala 174:36]
    node _jalr_target_T_2 = bits(_jalr_target_T_1, 31, 1) @[src/main/scala/riscv/core/InstructionDecode.scala 174:54]
    node jalr_target = cat(_jalr_target_T_2, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 174:24]
    node _io_if_jump_address_T = add(io.instruction_address, io.ex_immediate) @[src/main/scala/riscv/core/InstructionDecode.scala 181:55]
    node _io_if_jump_address_T_1 = tail(_io_if_jump_address_T, 1) @[src/main/scala/riscv/core/InstructionDecode.scala 181:55]
    node _io_if_jump_address_T_2 = add(io.instruction_address, io.ex_immediate) @[src/main/scala/riscv/core/InstructionDecode.scala 182:55]
    node _io_if_jump_address_T_3 = tail(_io_if_jump_address_T_2, 1) @[src/main/scala/riscv/core/InstructionDecode.scala 182:55]
    node _io_if_jump_address_T_4 = eq(UInt<7>("h63"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
    node _io_if_jump_address_T_5 = mux(_io_if_jump_address_T_4, _io_if_jump_address_T_1, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
    node _io_if_jump_address_T_6 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
    node _io_if_jump_address_T_7 = mux(_io_if_jump_address_T_6, _io_if_jump_address_T_3, _io_if_jump_address_T_5) @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
    node _io_if_jump_address_T_8 = eq(UInt<7>("h67"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
    node _io_if_jump_address_T_9 = mux(_io_if_jump_address_T_8, jalr_target, _io_if_jump_address_T_7) @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
    node _io_if_jump_address_T_10 = mux(io.interrupt_assert, io.interrupt_handler_address, _io_if_jump_address_T_9) @[src/main/scala/riscv/core/InstructionDecode.scala 176:28]
    io.if_jump_address <= _io_if_jump_address_T_10 @[src/main/scala/riscv/core/InstructionDecode.scala 176:22]
    io.clint_jump_flag <= io.ctrl_jump_instruction @[src/main/scala/riscv/core/InstructionDecode.scala 187:22]
    node _io_clint_jump_address_T = add(io.instruction_address, io.ex_immediate) @[src/main/scala/riscv/core/InstructionDecode.scala 193:53]
    node _io_clint_jump_address_T_1 = tail(_io_clint_jump_address_T, 1) @[src/main/scala/riscv/core/InstructionDecode.scala 193:53]
    node _io_clint_jump_address_T_2 = add(io.instruction_address, io.ex_immediate) @[src/main/scala/riscv/core/InstructionDecode.scala 194:53]
    node _io_clint_jump_address_T_3 = tail(_io_clint_jump_address_T_2, 1) @[src/main/scala/riscv/core/InstructionDecode.scala 194:53]
    node _io_clint_jump_address_T_4 = eq(UInt<7>("h63"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
    node _io_clint_jump_address_T_5 = mux(_io_clint_jump_address_T_4, _io_clint_jump_address_T_1, UInt<1>("h0")) @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
    node _io_clint_jump_address_T_6 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
    node _io_clint_jump_address_T_7 = mux(_io_clint_jump_address_T_6, _io_clint_jump_address_T_3, _io_clint_jump_address_T_5) @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
    node _io_clint_jump_address_T_8 = eq(UInt<7>("h67"), opcode) @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
    node _io_clint_jump_address_T_9 = mux(_io_clint_jump_address_T_8, jalr_target, _io_clint_jump_address_T_7) @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
    io.clint_jump_address <= _io_clint_jump_address_T_9 @[src/main/scala/riscv/core/InstructionDecode.scala 188:25]

  module PipelineRegister_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<32>("h13") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<32>("h13") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<32>("h1000") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<32>("h1000") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<12>, out : UInt<12>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<12>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<12>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module ID2EX :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip regs_reg1_read_address : UInt<5>, flip regs_reg2_read_address : UInt<5>, flip regs_write_enable : UInt<1>, flip regs_write_address : UInt<5>, flip regs_write_source : UInt<2>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip immediate : UInt<32>, flip aluop1_source : UInt<1>, flip aluop2_source : UInt<1>, flip csr_write_enable : UInt<1>, flip csr_address : UInt<12>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip csr_read_data : UInt<32>, output_instruction : UInt<32>, output_instruction_address : UInt<32>, output_regs_reg1_read_address : UInt<5>, output_regs_reg2_read_address : UInt<5>, output_regs_write_enable : UInt<1>, output_regs_write_address : UInt<5>, output_regs_write_source : UInt<2>, output_reg1_data : UInt<32>, output_reg2_data : UInt<32>, output_immediate : UInt<32>, output_aluop1_source : UInt<1>, output_aluop2_source : UInt<1>, output_csr_write_enable : UInt<1>, output_csr_address : UInt<12>, output_memory_read_enable : UInt<1>, output_memory_write_enable : UInt<1>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/ID2EX.scala 12:14]

    inst instruction of PipelineRegister_5 @[src/main/scala/riscv/core/ID2EX.scala 53:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/ID2EX.scala 54:25]
    instruction.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 55:25]
    instruction.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 56:25]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/ID2EX.scala 57:25]
    inst instruction_address of PipelineRegister_6 @[src/main/scala/riscv/core/ID2EX.scala 59:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/ID2EX.scala 60:33]
    instruction_address.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 61:33]
    instruction_address.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 62:33]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/ID2EX.scala 63:33]
    inst regs_reg1_read_address of PipelineRegister_7 @[src/main/scala/riscv/core/ID2EX.scala 65:38]
    regs_reg1_read_address.clock <= clock
    regs_reg1_read_address.reset <= reset
    regs_reg1_read_address.io.in <= io.regs_reg1_read_address @[src/main/scala/riscv/core/ID2EX.scala 66:36]
    regs_reg1_read_address.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 67:36]
    regs_reg1_read_address.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 68:36]
    io.output_regs_reg1_read_address <= regs_reg1_read_address.io.out @[src/main/scala/riscv/core/ID2EX.scala 69:36]
    inst regs_reg2_read_address of PipelineRegister_8 @[src/main/scala/riscv/core/ID2EX.scala 71:38]
    regs_reg2_read_address.clock <= clock
    regs_reg2_read_address.reset <= reset
    regs_reg2_read_address.io.in <= io.regs_reg2_read_address @[src/main/scala/riscv/core/ID2EX.scala 72:36]
    regs_reg2_read_address.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 73:36]
    regs_reg2_read_address.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 74:36]
    io.output_regs_reg2_read_address <= regs_reg2_read_address.io.out @[src/main/scala/riscv/core/ID2EX.scala 75:36]
    inst regs_write_enable of PipelineRegister_9 @[src/main/scala/riscv/core/ID2EX.scala 77:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/ID2EX.scala 78:31]
    regs_write_enable.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 79:31]
    regs_write_enable.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 80:31]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/ID2EX.scala 81:31]
    inst regs_write_address of PipelineRegister_10 @[src/main/scala/riscv/core/ID2EX.scala 83:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/ID2EX.scala 84:32]
    regs_write_address.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 85:32]
    regs_write_address.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 86:32]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/ID2EX.scala 87:32]
    inst regs_write_source of PipelineRegister_11 @[src/main/scala/riscv/core/ID2EX.scala 89:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/ID2EX.scala 90:31]
    regs_write_source.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 91:31]
    regs_write_source.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 92:31]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/ID2EX.scala 93:31]
    inst reg1_data of PipelineRegister_12 @[src/main/scala/riscv/core/ID2EX.scala 95:25]
    reg1_data.clock <= clock
    reg1_data.reset <= reset
    reg1_data.io.in <= io.reg1_data @[src/main/scala/riscv/core/ID2EX.scala 96:23]
    reg1_data.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 97:23]
    reg1_data.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 98:23]
    io.output_reg1_data <= reg1_data.io.out @[src/main/scala/riscv/core/ID2EX.scala 99:23]
    inst reg2_data of PipelineRegister_13 @[src/main/scala/riscv/core/ID2EX.scala 101:25]
    reg2_data.clock <= clock
    reg2_data.reset <= reset
    reg2_data.io.in <= io.reg2_data @[src/main/scala/riscv/core/ID2EX.scala 102:23]
    reg2_data.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 103:23]
    reg2_data.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 104:23]
    io.output_reg2_data <= reg2_data.io.out @[src/main/scala/riscv/core/ID2EX.scala 105:23]
    inst immediate of PipelineRegister_14 @[src/main/scala/riscv/core/ID2EX.scala 107:25]
    immediate.clock <= clock
    immediate.reset <= reset
    immediate.io.in <= io.immediate @[src/main/scala/riscv/core/ID2EX.scala 108:23]
    immediate.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 109:23]
    immediate.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 110:23]
    io.output_immediate <= immediate.io.out @[src/main/scala/riscv/core/ID2EX.scala 111:23]
    inst aluop1_source of PipelineRegister_15 @[src/main/scala/riscv/core/ID2EX.scala 113:29]
    aluop1_source.clock <= clock
    aluop1_source.reset <= reset
    aluop1_source.io.in <= io.aluop1_source @[src/main/scala/riscv/core/ID2EX.scala 114:27]
    aluop1_source.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 115:27]
    aluop1_source.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 116:27]
    io.output_aluop1_source <= aluop1_source.io.out @[src/main/scala/riscv/core/ID2EX.scala 117:27]
    inst aluop2_source of PipelineRegister_16 @[src/main/scala/riscv/core/ID2EX.scala 119:29]
    aluop2_source.clock <= clock
    aluop2_source.reset <= reset
    aluop2_source.io.in <= io.aluop2_source @[src/main/scala/riscv/core/ID2EX.scala 120:27]
    aluop2_source.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 121:27]
    aluop2_source.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 122:27]
    io.output_aluop2_source <= aluop2_source.io.out @[src/main/scala/riscv/core/ID2EX.scala 123:27]
    inst csr_write_enable of PipelineRegister_17 @[src/main/scala/riscv/core/ID2EX.scala 125:32]
    csr_write_enable.clock <= clock
    csr_write_enable.reset <= reset
    csr_write_enable.io.in <= io.csr_write_enable @[src/main/scala/riscv/core/ID2EX.scala 126:30]
    csr_write_enable.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 127:30]
    csr_write_enable.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 128:30]
    io.output_csr_write_enable <= csr_write_enable.io.out @[src/main/scala/riscv/core/ID2EX.scala 129:30]
    inst csr_address of PipelineRegister_18 @[src/main/scala/riscv/core/ID2EX.scala 131:27]
    csr_address.clock <= clock
    csr_address.reset <= reset
    csr_address.io.in <= io.csr_address @[src/main/scala/riscv/core/ID2EX.scala 132:25]
    csr_address.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 133:25]
    csr_address.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 134:25]
    io.output_csr_address <= csr_address.io.out @[src/main/scala/riscv/core/ID2EX.scala 135:25]
    inst memory_read_enable of PipelineRegister_19 @[src/main/scala/riscv/core/ID2EX.scala 137:34]
    memory_read_enable.clock <= clock
    memory_read_enable.reset <= reset
    memory_read_enable.io.in <= io.memory_read_enable @[src/main/scala/riscv/core/ID2EX.scala 138:32]
    memory_read_enable.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 139:32]
    memory_read_enable.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 140:32]
    io.output_memory_read_enable <= memory_read_enable.io.out @[src/main/scala/riscv/core/ID2EX.scala 141:32]
    inst memory_write_enable of PipelineRegister_20 @[src/main/scala/riscv/core/ID2EX.scala 143:35]
    memory_write_enable.clock <= clock
    memory_write_enable.reset <= reset
    memory_write_enable.io.in <= io.memory_write_enable @[src/main/scala/riscv/core/ID2EX.scala 144:33]
    memory_write_enable.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 145:33]
    memory_write_enable.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 146:33]
    io.output_memory_write_enable <= memory_write_enable.io.out @[src/main/scala/riscv/core/ID2EX.scala 147:33]
    inst csr_read_data of PipelineRegister_21 @[src/main/scala/riscv/core/ID2EX.scala 149:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/ID2EX.scala 150:27]
    csr_read_data.io.stall <= io.stall @[src/main/scala/riscv/core/ID2EX.scala 151:27]
    csr_read_data.io.flush <= io.flush @[src/main/scala/riscv/core/ID2EX.scala 152:27]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/ID2EX.scala 153:27]

  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { flip func : UInt<4>, flip op1 : UInt<32>, flip op2 : UInt<32>, result : UInt<32>} @[src/main/scala/riscv/core/ALU.scala 27:14]

    io.result <= UInt<1>("h0") @[src/main/scala/riscv/core/ALU.scala 36:13]
    node _T = asUInt(UInt<1>("h1")) @[src/main/scala/riscv/core/ALU.scala 37:19]
    node _T_1 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/riscv/core/ALU.scala 37:19]
    when _T_2 : @[src/main/scala/riscv/core/ALU.scala 37:19]
      node _io_result_T = add(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 39:27]
      node _io_result_T_1 = tail(_io_result_T, 1) @[src/main/scala/riscv/core/ALU.scala 39:27]
      io.result <= _io_result_T_1 @[src/main/scala/riscv/core/ALU.scala 39:17]
    else :
      node _T_3 = asUInt(UInt<2>("h2")) @[src/main/scala/riscv/core/ALU.scala 37:19]
      node _T_4 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/riscv/core/ALU.scala 37:19]
      when _T_5 : @[src/main/scala/riscv/core/ALU.scala 37:19]
        node _io_result_T_2 = sub(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 42:27]
        node _io_result_T_3 = tail(_io_result_T_2, 1) @[src/main/scala/riscv/core/ALU.scala 42:27]
        io.result <= _io_result_T_3 @[src/main/scala/riscv/core/ALU.scala 42:17]
      else :
        node _T_6 = asUInt(UInt<2>("h3")) @[src/main/scala/riscv/core/ALU.scala 37:19]
        node _T_7 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
        node _T_8 = eq(_T_6, _T_7) @[src/main/scala/riscv/core/ALU.scala 37:19]
        when _T_8 : @[src/main/scala/riscv/core/ALU.scala 37:19]
          node _io_result_T_4 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/ALU.scala 45:36]
          node _io_result_T_5 = dshl(io.op1, _io_result_T_4) @[src/main/scala/riscv/core/ALU.scala 45:27]
          io.result <= _io_result_T_5 @[src/main/scala/riscv/core/ALU.scala 45:17]
        else :
          node _T_9 = asUInt(UInt<3>("h4")) @[src/main/scala/riscv/core/ALU.scala 37:19]
          node _T_10 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
          node _T_11 = eq(_T_9, _T_10) @[src/main/scala/riscv/core/ALU.scala 37:19]
          when _T_11 : @[src/main/scala/riscv/core/ALU.scala 37:19]
            node _io_result_T_6 = asSInt(io.op1) @[src/main/scala/riscv/core/ALU.scala 48:27]
            node _io_result_T_7 = asSInt(io.op2) @[src/main/scala/riscv/core/ALU.scala 48:43]
            node _io_result_T_8 = lt(_io_result_T_6, _io_result_T_7) @[src/main/scala/riscv/core/ALU.scala 48:34]
            io.result <= _io_result_T_8 @[src/main/scala/riscv/core/ALU.scala 48:17]
          else :
            node _T_12 = asUInt(UInt<3>("h5")) @[src/main/scala/riscv/core/ALU.scala 37:19]
            node _T_13 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
            node _T_14 = eq(_T_12, _T_13) @[src/main/scala/riscv/core/ALU.scala 37:19]
            when _T_14 : @[src/main/scala/riscv/core/ALU.scala 37:19]
              node _io_result_T_9 = xor(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 51:27]
              io.result <= _io_result_T_9 @[src/main/scala/riscv/core/ALU.scala 51:17]
            else :
              node _T_15 = asUInt(UInt<3>("h6")) @[src/main/scala/riscv/core/ALU.scala 37:19]
              node _T_16 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
              node _T_17 = eq(_T_15, _T_16) @[src/main/scala/riscv/core/ALU.scala 37:19]
              when _T_17 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                node _io_result_T_10 = or(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 54:27]
                io.result <= _io_result_T_10 @[src/main/scala/riscv/core/ALU.scala 54:17]
              else :
                node _T_18 = asUInt(UInt<3>("h7")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                node _T_19 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                node _T_20 = eq(_T_18, _T_19) @[src/main/scala/riscv/core/ALU.scala 37:19]
                when _T_20 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                  node _io_result_T_11 = and(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 57:27]
                  io.result <= _io_result_T_11 @[src/main/scala/riscv/core/ALU.scala 57:17]
                else :
                  node _T_21 = asUInt(UInt<4>("h8")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                  node _T_22 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                  node _T_23 = eq(_T_21, _T_22) @[src/main/scala/riscv/core/ALU.scala 37:19]
                  when _T_23 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                    node _io_result_T_12 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/ALU.scala 60:36]
                    node _io_result_T_13 = dshr(io.op1, _io_result_T_12) @[src/main/scala/riscv/core/ALU.scala 60:27]
                    io.result <= _io_result_T_13 @[src/main/scala/riscv/core/ALU.scala 60:17]
                  else :
                    node _T_24 = asUInt(UInt<4>("h9")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                    node _T_25 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                    node _T_26 = eq(_T_24, _T_25) @[src/main/scala/riscv/core/ALU.scala 37:19]
                    when _T_26 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                      node _io_result_T_14 = asSInt(io.op1) @[src/main/scala/riscv/core/ALU.scala 63:28]
                      node _io_result_T_15 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/ALU.scala 63:44]
                      node _io_result_T_16 = dshr(_io_result_T_14, _io_result_T_15) @[src/main/scala/riscv/core/ALU.scala 63:35]
                      node _io_result_T_17 = asUInt(_io_result_T_16) @[src/main/scala/riscv/core/ALU.scala 63:52]
                      io.result <= _io_result_T_17 @[src/main/scala/riscv/core/ALU.scala 63:17]
                    else :
                      node _T_27 = asUInt(UInt<4>("ha")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                      node _T_28 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                      node _T_29 = eq(_T_27, _T_28) @[src/main/scala/riscv/core/ALU.scala 37:19]
                      when _T_29 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                        node _io_result_T_18 = lt(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 66:27]
                        io.result <= _io_result_T_18 @[src/main/scala/riscv/core/ALU.scala 66:17]


  module ALUControl :
    input clock : Clock
    input reset : Reset
    output io : { flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>, alu_funct : UInt<4>} @[src/main/scala/riscv/core/ALUControl.scala 15:14]

    io.alu_funct <= UInt<1>("h0") @[src/main/scala/riscv/core/ALUControl.scala 23:16]
    node _T = eq(UInt<5>("h13"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
    when _T : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
      node _io_alu_funct_T = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/ALUControl.scala 39:51]
      node _io_alu_funct_T_1 = mux(_io_alu_funct_T, UInt<4>("h9"), UInt<4>("h8")) @[src/main/scala/riscv/core/ALUControl.scala 39:41]
      node _io_alu_funct_T_2 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_3 = mux(_io_alu_funct_T_2, UInt<2>("h3"), UInt<1>("h1")) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_4 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_5 = mux(_io_alu_funct_T_4, UInt<3>("h4"), _io_alu_funct_T_3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_6 = eq(UInt<2>("h3"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_7 = mux(_io_alu_funct_T_6, UInt<4>("ha"), _io_alu_funct_T_5) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_8 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_9 = mux(_io_alu_funct_T_8, UInt<3>("h5"), _io_alu_funct_T_7) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_10 = eq(UInt<3>("h6"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_11 = mux(_io_alu_funct_T_10, UInt<3>("h6"), _io_alu_funct_T_9) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_12 = eq(UInt<3>("h7"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_13 = mux(_io_alu_funct_T_12, UInt<3>("h7"), _io_alu_funct_T_11) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_14 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      node _io_alu_funct_T_15 = mux(_io_alu_funct_T_14, _io_alu_funct_T_1, _io_alu_funct_T_13) @[src/main/scala/riscv/core/ALUControl.scala 30:8]
      io.alu_funct <= _io_alu_funct_T_15 @[src/main/scala/riscv/core/ALUControl.scala 27:20]
    else :
      node _T_1 = eq(UInt<6>("h33"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
      when _T_1 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
        node _io_alu_funct_T_16 = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/ALUControl.scala 49:53]
        node _io_alu_funct_T_17 = mux(_io_alu_funct_T_16, UInt<2>("h2"), UInt<1>("h1")) @[src/main/scala/riscv/core/ALUControl.scala 49:43]
        node _io_alu_funct_T_18 = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/ALUControl.scala 56:53]
        node _io_alu_funct_T_19 = mux(_io_alu_funct_T_18, UInt<4>("h9"), UInt<4>("h8")) @[src/main/scala/riscv/core/ALUControl.scala 56:43]
        node _io_alu_funct_T_20 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_21 = mux(_io_alu_funct_T_20, UInt<2>("h3"), _io_alu_funct_T_17) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_22 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_23 = mux(_io_alu_funct_T_22, UInt<3>("h4"), _io_alu_funct_T_21) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_24 = eq(UInt<2>("h3"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_25 = mux(_io_alu_funct_T_24, UInt<4>("ha"), _io_alu_funct_T_23) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_26 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_27 = mux(_io_alu_funct_T_26, UInt<3>("h5"), _io_alu_funct_T_25) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_28 = eq(UInt<3>("h6"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_29 = mux(_io_alu_funct_T_28, UInt<3>("h6"), _io_alu_funct_T_27) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_30 = eq(UInt<3>("h7"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_31 = mux(_io_alu_funct_T_30, UInt<3>("h7"), _io_alu_funct_T_29) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_32 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        node _io_alu_funct_T_33 = mux(_io_alu_funct_T_32, _io_alu_funct_T_19, _io_alu_funct_T_31) @[src/main/scala/riscv/core/ALUControl.scala 47:8]
        io.alu_funct <= _io_alu_funct_T_33 @[src/main/scala/riscv/core/ALUControl.scala 44:20]
      else :
        node _T_2 = eq(UInt<7>("h63"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
        when _T_2 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
          io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 61:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
          when _T_3 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
            io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 64:20]
          else :
            node _T_4 = eq(UInt<6>("h23"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
            when _T_4 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
              io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 67:20]
            else :
              node _T_5 = eq(UInt<7>("h6f"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
              when _T_5 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 70:20]
              else :
                node _T_6 = eq(UInt<7>("h67"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                when _T_6 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                  io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 73:20]
                else :
                  node _T_7 = eq(UInt<6>("h37"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                  when _T_7 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                    io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 76:20]
                  else :
                    node _T_8 = eq(UInt<5>("h17"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                    when _T_8 : @[src/main/scala/riscv/core/ALUControl.scala 25:21]
                      io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 79:20]


  module Execute :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip immediate : UInt<32>, flip aluop1_source : UInt<1>, flip aluop2_source : UInt<1>, flip csr_read_data : UInt<32>, flip forward_from_mem : UInt<32>, flip forward_from_wb : UInt<32>, flip reg1_forward : UInt<2>, flip reg2_forward : UInt<2>, mem_alu_result : UInt<32>, mem_reg2_data : UInt<32>, csr_write_data : UInt<32>} @[src/main/scala/riscv/core/Execute.scala 14:14]

    node opcode = bits(io.instruction, 6, 0) @[src/main/scala/riscv/core/Execute.scala 33:30]
    node funct3 = bits(io.instruction, 14, 12) @[src/main/scala/riscv/core/Execute.scala 34:30]
    node funct7 = bits(io.instruction, 31, 25) @[src/main/scala/riscv/core/Execute.scala 35:30]
    node uimm = bits(io.instruction, 19, 15) @[src/main/scala/riscv/core/Execute.scala 36:30]
    inst alu of ALU @[src/main/scala/riscv/core/Execute.scala 38:24]
    alu.clock <= clock
    alu.reset <= reset
    inst alu_ctrl of ALUControl @[src/main/scala/riscv/core/Execute.scala 39:24]
    alu_ctrl.clock <= clock
    alu_ctrl.reset <= reset
    alu_ctrl.io.opcode <= opcode @[src/main/scala/riscv/core/Execute.scala 41:22]
    alu_ctrl.io.funct3 <= funct3 @[src/main/scala/riscv/core/Execute.scala 42:22]
    alu_ctrl.io.funct7 <= funct7 @[src/main/scala/riscv/core/Execute.scala 43:22]
    alu.io.func <= alu_ctrl.io.alu_funct @[src/main/scala/riscv/core/Execute.scala 44:22]
    node _reg1_data_T = eq(UInt<2>("h1"), io.reg1_forward) @[src/main/scala/riscv/core/Execute.scala 49:4]
    node _reg1_data_T_1 = mux(_reg1_data_T, io.forward_from_mem, io.reg1_data) @[src/main/scala/riscv/core/Execute.scala 49:4]
    node _reg1_data_T_2 = eq(UInt<2>("h2"), io.reg1_forward) @[src/main/scala/riscv/core/Execute.scala 49:4]
    node reg1_data = mux(_reg1_data_T_2, io.forward_from_wb, _reg1_data_T_1) @[src/main/scala/riscv/core/Execute.scala 49:4]
    node _alu_io_op1_T = eq(io.aluop1_source, UInt<1>("h1")) @[src/main/scala/riscv/core/Execute.scala 56:22]
    node _alu_io_op1_T_1 = mux(_alu_io_op1_T, io.instruction_address, reg1_data) @[src/main/scala/riscv/core/Execute.scala 55:20]
    alu.io.op1 <= _alu_io_op1_T_1 @[src/main/scala/riscv/core/Execute.scala 55:14]
    node _reg2_data_T = eq(UInt<2>("h1"), io.reg2_forward) @[src/main/scala/riscv/core/Execute.scala 64:4]
    node _reg2_data_T_1 = mux(_reg2_data_T, io.forward_from_mem, io.reg2_data) @[src/main/scala/riscv/core/Execute.scala 64:4]
    node _reg2_data_T_2 = eq(UInt<2>("h2"), io.reg2_forward) @[src/main/scala/riscv/core/Execute.scala 64:4]
    node reg2_data = mux(_reg2_data_T_2, io.forward_from_wb, _reg2_data_T_1) @[src/main/scala/riscv/core/Execute.scala 64:4]
    node _alu_io_op2_T = eq(io.aluop2_source, UInt<1>("h1")) @[src/main/scala/riscv/core/Execute.scala 71:22]
    node _alu_io_op2_T_1 = mux(_alu_io_op2_T, io.immediate, reg2_data) @[src/main/scala/riscv/core/Execute.scala 70:20]
    alu.io.op2 <= _alu_io_op2_T_1 @[src/main/scala/riscv/core/Execute.scala 70:14]
    io.mem_alu_result <= alu.io.result @[src/main/scala/riscv/core/Execute.scala 75:21]
    io.mem_reg2_data <= reg2_data @[src/main/scala/riscv/core/Execute.scala 76:21]
    node _io_csr_write_data_T = not(reg1_data) @[src/main/scala/riscv/core/Execute.scala 83:57]
    node _io_csr_write_data_T_1 = and(io.csr_read_data, _io_csr_write_data_T) @[src/main/scala/riscv/core/Execute.scala 83:55]
    node _io_csr_write_data_T_2 = or(io.csr_read_data, reg1_data) @[src/main/scala/riscv/core/Execute.scala 84:55]
    node _io_csr_write_data_T_3 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/Execute.scala 85:40]
    node _io_csr_write_data_T_4 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/Execute.scala 86:61]
    node _io_csr_write_data_T_5 = not(_io_csr_write_data_T_4) @[src/main/scala/riscv/core/Execute.scala 86:57]
    node _io_csr_write_data_T_6 = and(io.csr_read_data, _io_csr_write_data_T_5) @[src/main/scala/riscv/core/Execute.scala 86:55]
    node _io_csr_write_data_T_7 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/Execute.scala 87:59]
    node _io_csr_write_data_T_8 = or(io.csr_read_data, _io_csr_write_data_T_7) @[src/main/scala/riscv/core/Execute.scala 87:55]
    node _io_csr_write_data_T_9 = eq(UInt<1>("h1"), funct3) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_10 = mux(_io_csr_write_data_T_9, reg1_data, UInt<1>("h0")) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_11 = eq(UInt<2>("h3"), funct3) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_12 = mux(_io_csr_write_data_T_11, _io_csr_write_data_T_1, _io_csr_write_data_T_10) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_13 = eq(UInt<2>("h2"), funct3) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_14 = mux(_io_csr_write_data_T_13, _io_csr_write_data_T_2, _io_csr_write_data_T_12) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_15 = eq(UInt<3>("h5"), funct3) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_16 = mux(_io_csr_write_data_T_15, _io_csr_write_data_T_3, _io_csr_write_data_T_14) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_17 = eq(UInt<3>("h7"), funct3) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_18 = mux(_io_csr_write_data_T_17, _io_csr_write_data_T_6, _io_csr_write_data_T_16) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_19 = eq(UInt<3>("h6"), funct3) @[src/main/scala/riscv/core/Execute.scala 80:4]
    node _io_csr_write_data_T_20 = mux(_io_csr_write_data_T_19, _io_csr_write_data_T_8, _io_csr_write_data_T_18) @[src/main/scala/riscv/core/Execute.scala 80:4]
    io.csr_write_data <= _io_csr_write_data_T_20 @[src/main/scala/riscv/core/Execute.scala 77:21]

  module PipelineRegister_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<3>, out : UInt<3>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module EX2MEM :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip regs_write_enable : UInt<1>, flip regs_write_source : UInt<2>, flip regs_write_address : UInt<32>, flip instruction_address : UInt<32>, flip funct3 : UInt<3>, flip reg2_data : UInt<32>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip alu_result : UInt<32>, flip csr_read_data : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_source : UInt<2>, output_regs_write_address : UInt<32>, output_instruction_address : UInt<32>, output_funct3 : UInt<32>, output_reg2_data : UInt<32>, output_memory_read_enable : UInt<1>, output_memory_write_enable : UInt<1>, output_alu_result : UInt<32>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/EX2MEM.scala 12:14]

    inst regs_write_enable of PipelineRegister_22 @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/EX2MEM.scala 41:31]
    regs_write_enable.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 42:31]
    regs_write_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 43:31]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/EX2MEM.scala 44:31]
    inst regs_write_source of PipelineRegister_23 @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/EX2MEM.scala 47:31]
    regs_write_source.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 48:31]
    regs_write_source.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 49:31]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/EX2MEM.scala 50:31]
    inst regs_write_address of PipelineRegister_24 @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/EX2MEM.scala 53:32]
    regs_write_address.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 54:32]
    regs_write_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 55:32]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/EX2MEM.scala 56:32]
    inst instruction_address of PipelineRegister_25 @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/EX2MEM.scala 59:33]
    instruction_address.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 60:33]
    instruction_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 61:33]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/EX2MEM.scala 62:33]
    inst funct3 of PipelineRegister_26 @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
    funct3.clock <= clock
    funct3.reset <= reset
    funct3.io.in <= io.funct3 @[src/main/scala/riscv/core/EX2MEM.scala 65:20]
    funct3.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 66:20]
    funct3.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 67:20]
    io.output_funct3 <= funct3.io.out @[src/main/scala/riscv/core/EX2MEM.scala 68:20]
    inst reg2_data of PipelineRegister_27 @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
    reg2_data.clock <= clock
    reg2_data.reset <= reset
    reg2_data.io.in <= io.reg2_data @[src/main/scala/riscv/core/EX2MEM.scala 71:23]
    reg2_data.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 72:23]
    reg2_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 73:23]
    io.output_reg2_data <= reg2_data.io.out @[src/main/scala/riscv/core/EX2MEM.scala 74:23]
    inst alu_result of PipelineRegister_28 @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
    alu_result.clock <= clock
    alu_result.reset <= reset
    alu_result.io.in <= io.alu_result @[src/main/scala/riscv/core/EX2MEM.scala 77:24]
    alu_result.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 78:24]
    alu_result.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 79:24]
    io.output_alu_result <= alu_result.io.out @[src/main/scala/riscv/core/EX2MEM.scala 80:24]
    inst memory_read_enable of PipelineRegister_29 @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
    memory_read_enable.clock <= clock
    memory_read_enable.reset <= reset
    memory_read_enable.io.in <= io.memory_read_enable @[src/main/scala/riscv/core/EX2MEM.scala 83:32]
    memory_read_enable.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 84:32]
    memory_read_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 85:32]
    io.output_memory_read_enable <= memory_read_enable.io.out @[src/main/scala/riscv/core/EX2MEM.scala 86:32]
    inst memory_write_enable of PipelineRegister_30 @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
    memory_write_enable.clock <= clock
    memory_write_enable.reset <= reset
    memory_write_enable.io.in <= io.memory_write_enable @[src/main/scala/riscv/core/EX2MEM.scala 89:33]
    memory_write_enable.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 90:33]
    memory_write_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 91:33]
    io.output_memory_write_enable <= memory_write_enable.io.out @[src/main/scala/riscv/core/EX2MEM.scala 92:33]
    inst csr_read_data of PipelineRegister_31 @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/EX2MEM.scala 95:27]
    csr_read_data.io.stall <= io.stall @[src/main/scala/riscv/core/EX2MEM.scala 96:27]
    csr_read_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/EX2MEM.scala 97:27]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/EX2MEM.scala 98:27]

  module MemoryAccess :
    input clock : Clock
    input reset : Reset
    output io : { flip alu_result : UInt<32>, flip reg2_data : UInt<32>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip funct3 : UInt<3>, flip regs_write_source : UInt<2>, flip csr_read_data : UInt<32>, flip instruction_address : UInt<32>, wb_memory_read_data : UInt<32>, forward_to_ex : UInt<32>, ctrl_stall_flag : UInt<1>, wb_regs_write_source : UInt<2>, bus : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], flip write_valid : UInt<1>, flip write_data_accepted : UInt<1>, flip busy : UInt<1>, request : UInt<1>, flip granted : UInt<1>}} @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]

    node mem_address_index = bits(io.alu_result, 1, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 36:40]
    reg mem_access_state : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 37:34]
    reg latched_memory_read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 41:41]
    reg latched_regs_write_source : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 48:42]
    reg latched_funct3 : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 49:42]
    reg latched_address_index : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 50:42]
    reg read_just_completed : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 57:36]
    node _T = eq(mem_access_state, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 69:48]
    node _T_1 = and(read_just_completed, _T) @[src/main/scala/riscv/core/MemoryAccess.scala 69:28]
    when _T_1 : @[src/main/scala/riscv/core/MemoryAccess.scala 69:77]
      read_just_completed <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 70:25]
    io.bus.request <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 73:18]
    io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 74:18]
    node _io_bus_address_T = bits(io.alu_result, 31, 2) @[src/main/scala/riscv/core/MemoryAccess.scala 75:34]
    node _io_bus_address_T_1 = cat(_io_bus_address_T, UInt<2>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 75:89]
    io.bus.address <= _io_bus_address_T_1 @[src/main/scala/riscv/core/MemoryAccess.scala 75:18]
    io.bus.write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 78:26]
    wire _WIRE : UInt<1>[4] @[src/main/scala/riscv/core/MemoryAccess.scala 79:36]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 79:36]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 79:36]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 79:36]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 79:36]
    io.bus.write_strobe <= _WIRE @[src/main/scala/riscv/core/MemoryAccess.scala 79:26]
    io.bus.write <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 80:26]
    io.wb_memory_read_data <= latched_memory_read_data @[src/main/scala/riscv/core/MemoryAccess.scala 81:26]
    io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 82:26]
    node _T_2 = eq(mem_access_state, UInt<1>("h1")) @[src/main/scala/riscv/core/MemoryAccess.scala 101:25]
    when _T_2 : @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
      io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 103:24]
      io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 104:24]
      when io.bus.read_valid : @[src/main/scala/riscv/core/MemoryAccess.scala 105:29]
        node _processed_data_T = bits(io.bus.read_data, 31, 31) @[src/main/scala/riscv/core/MemoryAccess.scala 116:30]
        node _processed_data_T_1 = mux(_processed_data_T, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 116:21]
        node _processed_data_T_2 = bits(io.bus.read_data, 31, 24) @[src/main/scala/riscv/core/MemoryAccess.scala 116:41]
        node _processed_data_T_3 = cat(_processed_data_T_1, _processed_data_T_2) @[src/main/scala/riscv/core/MemoryAccess.scala 116:16]
        node _processed_data_T_4 = bits(io.bus.read_data, 7, 7) @[src/main/scala/riscv/core/MemoryAccess.scala 118:39]
        node _processed_data_T_5 = mux(_processed_data_T_4, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 118:30]
        node _processed_data_T_6 = bits(io.bus.read_data, 7, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 118:49]
        node _processed_data_T_7 = cat(_processed_data_T_5, _processed_data_T_6) @[src/main/scala/riscv/core/MemoryAccess.scala 118:25]
        node _processed_data_T_8 = bits(io.bus.read_data, 15, 15) @[src/main/scala/riscv/core/MemoryAccess.scala 119:39]
        node _processed_data_T_9 = mux(_processed_data_T_8, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 119:30]
        node _processed_data_T_10 = bits(io.bus.read_data, 15, 8) @[src/main/scala/riscv/core/MemoryAccess.scala 119:50]
        node _processed_data_T_11 = cat(_processed_data_T_9, _processed_data_T_10) @[src/main/scala/riscv/core/MemoryAccess.scala 119:25]
        node _processed_data_T_12 = bits(io.bus.read_data, 23, 23) @[src/main/scala/riscv/core/MemoryAccess.scala 120:39]
        node _processed_data_T_13 = mux(_processed_data_T_12, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 120:30]
        node _processed_data_T_14 = bits(io.bus.read_data, 23, 16) @[src/main/scala/riscv/core/MemoryAccess.scala 120:50]
        node _processed_data_T_15 = cat(_processed_data_T_13, _processed_data_T_14) @[src/main/scala/riscv/core/MemoryAccess.scala 120:25]
        node _processed_data_T_16 = eq(UInt<1>("h0"), latched_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_17 = mux(_processed_data_T_16, _processed_data_T_7, _processed_data_T_3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_18 = eq(UInt<1>("h1"), latched_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_19 = mux(_processed_data_T_18, _processed_data_T_11, _processed_data_T_17) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_20 = eq(UInt<2>("h2"), latched_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_21 = mux(_processed_data_T_20, _processed_data_T_15, _processed_data_T_19) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_22 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 125:21]
        node _processed_data_T_23 = bits(io.bus.read_data, 31, 24) @[src/main/scala/riscv/core/MemoryAccess.scala 125:36]
        node _processed_data_T_24 = cat(_processed_data_T_22, _processed_data_T_23) @[src/main/scala/riscv/core/MemoryAccess.scala 125:16]
        node _processed_data_T_25 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 127:30]
        node _processed_data_T_26 = bits(io.bus.read_data, 7, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 127:45]
        node _processed_data_T_27 = cat(_processed_data_T_25, _processed_data_T_26) @[src/main/scala/riscv/core/MemoryAccess.scala 127:25]
        node _processed_data_T_28 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 128:30]
        node _processed_data_T_29 = bits(io.bus.read_data, 15, 8) @[src/main/scala/riscv/core/MemoryAccess.scala 128:45]
        node _processed_data_T_30 = cat(_processed_data_T_28, _processed_data_T_29) @[src/main/scala/riscv/core/MemoryAccess.scala 128:25]
        node _processed_data_T_31 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 129:30]
        node _processed_data_T_32 = bits(io.bus.read_data, 23, 16) @[src/main/scala/riscv/core/MemoryAccess.scala 129:45]
        node _processed_data_T_33 = cat(_processed_data_T_31, _processed_data_T_32) @[src/main/scala/riscv/core/MemoryAccess.scala 129:25]
        node _processed_data_T_34 = eq(UInt<1>("h0"), latched_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_35 = mux(_processed_data_T_34, _processed_data_T_27, _processed_data_T_24) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_36 = eq(UInt<1>("h1"), latched_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_37 = mux(_processed_data_T_36, _processed_data_T_30, _processed_data_T_35) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_38 = eq(UInt<2>("h2"), latched_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_39 = mux(_processed_data_T_38, _processed_data_T_33, _processed_data_T_37) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_40 = eq(latched_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 133:35]
        node _processed_data_T_41 = bits(io.bus.read_data, 15, 15) @[src/main/scala/riscv/core/MemoryAccess.scala 134:30]
        node _processed_data_T_42 = mux(_processed_data_T_41, UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 134:21]
        node _processed_data_T_43 = bits(io.bus.read_data, 15, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 134:41]
        node _processed_data_T_44 = cat(_processed_data_T_42, _processed_data_T_43) @[src/main/scala/riscv/core/MemoryAccess.scala 134:16]
        node _processed_data_T_45 = bits(io.bus.read_data, 31, 31) @[src/main/scala/riscv/core/MemoryAccess.scala 135:30]
        node _processed_data_T_46 = mux(_processed_data_T_45, UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 135:21]
        node _processed_data_T_47 = bits(io.bus.read_data, 31, 16) @[src/main/scala/riscv/core/MemoryAccess.scala 135:41]
        node _processed_data_T_48 = cat(_processed_data_T_46, _processed_data_T_47) @[src/main/scala/riscv/core/MemoryAccess.scala 135:16]
        node _processed_data_T_49 = mux(_processed_data_T_40, _processed_data_T_44, _processed_data_T_48) @[src/main/scala/riscv/core/MemoryAccess.scala 132:38]
        node _processed_data_T_50 = eq(latched_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 138:35]
        node _processed_data_T_51 = mux(UInt<1>("h0"), UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 139:21]
        node _processed_data_T_52 = bits(io.bus.read_data, 15, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 139:36]
        node _processed_data_T_53 = cat(_processed_data_T_51, _processed_data_T_52) @[src/main/scala/riscv/core/MemoryAccess.scala 139:16]
        node _processed_data_T_54 = mux(UInt<1>("h0"), UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 140:21]
        node _processed_data_T_55 = bits(io.bus.read_data, 31, 16) @[src/main/scala/riscv/core/MemoryAccess.scala 140:36]
        node _processed_data_T_56 = cat(_processed_data_T_54, _processed_data_T_55) @[src/main/scala/riscv/core/MemoryAccess.scala 140:16]
        node _processed_data_T_57 = mux(_processed_data_T_50, _processed_data_T_53, _processed_data_T_56) @[src/main/scala/riscv/core/MemoryAccess.scala 137:39]
        node _processed_data_T_58 = eq(UInt<1>("h0"), latched_funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_59 = mux(_processed_data_T_58, _processed_data_T_21, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_60 = eq(UInt<3>("h4"), latched_funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_61 = mux(_processed_data_T_60, _processed_data_T_39, _processed_data_T_59) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_62 = eq(UInt<1>("h1"), latched_funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_63 = mux(_processed_data_T_62, _processed_data_T_49, _processed_data_T_61) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_64 = eq(UInt<3>("h5"), latched_funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_65 = mux(_processed_data_T_64, _processed_data_T_57, _processed_data_T_63) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _processed_data_T_66 = eq(UInt<2>("h2"), latched_funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node processed_data = mux(_processed_data_T_66, io.bus.read_data, _processed_data_T_65) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        latched_memory_read_data <= processed_data @[src/main/scala/riscv/core/MemoryAccess.scala 146:32]
        io.wb_memory_read_data <= processed_data @[src/main/scala/riscv/core/MemoryAccess.scala 149:30]
        read_just_completed <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 152:27]
        mem_access_state <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 61:24]
        io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 62:24]
    else :
      node _T_3 = eq(mem_access_state, UInt<2>("h2")) @[src/main/scala/riscv/core/MemoryAccess.scala 155:31]
      when _T_3 : @[src/main/scala/riscv/core/MemoryAccess.scala 155:61]
        io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 163:24]
        io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 164:24]
        when io.bus.write_valid : @[src/main/scala/riscv/core/MemoryAccess.scala 166:30]
          mem_access_state <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 61:24]
          io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 62:24]
      else :
        when io.memory_read_enable : @[src/main/scala/riscv/core/MemoryAccess.scala 171:33]
          io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 173:26]
          io.bus.read <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 174:26]
          io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 175:26]
          latched_regs_write_source <= io.regs_write_source @[src/main/scala/riscv/core/MemoryAccess.scala 179:33]
          latched_funct3 <= io.funct3 @[src/main/scala/riscv/core/MemoryAccess.scala 180:33]
          latched_address_index <= mem_address_index @[src/main/scala/riscv/core/MemoryAccess.scala 181:33]
          when io.bus.granted : @[src/main/scala/riscv/core/MemoryAccess.scala 182:28]
            mem_access_state <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 183:26]
        else :
          when io.memory_write_enable : @[src/main/scala/riscv/core/MemoryAccess.scala 185:40]
            io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 187:27]
            io.bus.write_data <= io.reg2_data @[src/main/scala/riscv/core/MemoryAccess.scala 188:27]
            io.bus.write <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 189:27]
            wire _WIRE_1 : UInt<1>[4] @[src/main/scala/riscv/core/MemoryAccess.scala 190:37]
            _WIRE_1[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 190:37]
            _WIRE_1[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 190:37]
            _WIRE_1[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 190:37]
            _WIRE_1[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/MemoryAccess.scala 190:37]
            io.bus.write_strobe <= _WIRE_1 @[src/main/scala/riscv/core/MemoryAccess.scala 190:27]
            node _T_4 = eq(io.funct3, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 191:22]
            when _T_4 : @[src/main/scala/riscv/core/MemoryAccess.scala 191:48]
              io.bus.write_strobe[mem_address_index] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 192:48]
              node _io_bus_write_data_T = bits(io.reg2_data, 7, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 194:42]
              node _io_bus_write_data_T_1 = dshl(mem_address_index, UInt<2>("h3")) @[src/main/scala/riscv/core/MemoryAccess.scala 194:93]
              node _io_bus_write_data_T_2 = dshl(_io_bus_write_data_T, _io_bus_write_data_T_1) @[src/main/scala/riscv/core/MemoryAccess.scala 194:71]
              io.bus.write_data <= _io_bus_write_data_T_2 @[src/main/scala/riscv/core/MemoryAccess.scala 194:27]
            else :
              node _T_5 = eq(io.funct3, UInt<1>("h1")) @[src/main/scala/riscv/core/MemoryAccess.scala 197:28]
              when _T_5 : @[src/main/scala/riscv/core/MemoryAccess.scala 197:54]
                node _T_6 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/MemoryAccess.scala 198:32]
                when _T_6 : @[src/main/scala/riscv/core/MemoryAccess.scala 198:41]
                  io.bus.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 200:36]
                  io.bus.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 200:36]
                  node _io_bus_write_data_T_3 = bits(io.reg2_data, 15, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 203:44]
                  io.bus.write_data <= _io_bus_write_data_T_3 @[src/main/scala/riscv/core/MemoryAccess.scala 203:29]
                else :
                  io.bus.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 206:36]
                  io.bus.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 206:36]
                  node _io_bus_write_data_T_4 = bits(io.reg2_data, 15, 0) @[src/main/scala/riscv/core/MemoryAccess.scala 209:44]
                  node _io_bus_write_data_T_5 = shl(_io_bus_write_data_T_4, 16) @[src/main/scala/riscv/core/MemoryAccess.scala 212:13]
                  io.bus.write_data <= _io_bus_write_data_T_5 @[src/main/scala/riscv/core/MemoryAccess.scala 209:29]
              else :
                node _T_7 = eq(io.funct3, UInt<2>("h2")) @[src/main/scala/riscv/core/MemoryAccess.scala 214:28]
                when _T_7 : @[src/main/scala/riscv/core/MemoryAccess.scala 214:54]
                  io.bus.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 216:34]
                  io.bus.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 216:34]
                  io.bus.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 216:34]
                  io.bus.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 216:34]
            io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/MemoryAccess.scala 219:22]
            when io.bus.granted : @[src/main/scala/riscv/core/MemoryAccess.scala 220:28]
              mem_access_state <= UInt<2>("h2") @[src/main/scala/riscv/core/MemoryAccess.scala 221:26]
    node _forward_regs_write_source_T = eq(mem_access_state, UInt<1>("h1")) @[src/main/scala/riscv/core/MemoryAccess.scala 239:22]
    node forward_regs_write_source = mux(_forward_regs_write_source_T, latched_regs_write_source, io.regs_write_source) @[src/main/scala/riscv/core/MemoryAccess.scala 238:38]
    node _io_forward_to_ex_T = add(io.instruction_address, UInt<3>("h4")) @[src/main/scala/riscv/core/MemoryAccess.scala 252:72]
    node _io_forward_to_ex_T_1 = tail(_io_forward_to_ex_T, 1) @[src/main/scala/riscv/core/MemoryAccess.scala 252:72]
    node _io_forward_to_ex_T_2 = eq(UInt<2>("h1"), forward_regs_write_source) @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
    node _io_forward_to_ex_T_3 = mux(_io_forward_to_ex_T_2, io.wb_memory_read_data, io.alu_result) @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
    node _io_forward_to_ex_T_4 = eq(UInt<2>("h2"), forward_regs_write_source) @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
    node _io_forward_to_ex_T_5 = mux(_io_forward_to_ex_T_4, io.csr_read_data, _io_forward_to_ex_T_3) @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
    node _io_forward_to_ex_T_6 = eq(UInt<2>("h3"), forward_regs_write_source) @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
    node _io_forward_to_ex_T_7 = mux(_io_forward_to_ex_T_6, _io_forward_to_ex_T_1, _io_forward_to_ex_T_5) @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
    io.forward_to_ex <= _io_forward_to_ex_T_7 @[src/main/scala/riscv/core/MemoryAccess.scala 248:20]
    node _wb_effective_regs_write_source_T = eq(mem_access_state, UInt<1>("h1")) @[src/main/scala/riscv/core/MemoryAccess.scala 263:22]
    node wb_effective_regs_write_source = mux(_wb_effective_regs_write_source_T, latched_regs_write_source, io.regs_write_source) @[src/main/scala/riscv/core/MemoryAccess.scala 262:43]
    io.wb_regs_write_source <= wb_effective_regs_write_source @[src/main/scala/riscv/core/MemoryAccess.scala 269:27]

  module PipelineRegister_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module PipelineRegister_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]

    reg myreg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
      myreg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 21:11]
    else :
      when io.stall : @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
        out <= myreg @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
      else :
        myreg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 27:13]
        out <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    io.out <= out @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]

  module MEM2WB :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip instruction_address : UInt<32>, flip alu_result : UInt<32>, flip regs_write_enable : UInt<1>, flip regs_write_source : UInt<2>, flip regs_write_address : UInt<32>, flip memory_read_data : UInt<32>, flip csr_read_data : UInt<32>, output_instruction_address : UInt<32>, output_alu_result : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_source : UInt<2>, output_regs_write_address : UInt<32>, output_memory_read_data : UInt<32>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/MEM2WB.scala 12:14]

    inst alu_result of PipelineRegister_32 @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
    alu_result.clock <= clock
    alu_result.reset <= reset
    alu_result.io.in <= io.alu_result @[src/main/scala/riscv/core/MEM2WB.scala 34:24]
    alu_result.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 35:24]
    alu_result.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 36:24]
    io.output_alu_result <= alu_result.io.out @[src/main/scala/riscv/core/MEM2WB.scala 37:24]
    inst memory_read_data of PipelineRegister_33 @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
    memory_read_data.clock <= clock
    memory_read_data.reset <= reset
    memory_read_data.io.in <= io.memory_read_data @[src/main/scala/riscv/core/MEM2WB.scala 40:30]
    memory_read_data.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 41:30]
    memory_read_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 42:30]
    io.output_memory_read_data <= memory_read_data.io.out @[src/main/scala/riscv/core/MEM2WB.scala 43:30]
    inst regs_write_enable of PipelineRegister_34 @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/MEM2WB.scala 46:31]
    regs_write_enable.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 47:31]
    regs_write_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 48:31]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/MEM2WB.scala 49:31]
    inst regs_write_source of PipelineRegister_35 @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/MEM2WB.scala 52:31]
    regs_write_source.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 53:31]
    regs_write_source.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 54:31]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/MEM2WB.scala 55:31]
    inst regs_write_address of PipelineRegister_36 @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/MEM2WB.scala 58:32]
    regs_write_address.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 59:32]
    regs_write_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 60:32]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/MEM2WB.scala 61:32]
    inst instruction_address of PipelineRegister_37 @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/MEM2WB.scala 64:33]
    instruction_address.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 65:33]
    instruction_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 66:33]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/MEM2WB.scala 67:33]
    inst csr_read_data of PipelineRegister_38 @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/MEM2WB.scala 70:27]
    csr_read_data.io.stall <= io.stall @[src/main/scala/riscv/core/MEM2WB.scala 71:27]
    csr_read_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/MEM2WB.scala 72:27]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/MEM2WB.scala 73:27]

  module WriteBack :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction_address : UInt<32>, flip alu_result : UInt<32>, flip memory_read_data : UInt<32>, flip regs_write_source : UInt<2>, flip csr_read_data : UInt<32>, regs_write_data : UInt<32>} @[src/main/scala/riscv/core/WriteBack.scala 12:14]

    node _io_regs_write_data_T = add(io.instruction_address, UInt<3>("h4")) @[src/main/scala/riscv/core/WriteBack.scala 28:72]
    node _io_regs_write_data_T_1 = tail(_io_regs_write_data_T, 1) @[src/main/scala/riscv/core/WriteBack.scala 28:72]
    node _io_regs_write_data_T_2 = eq(UInt<2>("h1"), io.regs_write_source) @[src/main/scala/riscv/core/WriteBack.scala 24:4]
    node _io_regs_write_data_T_3 = mux(_io_regs_write_data_T_2, io.memory_read_data, io.alu_result) @[src/main/scala/riscv/core/WriteBack.scala 24:4]
    node _io_regs_write_data_T_4 = eq(UInt<2>("h2"), io.regs_write_source) @[src/main/scala/riscv/core/WriteBack.scala 24:4]
    node _io_regs_write_data_T_5 = mux(_io_regs_write_data_T_4, io.csr_read_data, _io_regs_write_data_T_3) @[src/main/scala/riscv/core/WriteBack.scala 24:4]
    node _io_regs_write_data_T_6 = eq(UInt<2>("h3"), io.regs_write_source) @[src/main/scala/riscv/core/WriteBack.scala 24:4]
    node _io_regs_write_data_T_7 = mux(_io_regs_write_data_T_6, _io_regs_write_data_T_1, _io_regs_write_data_T_5) @[src/main/scala/riscv/core/WriteBack.scala 24:4]
    io.regs_write_data <= _io_regs_write_data_T_7 @[src/main/scala/riscv/core/WriteBack.scala 21:22]

  module Forwarding :
    input clock : Clock
    input reset : Reset
    output io : { flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip rs1_ex : UInt<5>, flip rs2_ex : UInt<5>, flip rd_mem : UInt<5>, flip reg_write_enable_mem : UInt<1>, flip rd_wb : UInt<5>, flip reg_write_enable_wb : UInt<1>, reg1_forward_id : UInt<2>, reg2_forward_id : UInt<2>, reg1_forward_ex : UInt<2>, reg2_forward_ex : UInt<2>} @[src/main/scala/riscv/core/Forwarding.scala 60:14]

    node _T = eq(io.rs1_ex, io.rd_mem) @[src/main/scala/riscv/core/Forwarding.scala 80:45]
    node _T_1 = and(io.reg_write_enable_mem, _T) @[src/main/scala/riscv/core/Forwarding.scala 80:32]
    node _T_2 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 80:72]
    node _T_3 = and(_T_1, _T_2) @[src/main/scala/riscv/core/Forwarding.scala 80:59]
    when _T_3 : @[src/main/scala/riscv/core/Forwarding.scala 80:81]
      io.reg1_forward_ex <= UInt<2>("h1") @[src/main/scala/riscv/core/Forwarding.scala 83:24]
    else :
      node _T_4 = eq(io.rs1_ex, io.rd_wb) @[src/main/scala/riscv/core/Forwarding.scala 84:50]
      node _T_5 = and(io.reg_write_enable_wb, _T_4) @[src/main/scala/riscv/core/Forwarding.scala 84:37]
      node _T_6 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 84:75]
      node _T_7 = and(_T_5, _T_6) @[src/main/scala/riscv/core/Forwarding.scala 84:63]
      when _T_7 : @[src/main/scala/riscv/core/Forwarding.scala 84:84]
        io.reg1_forward_ex <= UInt<2>("h2") @[src/main/scala/riscv/core/Forwarding.scala 87:24]
      else :
        io.reg1_forward_ex <= UInt<2>("h0") @[src/main/scala/riscv/core/Forwarding.scala 90:24]
    node _T_8 = eq(io.rs2_ex, io.rd_mem) @[src/main/scala/riscv/core/Forwarding.scala 94:45]
    node _T_9 = and(io.reg_write_enable_mem, _T_8) @[src/main/scala/riscv/core/Forwarding.scala 94:32]
    node _T_10 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 94:72]
    node _T_11 = and(_T_9, _T_10) @[src/main/scala/riscv/core/Forwarding.scala 94:59]
    when _T_11 : @[src/main/scala/riscv/core/Forwarding.scala 94:81]
      io.reg2_forward_ex <= UInt<2>("h1") @[src/main/scala/riscv/core/Forwarding.scala 97:24]
    else :
      node _T_12 = eq(io.rs2_ex, io.rd_wb) @[src/main/scala/riscv/core/Forwarding.scala 98:50]
      node _T_13 = and(io.reg_write_enable_wb, _T_12) @[src/main/scala/riscv/core/Forwarding.scala 98:37]
      node _T_14 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 98:75]
      node _T_15 = and(_T_13, _T_14) @[src/main/scala/riscv/core/Forwarding.scala 98:63]
      when _T_15 : @[src/main/scala/riscv/core/Forwarding.scala 98:84]
        io.reg2_forward_ex <= UInt<2>("h2") @[src/main/scala/riscv/core/Forwarding.scala 100:24]
      else :
        io.reg2_forward_ex <= UInt<2>("h0") @[src/main/scala/riscv/core/Forwarding.scala 103:24]
    node _T_16 = eq(io.rs1_id, io.rd_mem) @[src/main/scala/riscv/core/Forwarding.scala 111:45]
    node _T_17 = and(io.reg_write_enable_mem, _T_16) @[src/main/scala/riscv/core/Forwarding.scala 111:32]
    node _T_18 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 111:72]
    node _T_19 = and(_T_17, _T_18) @[src/main/scala/riscv/core/Forwarding.scala 111:59]
    when _T_19 : @[src/main/scala/riscv/core/Forwarding.scala 111:81]
      io.reg1_forward_id <= UInt<2>("h1") @[src/main/scala/riscv/core/Forwarding.scala 116:24]
    else :
      node _T_20 = eq(io.rs1_id, io.rd_wb) @[src/main/scala/riscv/core/Forwarding.scala 117:50]
      node _T_21 = and(io.reg_write_enable_wb, _T_20) @[src/main/scala/riscv/core/Forwarding.scala 117:37]
      node _T_22 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 117:75]
      node _T_23 = and(_T_21, _T_22) @[src/main/scala/riscv/core/Forwarding.scala 117:63]
      when _T_23 : @[src/main/scala/riscv/core/Forwarding.scala 117:84]
        io.reg1_forward_id <= UInt<2>("h2") @[src/main/scala/riscv/core/Forwarding.scala 119:24]
      else :
        io.reg1_forward_id <= UInt<2>("h0") @[src/main/scala/riscv/core/Forwarding.scala 122:24]
    node _T_24 = eq(io.rs2_id, io.rd_mem) @[src/main/scala/riscv/core/Forwarding.scala 126:45]
    node _T_25 = and(io.reg_write_enable_mem, _T_24) @[src/main/scala/riscv/core/Forwarding.scala 126:32]
    node _T_26 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 126:72]
    node _T_27 = and(_T_25, _T_26) @[src/main/scala/riscv/core/Forwarding.scala 126:59]
    when _T_27 : @[src/main/scala/riscv/core/Forwarding.scala 126:81]
      io.reg2_forward_id <= UInt<2>("h1") @[src/main/scala/riscv/core/Forwarding.scala 130:24]
    else :
      node _T_28 = eq(io.rs2_id, io.rd_wb) @[src/main/scala/riscv/core/Forwarding.scala 131:50]
      node _T_29 = and(io.reg_write_enable_wb, _T_28) @[src/main/scala/riscv/core/Forwarding.scala 131:37]
      node _T_30 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/Forwarding.scala 131:75]
      node _T_31 = and(_T_29, _T_30) @[src/main/scala/riscv/core/Forwarding.scala 131:63]
      when _T_31 : @[src/main/scala/riscv/core/Forwarding.scala 131:84]
        io.reg2_forward_id <= UInt<2>("h2") @[src/main/scala/riscv/core/Forwarding.scala 133:24]
      else :
        io.reg2_forward_id <= UInt<2>("h0") @[src/main/scala/riscv/core/Forwarding.scala 136:24]


  module CLINT :
    input clock : Clock
    input reset : Reset
    output io : { flip interrupt_flag : UInt<32>, flip instruction_id : UInt<32>, flip instruction_address_if : UInt<32>, flip jump_flag : UInt<1>, flip jump_address : UInt<32>, id_interrupt_handler_address : UInt<32>, id_interrupt_assert : UInt<1>, csr_bundle : { flip mstatus : UInt<32>, flip mepc : UInt<32>, flip mcause : UInt<32>, flip mtvec : UInt<32>, flip mie : UInt<32>, mstatus_write_data : UInt<32>, mepc_write_data : UInt<32>, mcause_write_data : UInt<32>, direct_write_enable : UInt<1>}} @[src/main/scala/riscv/core/CLINT.scala 20:14]

    node interrupt_enable_global = bits(io.csr_bundle.mstatus, 3, 3) @[src/main/scala/riscv/core/CLINT.scala 34:56]
    node interrupt_enable_timer = bits(io.csr_bundle.mie, 7, 7) @[src/main/scala/riscv/core/CLINT.scala 35:52]
    node interrupt_enable_external = bits(io.csr_bundle.mie, 11, 11) @[src/main/scala/riscv/core/CLINT.scala 36:52]
    node instruction_address = mux(io.jump_flag, io.jump_address, io.instruction_address_if) @[src/main/scala/riscv/core/CLINT.scala 38:32]
    node _mstatus_disable_interrupt_T = bits(io.csr_bundle.mstatus, 31, 4) @[src/main/scala/riscv/core/CLINT.scala 43:56]
    node _mstatus_disable_interrupt_T_1 = cat(_mstatus_disable_interrupt_T, UInt<1>("h0")) @[src/main/scala/riscv/core/CLINT.scala 43:64]
    node _mstatus_disable_interrupt_T_2 = bits(io.csr_bundle.mstatus, 2, 0) @[src/main/scala/riscv/core/CLINT.scala 43:100]
    node mstatus_disable_interrupt = cat(_mstatus_disable_interrupt_T_1, _mstatus_disable_interrupt_T_2) @[src/main/scala/riscv/core/CLINT.scala 43:76]
    node _mstatus_recover_interrupt_T = bits(io.csr_bundle.mstatus, 31, 4) @[src/main/scala/riscv/core/CLINT.scala 45:26]
    node _mstatus_recover_interrupt_T_1 = bits(io.csr_bundle.mstatus, 7, 7) @[src/main/scala/riscv/core/CLINT.scala 45:58]
    node _mstatus_recover_interrupt_T_2 = cat(_mstatus_recover_interrupt_T, _mstatus_recover_interrupt_T_1) @[src/main/scala/riscv/core/CLINT.scala 45:34]
    node _mstatus_recover_interrupt_T_3 = bits(io.csr_bundle.mstatus, 2, 0) @[src/main/scala/riscv/core/CLINT.scala 45:86]
    node mstatus_recover_interrupt = cat(_mstatus_recover_interrupt_T_2, _mstatus_recover_interrupt_T_3) @[src/main/scala/riscv/core/CLINT.scala 45:62]
    node _interrupt_source_enabled_T = bits(io.interrupt_flag, 0, 0) @[src/main/scala/riscv/core/CLINT.scala 49:22]
    node interrupt_source_enabled = mux(_interrupt_source_enabled_T, interrupt_enable_timer, interrupt_enable_external) @[src/main/scala/riscv/core/CLINT.scala 48:37]
    node _T = eq(io.instruction_id, UInt<32>("h73")) @[src/main/scala/riscv/core/CLINT.scala 54:26]
    node _T_1 = eq(io.instruction_id, UInt<32>("h100073")) @[src/main/scala/riscv/core/CLINT.scala 54:73]
    node _T_2 = or(_T, _T_1) @[src/main/scala/riscv/core/CLINT.scala 54:52]
    when _T_2 : @[src/main/scala/riscv/core/CLINT.scala 54:101]
      io.csr_bundle.mstatus_write_data <= mstatus_disable_interrupt @[src/main/scala/riscv/core/CLINT.scala 55:38]
      io.csr_bundle.mepc_write_data <= instruction_address @[src/main/scala/riscv/core/CLINT.scala 56:38]
      node _io_csr_bundle_mcause_write_data_T = eq(UInt<32>("h73"), io.instruction_id) @[src/main/scala/riscv/core/CLINT.scala 60:6]
      node _io_csr_bundle_mcause_write_data_T_1 = mux(_io_csr_bundle_mcause_write_data_T, UInt<4>("hb"), UInt<4>("ha")) @[src/main/scala/riscv/core/CLINT.scala 60:6]
      node _io_csr_bundle_mcause_write_data_T_2 = eq(UInt<32>("h100073"), io.instruction_id) @[src/main/scala/riscv/core/CLINT.scala 60:6]
      node _io_csr_bundle_mcause_write_data_T_3 = mux(_io_csr_bundle_mcause_write_data_T_2, UInt<2>("h3"), _io_csr_bundle_mcause_write_data_T_1) @[src/main/scala/riscv/core/CLINT.scala 60:6]
      io.csr_bundle.mcause_write_data <= _io_csr_bundle_mcause_write_data_T_3 @[src/main/scala/riscv/core/CLINT.scala 57:37]
      io.csr_bundle.direct_write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/CLINT.scala 66:39]
      io.id_interrupt_assert <= UInt<1>("h1") @[src/main/scala/riscv/core/CLINT.scala 67:39]
      io.id_interrupt_handler_address <= io.csr_bundle.mtvec @[src/main/scala/riscv/core/CLINT.scala 68:39]
    else :
      node _T_3 = neq(io.interrupt_flag, UInt<8>("h0")) @[src/main/scala/riscv/core/CLINT.scala 69:32]
      node _T_4 = and(_T_3, interrupt_enable_global) @[src/main/scala/riscv/core/CLINT.scala 69:57]
      node _T_5 = and(_T_4, interrupt_source_enabled) @[src/main/scala/riscv/core/CLINT.scala 69:84]
      when _T_5 : @[src/main/scala/riscv/core/CLINT.scala 69:113]
        io.csr_bundle.mstatus_write_data <= mstatus_disable_interrupt @[src/main/scala/riscv/core/CLINT.scala 70:39]
        io.csr_bundle.mepc_write_data <= instruction_address @[src/main/scala/riscv/core/CLINT.scala 71:39]
        node _io_csr_bundle_mcause_write_data_T_4 = bits(io.interrupt_flag, 0, 0) @[src/main/scala/riscv/core/CLINT.scala 72:63]
        node _io_csr_bundle_mcause_write_data_T_5 = mux(_io_csr_bundle_mcause_write_data_T_4, UInt<32>("h80000007"), UInt<32>("h8000000b")) @[src/main/scala/riscv/core/CLINT.scala 72:45]
        io.csr_bundle.mcause_write_data <= _io_csr_bundle_mcause_write_data_T_5 @[src/main/scala/riscv/core/CLINT.scala 72:39]
        io.csr_bundle.direct_write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/CLINT.scala 73:39]
        io.id_interrupt_assert <= UInt<1>("h1") @[src/main/scala/riscv/core/CLINT.scala 74:39]
        io.id_interrupt_handler_address <= io.csr_bundle.mtvec @[src/main/scala/riscv/core/CLINT.scala 75:39]
      else :
        node _T_6 = eq(io.instruction_id, UInt<32>("h30200073")) @[src/main/scala/riscv/core/CLINT.scala 76:32]
        when _T_6 : @[src/main/scala/riscv/core/CLINT.scala 76:58]
          io.csr_bundle.mstatus_write_data <= mstatus_recover_interrupt @[src/main/scala/riscv/core/CLINT.scala 77:39]
          io.csr_bundle.mepc_write_data <= io.csr_bundle.mepc @[src/main/scala/riscv/core/CLINT.scala 78:39]
          io.csr_bundle.mcause_write_data <= io.csr_bundle.mcause @[src/main/scala/riscv/core/CLINT.scala 79:39]
          io.csr_bundle.direct_write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/CLINT.scala 80:39]
          io.id_interrupt_assert <= UInt<1>("h1") @[src/main/scala/riscv/core/CLINT.scala 81:39]
          io.id_interrupt_handler_address <= io.csr_bundle.mepc @[src/main/scala/riscv/core/CLINT.scala 82:39]
        else :
          io.csr_bundle.mstatus_write_data <= io.csr_bundle.mstatus @[src/main/scala/riscv/core/CLINT.scala 84:39]
          io.csr_bundle.mepc_write_data <= io.csr_bundle.mepc @[src/main/scala/riscv/core/CLINT.scala 85:39]
          io.csr_bundle.mcause_write_data <= io.csr_bundle.mcause @[src/main/scala/riscv/core/CLINT.scala 86:39]
          io.csr_bundle.direct_write_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/CLINT.scala 87:39]
          io.id_interrupt_assert <= UInt<1>("h0") @[src/main/scala/riscv/core/CLINT.scala 88:39]
          io.id_interrupt_handler_address <= UInt<1>("h0") @[src/main/scala/riscv/core/CLINT.scala 89:39]


  module CSR :
    input clock : Clock
    input reset : Reset
    output io : { flip reg_read_address_id : UInt<12>, flip reg_write_enable_ex : UInt<1>, flip reg_write_address_ex : UInt<12>, flip reg_write_data_ex : UInt<32>, flip debug_reg_read_address : UInt<12>, id_reg_read_data : UInt<32>, debug_reg_read_data : UInt<32>, flip clint_access_bundle : { flip mstatus : UInt<32>, flip mepc : UInt<32>, flip mcause : UInt<32>, flip mtvec : UInt<32>, flip mie : UInt<32>, mstatus_write_data : UInt<32>, mepc_write_data : UInt<32>, mcause_write_data : UInt<32>, direct_write_enable : UInt<1>}} @[src/main/scala/riscv/core/CSR.scala 38:14]

    reg mstatus : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 51:25]
    reg mie : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 52:25]
    reg mtvec : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 53:25]
    reg mscratch : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 54:25]
    reg mepc : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 55:25]
    reg mcause : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 56:25]
    reg cycles : UInt<64>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 57:25]
    node _T = bits(cycles, 31, 0) @[src/main/scala/riscv/core/CSR.scala 66:37]
    node _T_1 = bits(cycles, 63, 32) @[src/main/scala/riscv/core/CSR.scala 67:37]
    node _cycles_T = add(cycles, UInt<1>("h1")) @[src/main/scala/riscv/core/CSR.scala 69:20]
    node _cycles_T_1 = tail(_cycles_T, 1) @[src/main/scala/riscv/core/CSR.scala 69:20]
    cycles <= _cycles_T_1 @[src/main/scala/riscv/core/CSR.scala 69:10]
    node _io_id_reg_read_data_T = eq(UInt<12>("h300"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_1 = mux(_io_id_reg_read_data_T, mstatus, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_2 = eq(UInt<12>("h304"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_3 = mux(_io_id_reg_read_data_T_2, mie, _io_id_reg_read_data_T_1) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_4 = eq(UInt<12>("h305"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_5 = mux(_io_id_reg_read_data_T_4, mtvec, _io_id_reg_read_data_T_3) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_6 = eq(UInt<12>("h340"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_7 = mux(_io_id_reg_read_data_T_6, mscratch, _io_id_reg_read_data_T_5) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_8 = eq(UInt<12>("h341"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_9 = mux(_io_id_reg_read_data_T_8, mepc, _io_id_reg_read_data_T_7) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_10 = eq(UInt<12>("h342"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_11 = mux(_io_id_reg_read_data_T_10, mcause, _io_id_reg_read_data_T_9) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_12 = eq(UInt<12>("hc00"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_13 = mux(_io_id_reg_read_data_T_12, _T, _io_id_reg_read_data_T_11) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_14 = eq(UInt<12>("hc80"), io.reg_read_address_id) @[src/main/scala/riscv/core/CSR.scala 73:67]
    node _io_id_reg_read_data_T_15 = mux(_io_id_reg_read_data_T_14, _T_1, _io_id_reg_read_data_T_13) @[src/main/scala/riscv/core/CSR.scala 73:67]
    io.id_reg_read_data <= _io_id_reg_read_data_T_15 @[src/main/scala/riscv/core/CSR.scala 73:26]
    node _io_debug_reg_read_data_T = eq(UInt<12>("h300"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_1 = mux(_io_debug_reg_read_data_T, mstatus, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_2 = eq(UInt<12>("h304"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_3 = mux(_io_debug_reg_read_data_T_2, mie, _io_debug_reg_read_data_T_1) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_4 = eq(UInt<12>("h305"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_5 = mux(_io_debug_reg_read_data_T_4, mtvec, _io_debug_reg_read_data_T_3) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_6 = eq(UInt<12>("h340"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_7 = mux(_io_debug_reg_read_data_T_6, mscratch, _io_debug_reg_read_data_T_5) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_8 = eq(UInt<12>("h341"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_9 = mux(_io_debug_reg_read_data_T_8, mepc, _io_debug_reg_read_data_T_7) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_10 = eq(UInt<12>("h342"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_11 = mux(_io_debug_reg_read_data_T_10, mcause, _io_debug_reg_read_data_T_9) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_12 = eq(UInt<12>("hc00"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_13 = mux(_io_debug_reg_read_data_T_12, _T, _io_debug_reg_read_data_T_11) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_14 = eq(UInt<12>("hc80"), io.debug_reg_read_address) @[src/main/scala/riscv/core/CSR.scala 74:70]
    node _io_debug_reg_read_data_T_15 = mux(_io_debug_reg_read_data_T_14, _T_1, _io_debug_reg_read_data_T_13) @[src/main/scala/riscv/core/CSR.scala 74:70]
    io.debug_reg_read_data <= _io_debug_reg_read_data_T_15 @[src/main/scala/riscv/core/CSR.scala 74:26]
    node _io_clint_access_bundle_mstatus_T = eq(io.reg_write_address_ex, UInt<12>("h300")) @[src/main/scala/riscv/core/CSR.scala 77:55]
    node _io_clint_access_bundle_mstatus_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mstatus_T) @[src/main/scala/riscv/core/CSR.scala 77:28]
    node _io_clint_access_bundle_mstatus_T_2 = mux(_io_clint_access_bundle_mstatus_T_1, io.reg_write_data_ex, mstatus) @[src/main/scala/riscv/core/CSR.scala 76:40]
    io.clint_access_bundle.mstatus <= _io_clint_access_bundle_mstatus_T_2 @[src/main/scala/riscv/core/CSR.scala 76:34]
    node _io_clint_access_bundle_mtvec_T = eq(io.reg_write_address_ex, UInt<12>("h305")) @[src/main/scala/riscv/core/CSR.scala 82:55]
    node _io_clint_access_bundle_mtvec_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mtvec_T) @[src/main/scala/riscv/core/CSR.scala 82:28]
    node _io_clint_access_bundle_mtvec_T_2 = mux(_io_clint_access_bundle_mtvec_T_1, io.reg_write_data_ex, mtvec) @[src/main/scala/riscv/core/CSR.scala 81:38]
    io.clint_access_bundle.mtvec <= _io_clint_access_bundle_mtvec_T_2 @[src/main/scala/riscv/core/CSR.scala 81:32]
    node _io_clint_access_bundle_mcause_T = eq(io.reg_write_address_ex, UInt<12>("h342")) @[src/main/scala/riscv/core/CSR.scala 87:55]
    node _io_clint_access_bundle_mcause_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mcause_T) @[src/main/scala/riscv/core/CSR.scala 87:28]
    node _io_clint_access_bundle_mcause_T_2 = mux(_io_clint_access_bundle_mcause_T_1, io.reg_write_data_ex, mcause) @[src/main/scala/riscv/core/CSR.scala 86:39]
    io.clint_access_bundle.mcause <= _io_clint_access_bundle_mcause_T_2 @[src/main/scala/riscv/core/CSR.scala 86:33]
    node _io_clint_access_bundle_mepc_T = eq(io.reg_write_address_ex, UInt<12>("h341")) @[src/main/scala/riscv/core/CSR.scala 92:55]
    node _io_clint_access_bundle_mepc_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mepc_T) @[src/main/scala/riscv/core/CSR.scala 92:28]
    node _io_clint_access_bundle_mepc_T_2 = mux(_io_clint_access_bundle_mepc_T_1, io.reg_write_data_ex, mepc) @[src/main/scala/riscv/core/CSR.scala 91:37]
    io.clint_access_bundle.mepc <= _io_clint_access_bundle_mepc_T_2 @[src/main/scala/riscv/core/CSR.scala 91:31]
    node _io_clint_access_bundle_mie_T = eq(io.reg_write_address_ex, UInt<12>("h304")) @[src/main/scala/riscv/core/CSR.scala 97:55]
    node _io_clint_access_bundle_mie_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mie_T) @[src/main/scala/riscv/core/CSR.scala 97:28]
    node _io_clint_access_bundle_mie_T_2 = mux(_io_clint_access_bundle_mie_T_1, io.reg_write_data_ex, mie) @[src/main/scala/riscv/core/CSR.scala 96:36]
    io.clint_access_bundle.mie <= _io_clint_access_bundle_mie_T_2 @[src/main/scala/riscv/core/CSR.scala 96:30]
    when io.clint_access_bundle.direct_write_enable : @[src/main/scala/riscv/core/CSR.scala 102:52]
      mstatus <= io.clint_access_bundle.mstatus_write_data @[src/main/scala/riscv/core/CSR.scala 103:13]
      mepc <= io.clint_access_bundle.mepc_write_data @[src/main/scala/riscv/core/CSR.scala 104:13]
      mcause <= io.clint_access_bundle.mcause_write_data @[src/main/scala/riscv/core/CSR.scala 105:13]
    else :
      when io.reg_write_enable_ex : @[src/main/scala/riscv/core/CSR.scala 106:38]
        node _T_2 = eq(io.reg_write_address_ex, UInt<12>("h300")) @[src/main/scala/riscv/core/CSR.scala 107:34]
        when _T_2 : @[src/main/scala/riscv/core/CSR.scala 107:59]
          mstatus <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 108:15]
        else :
          node _T_3 = eq(io.reg_write_address_ex, UInt<12>("h341")) @[src/main/scala/riscv/core/CSR.scala 109:40]
          when _T_3 : @[src/main/scala/riscv/core/CSR.scala 109:62]
            mepc <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 110:12]
          else :
            node _T_4 = eq(io.reg_write_address_ex, UInt<12>("h342")) @[src/main/scala/riscv/core/CSR.scala 111:40]
            when _T_4 : @[src/main/scala/riscv/core/CSR.scala 111:64]
              mcause <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 112:14]
    when io.reg_write_enable_ex : @[src/main/scala/riscv/core/CSR.scala 116:32]
      node _T_5 = eq(io.reg_write_address_ex, UInt<12>("h304")) @[src/main/scala/riscv/core/CSR.scala 117:34]
      when _T_5 : @[src/main/scala/riscv/core/CSR.scala 117:55]
        mie <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 118:11]
      else :
        node _T_6 = eq(io.reg_write_address_ex, UInt<12>("h305")) @[src/main/scala/riscv/core/CSR.scala 119:40]
        when _T_6 : @[src/main/scala/riscv/core/CSR.scala 119:63]
          mtvec <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 120:13]
        else :
          node _T_7 = eq(io.reg_write_address_ex, UInt<12>("h340")) @[src/main/scala/riscv/core/CSR.scala 121:40]
          when _T_7 : @[src/main/scala/riscv/core/CSR.scala 121:66]
            mscratch <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 122:16]


  module PipelinedCPU :
    input clock : Clock
    input reset : Reset
    output io : { instruction_address : UInt<32>, flip instruction : UInt<32>, flip instruction_valid : UInt<1>, memory_bundle : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], flip write_valid : UInt<1>, flip write_data_accepted : UInt<1>, flip busy : UInt<1>, request : UInt<1>, flip granted : UInt<1>}, device_select : UInt<3>, axi4_channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip interrupt_flag : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>, flip csr_debug_read_address : UInt<12>, csr_debug_read_data : UInt<32>, bus_address : UInt<32>, debug_bus_write_enable : UInt<1>, debug_bus_write_data : UInt<32>} @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]

    inst ctrl of Control @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
    ctrl.clock <= clock
    ctrl.reset <= reset
    inst regs of RegisterFile @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
    regs.clock <= clock
    regs.reset <= reset
    inst inst_fetch of InstructionFetch @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
    inst_fetch.clock <= clock
    inst_fetch.reset <= reset
    inst if2id of IF2ID @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
    if2id.clock <= clock
    if2id.reset <= reset
    inst id of InstructionDecode @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
    id.clock <= clock
    id.reset <= reset
    inst id2ex of ID2EX @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
    id2ex.clock <= clock
    id2ex.reset <= reset
    inst ex of Execute @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
    ex.clock <= clock
    ex.reset <= reset
    inst ex2mem of EX2MEM @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
    ex2mem.clock <= clock
    ex2mem.reset <= reset
    inst mem of MemoryAccess @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
    mem.clock <= clock
    mem.reset <= reset
    inst mem2wb of MEM2WB @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
    mem2wb.clock <= clock
    mem2wb.reset <= reset
    inst wb of WriteBack @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
    wb.clock <= clock
    wb.reset <= reset
    inst forwarding of Forwarding @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
    forwarding.clock <= clock
    forwarding.reset <= reset
    inst clint of CLINT @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
    clint.clock <= clock
    clint.reset <= reset
    inst csr_regs of CSR @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
    csr_regs.clock <= clock
    csr_regs.reset <= reset
    ctrl.io.jump_flag <= id.io.if_jump_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 133:35]
    ctrl.io.jump_instruction_id <= id.io.ctrl_jump_instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 134:35]
    ctrl.io.rs1_id <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 135:35]
    ctrl.io.rs2_id <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 136:35]
    ctrl.io.memory_read_enable_ex <= id2ex.io.output_memory_read_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 137:35]
    ctrl.io.rd_ex <= id2ex.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 138:35]
    ctrl.io.memory_read_enable_mem <= ex2mem.io.output_memory_read_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 139:35]
    ctrl.io.rd_mem <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 140:35]
    ctrl.io.memory_write_enable_ex <= id2ex.io.output_memory_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 141:35]
    ctrl.io.memory_write_enable_mem <= ex2mem.io.output_memory_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 142:35]
    ctrl.io.regs_write_enable_ex <= id2ex.io.output_regs_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 143:35]
    ctrl.io.regs_write_source_ex <= id2ex.io.output_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 144:35]
    ctrl.io.regs_write_source_mem <= ex2mem.io.output_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 145:35]
    ctrl.io.regs_write_source_wb <= mem2wb.io.output_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 147:32]
    ctrl.io.rd_wb <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 148:32]
    regs.io.write_enable <= mem2wb.io.output_regs_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 150:25]
    regs.io.write_address <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 151:25]
    regs.io.write_data <= wb.io.regs_write_data @[src/main/scala/riscv/core/PipelinedCPU.scala 152:25]
    regs.io.read_address1 <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 153:25]
    regs.io.read_address2 <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 154:25]
    regs.io.debug_read_address <= io.debug_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 156:30]
    io.debug_read_data <= regs.io.debug_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 157:30]
    io.instruction_address <= inst_fetch.io.instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 162:35]
    node _inst_fetch_io_stall_flag_ctrl_T = or(ctrl.io.pc_stall, mem.io.ctrl_stall_flag) @[src/main/scala/riscv/core/PipelinedCPU.scala 163:55]
    inst_fetch.io.stall_flag_ctrl <= _inst_fetch_io_stall_flag_ctrl_T @[src/main/scala/riscv/core/PipelinedCPU.scala 163:35]
    inst_fetch.io.jump_flag_id <= id.io.if_jump_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 164:35]
    inst_fetch.io.jump_address_id <= id.io.if_jump_address @[src/main/scala/riscv/core/PipelinedCPU.scala 165:35]
    inst_fetch.io.rom_instruction <= io.instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 166:35]
    inst_fetch.io.instruction_valid <= io.instruction_valid @[src/main/scala/riscv/core/PipelinedCPU.scala 167:35]
    node _btb_wrong_direction_T = and(if2id.io.output_btb_predicted_taken, id.io.ctrl_jump_instruction) @[src/main/scala/riscv/core/PipelinedCPU.scala 180:43]
    node _btb_wrong_direction_T_1 = eq(id.io.if_jump_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 180:67]
    node btb_wrong_direction = and(_btb_wrong_direction_T, _btb_wrong_direction_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 180:64]
    node _btb_non_branch_T = eq(id.io.ctrl_jump_instruction, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 183:41]
    node btb_non_branch = and(if2id.io.output_btb_predicted_taken, _btb_non_branch_T) @[src/main/scala/riscv/core/PipelinedCPU.scala 183:38]
    node _btb_wrong_target_T = and(if2id.io.output_btb_predicted_taken, id.io.if_jump_flag) @[src/main/scala/riscv/core/PipelinedCPU.scala 186:40]
    node _btb_wrong_target_T_1 = neq(if2id.io.output_btb_predicted_target, id.io.if_jump_address) @[src/main/scala/riscv/core/PipelinedCPU.scala 186:76]
    node btb_wrong_target = and(_btb_wrong_target_T, _btb_wrong_target_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 186:56]
    node _btb_correct_prediction_T = and(if2id.io.output_btb_predicted_taken, id.io.if_jump_flag) @[src/main/scala/riscv/core/PipelinedCPU.scala 189:46]
    node _btb_correct_prediction_T_1 = eq(if2id.io.output_btb_predicted_target, id.io.if_jump_address) @[src/main/scala/riscv/core/PipelinedCPU.scala 189:82]
    node btb_correct_prediction = and(_btb_correct_prediction_T, _btb_correct_prediction_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 189:62]
    node _btb_mispredict_T = or(btb_wrong_direction, btb_non_branch) @[src/main/scala/riscv/core/PipelinedCPU.scala 192:45]
    node _btb_mispredict_T_1 = or(_btb_mispredict_T, btb_wrong_target) @[src/main/scala/riscv/core/PipelinedCPU.scala 192:63]
    node _btb_mispredict_T_2 = eq(id.io.branch_hazard, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 192:87]
    node btb_mispredict = and(_btb_mispredict_T_1, _btb_mispredict_T_2) @[src/main/scala/riscv/core/PipelinedCPU.scala 192:84]
    node _btb_correction_addr_T = add(if2id.io.output_instruction_address, UInt<3>("h4")) @[src/main/scala/riscv/core/PipelinedCPU.scala 197:102]
    node _btb_correction_addr_T_1 = tail(_btb_correction_addr_T, 1) @[src/main/scala/riscv/core/PipelinedCPU.scala 197:102]
    node btb_correction_addr = mux(btb_wrong_target, id.io.if_jump_address, _btb_correction_addr_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 197:32]
    inst_fetch.io.btb_mispredict <= btb_mispredict @[src/main/scala/riscv/core/PipelinedCPU.scala 199:40]
    inst_fetch.io.btb_correction_addr <= btb_correction_addr @[src/main/scala/riscv/core/PipelinedCPU.scala 200:40]
    inst_fetch.io.btb_correct_prediction <= btb_correct_prediction @[src/main/scala/riscv/core/PipelinedCPU.scala 201:40]
    node _btb_should_update_T = or(id.io.ctrl_jump_instruction, btb_non_branch) @[src/main/scala/riscv/core/PipelinedCPU.scala 206:52]
    node _btb_should_update_T_1 = eq(id.io.branch_hazard, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 206:74]
    node _btb_should_update_T_2 = and(_btb_should_update_T, _btb_should_update_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 206:71]
    node _btb_should_update_T_3 = eq(mem.io.ctrl_stall_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 206:98]
    node btb_should_update = and(_btb_should_update_T_2, _btb_should_update_T_3) @[src/main/scala/riscv/core/PipelinedCPU.scala 206:95]
    inst_fetch.io.btb_update_valid <= btb_should_update @[src/main/scala/riscv/core/PipelinedCPU.scala 207:35]
    inst_fetch.io.btb_update_pc <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 208:35]
    inst_fetch.io.btb_update_target <= id.io.if_jump_address @[src/main/scala/riscv/core/PipelinedCPU.scala 209:35]
    node _inst_fetch_io_btb_update_taken_T = and(id.io.if_jump_flag, id.io.ctrl_jump_instruction) @[src/main/scala/riscv/core/PipelinedCPU.scala 210:57]
    inst_fetch.io.btb_update_taken <= _inst_fetch_io_btb_update_taken_T @[src/main/scala/riscv/core/PipelinedCPU.scala 210:35]
    node _if2id_io_stall_T = or(ctrl.io.if_stall, mem.io.ctrl_stall_flag) @[src/main/scala/riscv/core/PipelinedCPU.scala 212:38]
    if2id.io.stall <= _if2id_io_stall_T @[src/main/scala/riscv/core/PipelinedCPU.scala 212:18]
    node _need_if_flush_T = eq(btb_correct_prediction, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 237:44]
    node _need_if_flush_T_1 = and(ctrl.io.if_flush, _need_if_flush_T) @[src/main/scala/riscv/core/PipelinedCPU.scala 237:41]
    node need_if_flush = or(_need_if_flush_T_1, btb_mispredict) @[src/main/scala/riscv/core/PipelinedCPU.scala 237:69]
    node _if2id_io_flush_T = eq(mem.io.ctrl_stall_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 238:53]
    node _if2id_io_flush_T_1 = and(need_if_flush, _if2id_io_flush_T) @[src/main/scala/riscv/core/PipelinedCPU.scala 238:50]
    if2id.io.flush <= _if2id_io_flush_T_1 @[src/main/scala/riscv/core/PipelinedCPU.scala 238:33]
    if2id.io.instruction <= inst_fetch.io.id_instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 239:33]
    if2id.io.instruction_address <= inst_fetch.io.instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 240:33]
    if2id.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 241:33]
    if2id.io.btb_predicted_taken <= inst_fetch.io.btb_predicted_taken @[src/main/scala/riscv/core/PipelinedCPU.scala 242:33]
    if2id.io.btb_predicted_target <= inst_fetch.io.btb_predicted_target @[src/main/scala/riscv/core/PipelinedCPU.scala 243:33]
    id.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 245:35]
    id.io.instruction_address <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 246:35]
    id.io.reg1_data <= regs.io.read_data1 @[src/main/scala/riscv/core/PipelinedCPU.scala 247:35]
    id.io.reg2_data <= regs.io.read_data2 @[src/main/scala/riscv/core/PipelinedCPU.scala 248:35]
    id.io.forward_from_mem <= mem.io.forward_to_ex @[src/main/scala/riscv/core/PipelinedCPU.scala 249:35]
    id.io.forward_from_wb <= wb.io.regs_write_data @[src/main/scala/riscv/core/PipelinedCPU.scala 250:35]
    id.io.reg1_forward <= forwarding.io.reg1_forward_id @[src/main/scala/riscv/core/PipelinedCPU.scala 251:35]
    id.io.reg2_forward <= forwarding.io.reg2_forward_id @[src/main/scala/riscv/core/PipelinedCPU.scala 252:35]
    id.io.interrupt_assert <= clint.io.id_interrupt_assert @[src/main/scala/riscv/core/PipelinedCPU.scala 253:35]
    id.io.interrupt_handler_address <= clint.io.id_interrupt_handler_address @[src/main/scala/riscv/core/PipelinedCPU.scala 254:35]
    id.io.branch_hazard <= ctrl.io.branch_hazard @[src/main/scala/riscv/core/PipelinedCPU.scala 255:35]
    id2ex.io.stall <= mem.io.ctrl_stall_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 257:18]
    node _id2ex_io_flush_T = eq(mem.io.ctrl_stall_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelinedCPU.scala 267:56]
    node _id2ex_io_flush_T_1 = or(_id2ex_io_flush_T, ctrl.io.jal_jalr_hazard) @[src/main/scala/riscv/core/PipelinedCPU.scala 267:67]
    node _id2ex_io_flush_T_2 = and(ctrl.io.id_flush, _id2ex_io_flush_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 267:52]
    id2ex.io.flush <= _id2ex_io_flush_T_2 @[src/main/scala/riscv/core/PipelinedCPU.scala 267:32]
    id2ex.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 268:32]
    id2ex.io.instruction_address <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 269:32]
    node _id_reg1_data_forwarded_T = eq(UInt<2>("h1"), forwarding.io.reg1_forward_id) @[src/main/scala/riscv/core/PipelinedCPU.scala 276:92]
    node _id_reg1_data_forwarded_T_1 = mux(_id_reg1_data_forwarded_T, mem.io.forward_to_ex, regs.io.read_data1) @[src/main/scala/riscv/core/PipelinedCPU.scala 276:92]
    node _id_reg1_data_forwarded_T_2 = eq(UInt<2>("h2"), forwarding.io.reg1_forward_id) @[src/main/scala/riscv/core/PipelinedCPU.scala 276:92]
    node id_reg1_data_forwarded = mux(_id_reg1_data_forwarded_T_2, wb.io.regs_write_data, _id_reg1_data_forwarded_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 276:92]
    node _id_reg2_data_forwarded_T = eq(UInt<2>("h1"), forwarding.io.reg2_forward_id) @[src/main/scala/riscv/core/PipelinedCPU.scala 282:92]
    node _id_reg2_data_forwarded_T_1 = mux(_id_reg2_data_forwarded_T, mem.io.forward_to_ex, regs.io.read_data2) @[src/main/scala/riscv/core/PipelinedCPU.scala 282:92]
    node _id_reg2_data_forwarded_T_2 = eq(UInt<2>("h2"), forwarding.io.reg2_forward_id) @[src/main/scala/riscv/core/PipelinedCPU.scala 282:92]
    node id_reg2_data_forwarded = mux(_id_reg2_data_forwarded_T_2, wb.io.regs_write_data, _id_reg2_data_forwarded_T_1) @[src/main/scala/riscv/core/PipelinedCPU.scala 282:92]
    id2ex.io.reg1_data <= id_reg1_data_forwarded @[src/main/scala/riscv/core/PipelinedCPU.scala 289:35]
    id2ex.io.reg2_data <= id_reg2_data_forwarded @[src/main/scala/riscv/core/PipelinedCPU.scala 290:35]
    id2ex.io.regs_reg1_read_address <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 291:35]
    id2ex.io.regs_reg2_read_address <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 292:35]
    id2ex.io.regs_write_enable <= id.io.ex_reg_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 293:35]
    id2ex.io.regs_write_address <= id.io.ex_reg_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 294:35]
    id2ex.io.regs_write_source <= id.io.ex_reg_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 295:35]
    id2ex.io.immediate <= id.io.ex_immediate @[src/main/scala/riscv/core/PipelinedCPU.scala 296:35]
    id2ex.io.aluop1_source <= id.io.ex_aluop1_source @[src/main/scala/riscv/core/PipelinedCPU.scala 297:35]
    id2ex.io.aluop2_source <= id.io.ex_aluop2_source @[src/main/scala/riscv/core/PipelinedCPU.scala 298:35]
    id2ex.io.csr_write_enable <= id.io.ex_csr_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 299:35]
    id2ex.io.csr_address <= id.io.ex_csr_address @[src/main/scala/riscv/core/PipelinedCPU.scala 300:35]
    id2ex.io.memory_read_enable <= id.io.ex_memory_read_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 301:35]
    id2ex.io.memory_write_enable <= id.io.ex_memory_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 302:35]
    id2ex.io.csr_read_data <= csr_regs.io.id_reg_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 303:35]
    ex.io.instruction <= id2ex.io.output_instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 305:29]
    ex.io.instruction_address <= id2ex.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 306:29]
    ex.io.reg1_data <= id2ex.io.output_reg1_data @[src/main/scala/riscv/core/PipelinedCPU.scala 307:29]
    ex.io.reg2_data <= id2ex.io.output_reg2_data @[src/main/scala/riscv/core/PipelinedCPU.scala 308:29]
    ex.io.immediate <= id2ex.io.output_immediate @[src/main/scala/riscv/core/PipelinedCPU.scala 309:29]
    ex.io.aluop1_source <= id2ex.io.output_aluop1_source @[src/main/scala/riscv/core/PipelinedCPU.scala 310:29]
    ex.io.aluop2_source <= id2ex.io.output_aluop2_source @[src/main/scala/riscv/core/PipelinedCPU.scala 311:29]
    ex.io.csr_read_data <= id2ex.io.output_csr_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 312:29]
    ex.io.forward_from_mem <= mem.io.forward_to_ex @[src/main/scala/riscv/core/PipelinedCPU.scala 313:29]
    ex.io.forward_from_wb <= wb.io.regs_write_data @[src/main/scala/riscv/core/PipelinedCPU.scala 314:29]
    ex.io.reg1_forward <= forwarding.io.reg1_forward_ex @[src/main/scala/riscv/core/PipelinedCPU.scala 315:29]
    ex.io.reg2_forward <= forwarding.io.reg2_forward_ex @[src/main/scala/riscv/core/PipelinedCPU.scala 316:29]
    ex2mem.io.stall <= mem.io.ctrl_stall_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 318:33]
    ex2mem.io.regs_write_enable <= id2ex.io.output_regs_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 319:33]
    ex2mem.io.regs_write_source <= id2ex.io.output_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 320:33]
    ex2mem.io.regs_write_address <= id2ex.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 321:33]
    ex2mem.io.instruction_address <= id2ex.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 322:33]
    node _ex2mem_io_funct3_T = bits(id2ex.io.output_instruction, 14, 12) @[src/main/scala/riscv/core/PipelinedCPU.scala 323:63]
    ex2mem.io.funct3 <= _ex2mem_io_funct3_T @[src/main/scala/riscv/core/PipelinedCPU.scala 323:33]
    ex2mem.io.reg2_data <= ex.io.mem_reg2_data @[src/main/scala/riscv/core/PipelinedCPU.scala 324:33]
    ex2mem.io.memory_read_enable <= id2ex.io.output_memory_read_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 325:33]
    ex2mem.io.memory_write_enable <= id2ex.io.output_memory_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 326:33]
    ex2mem.io.alu_result <= ex.io.mem_alu_result @[src/main/scala/riscv/core/PipelinedCPU.scala 327:33]
    ex2mem.io.csr_read_data <= id2ex.io.output_csr_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 328:33]
    mem.io.alu_result <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/PipelinedCPU.scala 330:30]
    mem.io.reg2_data <= ex2mem.io.output_reg2_data @[src/main/scala/riscv/core/PipelinedCPU.scala 331:30]
    mem.io.memory_read_enable <= ex2mem.io.output_memory_read_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 332:30]
    mem.io.memory_write_enable <= ex2mem.io.output_memory_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 333:30]
    mem.io.funct3 <= ex2mem.io.output_funct3 @[src/main/scala/riscv/core/PipelinedCPU.scala 334:30]
    mem.io.regs_write_source <= ex2mem.io.output_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 335:30]
    mem.io.csr_read_data <= ex2mem.io.output_csr_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 336:30]
    mem.io.instruction_address <= ex2mem.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 337:30]
    node _io_device_select_T = bits(mem.io.bus.address, 31, 29) @[src/main/scala/riscv/core/PipelinedCPU.scala 339:13]
    io.device_select <= _io_device_select_T @[src/main/scala/riscv/core/PipelinedCPU.scala 338:20]
    mem.io.bus.granted <= io.memory_bundle.granted @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    io.memory_bundle.request <= mem.io.bus.request @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    mem.io.bus.busy <= io.memory_bundle.busy @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    mem.io.bus.write_data_accepted <= io.memory_bundle.write_data_accepted @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    mem.io.bus.write_valid <= io.memory_bundle.write_valid @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    io.memory_bundle.write_strobe <= mem.io.bus.write_strobe @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    io.memory_bundle.write_data <= mem.io.bus.write_data @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    io.memory_bundle.write <= mem.io.bus.write @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    mem.io.bus.read_valid <= io.memory_bundle.read_valid @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    mem.io.bus.read_data <= io.memory_bundle.read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    io.memory_bundle.read <= mem.io.bus.read @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    io.memory_bundle.address <= mem.io.bus.address @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
    node _io_memory_bundle_address_T = bits(mem.io.bus.address, 28, 0) @[src/main/scala/riscv/core/PipelinedCPU.scala 342:13]
    node _io_memory_bundle_address_T_1 = cat(UInt<3>("h0"), _io_memory_bundle_address_T) @[src/main/scala/riscv/core/PipelinedCPU.scala 341:70]
    io.memory_bundle.address <= _io_memory_bundle_address_T_1 @[src/main/scala/riscv/core/PipelinedCPU.scala 341:28]
    mem2wb.io.stall <= mem.io.ctrl_stall_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 344:33]
    mem2wb.io.instruction_address <= ex2mem.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 345:33]
    mem2wb.io.alu_result <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/PipelinedCPU.scala 346:33]
    mem2wb.io.regs_write_enable <= ex2mem.io.output_regs_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 347:33]
    mem2wb.io.regs_write_source <= mem.io.wb_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 350:32]
    mem2wb.io.regs_write_address <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 351:32]
    mem2wb.io.memory_read_data <= mem.io.wb_memory_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 352:32]
    mem2wb.io.csr_read_data <= ex2mem.io.output_csr_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 353:32]
    wb.io.instruction_address <= mem2wb.io.output_instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 355:29]
    wb.io.alu_result <= mem2wb.io.output_alu_result @[src/main/scala/riscv/core/PipelinedCPU.scala 356:29]
    wb.io.memory_read_data <= mem2wb.io.output_memory_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 357:29]
    wb.io.regs_write_source <= mem2wb.io.output_regs_write_source @[src/main/scala/riscv/core/PipelinedCPU.scala 358:29]
    wb.io.csr_read_data <= mem2wb.io.output_csr_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 359:29]
    forwarding.io.rs1_id <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 361:38]
    forwarding.io.rs2_id <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 362:38]
    forwarding.io.rs1_ex <= id2ex.io.output_regs_reg1_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 363:38]
    forwarding.io.rs2_ex <= id2ex.io.output_regs_reg2_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 364:38]
    forwarding.io.rd_mem <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 365:38]
    forwarding.io.reg_write_enable_mem <= ex2mem.io.output_regs_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 366:38]
    forwarding.io.rd_wb <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/PipelinedCPU.scala 367:38]
    forwarding.io.reg_write_enable_wb <= mem2wb.io.output_regs_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 368:38]
    clint.io.instruction_address_if <= inst_fetch.io.instruction_address @[src/main/scala/riscv/core/PipelinedCPU.scala 370:35]
    clint.io.instruction_id <= if2id.io.output_instruction @[src/main/scala/riscv/core/PipelinedCPU.scala 371:35]
    clint.io.jump_flag <= id.io.clint_jump_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 372:35]
    clint.io.jump_address <= id.io.clint_jump_address @[src/main/scala/riscv/core/PipelinedCPU.scala 373:35]
    clint.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/PipelinedCPU.scala 374:35]
    csr_regs.io.clint_access_bundle <= clint.io.csr_bundle @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
    csr_regs.io.reg_read_address_id <= id.io.ex_csr_address @[src/main/scala/riscv/core/PipelinedCPU.scala 377:38]
    csr_regs.io.reg_write_enable_ex <= id2ex.io.output_csr_write_enable @[src/main/scala/riscv/core/PipelinedCPU.scala 378:38]
    csr_regs.io.reg_write_address_ex <= id2ex.io.output_csr_address @[src/main/scala/riscv/core/PipelinedCPU.scala 379:38]
    csr_regs.io.reg_write_data_ex <= ex.io.csr_write_data @[src/main/scala/riscv/core/PipelinedCPU.scala 380:38]
    csr_regs.io.debug_reg_read_address <= io.csr_debug_read_address @[src/main/scala/riscv/core/PipelinedCPU.scala 381:38]
    io.csr_debug_read_data <= csr_regs.io.debug_reg_read_data @[src/main/scala/riscv/core/PipelinedCPU.scala 382:38]
    io.bus_address <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 385:50]
    io.axi4_channels.read_address_channel.ARADDR <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 386:50]
    io.axi4_channels.read_address_channel.ARPROT <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 387:50]
    io.axi4_channels.read_address_channel.ARVALID <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 388:50]
    io.axi4_channels.read_data_channel.RREADY <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 389:50]
    io.axi4_channels.write_address_channel.AWADDR <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 390:50]
    io.axi4_channels.write_address_channel.AWPROT <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 391:50]
    io.axi4_channels.write_address_channel.AWVALID <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 392:50]
    io.axi4_channels.write_data_channel.WDATA <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 393:50]
    io.axi4_channels.write_data_channel.WSTRB <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 394:50]
    io.axi4_channels.write_data_channel.WVALID <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 395:50]
    io.axi4_channels.write_response_channel.BREADY <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 396:50]
    io.debug_bus_write_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 397:50]
    io.debug_bus_write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelinedCPU.scala 398:50]

  module AXI4LiteMaster :
    input clock : Clock
    input reset : Reset
    output io : { channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { flip address : UInt<32>, flip read : UInt<1>, flip write : UInt<1>, read_data : UInt<32>, flip write_data : UInt<32>, flip write_strobe : UInt<1>[4], busy : UInt<1>, read_valid : UInt<1>, write_valid : UInt<1>, write_data_accepted : UInt<1>}} @[src/main/scala/bus/AXI4Lite.scala 229:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 234:22]
    node _io_bundle_busy_T = neq(state, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 235:27]
    io.bundle.busy <= _io_bundle_busy_T @[src/main/scala/bus/AXI4Lite.scala 235:18]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 237:21]
    io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 238:44]
    io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 239:44]
    reg read_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 242:27]
    io.bundle.read_valid <= read_valid @[src/main/scala/bus/AXI4Lite.scala 243:24]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 244:26]
    io.bundle.read_data <= read_data @[src/main/scala/bus/AXI4Lite.scala 245:23]
    reg ARVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 247:24]
    io.channels.read_address_channel.ARVALID <= ARVALID @[src/main/scala/bus/AXI4Lite.scala 248:44]
    reg RREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 249:23]
    io.channels.read_data_channel.RREADY <= RREADY @[src/main/scala/bus/AXI4Lite.scala 250:40]
    io.channels.read_address_channel.ARPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 252:43]
    reg write_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 255:28]
    io.bundle.write_valid <= write_valid @[src/main/scala/bus/AXI4Lite.scala 256:25]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 257:27]
    io.channels.write_data_channel.WDATA <= write_data @[src/main/scala/bus/AXI4Lite.scala 258:40]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 259:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 259:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 259:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 259:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 259:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 259:29]
    node io_channels_write_data_channel_WSTRB_lo = cat(write_strobe[1], write_strobe[0]) @[src/main/scala/bus/AXI4Lite.scala 260:56]
    node io_channels_write_data_channel_WSTRB_hi = cat(write_strobe[3], write_strobe[2]) @[src/main/scala/bus/AXI4Lite.scala 260:56]
    node _io_channels_write_data_channel_WSTRB_T = cat(io_channels_write_data_channel_WSTRB_hi, io_channels_write_data_channel_WSTRB_lo) @[src/main/scala/bus/AXI4Lite.scala 260:56]
    io.channels.write_data_channel.WSTRB <= _io_channels_write_data_channel_WSTRB_T @[src/main/scala/bus/AXI4Lite.scala 260:40]
    reg AWVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 262:24]
    io.channels.write_address_channel.AWVALID <= AWVALID @[src/main/scala/bus/AXI4Lite.scala 263:45]
    reg WVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 264:23]
    io.channels.write_data_channel.WVALID <= WVALID @[src/main/scala/bus/AXI4Lite.scala 265:41]
    reg BREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 266:23]
    io.channels.write_response_channel.BREADY <= BREADY @[src/main/scala/bus/AXI4Lite.scala 267:45]
    reg write_data_accepted : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 270:36]
    io.bundle.write_data_accepted <= write_data_accepted @[src/main/scala/bus/AXI4Lite.scala 271:33]
    io.channels.write_address_channel.AWPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 273:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 279:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 279:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 279:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 279:17]
      read_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 281:27]
      write_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 282:27]
      write_data_accepted <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 283:27]
      node _T_3 = eq(io.bundle.write, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 285:30]
      node _T_4 = and(io.bundle.read, _T_3) @[src/main/scala/bus/AXI4Lite.scala 285:27]
      when _T_4 : @[src/main/scala/bus/AXI4Lite.scala 285:48]
        addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 287:17]
        ARVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 288:17]
        RREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 289:17]
        state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 290:17]
      else :
        when io.bundle.write : @[src/main/scala/bus/AXI4Lite.scala 291:35]
          addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 293:22]
          write_data <= io.bundle.write_data @[src/main/scala/bus/AXI4Lite.scala 294:22]
          write_strobe <= io.bundle.write_strobe @[src/main/scala/bus/AXI4Lite.scala 295:22]
          AWVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 296:22]
          WVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 297:22]
          state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 298:22]
    else :
      node _T_5 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 279:17]
      node _T_6 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 279:17]
      node _T_7 = eq(_T_5, _T_6) @[src/main/scala/bus/AXI4Lite.scala 279:17]
      when _T_7 : @[src/main/scala/bus/AXI4Lite.scala 279:17]
        node _T_8 = and(ARVALID, io.channels.read_address_channel.ARREADY) @[src/main/scala/bus/AXI4Lite.scala 304:20]
        when _T_8 : @[src/main/scala/bus/AXI4Lite.scala 304:65]
          ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 305:17]
        node _T_9 = and(io.channels.read_data_channel.RVALID, RREADY) @[src/main/scala/bus/AXI4Lite.scala 308:49]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 308:60]
          read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 310:20]
          RREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 311:20]
          read_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 312:20]
          state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 313:20]
      else :
        node _T_10 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 279:17]
        node _T_11 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 279:17]
        node _T_12 = eq(_T_10, _T_11) @[src/main/scala/bus/AXI4Lite.scala 279:17]
        when _T_12 : @[src/main/scala/bus/AXI4Lite.scala 279:17]
          node _T_13 = and(AWVALID, io.channels.write_address_channel.AWREADY) @[src/main/scala/bus/AXI4Lite.scala 319:20]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 319:66]
            AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 320:17]
          node _T_14 = and(WVALID, io.channels.write_data_channel.WREADY) @[src/main/scala/bus/AXI4Lite.scala 323:19]
          when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 323:61]
            WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 325:29]
            BREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 326:29]
            write_data_accepted <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 327:29]
            state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 328:29]
        else :
          node _T_15 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 279:17]
          node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 279:17]
          node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 279:17]
          when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 279:17]
            node _T_18 = and(AWVALID, io.channels.write_address_channel.AWREADY) @[src/main/scala/bus/AXI4Lite.scala 335:20]
            when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 335:66]
              AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 336:17]
            node _T_19 = and(io.channels.write_response_channel.BVALID, BREADY) @[src/main/scala/bus/AXI4Lite.scala 339:54]
            when _T_19 : @[src/main/scala/bus/AXI4Lite.scala 339:65]
              BREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 341:21]
              write_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 342:21]
              state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 343:21]
          else :
            node _T_20 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 279:17]
            node _T_21 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 279:17]
            node _T_22 = eq(_T_20, _T_21) @[src/main/scala/bus/AXI4Lite.scala 279:17]
            when _T_22 : @[src/main/scala/bus/AXI4Lite.scala 279:17]
              state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 349:13]
            else :
              node _T_23 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 279:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 279:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 279:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 279:17]
                state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 352:13]


  module CPU :
    input clock : Clock
    input reset : Reset
    output io : { instruction_address : UInt<32>, flip instruction : UInt<32>, flip instruction_valid : UInt<1>, memory_bundle : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], flip write_valid : UInt<1>, flip write_data_accepted : UInt<1>, flip busy : UInt<1>, request : UInt<1>, flip granted : UInt<1>}, device_select : UInt<3>, axi4_channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip interrupt_flag : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>, flip csr_debug_read_address : UInt<12>, csr_debug_read_data : UInt<32>, bus_address : UInt<32>, debug_bus_write_enable : UInt<1>, debug_bus_write_data : UInt<32>} @[src/main/scala/riscv/core/CPU.scala 14:14]

    inst cpu of PipelinedCPU @[src/main/scala/riscv/core/CPU.scala 18:23]
    cpu.clock <= clock
    cpu.reset <= reset
    io.instruction_address <= cpu.io.instruction_address @[src/main/scala/riscv/core/CPU.scala 21:32]
    cpu.io.instruction <= io.instruction @[src/main/scala/riscv/core/CPU.scala 22:32]
    cpu.io.instruction_valid <= io.instruction_valid @[src/main/scala/riscv/core/CPU.scala 23:32]
    inst axi_master of AXI4LiteMaster @[src/main/scala/riscv/core/CPU.scala 26:30]
    axi_master.clock <= clock
    axi_master.reset <= reset
    node _full_bus_address_T = bits(cpu.io.memory_bundle.address, 28, 0) @[src/main/scala/riscv/core/CPU.scala 30:17]
    node full_bus_address = cat(cpu.io.device_select, _full_bus_address_T) @[src/main/scala/riscv/core/CPU.scala 29:51]
    axi_master.io.bundle.address <= full_bus_address @[src/main/scala/riscv/core/CPU.scala 33:41]
    node _axi_master_io_bundle_read_T = and(cpu.io.memory_bundle.request, cpu.io.memory_bundle.read) @[src/main/scala/riscv/core/CPU.scala 34:73]
    axi_master.io.bundle.read <= _axi_master_io_bundle_read_T @[src/main/scala/riscv/core/CPU.scala 34:41]
    node _axi_master_io_bundle_write_T = and(cpu.io.memory_bundle.request, cpu.io.memory_bundle.write) @[src/main/scala/riscv/core/CPU.scala 35:73]
    axi_master.io.bundle.write <= _axi_master_io_bundle_write_T @[src/main/scala/riscv/core/CPU.scala 35:41]
    axi_master.io.bundle.write_data <= cpu.io.memory_bundle.write_data @[src/main/scala/riscv/core/CPU.scala 36:41]
    axi_master.io.bundle.write_strobe[0] <= cpu.io.memory_bundle.write_strobe[0] @[src/main/scala/riscv/core/CPU.scala 37:41]
    axi_master.io.bundle.write_strobe[1] <= cpu.io.memory_bundle.write_strobe[1] @[src/main/scala/riscv/core/CPU.scala 37:41]
    axi_master.io.bundle.write_strobe[2] <= cpu.io.memory_bundle.write_strobe[2] @[src/main/scala/riscv/core/CPU.scala 37:41]
    axi_master.io.bundle.write_strobe[3] <= cpu.io.memory_bundle.write_strobe[3] @[src/main/scala/riscv/core/CPU.scala 37:41]
    cpu.io.memory_bundle.read_data <= axi_master.io.bundle.read_data @[src/main/scala/riscv/core/CPU.scala 39:48]
    cpu.io.memory_bundle.read_valid <= axi_master.io.bundle.read_valid @[src/main/scala/riscv/core/CPU.scala 40:48]
    cpu.io.memory_bundle.write_valid <= axi_master.io.bundle.write_valid @[src/main/scala/riscv/core/CPU.scala 41:48]
    cpu.io.memory_bundle.write_data_accepted <= axi_master.io.bundle.write_data_accepted @[src/main/scala/riscv/core/CPU.scala 42:48]
    cpu.io.memory_bundle.busy <= axi_master.io.bundle.busy @[src/main/scala/riscv/core/CPU.scala 43:48]
    node _cpu_io_memory_bundle_granted_T = eq(axi_master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/riscv/core/CPU.scala 44:51]
    cpu.io.memory_bundle.granted <= _cpu_io_memory_bundle_granted_T @[src/main/scala/riscv/core/CPU.scala 44:48]
    axi_master.io.channels.read_data_channel.RRESP <= io.axi4_channels.read_data_channel.RRESP @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.read_data_channel.RDATA <= io.axi4_channels.read_data_channel.RDATA @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.read_data_channel.RREADY <= axi_master.io.channels.read_data_channel.RREADY @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.read_data_channel.RVALID <= io.axi4_channels.read_data_channel.RVALID @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.read_address_channel.ARPROT <= axi_master.io.channels.read_address_channel.ARPROT @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.read_address_channel.ARADDR <= axi_master.io.channels.read_address_channel.ARADDR @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.read_address_channel.ARREADY <= io.axi4_channels.read_address_channel.ARREADY @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.read_address_channel.ARVALID <= axi_master.io.channels.read_address_channel.ARVALID @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.write_response_channel.BRESP <= io.axi4_channels.write_response_channel.BRESP @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_response_channel.BREADY <= axi_master.io.channels.write_response_channel.BREADY @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.write_response_channel.BVALID <= io.axi4_channels.write_response_channel.BVALID @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_data_channel.WSTRB <= axi_master.io.channels.write_data_channel.WSTRB @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_data_channel.WDATA <= axi_master.io.channels.write_data_channel.WDATA @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.write_data_channel.WREADY <= io.axi4_channels.write_data_channel.WREADY @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_data_channel.WVALID <= axi_master.io.channels.write_data_channel.WVALID @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_address_channel.AWPROT <= axi_master.io.channels.write_address_channel.AWPROT @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_address_channel.AWADDR <= axi_master.io.channels.write_address_channel.AWADDR @[src/main/scala/riscv/core/CPU.scala 47:24]
    axi_master.io.channels.write_address_channel.AWREADY <= io.axi4_channels.write_address_channel.AWREADY @[src/main/scala/riscv/core/CPU.scala 47:24]
    io.axi4_channels.write_address_channel.AWVALID <= axi_master.io.channels.write_address_channel.AWVALID @[src/main/scala/riscv/core/CPU.scala 47:24]
    cpu.io.axi4_channels.read_address_channel.ARREADY <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 50:58]
    cpu.io.axi4_channels.read_data_channel.RVALID <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 51:58]
    cpu.io.axi4_channels.read_data_channel.RDATA <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 52:58]
    cpu.io.axi4_channels.read_data_channel.RRESP <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 53:58]
    cpu.io.axi4_channels.write_address_channel.AWREADY <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 54:58]
    cpu.io.axi4_channels.write_data_channel.WREADY <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 55:58]
    cpu.io.axi4_channels.write_response_channel.BVALID <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 56:58]
    cpu.io.axi4_channels.write_response_channel.BRESP <= UInt<1>("h0") @[src/main/scala/riscv/core/CPU.scala 57:58]
    io.device_select <= cpu.io.device_select @[src/main/scala/riscv/core/CPU.scala 60:24]
    reg bus_address_reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/riscv/core/CPU.scala 69:37]
    node _start_bus_transaction_T = eq(axi_master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/riscv/core/CPU.scala 75:9]
    node _start_bus_transaction_T_1 = and(_start_bus_transaction_T, cpu.io.memory_bundle.request) @[src/main/scala/riscv/core/CPU.scala 75:36]
    node _start_bus_transaction_T_2 = or(cpu.io.memory_bundle.read, cpu.io.memory_bundle.write) @[src/main/scala/riscv/core/CPU.scala 77:38]
    node start_bus_transaction = and(_start_bus_transaction_T_1, _start_bus_transaction_T_2) @[src/main/scala/riscv/core/CPU.scala 76:40]
    when start_bus_transaction : @[src/main/scala/riscv/core/CPU.scala 79:35]
      bus_address_reg <= full_bus_address @[src/main/scala/riscv/core/CPU.scala 80:25]
    io.bus_address <= bus_address_reg @[src/main/scala/riscv/core/CPU.scala 83:22]
    io.memory_bundle.address <= cpu.io.memory_bundle.address @[src/main/scala/riscv/core/CPU.scala 86:37]
    io.memory_bundle.read <= cpu.io.memory_bundle.read @[src/main/scala/riscv/core/CPU.scala 87:37]
    io.memory_bundle.write <= cpu.io.memory_bundle.write @[src/main/scala/riscv/core/CPU.scala 88:37]
    io.memory_bundle.write_data <= cpu.io.memory_bundle.write_data @[src/main/scala/riscv/core/CPU.scala 89:37]
    io.memory_bundle.write_strobe <= cpu.io.memory_bundle.write_strobe @[src/main/scala/riscv/core/CPU.scala 90:37]
    io.memory_bundle.request <= cpu.io.memory_bundle.request @[src/main/scala/riscv/core/CPU.scala 91:37]
    cpu.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/CPU.scala 98:29]
    cpu.io.debug_read_address <= io.debug_read_address @[src/main/scala/riscv/core/CPU.scala 101:33]
    io.debug_read_data <= cpu.io.debug_read_data @[src/main/scala/riscv/core/CPU.scala 102:33]
    cpu.io.csr_debug_read_address <= io.csr_debug_read_address @[src/main/scala/riscv/core/CPU.scala 104:37]
    io.csr_debug_read_data <= cpu.io.csr_debug_read_data @[src/main/scala/riscv/core/CPU.scala 105:37]
    io.debug_bus_write_enable <= cpu.io.memory_bundle.write @[src/main/scala/riscv/core/CPU.scala 108:33]
    io.debug_bus_write_data <= cpu.io.memory_bundle.write_data @[src/main/scala/riscv/core/CPU.scala 109:33]

  module DummySlave :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<4>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<4>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}} @[src/main/scala/peripheral/DummySlave.scala 13:14]

    io.channels.read_address_channel.ARREADY <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 17:45]
    io.channels.read_data_channel.RVALID <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 18:45]
    io.channels.read_data_channel.RDATA <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 19:45]
    io.channels.read_data_channel.RRESP <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 20:45]
    io.channels.write_address_channel.AWREADY <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 21:45]
    io.channels.write_data_channel.WREADY <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 22:45]
    io.channels.write_response_channel.BVALID <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 23:45]
    io.channels.write_response_channel.BRESP <= UInt<1>("h0") @[src/main/scala/peripheral/DummySlave.scala 24:45]

  module BusArbiter :
    input clock : Clock
    input reset : Reset
    output io : { flip bus_request : UInt<1>[1], bus_granted : UInt<1>[1], ctrl_stall_flag : UInt<1>} @[src/main/scala/bus/BusArbiter.scala 11:14]

    wire granted : UInt @[src/main/scala/bus/BusArbiter.scala 17:21]
    granted <= UInt<1>("h0") @[src/main/scala/bus/BusArbiter.scala 20:11]
    when io.bus_request[0] : @[src/main/scala/bus/BusArbiter.scala 22:31]
      granted <= UInt<1>("h0") @[src/main/scala/bus/BusArbiter.scala 23:15]
    node _io_bus_granted_0_T = eq(UInt<1>("h0"), granted) @[src/main/scala/bus/BusArbiter.scala 27:32]
    io.bus_granted[0] <= _io_bus_granted_0_T @[src/main/scala/bus/BusArbiter.scala 27:25]
    node _io_ctrl_stall_flag_T = eq(io.bus_granted[0], UInt<1>("h0")) @[src/main/scala/bus/BusArbiter.scala 29:25]
    io.ctrl_stall_flag <= _io_ctrl_stall_flag_T @[src/main/scala/bus/BusArbiter.scala 29:22]

  module BusSwitch :
    input clock : Clock
    input reset : Reset
    output io : { flip address : UInt<32>, slaves : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}[8], flip master : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}} @[src/main/scala/bus/BusSwitch.scala 12:14]

    node index = bits(io.address, 31, 29) @[src/main/scala/bus/BusSwitch.scala 18:25]
    node sel_shiftAmount = bits(index, 2, 0) @[src/main/scala/chisel3/util/OneHot.scala 64:49]
    node _sel_T = dshl(UInt<1>("h1"), sel_shiftAmount) @[src/main/scala/chisel3/util/OneHot.scala 65:12]
    node sel = bits(_sel_T, 7, 0) @[src/main/scala/chisel3/util/OneHot.scala 65:27]
    node hit = bits(sel, 0, 0) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_0_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[0].write_address_channel.AWVALID <= _io_slaves_0_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[0].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[0].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_0_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[0].write_data_channel.WVALID <= _io_slaves_0_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[0].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[0].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_0_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[0].write_response_channel.BREADY <= _io_slaves_0_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_0_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[0].read_address_channel.ARVALID <= _io_slaves_0_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[0].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[0].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_0_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[0].read_data_channel.RREADY <= _io_slaves_0_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_1 = bits(sel, 1, 1) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_1_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_1) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[1].write_address_channel.AWVALID <= _io_slaves_1_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[1].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[1].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_1_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_1) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[1].write_data_channel.WVALID <= _io_slaves_1_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[1].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[1].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_1_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_1) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[1].write_response_channel.BREADY <= _io_slaves_1_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_1_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_1) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[1].read_address_channel.ARVALID <= _io_slaves_1_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[1].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[1].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_1_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_1) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[1].read_data_channel.RREADY <= _io_slaves_1_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_2 = bits(sel, 2, 2) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_2_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_2) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[2].write_address_channel.AWVALID <= _io_slaves_2_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[2].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[2].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_2_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_2) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[2].write_data_channel.WVALID <= _io_slaves_2_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[2].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[2].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_2_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_2) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[2].write_response_channel.BREADY <= _io_slaves_2_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_2_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_2) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[2].read_address_channel.ARVALID <= _io_slaves_2_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[2].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[2].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_2_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_2) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[2].read_data_channel.RREADY <= _io_slaves_2_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_3 = bits(sel, 3, 3) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_3_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_3) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[3].write_address_channel.AWVALID <= _io_slaves_3_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[3].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[3].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_3_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_3) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[3].write_data_channel.WVALID <= _io_slaves_3_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[3].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[3].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_3_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_3) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[3].write_response_channel.BREADY <= _io_slaves_3_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_3_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_3) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[3].read_address_channel.ARVALID <= _io_slaves_3_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[3].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[3].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_3_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_3) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[3].read_data_channel.RREADY <= _io_slaves_3_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_4 = bits(sel, 4, 4) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_4_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_4) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[4].write_address_channel.AWVALID <= _io_slaves_4_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[4].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[4].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_4_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_4) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[4].write_data_channel.WVALID <= _io_slaves_4_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[4].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[4].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_4_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_4) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[4].write_response_channel.BREADY <= _io_slaves_4_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_4_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_4) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[4].read_address_channel.ARVALID <= _io_slaves_4_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[4].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[4].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_4_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_4) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[4].read_data_channel.RREADY <= _io_slaves_4_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_5 = bits(sel, 5, 5) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_5_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_5) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[5].write_address_channel.AWVALID <= _io_slaves_5_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[5].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[5].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_5_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_5) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[5].write_data_channel.WVALID <= _io_slaves_5_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[5].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[5].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_5_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_5) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[5].write_response_channel.BREADY <= _io_slaves_5_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_5_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_5) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[5].read_address_channel.ARVALID <= _io_slaves_5_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[5].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[5].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_5_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_5) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[5].read_data_channel.RREADY <= _io_slaves_5_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_6 = bits(sel, 6, 6) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_6_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_6) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[6].write_address_channel.AWVALID <= _io_slaves_6_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[6].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[6].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_6_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_6) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[6].write_data_channel.WVALID <= _io_slaves_6_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[6].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[6].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_6_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_6) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[6].write_response_channel.BREADY <= _io_slaves_6_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_6_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_6) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[6].read_address_channel.ARVALID <= _io_slaves_6_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[6].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[6].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_6_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_6) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[6].read_data_channel.RREADY <= _io_slaves_6_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node hit_7 = bits(sel, 7, 7) @[src/main/scala/bus/BusSwitch.scala 23:18]
    node _io_slaves_7_write_address_channel_AWVALID_T = and(io.master.write_address_channel.AWVALID, hit_7) @[src/main/scala/bus/BusSwitch.scala 25:91]
    io.slaves[7].write_address_channel.AWVALID <= _io_slaves_7_write_address_channel_AWVALID_T @[src/main/scala/bus/BusSwitch.scala 25:48]
    io.slaves[7].write_address_channel.AWADDR <= io.master.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 26:48]
    io.slaves[7].write_address_channel.AWPROT <= io.master.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 27:48]
    node _io_slaves_7_write_data_channel_WVALID_T = and(io.master.write_data_channel.WVALID, hit_7) @[src/main/scala/bus/BusSwitch.scala 29:83]
    io.slaves[7].write_data_channel.WVALID <= _io_slaves_7_write_data_channel_WVALID_T @[src/main/scala/bus/BusSwitch.scala 29:44]
    io.slaves[7].write_data_channel.WDATA <= io.master.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:44]
    io.slaves[7].write_data_channel.WSTRB <= io.master.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 31:44]
    node _io_slaves_7_write_response_channel_BREADY_T = and(io.master.write_response_channel.BREADY, hit_7) @[src/main/scala/bus/BusSwitch.scala 33:91]
    io.slaves[7].write_response_channel.BREADY <= _io_slaves_7_write_response_channel_BREADY_T @[src/main/scala/bus/BusSwitch.scala 33:48]
    node _io_slaves_7_read_address_channel_ARVALID_T = and(io.master.read_address_channel.ARVALID, hit_7) @[src/main/scala/bus/BusSwitch.scala 35:89]
    io.slaves[7].read_address_channel.ARVALID <= _io_slaves_7_read_address_channel_ARVALID_T @[src/main/scala/bus/BusSwitch.scala 35:47]
    io.slaves[7].read_address_channel.ARADDR <= io.master.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 36:47]
    io.slaves[7].read_address_channel.ARPROT <= io.master.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 37:47]
    node _io_slaves_7_read_data_channel_RREADY_T = and(io.master.read_data_channel.RREADY, hit_7) @[src/main/scala/bus/BusSwitch.scala 39:81]
    io.slaves[7].read_data_channel.RREADY <= _io_slaves_7_read_data_channel_RREADY_T @[src/main/scala/bus/BusSwitch.scala 39:43]
    node _io_master_write_address_channel_AWREADY_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_address_channel_AWREADY_T_8 = mux(_io_master_write_address_channel_AWREADY_T, io.slaves[0].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_9 = mux(_io_master_write_address_channel_AWREADY_T_1, io.slaves[1].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_10 = mux(_io_master_write_address_channel_AWREADY_T_2, io.slaves[2].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_11 = mux(_io_master_write_address_channel_AWREADY_T_3, io.slaves[3].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_12 = mux(_io_master_write_address_channel_AWREADY_T_4, io.slaves[4].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_13 = mux(_io_master_write_address_channel_AWREADY_T_5, io.slaves[5].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_14 = mux(_io_master_write_address_channel_AWREADY_T_6, io.slaves[6].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_15 = mux(_io_master_write_address_channel_AWREADY_T_7, io.slaves[7].write_address_channel.AWREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_16 = or(_io_master_write_address_channel_AWREADY_T_8, _io_master_write_address_channel_AWREADY_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_17 = or(_io_master_write_address_channel_AWREADY_T_16, _io_master_write_address_channel_AWREADY_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_18 = or(_io_master_write_address_channel_AWREADY_T_17, _io_master_write_address_channel_AWREADY_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_19 = or(_io_master_write_address_channel_AWREADY_T_18, _io_master_write_address_channel_AWREADY_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_20 = or(_io_master_write_address_channel_AWREADY_T_19, _io_master_write_address_channel_AWREADY_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_21 = or(_io_master_write_address_channel_AWREADY_T_20, _io_master_write_address_channel_AWREADY_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_address_channel_AWREADY_T_22 = or(_io_master_write_address_channel_AWREADY_T_21, _io_master_write_address_channel_AWREADY_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_write_address_channel_AWREADY_WIRE : UInt<1> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_write_address_channel_AWREADY_WIRE <= _io_master_write_address_channel_AWREADY_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.write_address_channel.AWREADY <= _io_master_write_address_channel_AWREADY_WIRE @[src/main/scala/bus/BusSwitch.scala 43:43]
    node _io_master_write_data_channel_WREADY_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_data_channel_WREADY_T_8 = mux(_io_master_write_data_channel_WREADY_T, io.slaves[0].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_9 = mux(_io_master_write_data_channel_WREADY_T_1, io.slaves[1].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_10 = mux(_io_master_write_data_channel_WREADY_T_2, io.slaves[2].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_11 = mux(_io_master_write_data_channel_WREADY_T_3, io.slaves[3].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_12 = mux(_io_master_write_data_channel_WREADY_T_4, io.slaves[4].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_13 = mux(_io_master_write_data_channel_WREADY_T_5, io.slaves[5].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_14 = mux(_io_master_write_data_channel_WREADY_T_6, io.slaves[6].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_15 = mux(_io_master_write_data_channel_WREADY_T_7, io.slaves[7].write_data_channel.WREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_16 = or(_io_master_write_data_channel_WREADY_T_8, _io_master_write_data_channel_WREADY_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_17 = or(_io_master_write_data_channel_WREADY_T_16, _io_master_write_data_channel_WREADY_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_18 = or(_io_master_write_data_channel_WREADY_T_17, _io_master_write_data_channel_WREADY_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_19 = or(_io_master_write_data_channel_WREADY_T_18, _io_master_write_data_channel_WREADY_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_20 = or(_io_master_write_data_channel_WREADY_T_19, _io_master_write_data_channel_WREADY_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_21 = or(_io_master_write_data_channel_WREADY_T_20, _io_master_write_data_channel_WREADY_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_data_channel_WREADY_T_22 = or(_io_master_write_data_channel_WREADY_T_21, _io_master_write_data_channel_WREADY_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_write_data_channel_WREADY_WIRE : UInt<1> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_write_data_channel_WREADY_WIRE <= _io_master_write_data_channel_WREADY_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.write_data_channel.WREADY <= _io_master_write_data_channel_WREADY_WIRE @[src/main/scala/bus/BusSwitch.scala 44:43]
    node _io_master_write_response_channel_BVALID_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BVALID_T_8 = mux(_io_master_write_response_channel_BVALID_T, io.slaves[0].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_9 = mux(_io_master_write_response_channel_BVALID_T_1, io.slaves[1].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_10 = mux(_io_master_write_response_channel_BVALID_T_2, io.slaves[2].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_11 = mux(_io_master_write_response_channel_BVALID_T_3, io.slaves[3].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_12 = mux(_io_master_write_response_channel_BVALID_T_4, io.slaves[4].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_13 = mux(_io_master_write_response_channel_BVALID_T_5, io.slaves[5].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_14 = mux(_io_master_write_response_channel_BVALID_T_6, io.slaves[6].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_15 = mux(_io_master_write_response_channel_BVALID_T_7, io.slaves[7].write_response_channel.BVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_16 = or(_io_master_write_response_channel_BVALID_T_8, _io_master_write_response_channel_BVALID_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_17 = or(_io_master_write_response_channel_BVALID_T_16, _io_master_write_response_channel_BVALID_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_18 = or(_io_master_write_response_channel_BVALID_T_17, _io_master_write_response_channel_BVALID_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_19 = or(_io_master_write_response_channel_BVALID_T_18, _io_master_write_response_channel_BVALID_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_20 = or(_io_master_write_response_channel_BVALID_T_19, _io_master_write_response_channel_BVALID_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_21 = or(_io_master_write_response_channel_BVALID_T_20, _io_master_write_response_channel_BVALID_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BVALID_T_22 = or(_io_master_write_response_channel_BVALID_T_21, _io_master_write_response_channel_BVALID_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_write_response_channel_BVALID_WIRE : UInt<1> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_write_response_channel_BVALID_WIRE <= _io_master_write_response_channel_BVALID_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.write_response_channel.BVALID <= _io_master_write_response_channel_BVALID_WIRE @[src/main/scala/bus/BusSwitch.scala 45:43]
    node _io_master_write_response_channel_BRESP_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_write_response_channel_BRESP_T_8 = mux(_io_master_write_response_channel_BRESP_T, io.slaves[0].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_9 = mux(_io_master_write_response_channel_BRESP_T_1, io.slaves[1].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_10 = mux(_io_master_write_response_channel_BRESP_T_2, io.slaves[2].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_11 = mux(_io_master_write_response_channel_BRESP_T_3, io.slaves[3].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_12 = mux(_io_master_write_response_channel_BRESP_T_4, io.slaves[4].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_13 = mux(_io_master_write_response_channel_BRESP_T_5, io.slaves[5].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_14 = mux(_io_master_write_response_channel_BRESP_T_6, io.slaves[6].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_15 = mux(_io_master_write_response_channel_BRESP_T_7, io.slaves[7].write_response_channel.BRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_16 = or(_io_master_write_response_channel_BRESP_T_8, _io_master_write_response_channel_BRESP_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_17 = or(_io_master_write_response_channel_BRESP_T_16, _io_master_write_response_channel_BRESP_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_18 = or(_io_master_write_response_channel_BRESP_T_17, _io_master_write_response_channel_BRESP_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_19 = or(_io_master_write_response_channel_BRESP_T_18, _io_master_write_response_channel_BRESP_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_20 = or(_io_master_write_response_channel_BRESP_T_19, _io_master_write_response_channel_BRESP_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_21 = or(_io_master_write_response_channel_BRESP_T_20, _io_master_write_response_channel_BRESP_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_write_response_channel_BRESP_T_22 = or(_io_master_write_response_channel_BRESP_T_21, _io_master_write_response_channel_BRESP_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_write_response_channel_BRESP_WIRE : UInt<2> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_write_response_channel_BRESP_WIRE <= _io_master_write_response_channel_BRESP_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.write_response_channel.BRESP <= _io_master_write_response_channel_BRESP_WIRE @[src/main/scala/bus/BusSwitch.scala 46:43]
    node _io_master_read_address_channel_ARREADY_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_address_channel_ARREADY_T_8 = mux(_io_master_read_address_channel_ARREADY_T, io.slaves[0].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_9 = mux(_io_master_read_address_channel_ARREADY_T_1, io.slaves[1].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_10 = mux(_io_master_read_address_channel_ARREADY_T_2, io.slaves[2].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_11 = mux(_io_master_read_address_channel_ARREADY_T_3, io.slaves[3].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_12 = mux(_io_master_read_address_channel_ARREADY_T_4, io.slaves[4].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_13 = mux(_io_master_read_address_channel_ARREADY_T_5, io.slaves[5].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_14 = mux(_io_master_read_address_channel_ARREADY_T_6, io.slaves[6].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_15 = mux(_io_master_read_address_channel_ARREADY_T_7, io.slaves[7].read_address_channel.ARREADY, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_16 = or(_io_master_read_address_channel_ARREADY_T_8, _io_master_read_address_channel_ARREADY_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_17 = or(_io_master_read_address_channel_ARREADY_T_16, _io_master_read_address_channel_ARREADY_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_18 = or(_io_master_read_address_channel_ARREADY_T_17, _io_master_read_address_channel_ARREADY_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_19 = or(_io_master_read_address_channel_ARREADY_T_18, _io_master_read_address_channel_ARREADY_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_20 = or(_io_master_read_address_channel_ARREADY_T_19, _io_master_read_address_channel_ARREADY_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_21 = or(_io_master_read_address_channel_ARREADY_T_20, _io_master_read_address_channel_ARREADY_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_address_channel_ARREADY_T_22 = or(_io_master_read_address_channel_ARREADY_T_21, _io_master_read_address_channel_ARREADY_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_read_address_channel_ARREADY_WIRE : UInt<1> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_read_address_channel_ARREADY_WIRE <= _io_master_read_address_channel_ARREADY_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.read_address_channel.ARREADY <= _io_master_read_address_channel_ARREADY_WIRE @[src/main/scala/bus/BusSwitch.scala 48:42]
    node _io_master_read_data_channel_RVALID_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RVALID_T_8 = mux(_io_master_read_data_channel_RVALID_T, io.slaves[0].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_9 = mux(_io_master_read_data_channel_RVALID_T_1, io.slaves[1].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_10 = mux(_io_master_read_data_channel_RVALID_T_2, io.slaves[2].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_11 = mux(_io_master_read_data_channel_RVALID_T_3, io.slaves[3].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_12 = mux(_io_master_read_data_channel_RVALID_T_4, io.slaves[4].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_13 = mux(_io_master_read_data_channel_RVALID_T_5, io.slaves[5].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_14 = mux(_io_master_read_data_channel_RVALID_T_6, io.slaves[6].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_15 = mux(_io_master_read_data_channel_RVALID_T_7, io.slaves[7].read_data_channel.RVALID, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_16 = or(_io_master_read_data_channel_RVALID_T_8, _io_master_read_data_channel_RVALID_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_17 = or(_io_master_read_data_channel_RVALID_T_16, _io_master_read_data_channel_RVALID_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_18 = or(_io_master_read_data_channel_RVALID_T_17, _io_master_read_data_channel_RVALID_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_19 = or(_io_master_read_data_channel_RVALID_T_18, _io_master_read_data_channel_RVALID_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_20 = or(_io_master_read_data_channel_RVALID_T_19, _io_master_read_data_channel_RVALID_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_21 = or(_io_master_read_data_channel_RVALID_T_20, _io_master_read_data_channel_RVALID_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RVALID_T_22 = or(_io_master_read_data_channel_RVALID_T_21, _io_master_read_data_channel_RVALID_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_read_data_channel_RVALID_WIRE : UInt<1> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_read_data_channel_RVALID_WIRE <= _io_master_read_data_channel_RVALID_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.read_data_channel.RVALID <= _io_master_read_data_channel_RVALID_WIRE @[src/main/scala/bus/BusSwitch.scala 49:42]
    node _io_master_read_data_channel_RDATA_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RDATA_T_8 = mux(_io_master_read_data_channel_RDATA_T, io.slaves[0].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_9 = mux(_io_master_read_data_channel_RDATA_T_1, io.slaves[1].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_10 = mux(_io_master_read_data_channel_RDATA_T_2, io.slaves[2].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_11 = mux(_io_master_read_data_channel_RDATA_T_3, io.slaves[3].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_12 = mux(_io_master_read_data_channel_RDATA_T_4, io.slaves[4].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_13 = mux(_io_master_read_data_channel_RDATA_T_5, io.slaves[5].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_14 = mux(_io_master_read_data_channel_RDATA_T_6, io.slaves[6].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_15 = mux(_io_master_read_data_channel_RDATA_T_7, io.slaves[7].read_data_channel.RDATA, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_16 = or(_io_master_read_data_channel_RDATA_T_8, _io_master_read_data_channel_RDATA_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_17 = or(_io_master_read_data_channel_RDATA_T_16, _io_master_read_data_channel_RDATA_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_18 = or(_io_master_read_data_channel_RDATA_T_17, _io_master_read_data_channel_RDATA_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_19 = or(_io_master_read_data_channel_RDATA_T_18, _io_master_read_data_channel_RDATA_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_20 = or(_io_master_read_data_channel_RDATA_T_19, _io_master_read_data_channel_RDATA_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_21 = or(_io_master_read_data_channel_RDATA_T_20, _io_master_read_data_channel_RDATA_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RDATA_T_22 = or(_io_master_read_data_channel_RDATA_T_21, _io_master_read_data_channel_RDATA_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_read_data_channel_RDATA_WIRE : UInt<32> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_read_data_channel_RDATA_WIRE <= _io_master_read_data_channel_RDATA_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.read_data_channel.RDATA <= _io_master_read_data_channel_RDATA_WIRE @[src/main/scala/bus/BusSwitch.scala 50:42]
    node _io_master_read_data_channel_RRESP_T = bits(sel, 0, 0) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_1 = bits(sel, 1, 1) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_2 = bits(sel, 2, 2) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_3 = bits(sel, 3, 3) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_4 = bits(sel, 4, 4) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_5 = bits(sel, 5, 5) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_6 = bits(sel, 6, 6) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_7 = bits(sel, 7, 7) @[src/main/scala/chisel3/util/Mux.scala 32:36]
    node _io_master_read_data_channel_RRESP_T_8 = mux(_io_master_read_data_channel_RRESP_T, io.slaves[0].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_9 = mux(_io_master_read_data_channel_RRESP_T_1, io.slaves[1].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_10 = mux(_io_master_read_data_channel_RRESP_T_2, io.slaves[2].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_11 = mux(_io_master_read_data_channel_RRESP_T_3, io.slaves[3].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_12 = mux(_io_master_read_data_channel_RRESP_T_4, io.slaves[4].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_13 = mux(_io_master_read_data_channel_RRESP_T_5, io.slaves[5].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_14 = mux(_io_master_read_data_channel_RRESP_T_6, io.slaves[6].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_15 = mux(_io_master_read_data_channel_RRESP_T_7, io.slaves[7].read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_16 = or(_io_master_read_data_channel_RRESP_T_8, _io_master_read_data_channel_RRESP_T_9) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_17 = or(_io_master_read_data_channel_RRESP_T_16, _io_master_read_data_channel_RRESP_T_10) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_18 = or(_io_master_read_data_channel_RRESP_T_17, _io_master_read_data_channel_RRESP_T_11) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_19 = or(_io_master_read_data_channel_RRESP_T_18, _io_master_read_data_channel_RRESP_T_12) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_20 = or(_io_master_read_data_channel_RRESP_T_19, _io_master_read_data_channel_RRESP_T_13) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_21 = or(_io_master_read_data_channel_RRESP_T_20, _io_master_read_data_channel_RRESP_T_14) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    node _io_master_read_data_channel_RRESP_T_22 = or(_io_master_read_data_channel_RRESP_T_21, _io_master_read_data_channel_RRESP_T_15) @[src/main/scala/chisel3/util/Mux.scala 30:73]
    wire _io_master_read_data_channel_RRESP_WIRE : UInt<2> @[src/main/scala/chisel3/util/Mux.scala 30:73]
    _io_master_read_data_channel_RRESP_WIRE <= _io_master_read_data_channel_RRESP_T_22 @[src/main/scala/chisel3/util/Mux.scala 30:73]
    io.master.read_data_channel.RRESP <= _io_master_read_data_channel_RRESP_WIRE @[src/main/scala/bus/BusSwitch.scala 51:42]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip signal_interrupt : UInt<1>, instruction_address : UInt<32>, flip instruction : UInt<32>, flip instruction_valid : UInt<1>, mem_slave : { address : UInt<32>, read : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4]}, flip vga_pixclk : Clock, vga_hsync : UInt<1>, vga_vsync : UInt<1>, vga_rrggbb : UInt<6>, vga_activevideo : UInt<1>, vga_x_pos : UInt<10>, vga_y_pos : UInt<10>, uart_txd : UInt<1>, flip uart_rxd : UInt<1>, uart_interrupt : UInt<1>, flip mouse_x : UInt<16>, flip mouse_y : UInt<16>, flip mouse_left_button : UInt<1>, flip mouse_right_button : UInt<1>, flip mouse_middle_button : UInt<1>, flip cpu_debug_read_address : UInt<5>, cpu_debug_read_data : UInt<32>, flip cpu_csr_debug_read_address : UInt<12>, cpu_csr_debug_read_data : UInt<32>} @[src/main/scala/board/verilator/Top.scala 22:14]

    inst mem_slave of AXI4LiteSlave @[src/main/scala/board/verilator/Top.scala 60:25]
    mem_slave.clock <= clock
    mem_slave.reset <= reset
    io.mem_slave.write_strobe <= mem_slave.io.bundle.write_strobe @[src/main/scala/board/verilator/Top.scala 61:16]
    io.mem_slave.write_data <= mem_slave.io.bundle.write_data @[src/main/scala/board/verilator/Top.scala 61:16]
    io.mem_slave.write <= mem_slave.io.bundle.write @[src/main/scala/board/verilator/Top.scala 61:16]
    mem_slave.io.bundle.read_valid <= io.mem_slave.read_valid @[src/main/scala/board/verilator/Top.scala 61:16]
    mem_slave.io.bundle.read_data <= io.mem_slave.read_data @[src/main/scala/board/verilator/Top.scala 61:16]
    io.mem_slave.read <= mem_slave.io.bundle.read @[src/main/scala/board/verilator/Top.scala 61:16]
    io.mem_slave.address <= mem_slave.io.bundle.address @[src/main/scala/board/verilator/Top.scala 61:16]
    inst vga of VGA @[src/main/scala/board/verilator/Top.scala 64:19]
    vga.clock <= clock
    vga.reset <= reset
    inst uart of Uart @[src/main/scala/board/verilator/Top.scala 67:20]
    uart.clock <= clock
    uart.reset <= reset
    inst mouse of Mouse @[src/main/scala/board/verilator/Top.scala 70:21]
    mouse.clock <= clock
    mouse.reset <= reset
    inst timer of Timer @[src/main/scala/board/verilator/Top.scala 73:21]
    timer.clock <= clock
    timer.reset <= reset
    inst cpu of CPU @[src/main/scala/board/verilator/Top.scala 75:27]
    cpu.clock <= clock
    cpu.reset <= reset
    inst dummy of DummySlave @[src/main/scala/board/verilator/Top.scala 76:27]
    dummy.clock <= clock
    dummy.reset <= reset
    inst bus_arbiter of BusArbiter @[src/main/scala/board/verilator/Top.scala 77:27]
    bus_arbiter.clock <= clock
    bus_arbiter.reset <= reset
    inst bus_switch of BusSwitch @[src/main/scala/board/verilator/Top.scala 78:27]
    bus_switch.clock <= clock
    bus_switch.reset <= reset
    io.instruction_address <= cpu.io.instruction_address @[src/main/scala/board/verilator/Top.scala 81:28]
    cpu.io.instruction <= io.instruction @[src/main/scala/board/verilator/Top.scala 82:28]
    cpu.io.instruction_valid <= io.instruction_valid @[src/main/scala/board/verilator/Top.scala 83:28]
    cpu.io.memory_bundle.read_data <= UInt<1>("h0") @[src/main/scala/board/verilator/Top.scala 89:44]
    cpu.io.memory_bundle.read_valid <= UInt<1>("h0") @[src/main/scala/board/verilator/Top.scala 90:44]
    cpu.io.memory_bundle.write_valid <= UInt<1>("h0") @[src/main/scala/board/verilator/Top.scala 91:44]
    cpu.io.memory_bundle.write_data_accepted <= UInt<1>("h0") @[src/main/scala/board/verilator/Top.scala 92:44]
    cpu.io.memory_bundle.busy <= UInt<1>("h0") @[src/main/scala/board/verilator/Top.scala 93:44]
    cpu.io.memory_bundle.granted <= UInt<1>("h0") @[src/main/scala/board/verilator/Top.scala 94:44]
    bus_arbiter.io.bus_request[0] <= UInt<1>("h1") @[src/main/scala/board/verilator/Top.scala 97:33]
    bus_switch.io.master <= cpu.io.axi4_channels @[src/main/scala/board/verilator/Top.scala 100:24]
    bus_switch.io.address <= cpu.io.bus_address @[src/main/scala/board/verilator/Top.scala 101:25]
    mem_slave.io.channels <= bus_switch.io.slaves[0] @[src/main/scala/board/verilator/Top.scala 102:27]
    vga.io.channels <= bus_switch.io.slaves[1] @[src/main/scala/board/verilator/Top.scala 103:27]
    uart.io.channels <= bus_switch.io.slaves[2] @[src/main/scala/board/verilator/Top.scala 104:27]
    mouse.io.channels <= bus_switch.io.slaves[3] @[src/main/scala/board/verilator/Top.scala 105:27]
    timer.io.channels <= bus_switch.io.slaves[4] @[src/main/scala/board/verilator/Top.scala 106:27]
    dummy.io.channels <= bus_switch.io.slaves[5] @[src/main/scala/board/verilator/Top.scala 108:29]
    dummy.io.channels <= bus_switch.io.slaves[6] @[src/main/scala/board/verilator/Top.scala 108:29]
    dummy.io.channels <= bus_switch.io.slaves[7] @[src/main/scala/board/verilator/Top.scala 108:29]
    vga.io.pixClock <= io.vga_pixclk @[src/main/scala/board/verilator/Top.scala 112:22]
    io.vga_hsync <= vga.io.hsync @[src/main/scala/board/verilator/Top.scala 113:22]
    io.vga_vsync <= vga.io.vsync @[src/main/scala/board/verilator/Top.scala 114:22]
    io.vga_rrggbb <= vga.io.rrggbb @[src/main/scala/board/verilator/Top.scala 115:22]
    io.vga_activevideo <= vga.io.activevideo @[src/main/scala/board/verilator/Top.scala 116:22]
    io.vga_x_pos <= vga.io.x_pos @[src/main/scala/board/verilator/Top.scala 117:22]
    io.vga_y_pos <= vga.io.y_pos @[src/main/scala/board/verilator/Top.scala 118:22]
    node _vga_io_cursor_x_T = bits(io.mouse_x, 9, 0) @[src/main/scala/board/verilator/Top.scala 119:32]
    vga.io.cursor_x <= _vga_io_cursor_x_T @[src/main/scala/board/verilator/Top.scala 119:19]
    node _vga_io_cursor_y_T = bits(io.mouse_y, 9, 0) @[src/main/scala/board/verilator/Top.scala 120:32]
    vga.io.cursor_y <= _vga_io_cursor_y_T @[src/main/scala/board/verilator/Top.scala 120:19]
    io.uart_txd <= uart.io.txd @[src/main/scala/board/verilator/Top.scala 123:21]
    uart.io.rxd <= io.uart_rxd @[src/main/scala/board/verilator/Top.scala 124:21]
    io.uart_interrupt <= uart.io.signal_interrupt @[src/main/scala/board/verilator/Top.scala 125:21]
    mouse.io.x <= io.mouse_x @[src/main/scala/board/verilator/Top.scala 128:25]
    mouse.io.y <= io.mouse_y @[src/main/scala/board/verilator/Top.scala 129:25]
    mouse.io.leftButton <= io.mouse_left_button @[src/main/scala/board/verilator/Top.scala 130:25]
    mouse.io.rightButton <= io.mouse_right_button @[src/main/scala/board/verilator/Top.scala 131:25]
    mouse.io.middleButton <= io.mouse_middle_button @[src/main/scala/board/verilator/Top.scala 132:25]
    node _cpu_io_interrupt_flag_T = or(io.signal_interrupt, uart.io.signal_interrupt) @[src/main/scala/board/verilator/Top.scala 135:48]
    node _cpu_io_interrupt_flag_T_1 = or(_cpu_io_interrupt_flag_T, timer.io.signal_interrupt) @[src/main/scala/board/verilator/Top.scala 135:76]
    cpu.io.interrupt_flag <= _cpu_io_interrupt_flag_T_1 @[src/main/scala/board/verilator/Top.scala 135:25]
    cpu.io.debug_read_address <= io.cpu_debug_read_address @[src/main/scala/board/verilator/Top.scala 138:33]
    io.cpu_debug_read_data <= cpu.io.debug_read_data @[src/main/scala/board/verilator/Top.scala 139:33]
    cpu.io.csr_debug_read_address <= io.cpu_csr_debug_read_address @[src/main/scala/board/verilator/Top.scala 140:33]
    io.cpu_csr_debug_read_data <= cpu.io.csr_debug_read_data @[src/main/scala/board/verilator/Top.scala 141:33]

