module AXI4LiteSlave(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output [31:0] io_bundle_address, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_read, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [31:0] io_bundle_read_data, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_bundle_read_valid, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_write, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output [31:0] io_bundle_write_data, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_write_strobe_0, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_write_strobe_1, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_write_strobe_2, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_write_strobe_3 // @[src/main/scala/bus/AXI4Lite.scala 111:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/bus/AXI4Lite.scala 116:22]
  reg [31:0] addr; // @[src/main/scala/bus/AXI4Lite.scala 118:21]
  reg  read; // @[src/main/scala/bus/AXI4Lite.scala 122:21]
  reg [31:0] read_data; // @[src/main/scala/bus/AXI4Lite.scala 124:26]
  reg  ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 127:24]
  reg  RVALID; // @[src/main/scala/bus/AXI4Lite.scala 129:23]
  reg  write; // @[src/main/scala/bus/AXI4Lite.scala 135:22]
  reg [31:0] write_data; // @[src/main/scala/bus/AXI4Lite.scala 137:27]
  reg  write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
  reg  write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
  reg  write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
  reg  write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
  reg  AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 142:24]
  reg  WREADY; // @[src/main/scala/bus/AXI4Lite.scala 144:23]
  reg  BVALID; // @[src/main/scala/bus/AXI4Lite.scala 146:23]
  wire  _GEN_1 = io_channels_write_address_channel_AWVALID | AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 160:61 163:17 142:24]
  wire  _GEN_3 = io_channels_read_address_channel_ARVALID | ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 156:54 159:17 127:24]
  wire  _GEN_7 = io_channels_read_address_channel_ARVALID & ARREADY | read; // @[src/main/scala/bus/AXI4Lite.scala 168:65 172:17 122:21]
  wire [31:0] _GEN_9 = io_bundle_read_valid ? io_bundle_read_data : read_data; // @[src/main/scala/bus/AXI4Lite.scala 178:34 180:19 124:26]
  wire  _GEN_10 = io_bundle_read_valid | RVALID; // @[src/main/scala/bus/AXI4Lite.scala 178:34 181:19 129:23]
  wire  _GEN_12 = io_bundle_read_valid ? 1'h0 : read; // @[src/main/scala/bus/AXI4Lite.scala 178:34 183:19 122:21]
  wire  _GEN_13 = RVALID & io_channels_read_data_channel_RREADY ? 1'h0 : _GEN_10; // @[src/main/scala/bus/AXI4Lite.scala 186:60 188:16]
  wire [2:0] _GEN_14 = RVALID & io_channels_read_data_channel_RREADY ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 186:60 189:16 116:22]
  wire [31:0] _GEN_15 = io_channels_write_address_channel_AWVALID & AWREADY ? io_channels_write_address_channel_AWADDR
     : addr; // @[src/main/scala/bus/AXI4Lite.scala 194:66 196:17 118:21]
  wire  _GEN_16 = io_channels_write_address_channel_AWVALID & AWREADY ? 1'h0 : AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 194:66 197:17 142:24]
  wire  _GEN_17 = io_channels_write_address_channel_AWVALID & AWREADY | WREADY; // @[src/main/scala/bus/AXI4Lite.scala 194:66 198:17 144:23]
  wire [2:0] _GEN_18 = io_channels_write_address_channel_AWVALID & AWREADY ? 3'h4 : state; // @[src/main/scala/bus/AXI4Lite.scala 194:66 199:17 116:22]
  wire [31:0] _GEN_19 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WDATA :
    write_data; // @[src/main/scala/bus/AXI4Lite.scala 204:61 206:22 137:27]
  wire  _GEN_20 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[0] :
    write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 204:61 207:22 139:29]
  wire  _GEN_21 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[1] :
    write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 204:61 207:22 139:29]
  wire  _GEN_22 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[2] :
    write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 204:61 207:22 139:29]
  wire  _GEN_23 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[3] :
    write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 204:61 207:22 139:29]
  wire  _GEN_24 = io_channels_write_data_channel_WVALID & WREADY ? 1'h0 : WREADY; // @[src/main/scala/bus/AXI4Lite.scala 204:61 208:22 144:23]
  wire  _GEN_25 = io_channels_write_data_channel_WVALID & WREADY | write; // @[src/main/scala/bus/AXI4Lite.scala 135:22 204:61 209:22]
  wire [2:0] _GEN_26 = io_channels_write_data_channel_WVALID & WREADY ? 3'h5 : state; // @[src/main/scala/bus/AXI4Lite.scala 116:22 204:61 210:22]
  wire  _GEN_27 = BVALID & io_channels_write_response_channel_BREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 216:14 219:65 221:16]
  wire [2:0] _GEN_28 = BVALID & io_channels_write_response_channel_BREADY ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 219:65 222:16 116:22]
  wire  _GEN_29 = 3'h5 == state ? 1'h0 : write; // @[src/main/scala/bus/AXI4Lite.scala 151:17 215:14 135:22]
  wire  _GEN_30 = 3'h5 == state ? _GEN_27 : BVALID; // @[src/main/scala/bus/AXI4Lite.scala 151:17 146:23]
  wire [2:0] _GEN_32 = 3'h5 == state ? _GEN_28 : state; // @[src/main/scala/bus/AXI4Lite.scala 151:17 116:22]
  wire [31:0] _GEN_33 = 3'h4 == state ? _GEN_19 : write_data; // @[src/main/scala/bus/AXI4Lite.scala 151:17 137:27]
  wire  _GEN_34 = 3'h4 == state ? _GEN_20 : write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_35 = 3'h4 == state ? _GEN_21 : write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_36 = 3'h4 == state ? _GEN_22 : write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_37 = 3'h4 == state ? _GEN_23 : write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_38 = 3'h4 == state ? _GEN_24 : WREADY; // @[src/main/scala/bus/AXI4Lite.scala 151:17 144:23]
  wire  _GEN_39 = 3'h4 == state ? _GEN_25 : _GEN_29; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire [2:0] _GEN_40 = 3'h4 == state ? _GEN_26 : _GEN_32; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire  _GEN_41 = 3'h4 == state ? BVALID : _GEN_30; // @[src/main/scala/bus/AXI4Lite.scala 151:17 146:23]
  wire [31:0] _GEN_43 = 3'h3 == state ? _GEN_15 : addr; // @[src/main/scala/bus/AXI4Lite.scala 151:17 118:21]
  wire  _GEN_44 = 3'h3 == state ? _GEN_16 : AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 151:17 142:24]
  wire  _GEN_45 = 3'h3 == state ? _GEN_17 : _GEN_38; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire [2:0] _GEN_46 = 3'h3 == state ? _GEN_18 : _GEN_40; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire [31:0] _GEN_47 = 3'h3 == state ? write_data : _GEN_33; // @[src/main/scala/bus/AXI4Lite.scala 151:17 137:27]
  wire  _GEN_48 = 3'h3 == state ? write_strobe_0 : _GEN_34; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_49 = 3'h3 == state ? write_strobe_1 : _GEN_35; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_50 = 3'h3 == state ? write_strobe_2 : _GEN_36; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_51 = 3'h3 == state ? write_strobe_3 : _GEN_37; // @[src/main/scala/bus/AXI4Lite.scala 151:17 139:29]
  wire  _GEN_52 = 3'h3 == state ? write : _GEN_39; // @[src/main/scala/bus/AXI4Lite.scala 151:17 135:22]
  wire  _GEN_53 = 3'h3 == state ? BVALID : _GEN_41; // @[src/main/scala/bus/AXI4Lite.scala 151:17 146:23]
  assign io_channels_write_address_channel_AWREADY = AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 143:45]
  assign io_channels_write_data_channel_WREADY = WREADY; // @[src/main/scala/bus/AXI4Lite.scala 145:41]
  assign io_channels_write_response_channel_BVALID = BVALID; // @[src/main/scala/bus/AXI4Lite.scala 147:45]
  assign io_channels_read_address_channel_ARREADY = ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 128:44]
  assign io_channels_read_data_channel_RVALID = RVALID; // @[src/main/scala/bus/AXI4Lite.scala 130:40]
  assign io_channels_read_data_channel_RDATA = read_data; // @[src/main/scala/bus/AXI4Lite.scala 125:39]
  assign io_bundle_address = addr; // @[src/main/scala/bus/AXI4Lite.scala 119:21]
  assign io_bundle_read = read; // @[src/main/scala/bus/AXI4Lite.scala 123:18]
  assign io_bundle_write = write; // @[src/main/scala/bus/AXI4Lite.scala 136:19]
  assign io_bundle_write_data = write_data; // @[src/main/scala/bus/AXI4Lite.scala 138:24]
  assign io_bundle_write_strobe_0 = write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 140:26]
  assign io_bundle_write_strobe_1 = write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 140:26]
  assign io_bundle_write_strobe_2 = write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 140:26]
  assign io_bundle_write_strobe_3 = write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 140:26]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 116:22]
      state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 116:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (io_channels_read_address_channel_ARVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= 3'h1; // @[src/main/scala/bus/AXI4Lite.scala 158:17]
      end else if (io_channels_write_address_channel_AWVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 160:61]
        state <= 3'h3; // @[src/main/scala/bus/AXI4Lite.scala 162:17]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 168:65]
        state <= 3'h2; // @[src/main/scala/bus/AXI4Lite.scala 173:17]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      state <= _GEN_14;
    end else begin
      state <= _GEN_46;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 118:21]
      addr <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 118:21]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/AXI4Lite.scala 170:17]
        end
      end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        addr <= _GEN_43;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 122:21]
      read <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 122:21]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 153:13]
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= _GEN_7;
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= _GEN_12;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 124:26]
      read_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 124:26]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          read_data <= _GEN_9;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 127:24]
      ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 127:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      ARREADY <= _GEN_3;
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 168:65]
        ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 171:17]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 129:23]
      RVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 129:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          RVALID <= _GEN_13;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 135:22]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 135:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 154:13]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        write <= _GEN_52;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 137:27]
      write_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 137:27]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          write_data <= _GEN_47;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 139:29]
      write_strobe_0 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          write_strobe_0 <= _GEN_48;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 139:29]
      write_strobe_1 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          write_strobe_1 <= _GEN_49;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 139:29]
      write_strobe_2 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          write_strobe_2 <= _GEN_50;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 139:29]
      write_strobe_3 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 139:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          write_strobe_3 <= _GEN_51;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 142:24]
      AWREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 142:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(io_channels_read_address_channel_ARVALID)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:54]
        AWREADY <= _GEN_1;
      end
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        AWREADY <= _GEN_44;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 144:23]
      WREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 144:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          WREADY <= _GEN_45;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 146:23]
      BVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 146:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          BVALID <= _GEN_53;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  read = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  read_data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  ARREADY = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  RVALID = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  write = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  write_data = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  write_strobe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  write_strobe_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  write_strobe_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  write_strobe_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  AWREADY = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  WREADY = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  BVALID = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4LiteSlave_1(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [7:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [7:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output [7:0]  io_bundle_address, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_read, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input  [31:0] io_bundle_read_data, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  input         io_bundle_read_valid, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output        io_bundle_write, // @[src/main/scala/bus/AXI4Lite.scala 111:14]
  output [31:0] io_bundle_write_data // @[src/main/scala/bus/AXI4Lite.scala 111:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/bus/AXI4Lite.scala 116:22]
  reg [7:0] addr; // @[src/main/scala/bus/AXI4Lite.scala 118:21]
  reg  read; // @[src/main/scala/bus/AXI4Lite.scala 122:21]
  reg [31:0] read_data; // @[src/main/scala/bus/AXI4Lite.scala 124:26]
  reg  ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 127:24]
  reg  RVALID; // @[src/main/scala/bus/AXI4Lite.scala 129:23]
  reg  write; // @[src/main/scala/bus/AXI4Lite.scala 135:22]
  reg [31:0] write_data; // @[src/main/scala/bus/AXI4Lite.scala 137:27]
  reg  AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 142:24]
  reg  WREADY; // @[src/main/scala/bus/AXI4Lite.scala 144:23]
  reg  BVALID; // @[src/main/scala/bus/AXI4Lite.scala 146:23]
  wire  _GEN_1 = io_channels_write_address_channel_AWVALID | AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 160:61 163:17 142:24]
  wire  _GEN_3 = io_channels_read_address_channel_ARVALID | ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 156:54 159:17 127:24]
  wire  _GEN_7 = io_channels_read_address_channel_ARVALID & ARREADY | read; // @[src/main/scala/bus/AXI4Lite.scala 168:65 172:17 122:21]
  wire [31:0] _GEN_9 = io_bundle_read_valid ? io_bundle_read_data : read_data; // @[src/main/scala/bus/AXI4Lite.scala 178:34 180:19 124:26]
  wire  _GEN_10 = io_bundle_read_valid | RVALID; // @[src/main/scala/bus/AXI4Lite.scala 178:34 181:19 129:23]
  wire  _GEN_12 = io_bundle_read_valid ? 1'h0 : read; // @[src/main/scala/bus/AXI4Lite.scala 178:34 183:19 122:21]
  wire  _GEN_13 = RVALID & io_channels_read_data_channel_RREADY ? 1'h0 : _GEN_10; // @[src/main/scala/bus/AXI4Lite.scala 186:60 188:16]
  wire [2:0] _GEN_14 = RVALID & io_channels_read_data_channel_RREADY ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 186:60 189:16 116:22]
  wire [7:0] _GEN_15 = io_channels_write_address_channel_AWVALID & AWREADY ? io_channels_write_address_channel_AWADDR :
    addr; // @[src/main/scala/bus/AXI4Lite.scala 194:66 196:17 118:21]
  wire  _GEN_16 = io_channels_write_address_channel_AWVALID & AWREADY ? 1'h0 : AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 194:66 197:17 142:24]
  wire  _GEN_17 = io_channels_write_address_channel_AWVALID & AWREADY | WREADY; // @[src/main/scala/bus/AXI4Lite.scala 194:66 198:17 144:23]
  wire [2:0] _GEN_18 = io_channels_write_address_channel_AWVALID & AWREADY ? 3'h4 : state; // @[src/main/scala/bus/AXI4Lite.scala 194:66 199:17 116:22]
  wire [31:0] _GEN_19 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WDATA :
    write_data; // @[src/main/scala/bus/AXI4Lite.scala 204:61 206:22 137:27]
  wire  _GEN_24 = io_channels_write_data_channel_WVALID & WREADY ? 1'h0 : WREADY; // @[src/main/scala/bus/AXI4Lite.scala 204:61 208:22 144:23]
  wire  _GEN_25 = io_channels_write_data_channel_WVALID & WREADY | write; // @[src/main/scala/bus/AXI4Lite.scala 135:22 204:61 209:22]
  wire [2:0] _GEN_26 = io_channels_write_data_channel_WVALID & WREADY ? 3'h5 : state; // @[src/main/scala/bus/AXI4Lite.scala 116:22 204:61 210:22]
  wire  _GEN_27 = BVALID & io_channels_write_response_channel_BREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 216:14 219:65 221:16]
  wire [2:0] _GEN_28 = BVALID & io_channels_write_response_channel_BREADY ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 219:65 222:16 116:22]
  wire  _GEN_29 = 3'h5 == state ? 1'h0 : write; // @[src/main/scala/bus/AXI4Lite.scala 151:17 215:14 135:22]
  wire  _GEN_30 = 3'h5 == state ? _GEN_27 : BVALID; // @[src/main/scala/bus/AXI4Lite.scala 151:17 146:23]
  wire [2:0] _GEN_32 = 3'h5 == state ? _GEN_28 : state; // @[src/main/scala/bus/AXI4Lite.scala 151:17 116:22]
  wire [31:0] _GEN_33 = 3'h4 == state ? _GEN_19 : write_data; // @[src/main/scala/bus/AXI4Lite.scala 151:17 137:27]
  wire  _GEN_38 = 3'h4 == state ? _GEN_24 : WREADY; // @[src/main/scala/bus/AXI4Lite.scala 151:17 144:23]
  wire  _GEN_39 = 3'h4 == state ? _GEN_25 : _GEN_29; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire [2:0] _GEN_40 = 3'h4 == state ? _GEN_26 : _GEN_32; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire  _GEN_41 = 3'h4 == state ? BVALID : _GEN_30; // @[src/main/scala/bus/AXI4Lite.scala 151:17 146:23]
  wire [7:0] _GEN_43 = 3'h3 == state ? _GEN_15 : addr; // @[src/main/scala/bus/AXI4Lite.scala 151:17 118:21]
  wire  _GEN_44 = 3'h3 == state ? _GEN_16 : AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 151:17 142:24]
  wire  _GEN_45 = 3'h3 == state ? _GEN_17 : _GEN_38; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire [2:0] _GEN_46 = 3'h3 == state ? _GEN_18 : _GEN_40; // @[src/main/scala/bus/AXI4Lite.scala 151:17]
  wire [31:0] _GEN_47 = 3'h3 == state ? write_data : _GEN_33; // @[src/main/scala/bus/AXI4Lite.scala 151:17 137:27]
  wire  _GEN_52 = 3'h3 == state ? write : _GEN_39; // @[src/main/scala/bus/AXI4Lite.scala 151:17 135:22]
  wire  _GEN_53 = 3'h3 == state ? BVALID : _GEN_41; // @[src/main/scala/bus/AXI4Lite.scala 151:17 146:23]
  assign io_channels_write_address_channel_AWREADY = AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 143:45]
  assign io_channels_write_data_channel_WREADY = WREADY; // @[src/main/scala/bus/AXI4Lite.scala 145:41]
  assign io_channels_write_response_channel_BVALID = BVALID; // @[src/main/scala/bus/AXI4Lite.scala 147:45]
  assign io_channels_read_address_channel_ARREADY = ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 128:44]
  assign io_channels_read_data_channel_RVALID = RVALID; // @[src/main/scala/bus/AXI4Lite.scala 130:40]
  assign io_channels_read_data_channel_RDATA = read_data; // @[src/main/scala/bus/AXI4Lite.scala 125:39]
  assign io_bundle_address = addr; // @[src/main/scala/bus/AXI4Lite.scala 119:21]
  assign io_bundle_read = read; // @[src/main/scala/bus/AXI4Lite.scala 123:18]
  assign io_bundle_write = write; // @[src/main/scala/bus/AXI4Lite.scala 136:19]
  assign io_bundle_write_data = write_data; // @[src/main/scala/bus/AXI4Lite.scala 138:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 116:22]
      state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 116:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (io_channels_read_address_channel_ARVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 156:54]
        state <= 3'h1; // @[src/main/scala/bus/AXI4Lite.scala 158:17]
      end else if (io_channels_write_address_channel_AWVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 160:61]
        state <= 3'h3; // @[src/main/scala/bus/AXI4Lite.scala 162:17]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 168:65]
        state <= 3'h2; // @[src/main/scala/bus/AXI4Lite.scala 173:17]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      state <= _GEN_14;
    end else begin
      state <= _GEN_46;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 118:21]
      addr <= 8'h0; // @[src/main/scala/bus/AXI4Lite.scala 118:21]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 168:65]
          addr <= io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/AXI4Lite.scala 170:17]
        end
      end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        addr <= _GEN_43;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 122:21]
      read <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 122:21]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 153:13]
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= _GEN_7;
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      read <= _GEN_12;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 124:26]
      read_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 124:26]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          read_data <= _GEN_9;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 127:24]
      ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 127:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      ARREADY <= _GEN_3;
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 168:65]
        ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 171:17]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 129:23]
      RVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 129:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          RVALID <= _GEN_13;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 135:22]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 135:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 154:13]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        write <= _GEN_52;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 137:27]
      write_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 137:27]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          write_data <= _GEN_47;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 142:24]
      AWREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 142:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(io_channels_read_address_channel_ARVALID)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:54]
        AWREADY <= _GEN_1;
      end
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        AWREADY <= _GEN_44;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 144:23]
      WREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 144:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          WREADY <= _GEN_45;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 146:23]
      BVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 146:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 151:17]
          BVALID <= _GEN_53;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  read = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  read_data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  ARREADY = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  RVALID = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  write = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  write_data = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  AWREADY = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  WREADY = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  BVALID = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VGA(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input  [7:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input  [7:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input         io_pixClock, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_hsync, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_vsync, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output [5:0]  io_rrggbb, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output        io_activevideo, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output [9:0]  io_x_pos, // @[src/main/scala/peripheral/VGA.scala 29:14]
  output [9:0]  io_y_pos, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input  [9:0]  io_cursor_x, // @[src/main/scala/peripheral/VGA.scala 29:14]
  input  [9:0]  io_cursor_y // @[src/main/scala/peripheral/VGA.scala 29:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
`endif // RANDOMIZE_REG_INIT
  wire  framebuffer_clka; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire  framebuffer_wea; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire [12:0] framebuffer_addra; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire [31:0] framebuffer_dina; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire  framebuffer_clkb; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire [12:0] framebuffer_addrb; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire [31:0] framebuffer_doutb; // @[src/main/scala/peripheral/VGA.scala 91:27]
  wire  slave_clock; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_reset; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [7:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [7:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [7:0] slave_io_bundle_address; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_bundle_read; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_bundle_read_valid; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/VGA.scala 94:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/VGA.scala 94:21]
  reg [31:0] ctrlReg; // @[src/main/scala/peripheral/VGA.scala 101:30]
  reg [31:0] intrStatusReg; // @[src/main/scala/peripheral/VGA.scala 102:30]
  reg [31:0] uploadAddrReg; // @[src/main/scala/peripheral/VGA.scala 103:30]
  reg [5:0] paletteReg_0; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_1; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_2; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_3; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_4; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_5; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_6; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_7; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_8; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_9; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_10; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_11; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_12; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_13; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_14; // @[src/main/scala/peripheral/VGA.scala 104:30]
  reg [5:0] paletteReg_15; // @[src/main/scala/peripheral/VGA.scala 104:30]
  wire [3:0] ctrl_frame_sel = ctrlReg[7:4]; // @[src/main/scala/peripheral/VGA.scala 110:31]
  wire  ctrl_vblank_ie = ctrlReg[8]; // @[src/main/scala/peripheral/VGA.scala 111:31]
  wire [15:0] upload_pix_addr = uploadAddrReg[15:0]; // @[src/main/scala/peripheral/VGA.scala 119:41]
  wire [3:0] upload_frame_raw = uploadAddrReg[19:16]; // @[src/main/scala/peripheral/VGA.scala 120:41]
  wire [3:0] upload_frame = upload_frame_raw >= 4'hc ? 4'hb : upload_frame_raw; // @[src/main/scala/peripheral/VGA.scala 121:31]
  reg  vblank_sync1; // @[src/main/scala/peripheral/VGA.scala 124:36]
  reg  vblank_synced; // @[src/main/scala/peripheral/VGA.scala 125:36]
  reg [3:0] curr_frame_sync1; // @[src/main/scala/peripheral/VGA.scala 126:36]
  reg [3:0] curr_frame_synced; // @[src/main/scala/peripheral/VGA.scala 127:36]
  reg  vblank_prev; // @[src/main/scala/peripheral/VGA.scala 136:37]
  wire  vblank_rising_edge = vblank_synced & ~vblank_prev; // @[src/main/scala/peripheral/VGA.scala 137:44]
  wire [31:0] _GEN_0 = vblank_rising_edge & ctrl_vblank_ie ? 32'h1 : intrStatusReg; // @[src/main/scala/peripheral/VGA.scala 139:48 140:21 102:30]
  wire [7:0] addr = slave_io_bundle_address; // @[src/main/scala/peripheral/VGA.scala 146:52]
  wire  addr_id = addr == 8'h0; // @[src/main/scala/peripheral/VGA.scala 147:33]
  wire  addr_status = addr == 8'h4; // @[src/main/scala/peripheral/VGA.scala 148:33]
  wire  addr_intr_status = addr == 8'h8; // @[src/main/scala/peripheral/VGA.scala 149:33]
  wire  addr_upload_addr = addr == 8'h10; // @[src/main/scala/peripheral/VGA.scala 150:33]
  wire  addr_stream_data = addr == 8'h14; // @[src/main/scala/peripheral/VGA.scala 151:33]
  wire  addr_ctrl = addr == 8'h20; // @[src/main/scala/peripheral/VGA.scala 152:33]
  wire  addr_palette = addr >= 8'h24 & addr < 8'h60; // @[src/main/scala/peripheral/VGA.scala 153:57]
  wire [7:0] _palette_idx_T_1 = addr - 8'h24; // @[src/main/scala/peripheral/VGA.scala 154:34]
  wire [5:0] palette_idx = _palette_idx_T_1[7:2]; // @[src/main/scala/peripheral/VGA.scala 154:56]
  wire [32:0] _read_data_prepared_T = {24'h0,curr_frame_synced,2'h0,1'h0,vblank_synced,vblank_synced}; // @[src/main/scala/peripheral/VGA.scala 177:32]
  wire [5:0] _GEN_2 = 4'h1 == palette_idx[3:0] ? paletteReg_1 : paletteReg_0; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_3 = 4'h2 == palette_idx[3:0] ? paletteReg_2 : _GEN_2; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_4 = 4'h3 == palette_idx[3:0] ? paletteReg_3 : _GEN_3; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_5 = 4'h4 == palette_idx[3:0] ? paletteReg_4 : _GEN_4; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_6 = 4'h5 == palette_idx[3:0] ? paletteReg_5 : _GEN_5; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_7 = 4'h6 == palette_idx[3:0] ? paletteReg_6 : _GEN_6; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_8 = 4'h7 == palette_idx[3:0] ? paletteReg_7 : _GEN_7; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_9 = 4'h8 == palette_idx[3:0] ? paletteReg_8 : _GEN_8; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_10 = 4'h9 == palette_idx[3:0] ? paletteReg_9 : _GEN_9; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_11 = 4'ha == palette_idx[3:0] ? paletteReg_10 : _GEN_10; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_12 = 4'hb == palette_idx[3:0] ? paletteReg_11 : _GEN_11; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_13 = 4'hc == palette_idx[3:0] ? paletteReg_12 : _GEN_12; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_14 = 4'hd == palette_idx[3:0] ? paletteReg_13 : _GEN_13; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_15 = 4'he == palette_idx[3:0] ? paletteReg_14 : _GEN_14; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [5:0] _GEN_16 = 4'hf == palette_idx[3:0] ? paletteReg_15 : _GEN_15; // @[src/main/scala/peripheral/VGA.scala 190:{26,26}]
  wire [31:0] _GEN_17 = addr_palette ? {{26'd0}, _GEN_16} : 32'h0; // @[src/main/scala/peripheral/VGA.scala 189:30 190:26 170:41]
  wire [31:0] _GEN_18 = addr_upload_addr ? uploadAddrReg : _GEN_17; // @[src/main/scala/peripheral/VGA.scala 187:34 188:26]
  wire [31:0] _GEN_19 = addr_intr_status ? intrStatusReg : _GEN_18; // @[src/main/scala/peripheral/VGA.scala 185:34 186:26]
  wire [32:0] _GEN_20 = addr_status ? _read_data_prepared_T : {{1'd0}, _GEN_19}; // @[src/main/scala/peripheral/VGA.scala 176:29 177:26]
  wire [32:0] _GEN_21 = addr_ctrl ? {{1'd0}, ctrlReg} : _GEN_20; // @[src/main/scala/peripheral/VGA.scala 174:27 175:26]
  wire [32:0] _GEN_22 = addr_id ? 33'h56474131 : _GEN_21; // @[src/main/scala/peripheral/VGA.scala 172:19 173:26]
  wire [3:0] requested_frame = slave_io_bundle_write_data[7:4]; // @[src/main/scala/peripheral/VGA.scala 208:57]
  wire  display_enable = slave_io_bundle_write_data[0]; // @[src/main/scala/peripheral/VGA.scala 209:57]
  wire [31:0] _ctrlReg_T_3 = {ctrlReg[31:8],ctrl_frame_sel,3'h0,display_enable}; // @[src/main/scala/peripheral/VGA.scala 213:25]
  wire [31:0] _intrStatusReg_T = ~slave_io_bundle_write_data; // @[src/main/scala/peripheral/VGA.scala 216:42]
  wire [31:0] _intrStatusReg_T_1 = intrStatusReg & _intrStatusReg_T; // @[src/main/scala/peripheral/VGA.scala 216:40]
  wire [12:0] word_offset = upload_pix_addr[15:3]; // @[src/main/scala/peripheral/VGA.scala 221:51]
  wire [13:0] frame_base = upload_frame * 10'h200; // @[src/main/scala/peripheral/VGA.scala 222:46]
  wire [13:0] _GEN_182 = {{1'd0}, word_offset}; // @[src/main/scala/peripheral/VGA.scala 223:44]
  wire [13:0] fb_addr = frame_base + _GEN_182; // @[src/main/scala/peripheral/VGA.scala 223:44]
  wire [15:0] next_addr = upload_pix_addr + 16'h8; // @[src/main/scala/peripheral/VGA.scala 229:44]
  wire [15:0] wrapped_addr = next_addr >= 16'h1000 ? 16'h0 : next_addr; // @[src/main/scala/peripheral/VGA.scala 230:31]
  wire [19:0] _uploadAddrReg_T = {upload_frame,wrapped_addr}; // @[src/main/scala/peripheral/VGA.scala 231:29]
  wire [5:0] _GEN_24 = 4'h0 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_0; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_25 = 4'h1 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_1; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_26 = 4'h2 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_2; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_27 = 4'h3 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_3; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_28 = 4'h4 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_4; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_29 = 4'h5 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_5; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_30 = 4'h6 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_6; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_31 = 4'h7 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_7; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_32 = 4'h8 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_8; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_33 = 4'h9 == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_9; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_34 = 4'ha == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_10; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_35 = 4'hb == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_11; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_36 = 4'hc == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_12; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_37 = 4'hd == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_13; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_38 = 4'he == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_14; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_39 = 4'hf == palette_idx[3:0] ? slave_io_bundle_write_data[5:0] : paletteReg_15; // @[src/main/scala/peripheral/VGA.scala 104:30 233:{33,33}]
  wire [5:0] _GEN_40 = addr_palette ? _GEN_24 : paletteReg_0; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_41 = addr_palette ? _GEN_25 : paletteReg_1; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_42 = addr_palette ? _GEN_26 : paletteReg_2; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_43 = addr_palette ? _GEN_27 : paletteReg_3; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_44 = addr_palette ? _GEN_28 : paletteReg_4; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_45 = addr_palette ? _GEN_29 : paletteReg_5; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_46 = addr_palette ? _GEN_30 : paletteReg_6; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_47 = addr_palette ? _GEN_31 : paletteReg_7; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_48 = addr_palette ? _GEN_32 : paletteReg_8; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_49 = addr_palette ? _GEN_33 : paletteReg_9; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_50 = addr_palette ? _GEN_34 : paletteReg_10; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_51 = addr_palette ? _GEN_35 : paletteReg_11; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_52 = addr_palette ? _GEN_36 : paletteReg_12; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_53 = addr_palette ? _GEN_37 : paletteReg_13; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_54 = addr_palette ? _GEN_38 : paletteReg_14; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [5:0] _GEN_55 = addr_palette ? _GEN_39 : paletteReg_15; // @[src/main/scala/peripheral/VGA.scala 104:30 232:32]
  wire [13:0] _GEN_57 = addr_stream_data ? fb_addr : 14'h0; // @[src/main/scala/peripheral/VGA.scala 219:36 226:23 202:36]
  wire [31:0] _GEN_58 = addr_stream_data ? slave_io_bundle_write_data : 32'h0; // @[src/main/scala/peripheral/VGA.scala 219:36 227:23 203:36]
  wire [31:0] _GEN_59 = addr_stream_data ? {{12'd0}, _uploadAddrReg_T} : uploadAddrReg; // @[src/main/scala/peripheral/VGA.scala 219:36 231:23 103:30]
  wire [5:0] _GEN_60 = addr_stream_data ? paletteReg_0 : _GEN_40; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_61 = addr_stream_data ? paletteReg_1 : _GEN_41; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_62 = addr_stream_data ? paletteReg_2 : _GEN_42; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_63 = addr_stream_data ? paletteReg_3 : _GEN_43; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_64 = addr_stream_data ? paletteReg_4 : _GEN_44; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_65 = addr_stream_data ? paletteReg_5 : _GEN_45; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_66 = addr_stream_data ? paletteReg_6 : _GEN_46; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_67 = addr_stream_data ? paletteReg_7 : _GEN_47; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_68 = addr_stream_data ? paletteReg_8 : _GEN_48; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_69 = addr_stream_data ? paletteReg_9 : _GEN_49; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_70 = addr_stream_data ? paletteReg_10 : _GEN_50; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_71 = addr_stream_data ? paletteReg_11 : _GEN_51; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_72 = addr_stream_data ? paletteReg_12 : _GEN_52; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_73 = addr_stream_data ? paletteReg_13 : _GEN_53; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_74 = addr_stream_data ? paletteReg_14 : _GEN_54; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [5:0] _GEN_75 = addr_stream_data ? paletteReg_15 : _GEN_55; // @[src/main/scala/peripheral/VGA.scala 104:30 219:36]
  wire [31:0] _GEN_76 = addr_upload_addr ? slave_io_bundle_write_data : _GEN_59; // @[src/main/scala/peripheral/VGA.scala 217:36 218:23]
  wire  _GEN_77 = addr_upload_addr ? 1'h0 : addr_stream_data; // @[src/main/scala/peripheral/VGA.scala 201:36 217:36]
  wire [13:0] _GEN_78 = addr_upload_addr ? 14'h0 : _GEN_57; // @[src/main/scala/peripheral/VGA.scala 202:36 217:36]
  wire [31:0] _GEN_79 = addr_upload_addr ? 32'h0 : _GEN_58; // @[src/main/scala/peripheral/VGA.scala 203:36 217:36]
  wire [5:0] _GEN_80 = addr_upload_addr ? paletteReg_0 : _GEN_60; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_81 = addr_upload_addr ? paletteReg_1 : _GEN_61; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_82 = addr_upload_addr ? paletteReg_2 : _GEN_62; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_83 = addr_upload_addr ? paletteReg_3 : _GEN_63; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_84 = addr_upload_addr ? paletteReg_4 : _GEN_64; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_85 = addr_upload_addr ? paletteReg_5 : _GEN_65; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_86 = addr_upload_addr ? paletteReg_6 : _GEN_66; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_87 = addr_upload_addr ? paletteReg_7 : _GEN_67; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_88 = addr_upload_addr ? paletteReg_8 : _GEN_68; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_89 = addr_upload_addr ? paletteReg_9 : _GEN_69; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_90 = addr_upload_addr ? paletteReg_10 : _GEN_70; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_91 = addr_upload_addr ? paletteReg_11 : _GEN_71; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_92 = addr_upload_addr ? paletteReg_12 : _GEN_72; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_93 = addr_upload_addr ? paletteReg_13 : _GEN_73; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_94 = addr_upload_addr ? paletteReg_14 : _GEN_74; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire [5:0] _GEN_95 = addr_upload_addr ? paletteReg_15 : _GEN_75; // @[src/main/scala/peripheral/VGA.scala 104:30 217:36]
  wire  _GEN_98 = addr_intr_status ? 1'h0 : _GEN_77; // @[src/main/scala/peripheral/VGA.scala 201:36 215:36]
  wire [13:0] _GEN_99 = addr_intr_status ? 14'h0 : _GEN_78; // @[src/main/scala/peripheral/VGA.scala 202:36 215:36]
  wire [31:0] _GEN_100 = addr_intr_status ? 32'h0 : _GEN_79; // @[src/main/scala/peripheral/VGA.scala 203:36 215:36]
  wire  _GEN_120 = addr_ctrl ? 1'h0 : _GEN_98; // @[src/main/scala/peripheral/VGA.scala 207:23 201:36]
  wire [13:0] _GEN_121 = addr_ctrl ? 14'h0 : _GEN_99; // @[src/main/scala/peripheral/VGA.scala 207:23 202:36]
  wire [31:0] _GEN_122 = addr_ctrl ? 32'h0 : _GEN_100; // @[src/main/scala/peripheral/VGA.scala 207:23 203:36]
  wire [13:0] _GEN_143 = slave_io_bundle_write ? _GEN_121 : 14'h0; // @[src/main/scala/peripheral/VGA.scala 206:33 202:36]
  reg [9:0] h_count; // @[src/main/scala/peripheral/VGA.scala 244:26]
  reg [9:0] v_count; // @[src/main/scala/peripheral/VGA.scala 245:26]
  wire [9:0] _v_count_T_1 = v_count + 10'h1; // @[src/main/scala/peripheral/VGA.scala 252:28]
  wire [9:0] _h_count_T_1 = h_count + 10'h1; // @[src/main/scala/peripheral/VGA.scala 255:26]
  wire  h_sync_pulse = h_count >= 10'h298 & h_count < 10'h2c0; // @[src/main/scala/peripheral/VGA.scala 258:57]
  wire  v_sync_pulse = v_count >= 10'h1e9 & v_count < 10'h1ec; // @[src/main/scala/peripheral/VGA.scala 259:57]
  reg  hsync_d1; // @[src/main/scala/peripheral/VGA.scala 260:31]
  reg  vsync_d1; // @[src/main/scala/peripheral/VGA.scala 261:31]
  reg  io_hsync_REG; // @[src/main/scala/peripheral/VGA.scala 262:24]
  reg  io_vsync_REG; // @[src/main/scala/peripheral/VGA.scala 263:24]
  reg [9:0] x_px; // @[src/main/scala/peripheral/VGA.scala 268:23]
  reg [9:0] y_px; // @[src/main/scala/peripheral/VGA.scala 269:23]
  wire  _in_display_x_T = x_px >= 10'h80; // @[src/main/scala/peripheral/VGA.scala 271:30]
  wire  in_display_x = x_px >= 10'h80 & x_px < 10'h200; // @[src/main/scala/peripheral/VGA.scala 271:48]
  wire  _in_display_y_T = y_px >= 10'h30; // @[src/main/scala/peripheral/VGA.scala 272:30]
  wire  in_display_y = y_px >= 10'h30 & y_px < 10'h1b0; // @[src/main/scala/peripheral/VGA.scala 272:47]
  wire [9:0] _rel_x_T_2 = x_px - 10'h80; // @[src/main/scala/peripheral/VGA.scala 275:49]
  wire [9:0] rel_x = _in_display_x_T ? _rel_x_T_2 : 10'h0; // @[src/main/scala/peripheral/VGA.scala 275:20]
  wire [9:0] _rel_y_T_2 = y_px - 10'h30; // @[src/main/scala/peripheral/VGA.scala 276:48]
  wire [9:0] rel_y = _in_display_y_T ? _rel_y_T_2 : 10'h0; // @[src/main/scala/peripheral/VGA.scala 276:20]
  wire [23:0] frame_x_mult = rel_x * 14'h2aab; // @[src/main/scala/peripheral/VGA.scala 278:30]
  wire [7:0] frame_x_div = frame_x_mult[23:16]; // @[src/main/scala/peripheral/VGA.scala 279:36]
  wire [23:0] frame_y_mult = rel_y * 14'h2aab; // @[src/main/scala/peripheral/VGA.scala 280:30]
  wire [7:0] frame_y_div = frame_y_mult[23:16]; // @[src/main/scala/peripheral/VGA.scala 281:36]
  wire [5:0] frame_x = frame_x_div >= 8'h40 ? 6'h3f : frame_x_div[5:0]; // @[src/main/scala/peripheral/VGA.scala 282:27]
  wire [5:0] frame_y = frame_y_div >= 8'h40 ? 6'h3f : frame_y_div[5:0]; // @[src/main/scala/peripheral/VGA.scala 283:27]
  reg [3:0] curr_frame_sync1_1; // @[src/main/scala/peripheral/VGA.scala 286:35]
  reg [3:0] curr_frame; // @[src/main/scala/peripheral/VGA.scala 287:35]
  reg  display_enabled_sync1; // @[src/main/scala/peripheral/VGA.scala 289:40]
  reg  display_enabled; // @[src/main/scala/peripheral/VGA.scala 290:40]
  reg  blanking_sync1; // @[src/main/scala/peripheral/VGA.scala 292:33]
  reg  blanking; // @[src/main/scala/peripheral/VGA.scala 293:33]
  reg [5:0] palette_sync1_0; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_1; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_2; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_3; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_4; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_5; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_6; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_7; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_8; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_9; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_10; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_11; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_12; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_13; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_14; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync1_15; // @[src/main/scala/peripheral/VGA.scala 295:32]
  reg [5:0] palette_sync_0; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_1; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_2; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_3; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_4; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_5; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_6; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_7; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_8; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_9; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_10; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_11; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_12; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_13; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_14; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg [5:0] palette_sync_15; // @[src/main/scala/peripheral/VGA.scala 296:32]
  reg  in_display_d1; // @[src/main/scala/peripheral/VGA.scala 301:37]
  reg  h_active_d1; // @[src/main/scala/peripheral/VGA.scala 308:30]
  reg  v_active_d1; // @[src/main/scala/peripheral/VGA.scala 309:30]
  reg  h_active_d2; // @[src/main/scala/peripheral/VGA.scala 310:30]
  reg  v_active_d2; // @[src/main/scala/peripheral/VGA.scala 311:30]
  wire [12:0] _pixel_idx_T = frame_y * 7'h40; // @[src/main/scala/peripheral/VGA.scala 313:33]
  wire [12:0] _GEN_183 = {{7'd0}, frame_x}; // @[src/main/scala/peripheral/VGA.scala 313:49]
  wire [12:0] pixel_idx = _pixel_idx_T + _GEN_183; // @[src/main/scala/peripheral/VGA.scala 313:49]
  wire [9:0] word_offset_1 = pixel_idx[12:3]; // @[src/main/scala/peripheral/VGA.scala 314:35]
  wire [13:0] frame_base_1 = curr_frame * 10'h200; // @[src/main/scala/peripheral/VGA.scala 316:36]
  wire [13:0] _GEN_184 = {{4'd0}, word_offset_1}; // @[src/main/scala/peripheral/VGA.scala 317:36]
  wire [13:0] fb_read_addr = frame_base_1 + _GEN_184; // @[src/main/scala/peripheral/VGA.scala 317:36]
  reg [2:0] pixel_in_word_d1; // @[src/main/scala/peripheral/VGA.scala 322:35]
  wire [3:0] _pixel_4bit_T_9 = 3'h0 == pixel_in_word_d1 ? framebuffer_doutb[3:0] : 4'h0; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] _pixel_4bit_T_11 = 3'h1 == pixel_in_word_d1 ? framebuffer_doutb[7:4] : _pixel_4bit_T_9; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] _pixel_4bit_T_13 = 3'h2 == pixel_in_word_d1 ? framebuffer_doutb[11:8] : _pixel_4bit_T_11; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] _pixel_4bit_T_15 = 3'h3 == pixel_in_word_d1 ? framebuffer_doutb[15:12] : _pixel_4bit_T_13; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] _pixel_4bit_T_17 = 3'h4 == pixel_in_word_d1 ? framebuffer_doutb[19:16] : _pixel_4bit_T_15; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] _pixel_4bit_T_19 = 3'h5 == pixel_in_word_d1 ? framebuffer_doutb[23:20] : _pixel_4bit_T_17; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] _pixel_4bit_T_21 = 3'h6 == pixel_in_word_d1 ? framebuffer_doutb[27:24] : _pixel_4bit_T_19; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [3:0] pixel_4bit = 3'h7 == pixel_in_word_d1 ? framebuffer_doutb[31:28] : _pixel_4bit_T_21; // @[src/main/scala/peripheral/VGA.scala 326:51]
  wire [5:0] _GEN_165 = 4'h1 == pixel_4bit ? palette_sync_1 : palette_sync_0; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_166 = 4'h2 == pixel_4bit ? palette_sync_2 : _GEN_165; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_167 = 4'h3 == pixel_4bit ? palette_sync_3 : _GEN_166; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_168 = 4'h4 == pixel_4bit ? palette_sync_4 : _GEN_167; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_169 = 4'h5 == pixel_4bit ? palette_sync_5 : _GEN_168; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_170 = 4'h6 == pixel_4bit ? palette_sync_6 : _GEN_169; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_171 = 4'h7 == pixel_4bit ? palette_sync_7 : _GEN_170; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_172 = 4'h8 == pixel_4bit ? palette_sync_8 : _GEN_171; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_173 = 4'h9 == pixel_4bit ? palette_sync_9 : _GEN_172; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_174 = 4'ha == pixel_4bit ? palette_sync_10 : _GEN_173; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_175 = 4'hb == pixel_4bit ? palette_sync_11 : _GEN_174; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_176 = 4'hc == pixel_4bit ? palette_sync_12 : _GEN_175; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_177 = 4'hd == pixel_4bit ? palette_sync_13 : _GEN_176; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_178 = 4'he == pixel_4bit ? palette_sync_14 : _GEN_177; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_179 = 4'hf == pixel_4bit ? palette_sync_15 : _GEN_178; // @[src/main/scala/peripheral/VGA.scala 345:{20,20}]
  wire [5:0] _GEN_180 = display_enabled & in_display_d1 ? _GEN_179 : 6'h1; // @[src/main/scala/peripheral/VGA.scala 344:50 345:20 347:20]
  wire [5:0] output_color = blanking ? 6'h0 : _GEN_180; // @[src/main/scala/peripheral/VGA.scala 342:20 343:20]
  reg [9:0] x_px_d1; // @[src/main/scala/peripheral/VGA.scala 352:26]
  reg [9:0] y_px_d1; // @[src/main/scala/peripheral/VGA.scala 353:26]
  wire [9:0] _in_cursor_x_T_2 = io_cursor_x + 10'ha; // @[src/main/scala/peripheral/VGA.scala 356:75]
  wire  in_cursor_x = x_px_d1 >= io_cursor_x & x_px_d1 < _in_cursor_x_T_2; // @[src/main/scala/peripheral/VGA.scala 356:48]
  wire [9:0] _in_cursor_y_T_2 = io_cursor_y + 10'ha; // @[src/main/scala/peripheral/VGA.scala 357:75]
  wire  in_cursor_y = y_px_d1 >= io_cursor_y & y_px_d1 < _in_cursor_y_T_2; // @[src/main/scala/peripheral/VGA.scala 357:48]
  wire  is_cursor = in_cursor_x & in_cursor_y; // @[src/main/scala/peripheral/VGA.scala 358:35]
  wire [5:0] final_color = is_cursor ? 6'h30 : output_color; // @[src/main/scala/peripheral/VGA.scala 361:26]
  TrueDualPortRAM32 #(.ADDR_WIDTH(13), .DEPTH(6144)) framebuffer ( // @[src/main/scala/peripheral/VGA.scala 91:27]
    .clka(framebuffer_clka),
    .wea(framebuffer_wea),
    .addra(framebuffer_addra),
    .dina(framebuffer_dina),
    .clkb(framebuffer_clkb),
    .addrb(framebuffer_addrb),
    .doutb(framebuffer_doutb)
  );
  AXI4LiteSlave_1 slave ( // @[src/main/scala/peripheral/VGA.scala 94:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_address(slave_io_bundle_address),
    .io_bundle_read(slave_io_bundle_read),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_read_valid(slave_io_bundle_read_valid),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_write_data(slave_io_bundle_write_data)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign io_hsync = io_hsync_REG; // @[src/main/scala/peripheral/VGA.scala 262:14]
  assign io_vsync = io_vsync_REG; // @[src/main/scala/peripheral/VGA.scala 263:14]
  assign io_rrggbb = h_active_d2 & v_active_d2 ? final_color : 6'h0; // @[src/main/scala/peripheral/VGA.scala 365:26]
  assign io_activevideo = h_active_d2 & v_active_d2; // @[src/main/scala/peripheral/VGA.scala 366:35]
  assign io_x_pos = x_px_d1; // @[src/main/scala/peripheral/VGA.scala 369:14]
  assign io_y_pos = y_px_d1; // @[src/main/scala/peripheral/VGA.scala 370:14]
  assign framebuffer_clka = clock; // @[src/main/scala/peripheral/VGA.scala 199:25]
  assign framebuffer_wea = slave_io_bundle_write & _GEN_120; // @[src/main/scala/peripheral/VGA.scala 206:33 201:36]
  assign framebuffer_addra = _GEN_143[12:0]; // @[src/main/scala/peripheral/VGA.scala 202:36]
  assign framebuffer_dina = slave_io_bundle_write ? _GEN_122 : 32'h0; // @[src/main/scala/peripheral/VGA.scala 206:33 203:36]
  assign framebuffer_clkb = io_pixClock; // @[src/main/scala/peripheral/VGA.scala 319:26]
  assign framebuffer_addrb = fb_read_addr[12:0]; // @[src/main/scala/peripheral/VGA.scala 320:26]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/VGA.scala 95:21]
  assign slave_io_bundle_read_data = _GEN_22[31:0]; // @[src/main/scala/peripheral/VGA.scala 170:41]
  assign slave_io_bundle_read_valid = slave_io_bundle_read; // @[src/main/scala/peripheral/VGA.scala 195:32]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 101:30]
      ctrlReg <= 32'h0; // @[src/main/scala/peripheral/VGA.scala 101:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (addr_ctrl) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (requested_frame < 4'hc) begin // @[src/main/scala/peripheral/VGA.scala 210:38]
          ctrlReg <= slave_io_bundle_write_data; // @[src/main/scala/peripheral/VGA.scala 211:19]
        end else begin
          ctrlReg <= _ctrlReg_T_3; // @[src/main/scala/peripheral/VGA.scala 213:19]
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 102:30]
      intrStatusReg <= 32'h0; // @[src/main/scala/peripheral/VGA.scala 102:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (addr_ctrl) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        intrStatusReg <= _GEN_0;
      end else if (addr_intr_status) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
        intrStatusReg <= _intrStatusReg_T_1; // @[src/main/scala/peripheral/VGA.scala 216:23]
      end else begin
        intrStatusReg <= _GEN_0;
      end
    end else begin
      intrStatusReg <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 103:30]
      uploadAddrReg <= 32'h0; // @[src/main/scala/peripheral/VGA.scala 103:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          uploadAddrReg <= _GEN_76;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_0 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_0 <= _GEN_80;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_1 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_1 <= _GEN_81;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_2 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_2 <= _GEN_82;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_3 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_3 <= _GEN_83;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_4 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_4 <= _GEN_84;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_5 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_5 <= _GEN_85;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_6 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_6 <= _GEN_86;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_7 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_7 <= _GEN_87;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_8 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_8 <= _GEN_88;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_9 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_9 <= _GEN_89;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_10 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_10 <= _GEN_90;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_11 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_11 <= _GEN_91;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_12 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_12 <= _GEN_92;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_13 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_13 <= _GEN_93;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_14 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_14 <= _GEN_94;
        end
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 104:30]
      paletteReg_15 <= 6'h0; // @[src/main/scala/peripheral/VGA.scala 104:30]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/VGA.scala 206:33]
      if (!(addr_ctrl)) begin // @[src/main/scala/peripheral/VGA.scala 207:23]
        if (!(addr_intr_status)) begin // @[src/main/scala/peripheral/VGA.scala 215:36]
          paletteReg_15 <= _GEN_95;
        end
      end
    end
    vblank_sync1 <= v_count >= 10'h1e0; // @[src/main/scala/peripheral/VGA.scala 372:29]
    vblank_synced <= vblank_sync1; // @[src/main/scala/peripheral/VGA.scala 125:36]
    curr_frame_sync1 <= curr_frame; // @[src/main/scala/peripheral/VGA.scala 115:29 375:21]
    curr_frame_synced <= curr_frame_sync1; // @[src/main/scala/peripheral/VGA.scala 127:36]
    vblank_prev <= vblank_synced; // @[src/main/scala/peripheral/VGA.scala 136:37]
  end
  always @(posedge io_pixClock) begin
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 244:26]
      h_count <= 10'h0; // @[src/main/scala/peripheral/VGA.scala 244:26]
    end else if (h_count == 10'h33f) begin // @[src/main/scala/peripheral/VGA.scala 247:39]
      h_count <= 10'h0; // @[src/main/scala/peripheral/VGA.scala 248:15]
    end else begin
      h_count <= _h_count_T_1; // @[src/main/scala/peripheral/VGA.scala 255:15]
    end
    if (reset) begin // @[src/main/scala/peripheral/VGA.scala 245:26]
      v_count <= 10'h0; // @[src/main/scala/peripheral/VGA.scala 245:26]
    end else if (h_count == 10'h33f) begin // @[src/main/scala/peripheral/VGA.scala 247:39]
      if (v_count == 10'h207) begin // @[src/main/scala/peripheral/VGA.scala 249:41]
        v_count <= 10'h0; // @[src/main/scala/peripheral/VGA.scala 250:17]
      end else begin
        v_count <= _v_count_T_1; // @[src/main/scala/peripheral/VGA.scala 252:17]
      end
    end
    hsync_d1 <= ~h_sync_pulse; // @[src/main/scala/peripheral/VGA.scala 260:32]
    vsync_d1 <= ~v_sync_pulse; // @[src/main/scala/peripheral/VGA.scala 261:32]
    io_hsync_REG <= hsync_d1; // @[src/main/scala/peripheral/VGA.scala 262:24]
    io_vsync_REG <= vsync_d1; // @[src/main/scala/peripheral/VGA.scala 263:24]
    x_px <= h_count; // @[src/main/scala/peripheral/VGA.scala 268:23]
    y_px <= v_count; // @[src/main/scala/peripheral/VGA.scala 269:23]
    curr_frame_sync1_1 <= ctrlReg[7:4]; // @[src/main/scala/peripheral/VGA.scala 110:31]
    curr_frame <= curr_frame_sync1_1; // @[src/main/scala/peripheral/VGA.scala 287:35]
    display_enabled_sync1 <= ctrlReg[0]; // @[src/main/scala/peripheral/VGA.scala 107:31]
    display_enabled <= display_enabled_sync1; // @[src/main/scala/peripheral/VGA.scala 290:40]
    blanking_sync1 <= ctrlReg[1]; // @[src/main/scala/peripheral/VGA.scala 108:31]
    blanking <= blanking_sync1; // @[src/main/scala/peripheral/VGA.scala 293:33]
    palette_sync1_0 <= paletteReg_0; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_1 <= paletteReg_1; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_2 <= paletteReg_2; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_3 <= paletteReg_3; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_4 <= paletteReg_4; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_5 <= paletteReg_5; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_6 <= paletteReg_6; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_7 <= paletteReg_7; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_8 <= paletteReg_8; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_9 <= paletteReg_9; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_10 <= paletteReg_10; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_11 <= paletteReg_11; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_12 <= paletteReg_12; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_13 <= paletteReg_13; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_14 <= paletteReg_14; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync1_15 <= paletteReg_15; // @[src/main/scala/peripheral/VGA.scala 295:32]
    palette_sync_0 <= palette_sync1_0; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_1 <= palette_sync1_1; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_2 <= palette_sync1_2; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_3 <= palette_sync1_3; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_4 <= palette_sync1_4; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_5 <= palette_sync1_5; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_6 <= palette_sync1_6; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_7 <= palette_sync1_7; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_8 <= palette_sync1_8; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_9 <= palette_sync1_9; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_10 <= palette_sync1_10; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_11 <= palette_sync1_11; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_12 <= palette_sync1_12; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_13 <= palette_sync1_13; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_14 <= palette_sync1_14; // @[src/main/scala/peripheral/VGA.scala 296:32]
    palette_sync_15 <= palette_sync1_15; // @[src/main/scala/peripheral/VGA.scala 296:32]
    in_display_d1 <= in_display_x & in_display_y; // @[src/main/scala/peripheral/VGA.scala 273:37]
    h_active_d1 <= h_count < 10'h280; // @[src/main/scala/peripheral/VGA.scala 265:28]
    v_active_d1 <= v_count < 10'h1e0; // @[src/main/scala/peripheral/VGA.scala 266:28]
    h_active_d2 <= h_active_d1; // @[src/main/scala/peripheral/VGA.scala 310:30]
    v_active_d2 <= v_active_d1; // @[src/main/scala/peripheral/VGA.scala 311:30]
    pixel_in_word_d1 <= pixel_idx[2:0]; // @[src/main/scala/peripheral/VGA.scala 315:34]
    x_px_d1 <= x_px; // @[src/main/scala/peripheral/VGA.scala 352:26]
    y_px_d1 <= y_px; // @[src/main/scala/peripheral/VGA.scala 353:26]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ctrlReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  intrStatusReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  uploadAddrReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  paletteReg_0 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  paletteReg_1 = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  paletteReg_2 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  paletteReg_3 = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  paletteReg_4 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  paletteReg_5 = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  paletteReg_6 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  paletteReg_7 = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  paletteReg_8 = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  paletteReg_9 = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  paletteReg_10 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  paletteReg_11 = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  paletteReg_12 = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  paletteReg_13 = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  paletteReg_14 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  paletteReg_15 = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  vblank_sync1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  vblank_synced = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  curr_frame_sync1 = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  curr_frame_synced = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  vblank_prev = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  h_count = _RAND_24[9:0];
  _RAND_25 = {1{`RANDOM}};
  v_count = _RAND_25[9:0];
  _RAND_26 = {1{`RANDOM}};
  hsync_d1 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  vsync_d1 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  io_hsync_REG = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  io_vsync_REG = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  x_px = _RAND_30[9:0];
  _RAND_31 = {1{`RANDOM}};
  y_px = _RAND_31[9:0];
  _RAND_32 = {1{`RANDOM}};
  curr_frame_sync1_1 = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  curr_frame = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  display_enabled_sync1 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  display_enabled = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  blanking_sync1 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  blanking = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  palette_sync1_0 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  palette_sync1_1 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  palette_sync1_2 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  palette_sync1_3 = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  palette_sync1_4 = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  palette_sync1_5 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  palette_sync1_6 = _RAND_44[5:0];
  _RAND_45 = {1{`RANDOM}};
  palette_sync1_7 = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  palette_sync1_8 = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  palette_sync1_9 = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  palette_sync1_10 = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  palette_sync1_11 = _RAND_49[5:0];
  _RAND_50 = {1{`RANDOM}};
  palette_sync1_12 = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  palette_sync1_13 = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  palette_sync1_14 = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  palette_sync1_15 = _RAND_53[5:0];
  _RAND_54 = {1{`RANDOM}};
  palette_sync_0 = _RAND_54[5:0];
  _RAND_55 = {1{`RANDOM}};
  palette_sync_1 = _RAND_55[5:0];
  _RAND_56 = {1{`RANDOM}};
  palette_sync_2 = _RAND_56[5:0];
  _RAND_57 = {1{`RANDOM}};
  palette_sync_3 = _RAND_57[5:0];
  _RAND_58 = {1{`RANDOM}};
  palette_sync_4 = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  palette_sync_5 = _RAND_59[5:0];
  _RAND_60 = {1{`RANDOM}};
  palette_sync_6 = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  palette_sync_7 = _RAND_61[5:0];
  _RAND_62 = {1{`RANDOM}};
  palette_sync_8 = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  palette_sync_9 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  palette_sync_10 = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  palette_sync_11 = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  palette_sync_12 = _RAND_66[5:0];
  _RAND_67 = {1{`RANDOM}};
  palette_sync_13 = _RAND_67[5:0];
  _RAND_68 = {1{`RANDOM}};
  palette_sync_14 = _RAND_68[5:0];
  _RAND_69 = {1{`RANDOM}};
  palette_sync_15 = _RAND_69[5:0];
  _RAND_70 = {1{`RANDOM}};
  in_display_d1 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  h_active_d1 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  v_active_d1 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  h_active_d2 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  v_active_d2 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  pixel_in_word_d1 = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  x_px_d1 = _RAND_76[9:0];
  _RAND_77 = {1{`RANDOM}};
  y_px_d1 = _RAND_77[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Tx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/peripheral/UART.scala 21:14]
  output       io_channel_ready, // @[src/main/scala/peripheral/UART.scala 21:14]
  input        io_channel_valid, // @[src/main/scala/peripheral/UART.scala 21:14]
  input  [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] shiftReg; // @[src/main/scala/peripheral/UART.scala 28:25]
  reg [19:0] cntReg; // @[src/main/scala/peripheral/UART.scala 29:25]
  reg [3:0] bitsReg; // @[src/main/scala/peripheral/UART.scala 30:25]
  wire  _io_channel_ready_T = cntReg == 20'h0; // @[src/main/scala/peripheral/UART.scala 32:31]
  wire [9:0] shift = shiftReg[10:1]; // @[src/main/scala/peripheral/UART.scala 38:28]
  wire [10:0] _shiftReg_T_1 = {1'h1,shift}; // @[src/main/scala/peripheral/UART.scala 39:22]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/peripheral/UART.scala 40:27]
  wire [10:0] _shiftReg_T_3 = {2'h3,io_channel_bits,1'h0}; // @[src/main/scala/peripheral/UART.scala 43:24]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/peripheral/UART.scala 50:22]
  assign io_txd = shiftReg[0]; // @[src/main/scala/peripheral/UART.scala 33:31]
  assign io_channel_ready = cntReg == 20'h0 & bitsReg == 4'h0; // @[src/main/scala/peripheral/UART.scala 32:40]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 28:25]
      shiftReg <= 11'h7ff; // @[src/main/scala/peripheral/UART.scala 28:25]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 35:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 37:27]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/peripheral/UART.scala 39:16]
      end else if (io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 42:30]
        shiftReg <= _shiftReg_T_3; // @[src/main/scala/peripheral/UART.scala 43:18]
      end else begin
        shiftReg <= 11'h7ff; // @[src/main/scala/peripheral/UART.scala 46:18]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 29:25]
      cntReg <= 20'h0; // @[src/main/scala/peripheral/UART.scala 29:25]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 35:24]
      cntReg <= 20'h1b1; // @[src/main/scala/peripheral/UART.scala 36:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[src/main/scala/peripheral/UART.scala 50:12]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 30:25]
      bitsReg <= 4'h0; // @[src/main/scala/peripheral/UART.scala 30:25]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 35:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 37:27]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/peripheral/UART.scala 40:16]
      end else if (io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 42:30]
        bitsReg <= 4'hb; // @[src/main/scala/peripheral/UART.scala 44:18]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Buffer(
  input        clock,
  input        reset,
  output       io_in_ready, // @[src/main/scala/peripheral/UART.scala 102:14]
  input        io_in_valid, // @[src/main/scala/peripheral/UART.scala 102:14]
  input  [7:0] io_in_bits, // @[src/main/scala/peripheral/UART.scala 102:14]
  input        io_out_ready, // @[src/main/scala/peripheral/UART.scala 102:14]
  output       io_out_valid, // @[src/main/scala/peripheral/UART.scala 102:14]
  output [7:0] io_out_bits // @[src/main/scala/peripheral/UART.scala 102:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[src/main/scala/peripheral/UART.scala 108:37]
  reg [7:0] dataReg; // @[src/main/scala/peripheral/UART.scala 109:37]
  wire  _io_in_ready_T = ~stateReg; // @[src/main/scala/peripheral/UART.scala 111:28]
  wire  _GEN_1 = io_in_valid | stateReg; // @[src/main/scala/peripheral/UART.scala 115:23 117:16 108:37]
  assign io_in_ready = ~stateReg; // @[src/main/scala/peripheral/UART.scala 111:28]
  assign io_out_valid = stateReg; // @[src/main/scala/peripheral/UART.scala 112:28]
  assign io_out_bits = dataReg; // @[src/main/scala/peripheral/UART.scala 124:15]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 108:37]
      stateReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 108:37]
    end else if (_io_in_ready_T) begin // @[src/main/scala/peripheral/UART.scala 114:28]
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin // @[src/main/scala/peripheral/UART.scala 120:24]
      stateReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 121:16]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 109:37]
      dataReg <= 8'h0; // @[src/main/scala/peripheral/UART.scala 109:37]
    end else if (_io_in_ready_T) begin // @[src/main/scala/peripheral/UART.scala 114:28]
      if (io_in_valid) begin // @[src/main/scala/peripheral/UART.scala 115:23]
        dataReg <= io_in_bits; // @[src/main/scala/peripheral/UART.scala 116:16]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/peripheral/UART.scala 131:14]
  output       io_channel_ready, // @[src/main/scala/peripheral/UART.scala 131:14]
  input        io_channel_valid, // @[src/main/scala/peripheral/UART.scala 131:14]
  input  [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 131:14]
);
  wire  tx_clock; // @[src/main/scala/peripheral/UART.scala 135:19]
  wire  tx_reset; // @[src/main/scala/peripheral/UART.scala 135:19]
  wire  tx_io_txd; // @[src/main/scala/peripheral/UART.scala 135:19]
  wire  tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 135:19]
  wire  tx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 135:19]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 135:19]
  wire  buf__clock; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire  buf__reset; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire  buf__io_in_ready; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire  buf__io_in_valid; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire [7:0] buf__io_in_bits; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire  buf__io_out_ready; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire  buf__io_out_valid; // @[src/main/scala/peripheral/UART.scala 136:19]
  wire [7:0] buf__io_out_bits; // @[src/main/scala/peripheral/UART.scala 136:19]
  Tx tx ( // @[src/main/scala/peripheral/UART.scala 135:19]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[src/main/scala/peripheral/UART.scala 136:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_ready(buf__io_in_ready),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[src/main/scala/peripheral/UART.scala 140:10]
  assign io_channel_ready = buf__io_in_ready; // @[src/main/scala/peripheral/UART.scala 138:13]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[src/main/scala/peripheral/UART.scala 139:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[src/main/scala/peripheral/UART.scala 139:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[src/main/scala/peripheral/UART.scala 138:13]
  assign buf__io_in_bits = io_channel_bits; // @[src/main/scala/peripheral/UART.scala 138:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 139:17]
endmodule
module Rx(
  input        clock,
  input        reset,
  input        io_rxd, // @[src/main/scala/peripheral/UART.scala 60:14]
  input        io_channel_ready, // @[src/main/scala/peripheral/UART.scala 60:14]
  output       io_channel_valid, // @[src/main/scala/peripheral/UART.scala 60:14]
  output [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 60:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  rxReg_REG; // @[src/main/scala/peripheral/UART.scala 69:30]
  reg  rxReg; // @[src/main/scala/peripheral/UART.scala 69:22]
  reg [7:0] shiftReg; // @[src/main/scala/peripheral/UART.scala 71:25]
  reg [19:0] cntReg; // @[src/main/scala/peripheral/UART.scala 72:25]
  reg [3:0] bitsReg; // @[src/main/scala/peripheral/UART.scala 73:25]
  reg  valReg; // @[src/main/scala/peripheral/UART.scala 74:25]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/peripheral/UART.scala 77:22]
  wire [7:0] _shiftReg_T_1 = {rxReg,shiftReg[7:1]}; // @[src/main/scala/peripheral/UART.scala 80:20]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/peripheral/UART.scala 81:25]
  wire  _GEN_0 = bitsReg == 4'h1 | valReg; // @[src/main/scala/peripheral/UART.scala 82:27 83:14 74:25]
  assign io_channel_valid = valReg; // @[src/main/scala/peripheral/UART.scala 95:20]
  assign io_channel_bits = shiftReg; // @[src/main/scala/peripheral/UART.scala 94:20]
  always @(posedge clock) begin
    rxReg_REG <= reset | io_rxd; // @[src/main/scala/peripheral/UART.scala 69:{30,30,30}]
    rxReg <= reset | rxReg_REG; // @[src/main/scala/peripheral/UART.scala 69:{22,22,22}]
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 71:25]
      shiftReg <= 8'h0; // @[src/main/scala/peripheral/UART.scala 71:25]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 76:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 78:31]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/peripheral/UART.scala 80:14]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 72:25]
      cntReg <= 20'h0; // @[src/main/scala/peripheral/UART.scala 72:25]
    end else if (cntReg != 20'h0) begin // @[src/main/scala/peripheral/UART.scala 76:24]
      cntReg <= _cntReg_T_1; // @[src/main/scala/peripheral/UART.scala 77:12]
    end else if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 78:31]
      cntReg <= 20'h1b1; // @[src/main/scala/peripheral/UART.scala 79:14]
    end else if (~rxReg) begin // @[src/main/scala/peripheral/UART.scala 85:29]
      cntReg <= 20'h28a; // @[src/main/scala/peripheral/UART.scala 86:13]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 73:25]
      bitsReg <= 4'h0; // @[src/main/scala/peripheral/UART.scala 73:25]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 76:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 78:31]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/peripheral/UART.scala 81:14]
      end else if (~rxReg) begin // @[src/main/scala/peripheral/UART.scala 85:29]
        bitsReg <= 4'h8; // @[src/main/scala/peripheral/UART.scala 87:13]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 74:25]
      valReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 74:25]
    end else if (valReg & io_channel_ready) begin // @[src/main/scala/peripheral/UART.scala 90:36]
      valReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 91:12]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 76:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 78:31]
        valReg <= _GEN_0;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rxReg_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  shiftReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[19:0];
  _RAND_4 = {1{`RANDOM}};
  bitsReg = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  valReg = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Uart(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input  [7:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input  [7:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_rxd, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_txd, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_signal_interrupt // @[src/main/scala/peripheral/UART.scala 164:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  slave_clock; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_reset; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [7:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [7:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [7:0] slave_io_bundle_address; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_bundle_read; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_bundle_read_valid; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/UART.scala 173:25]
  wire  tx_clock; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_reset; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_io_txd; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  rx_clock; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_reset; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_io_rxd; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire [7:0] rx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 177:18]
  reg  interrupt; // @[src/main/scala/peripheral/UART.scala 171:26]
  reg [7:0] rxData; // @[src/main/scala/peripheral/UART.scala 172:26]
  wire [7:0] addr = slave_io_bundle_address; // @[src/main/scala/peripheral/UART.scala 181:48]
  wire  addr_status = addr == 8'h0; // @[src/main/scala/peripheral/UART.scala 182:29]
  wire  addr_baud_rate = addr == 8'h4; // @[src/main/scala/peripheral/UART.scala 183:29]
  wire  addr_interrupt = addr == 8'h8; // @[src/main/scala/peripheral/UART.scala 184:29]
  wire  addr_rx_data = addr == 8'hc; // @[src/main/scala/peripheral/UART.scala 185:29]
  wire  addr_tx_data = addr == 8'h10; // @[src/main/scala/peripheral/UART.scala 186:29]
  wire [31:0] _slave_io_bundle_read_data_T = {30'h0,rx_io_channel_valid,tx_io_channel_ready}; // @[src/main/scala/peripheral/UART.scala 193:39]
  wire [7:0] _GEN_0 = addr_rx_data ? rxData : 8'h0; // @[src/main/scala/peripheral/UART.scala 188:30 196:30 197:33]
  wire  _GEN_1 = addr_rx_data ? 1'h0 : interrupt; // @[src/main/scala/peripheral/UART.scala 171:26 196:30 198:33]
  wire [16:0] _GEN_2 = addr_baud_rate ? 17'h1c200 : {{9'd0}, _GEN_0}; // @[src/main/scala/peripheral/UART.scala 194:32 195:33]
  wire  _GEN_3 = addr_baud_rate ? interrupt : _GEN_1; // @[src/main/scala/peripheral/UART.scala 171:26 194:32]
  wire [31:0] _GEN_4 = addr_status ? _slave_io_bundle_read_data_T : {{15'd0}, _GEN_2}; // @[src/main/scala/peripheral/UART.scala 191:23 193:33]
  wire  _GEN_5 = addr_status ? interrupt : _GEN_3; // @[src/main/scala/peripheral/UART.scala 191:23 171:26]
  wire  _GEN_7 = slave_io_bundle_read ? _GEN_5 : interrupt; // @[src/main/scala/peripheral/UART.scala 171:26 190:30]
  wire  _T = addr_tx_data & tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 208:29]
  wire [7:0] _GEN_9 = addr_tx_data & tx_io_channel_ready ? slave_io_bundle_write_data[7:0] : 8'h0; // @[src/main/scala/peripheral/UART.scala 204:23 208:53 213:26]
  wire  _GEN_10 = addr_interrupt ? slave_io_bundle_write_data != 32'h0 : _GEN_7; // @[src/main/scala/peripheral/UART.scala 206:26 207:17]
  wire  _GEN_11 = addr_interrupt ? 1'h0 : _T; // @[src/main/scala/peripheral/UART.scala 203:23 206:26]
  wire [7:0] _GEN_12 = addr_interrupt ? 8'h0 : _GEN_9; // @[src/main/scala/peripheral/UART.scala 204:23 206:26]
  wire  _GEN_13 = slave_io_bundle_write ? _GEN_10 : _GEN_7; // @[src/main/scala/peripheral/UART.scala 205:31]
  wire  _GEN_18 = rx_io_channel_valid | _GEN_13; // @[src/main/scala/peripheral/UART.scala 224:29 227:25]
  AXI4LiteSlave_1 slave ( // @[src/main/scala/peripheral/UART.scala 173:25]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_address(slave_io_bundle_address),
    .io_bundle_read(slave_io_bundle_read),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_read_valid(slave_io_bundle_read_valid),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_write_data(slave_io_bundle_write_data)
  );
  BufferedTx tx ( // @[src/main/scala/peripheral/UART.scala 176:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Rx rx ( // @[src/main/scala/peripheral/UART.scala 177:18]
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_channel_ready(rx_io_channel_ready),
    .io_channel_valid(rx_io_channel_valid),
    .io_channel_bits(rx_io_channel_bits)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_txd = tx_io_txd; // @[src/main/scala/peripheral/UART.scala 219:13]
  assign io_signal_interrupt = interrupt; // @[src/main/scala/peripheral/UART.scala 222:23]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_bundle_read_data = slave_io_bundle_read ? _GEN_4 : 32'h0; // @[src/main/scala/peripheral/UART.scala 188:30 190:30]
  assign slave_io_bundle_read_valid = 1'h1; // @[src/main/scala/peripheral/UART.scala 189:30]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = slave_io_bundle_write & _GEN_11; // @[src/main/scala/peripheral/UART.scala 203:23 205:31]
  assign tx_io_channel_bits = slave_io_bundle_write ? _GEN_12 : 8'h0; // @[src/main/scala/peripheral/UART.scala 204:23 205:31]
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rxd; // @[src/main/scala/peripheral/UART.scala 220:13]
  assign rx_io_channel_ready = rx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 223:23 224:29 225:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 171:26]
      interrupt <= 1'h0; // @[src/main/scala/peripheral/UART.scala 171:26]
    end else begin
      interrupt <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 172:26]
      rxData <= 8'h0; // @[src/main/scala/peripheral/UART.scala 172:26]
    end else if (rx_io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 224:29]
      rxData <= rx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 226:25]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  interrupt = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxData = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mouse(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input  [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input  [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input  [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input  [15:0] io_x, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input  [15:0] io_y, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_leftButton, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_rightButton, // @[src/main/scala/peripheral/Mouse.scala 19:14]
  input         io_middleButton // @[src/main/scala/peripheral/Mouse.scala 19:14]
);
  wire  slave_clock; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_reset; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [3:0] slave_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_bundle_address; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_read; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_read_valid; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire  slave_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/Mouse.scala 32:21]
  wire [31:0] addr = slave_io_bundle_address & 32'hff; // @[src/main/scala/peripheral/Mouse.scala 41:38]
  wire [31:0] _readData_T = {29'h0,io_middleButton,io_rightButton,io_leftButton}; // @[src/main/scala/peripheral/Mouse.scala 56:22]
  wire [31:0] _GEN_0 = 32'h8 == addr ? _readData_T : 32'h0; // @[src/main/scala/peripheral/Mouse.scala 47:16 56:16 44:29]
  wire [31:0] _GEN_1 = 32'h4 == addr ? {{16'd0}, io_y} : _GEN_0; // @[src/main/scala/peripheral/Mouse.scala 47:16 52:16]
  AXI4LiteSlave slave ( // @[src/main/scala/peripheral/Mouse.scala 32:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(slave_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_address(slave_io_bundle_address),
    .io_bundle_read(slave_io_bundle_read),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_read_valid(slave_io_bundle_read_valid),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_write_data(slave_io_bundle_write_data),
    .io_bundle_write_strobe_0(slave_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(slave_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(slave_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(slave_io_bundle_write_strobe_3)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_write_data_channel_WSTRB = io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Mouse.scala 33:21]
  assign slave_io_bundle_read_data = 32'h0 == addr ? {{16'd0}, io_x} : _GEN_1; // @[src/main/scala/peripheral/Mouse.scala 47:16 49:16]
  assign slave_io_bundle_read_valid = slave_io_bundle_read; // @[src/main/scala/peripheral/Mouse.scala 62:30]
endmodule
module Timer(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input  [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input  [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input  [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/Timer.scala 31:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/Timer.scala 31:14]
  output        io_signal_interrupt // @[src/main/scala/peripheral/Timer.scala 31:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  slave_clock; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_reset; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [3:0] slave_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_bundle_address; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_read; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_read_valid; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/Timer.scala 39:21]
  wire  slave_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/Timer.scala 39:21]
  reg [31:0] count; // @[src/main/scala/peripheral/Timer.scala 43:24]
  reg [31:0] limit; // @[src/main/scala/peripheral/Timer.scala 44:24]
  reg  enabled; // @[src/main/scala/peripheral/Timer.scala 45:24]
  wire  _T = limit != 32'h0; // @[src/main/scala/peripheral/Timer.scala 50:16]
  wire  _T_1 = count >= limit; // @[src/main/scala/peripheral/Timer.scala 50:33]
  wire [31:0] _count_T_1 = count + 32'h1; // @[src/main/scala/peripheral/Timer.scala 54:22]
  wire [31:0] _GEN_0 = limit != 32'h0 & count >= limit ? 32'h0 : _count_T_1; // @[src/main/scala/peripheral/Timer.scala 50:43 51:13 54:13]
  wire [31:0] _GEN_1 = enabled ? _GEN_0 : count; // @[src/main/scala/peripheral/Timer.scala 48:17 43:24]
  wire [31:0] _slave_io_bundle_read_data_T_2 = 4'h0 == slave_io_bundle_address[3:0] ? count : 32'h0; // @[src/main/scala/peripheral/Timer.scala 64:77]
  wire [31:0] _slave_io_bundle_read_data_T_4 = 4'h4 == slave_io_bundle_address[3:0] ? limit :
    _slave_io_bundle_read_data_T_2; // @[src/main/scala/peripheral/Timer.scala 64:77]
  wire  _GEN_2 = slave_io_bundle_address[3:0] == 4'h8 ? slave_io_bundle_write_data != 32'h0 : enabled; // @[src/main/scala/peripheral/Timer.scala 79:57 80:15 45:24]
  wire  _GEN_5 = slave_io_bundle_address[3:0] == 4'h4 ? enabled : _GEN_2; // @[src/main/scala/peripheral/Timer.scala 45:24 76:51]
  wire  _GEN_8 = slave_io_bundle_write ? _GEN_5 : enabled; // @[src/main/scala/peripheral/Timer.scala 45:24 73:31]
  AXI4LiteSlave slave ( // @[src/main/scala/peripheral/Timer.scala 39:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(slave_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_address(slave_io_bundle_address),
    .io_bundle_read(slave_io_bundle_read),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_read_valid(slave_io_bundle_read_valid),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_write_data(slave_io_bundle_write_data),
    .io_bundle_write_strobe_0(slave_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(slave_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(slave_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(slave_io_bundle_write_strobe_3)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign io_signal_interrupt = enabled & _T & _T_1; // @[src/main/scala/peripheral/Timer.scala 59:53]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_write_data_channel_WSTRB = io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Timer.scala 40:21]
  assign slave_io_bundle_read_data = 4'h8 == slave_io_bundle_address[3:0] ? {{31'd0}, enabled} :
    _slave_io_bundle_read_data_T_4; // @[src/main/scala/peripheral/Timer.scala 64:77]
  assign slave_io_bundle_read_valid = 1'h1; // @[src/main/scala/peripheral/Timer.scala 63:30]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 43:24]
      count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 43:24]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/Timer.scala 73:31]
      if (slave_io_bundle_address[3:0] == 4'h4) begin // @[src/main/scala/peripheral/Timer.scala 76:51]
        count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 78:13]
      end else begin
        count <= _GEN_1;
      end
    end else begin
      count <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 44:24]
      limit <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 44:24]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/Timer.scala 73:31]
      if (slave_io_bundle_address[3:0] == 4'h4) begin // @[src/main/scala/peripheral/Timer.scala 76:51]
        limit <= slave_io_bundle_write_data; // @[src/main/scala/peripheral/Timer.scala 77:13]
      end
    end
    enabled <= reset | _GEN_8; // @[src/main/scala/peripheral/Timer.scala 45:{24,24}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  limit = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  enabled = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input        io_jump_flag, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input        io_jump_instruction_id, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input        io_memory_read_enable_ex, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [4:0] io_rd_ex, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input        io_memory_read_enable_mem, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input        io_memory_write_enable_mem, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [1:0] io_regs_write_source_ex, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [1:0] io_regs_write_source_mem, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [1:0] io_regs_write_source_wb, // @[src/main/scala/riscv/core/Control.scala 55:14]
  input  [4:0] io_rd_wb, // @[src/main/scala/riscv/core/Control.scala 55:14]
  output       io_if_flush, // @[src/main/scala/riscv/core/Control.scala 55:14]
  output       io_id_flush, // @[src/main/scala/riscv/core/Control.scala 55:14]
  output       io_pc_stall, // @[src/main/scala/riscv/core/Control.scala 55:14]
  output       io_if_stall, // @[src/main/scala/riscv/core/Control.scala 55:14]
  output       io_branch_hazard, // @[src/main/scala/riscv/core/Control.scala 55:14]
  output       io_jal_jalr_hazard // @[src/main/scala/riscv/core/Control.scala 55:14]
);
  wire  _ex_hazard_for_branch_T = io_rd_ex != 5'h0; // @[src/main/scala/riscv/core/Control.scala 96:14]
  wire  _ex_hazard_for_branch_T_1 = io_jump_instruction_id & _ex_hazard_for_branch_T; // @[src/main/scala/riscv/core/Control.scala 95:53]
  wire  _ex_hazard_for_branch_T_4 = io_rd_ex == io_rs1_id | io_rd_ex == io_rs2_id; // @[src/main/scala/riscv/core/Control.scala 97:29]
  wire  ex_hazard_for_branch = _ex_hazard_for_branch_T_1 & _ex_hazard_for_branch_T_4; // @[src/main/scala/riscv/core/Control.scala 96:22]
  wire  store_load_hazard = io_memory_write_enable_mem & io_memory_read_enable_ex; // @[src/main/scala/riscv/core/Control.scala 111:54]
  wire  _jal_jalr_hazard_ex_T_2 = io_regs_write_source_ex == 2'h3 & _ex_hazard_for_branch_T; // @[src/main/scala/riscv/core/Control.scala 125:96]
  wire  jal_jalr_hazard_ex = _jal_jalr_hazard_ex_T_2 & _ex_hazard_for_branch_T_4; // @[src/main/scala/riscv/core/Control.scala 126:22]
  wire  _jal_jalr_hazard_mem_T_1 = io_rd_mem != 5'h0; // @[src/main/scala/riscv/core/Control.scala 140:15]
  wire  _jal_jalr_hazard_mem_T_2 = io_regs_write_source_mem == 2'h3 & _jal_jalr_hazard_mem_T_1; // @[src/main/scala/riscv/core/Control.scala 139:98]
  wire  _jal_jalr_hazard_mem_T_5 = io_rd_mem == io_rs1_id | io_rd_mem == io_rs2_id; // @[src/main/scala/riscv/core/Control.scala 141:30]
  wire  jal_jalr_hazard_mem = _jal_jalr_hazard_mem_T_2 & _jal_jalr_hazard_mem_T_5; // @[src/main/scala/riscv/core/Control.scala 140:23]
  wire  _jal_jalr_hazard_wb_T_1 = io_rd_wb != 5'h0; // @[src/main/scala/riscv/core/Control.scala 157:14]
  wire  _jal_jalr_hazard_wb_T_2 = io_regs_write_source_wb == 2'h3 & _jal_jalr_hazard_wb_T_1; // @[src/main/scala/riscv/core/Control.scala 156:96]
  wire  _jal_jalr_hazard_wb_T_5 = io_rd_wb == io_rs1_id | io_rd_wb == io_rs2_id; // @[src/main/scala/riscv/core/Control.scala 158:29]
  wire  jal_jalr_hazard_wb = _jal_jalr_hazard_wb_T_2 & _jal_jalr_hazard_wb_T_5; // @[src/main/scala/riscv/core/Control.scala 157:22]
  wire  _T_2 = (io_jump_instruction_id | io_memory_read_enable_ex) & _ex_hazard_for_branch_T; // @[src/main/scala/riscv/core/Control.scala 166:59]
  wire  _T_6 = _T_2 & _ex_hazard_for_branch_T_4; // @[src/main/scala/riscv/core/Control.scala 169:24]
  wire  _T_7 = io_jump_instruction_id & io_memory_read_enable_mem; // @[src/main/scala/riscv/core/Control.scala 180:33]
  wire  _T_9 = _T_7 & _jal_jalr_hazard_mem_T_1; // @[src/main/scala/riscv/core/Control.scala 181:37]
  wire  _T_13 = _T_9 & _jal_jalr_hazard_mem_T_5; // @[src/main/scala/riscv/core/Control.scala 182:29]
  wire  _T_14 = _T_6 | _T_13; // @[src/main/scala/riscv/core/Control.scala 177:7]
  wire  _T_15 = _T_14 | store_load_hazard; // @[src/main/scala/riscv/core/Control.scala 189:9]
  wire  _T_16 = _T_15 | jal_jalr_hazard_ex; // @[src/main/scala/riscv/core/Control.scala 195:9]
  wire  _T_17 = _T_16 | jal_jalr_hazard_mem; // @[src/main/scala/riscv/core/Control.scala 201:9]
  wire  _T_18 = _T_17 | jal_jalr_hazard_wb; // @[src/main/scala/riscv/core/Control.scala 207:9]
  wire  _is_load_use_hazard_T_1 = io_memory_read_enable_ex & _ex_hazard_for_branch_T; // @[src/main/scala/riscv/core/Control.scala 227:55]
  wire  is_load_use_hazard = _is_load_use_hazard_T_1 & _ex_hazard_for_branch_T_4; // @[src/main/scala/riscv/core/Control.scala 228:24]
  wire  is_jal_jalr_hazard = jal_jalr_hazard_ex | jal_jalr_hazard_mem | jal_jalr_hazard_wb; // @[src/main/scala/riscv/core/Control.scala 232:72]
  assign io_if_flush = _T_18 ? 1'h0 : io_jump_flag; // @[src/main/scala/riscv/core/Control.scala 212:5 86:22]
  assign io_id_flush = _T_18 & (is_load_use_hazard | is_jal_jalr_hazard); // @[src/main/scala/riscv/core/Control.scala 212:5 233:17 87:22]
  assign io_pc_stall = _T_17 | jal_jalr_hazard_wb; // @[src/main/scala/riscv/core/Control.scala 207:9]
  assign io_if_stall = _T_17 | jal_jalr_hazard_wb; // @[src/main/scala/riscv/core/Control.scala 207:9]
  assign io_branch_hazard = _T_18 & ex_hazard_for_branch; // @[src/main/scala/riscv/core/Control.scala 212:5 238:22 90:22]
  assign io_jal_jalr_hazard = _T_18 & is_jal_jalr_hazard; // @[src/main/scala/riscv/core/Control.scala 212:5 240:24 91:22]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  input  [4:0]  io_write_address, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  input  [31:0] io_write_data, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  input  [4:0]  io_read_address1, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  input  [4:0]  io_read_address2, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  output [31:0] io_read_data1, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  output [31:0] io_read_data2, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  input  [4:0]  io_debug_read_address, // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
  output [31:0] io_debug_read_data // @[src/main/scala/riscv/core/RegisterFile.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registers_0; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_1; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_2; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_3; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_4; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_5; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_6; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_7; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_8; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_9; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_10; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_11; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_12; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_13; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_14; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_15; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_16; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_17; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_18; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_19; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_20; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_21; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_22; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_23; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_24; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_25; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_26; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_27; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_28; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_29; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  reg [31:0] registers_30; // @[src/main/scala/riscv/core/RegisterFile.scala 37:22]
  wire [4:0] _T_5 = io_write_address - 5'h1; // @[src/main/scala/riscv/core/RegisterFile.scala 42:34]
  wire  _io_read_data1_T = io_read_address1 == 5'h0; // @[src/main/scala/riscv/core/RegisterFile.scala 50:22]
  wire  _io_read_data1_T_2 = io_write_enable & io_write_address == io_read_address1; // @[src/main/scala/riscv/core/RegisterFile.scala 53:23]
  wire [4:0] _io_read_data1_T_4 = io_read_address1 - 5'h1; // @[src/main/scala/riscv/core/RegisterFile.scala 55:34]
  wire [31:0] _GEN_94 = 5'h1 == _io_read_data1_T_4 ? registers_1 : registers_0; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_95 = 5'h2 == _io_read_data1_T_4 ? registers_2 : _GEN_94; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_96 = 5'h3 == _io_read_data1_T_4 ? registers_3 : _GEN_95; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_97 = 5'h4 == _io_read_data1_T_4 ? registers_4 : _GEN_96; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_98 = 5'h5 == _io_read_data1_T_4 ? registers_5 : _GEN_97; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_99 = 5'h6 == _io_read_data1_T_4 ? registers_6 : _GEN_98; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_100 = 5'h7 == _io_read_data1_T_4 ? registers_7 : _GEN_99; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_101 = 5'h8 == _io_read_data1_T_4 ? registers_8 : _GEN_100; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_102 = 5'h9 == _io_read_data1_T_4 ? registers_9 : _GEN_101; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_103 = 5'ha == _io_read_data1_T_4 ? registers_10 : _GEN_102; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_104 = 5'hb == _io_read_data1_T_4 ? registers_11 : _GEN_103; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_105 = 5'hc == _io_read_data1_T_4 ? registers_12 : _GEN_104; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_106 = 5'hd == _io_read_data1_T_4 ? registers_13 : _GEN_105; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_107 = 5'he == _io_read_data1_T_4 ? registers_14 : _GEN_106; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_108 = 5'hf == _io_read_data1_T_4 ? registers_15 : _GEN_107; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_109 = 5'h10 == _io_read_data1_T_4 ? registers_16 : _GEN_108; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_110 = 5'h11 == _io_read_data1_T_4 ? registers_17 : _GEN_109; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_111 = 5'h12 == _io_read_data1_T_4 ? registers_18 : _GEN_110; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_112 = 5'h13 == _io_read_data1_T_4 ? registers_19 : _GEN_111; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_113 = 5'h14 == _io_read_data1_T_4 ? registers_20 : _GEN_112; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_114 = 5'h15 == _io_read_data1_T_4 ? registers_21 : _GEN_113; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_115 = 5'h16 == _io_read_data1_T_4 ? registers_22 : _GEN_114; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_116 = 5'h17 == _io_read_data1_T_4 ? registers_23 : _GEN_115; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_117 = 5'h18 == _io_read_data1_T_4 ? registers_24 : _GEN_116; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_118 = 5'h19 == _io_read_data1_T_4 ? registers_25 : _GEN_117; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_119 = 5'h1a == _io_read_data1_T_4 ? registers_26 : _GEN_118; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_120 = 5'h1b == _io_read_data1_T_4 ? registers_27 : _GEN_119; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_121 = 5'h1c == _io_read_data1_T_4 ? registers_28 : _GEN_120; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_122 = 5'h1d == _io_read_data1_T_4 ? registers_29 : _GEN_121; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _GEN_123 = 5'h1e == _io_read_data1_T_4 ? registers_30 : _GEN_122; // @[src/main/scala/riscv/core/RegisterFile.scala 52:{8,8}]
  wire [31:0] _io_read_data1_T_5 = _io_read_data1_T_2 ? io_write_data : _GEN_123; // @[src/main/scala/riscv/core/RegisterFile.scala 52:8]
  wire  _io_read_data2_T = io_read_address2 == 5'h0; // @[src/main/scala/riscv/core/RegisterFile.scala 60:22]
  wire  _io_read_data2_T_2 = io_write_enable & io_write_address == io_read_address2; // @[src/main/scala/riscv/core/RegisterFile.scala 63:23]
  wire [4:0] _io_read_data2_T_4 = io_read_address2 - 5'h1; // @[src/main/scala/riscv/core/RegisterFile.scala 65:34]
  wire [31:0] _GEN_125 = 5'h1 == _io_read_data2_T_4 ? registers_1 : registers_0; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_126 = 5'h2 == _io_read_data2_T_4 ? registers_2 : _GEN_125; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_127 = 5'h3 == _io_read_data2_T_4 ? registers_3 : _GEN_126; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_128 = 5'h4 == _io_read_data2_T_4 ? registers_4 : _GEN_127; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_129 = 5'h5 == _io_read_data2_T_4 ? registers_5 : _GEN_128; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_130 = 5'h6 == _io_read_data2_T_4 ? registers_6 : _GEN_129; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_131 = 5'h7 == _io_read_data2_T_4 ? registers_7 : _GEN_130; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_132 = 5'h8 == _io_read_data2_T_4 ? registers_8 : _GEN_131; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_133 = 5'h9 == _io_read_data2_T_4 ? registers_9 : _GEN_132; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_134 = 5'ha == _io_read_data2_T_4 ? registers_10 : _GEN_133; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_135 = 5'hb == _io_read_data2_T_4 ? registers_11 : _GEN_134; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_136 = 5'hc == _io_read_data2_T_4 ? registers_12 : _GEN_135; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_137 = 5'hd == _io_read_data2_T_4 ? registers_13 : _GEN_136; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_138 = 5'he == _io_read_data2_T_4 ? registers_14 : _GEN_137; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_139 = 5'hf == _io_read_data2_T_4 ? registers_15 : _GEN_138; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_140 = 5'h10 == _io_read_data2_T_4 ? registers_16 : _GEN_139; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_141 = 5'h11 == _io_read_data2_T_4 ? registers_17 : _GEN_140; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_142 = 5'h12 == _io_read_data2_T_4 ? registers_18 : _GEN_141; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_143 = 5'h13 == _io_read_data2_T_4 ? registers_19 : _GEN_142; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_144 = 5'h14 == _io_read_data2_T_4 ? registers_20 : _GEN_143; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_145 = 5'h15 == _io_read_data2_T_4 ? registers_21 : _GEN_144; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_146 = 5'h16 == _io_read_data2_T_4 ? registers_22 : _GEN_145; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_147 = 5'h17 == _io_read_data2_T_4 ? registers_23 : _GEN_146; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_148 = 5'h18 == _io_read_data2_T_4 ? registers_24 : _GEN_147; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_149 = 5'h19 == _io_read_data2_T_4 ? registers_25 : _GEN_148; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_150 = 5'h1a == _io_read_data2_T_4 ? registers_26 : _GEN_149; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_151 = 5'h1b == _io_read_data2_T_4 ? registers_27 : _GEN_150; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_152 = 5'h1c == _io_read_data2_T_4 ? registers_28 : _GEN_151; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_153 = 5'h1d == _io_read_data2_T_4 ? registers_29 : _GEN_152; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _GEN_154 = 5'h1e == _io_read_data2_T_4 ? registers_30 : _GEN_153; // @[src/main/scala/riscv/core/RegisterFile.scala 62:{8,8}]
  wire [31:0] _io_read_data2_T_5 = _io_read_data2_T_2 ? io_write_data : _GEN_154; // @[src/main/scala/riscv/core/RegisterFile.scala 62:8]
  wire  _io_debug_read_data_T = io_debug_read_address == 5'h0; // @[src/main/scala/riscv/core/RegisterFile.scala 70:27]
  wire  _io_debug_read_data_T_2 = io_write_enable & io_write_address == io_debug_read_address; // @[src/main/scala/riscv/core/RegisterFile.scala 73:23]
  wire [4:0] _io_debug_read_data_T_4 = io_debug_read_address - 5'h1; // @[src/main/scala/riscv/core/RegisterFile.scala 75:39]
  wire [31:0] _GEN_156 = 5'h1 == _io_debug_read_data_T_4 ? registers_1 : registers_0; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_157 = 5'h2 == _io_debug_read_data_T_4 ? registers_2 : _GEN_156; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_158 = 5'h3 == _io_debug_read_data_T_4 ? registers_3 : _GEN_157; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_159 = 5'h4 == _io_debug_read_data_T_4 ? registers_4 : _GEN_158; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_160 = 5'h5 == _io_debug_read_data_T_4 ? registers_5 : _GEN_159; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_161 = 5'h6 == _io_debug_read_data_T_4 ? registers_6 : _GEN_160; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_162 = 5'h7 == _io_debug_read_data_T_4 ? registers_7 : _GEN_161; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_163 = 5'h8 == _io_debug_read_data_T_4 ? registers_8 : _GEN_162; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_164 = 5'h9 == _io_debug_read_data_T_4 ? registers_9 : _GEN_163; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_165 = 5'ha == _io_debug_read_data_T_4 ? registers_10 : _GEN_164; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_166 = 5'hb == _io_debug_read_data_T_4 ? registers_11 : _GEN_165; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_167 = 5'hc == _io_debug_read_data_T_4 ? registers_12 : _GEN_166; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_168 = 5'hd == _io_debug_read_data_T_4 ? registers_13 : _GEN_167; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_169 = 5'he == _io_debug_read_data_T_4 ? registers_14 : _GEN_168; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_170 = 5'hf == _io_debug_read_data_T_4 ? registers_15 : _GEN_169; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_171 = 5'h10 == _io_debug_read_data_T_4 ? registers_16 : _GEN_170; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_172 = 5'h11 == _io_debug_read_data_T_4 ? registers_17 : _GEN_171; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_173 = 5'h12 == _io_debug_read_data_T_4 ? registers_18 : _GEN_172; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_174 = 5'h13 == _io_debug_read_data_T_4 ? registers_19 : _GEN_173; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_175 = 5'h14 == _io_debug_read_data_T_4 ? registers_20 : _GEN_174; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_176 = 5'h15 == _io_debug_read_data_T_4 ? registers_21 : _GEN_175; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_177 = 5'h16 == _io_debug_read_data_T_4 ? registers_22 : _GEN_176; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_178 = 5'h17 == _io_debug_read_data_T_4 ? registers_23 : _GEN_177; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_179 = 5'h18 == _io_debug_read_data_T_4 ? registers_24 : _GEN_178; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_180 = 5'h19 == _io_debug_read_data_T_4 ? registers_25 : _GEN_179; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_181 = 5'h1a == _io_debug_read_data_T_4 ? registers_26 : _GEN_180; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_182 = 5'h1b == _io_debug_read_data_T_4 ? registers_27 : _GEN_181; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_183 = 5'h1c == _io_debug_read_data_T_4 ? registers_28 : _GEN_182; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_184 = 5'h1d == _io_debug_read_data_T_4 ? registers_29 : _GEN_183; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _GEN_185 = 5'h1e == _io_debug_read_data_T_4 ? registers_30 : _GEN_184; // @[src/main/scala/riscv/core/RegisterFile.scala 72:{8,8}]
  wire [31:0] _io_debug_read_data_T_5 = _io_debug_read_data_T_2 ? io_write_data : _GEN_185; // @[src/main/scala/riscv/core/RegisterFile.scala 72:8]
  assign io_read_data1 = _io_read_data1_T ? 32'h0 : _io_read_data1_T_5; // @[src/main/scala/riscv/core/RegisterFile.scala 49:23]
  assign io_read_data2 = _io_read_data2_T ? 32'h0 : _io_read_data2_T_5; // @[src/main/scala/riscv/core/RegisterFile.scala 59:23]
  assign io_debug_read_data = _io_debug_read_data_T ? 32'h0 : _io_debug_read_data_T_5; // @[src/main/scala/riscv/core/RegisterFile.scala 69:28]
  always @(posedge clock) begin
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h0 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_0 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h1 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_1 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h2 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_2 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h3 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_3 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h4 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_4 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h5 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_5 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h6 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_6 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h7 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_7 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h8 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_8 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h9 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_9 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'ha == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_10 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'hb == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_11 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'hc == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_12 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'hd == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_13 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'he == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_14 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'hf == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_15 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h10 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_16 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h11 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_17 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h12 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_18 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h13 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_19 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h14 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_20 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h15 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_21 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h16 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_22 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h17 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_23 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h18 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_24 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h19 == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_25 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h1a == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_26 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h1b == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_27 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h1c == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_28 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h1d == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_29 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 39:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 40:55]
        if (5'h1e == _T_5) begin // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
          registers_30 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 42:41]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registers_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registers_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registers_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registers_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registers_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registers_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registers_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registers_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registers_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registers_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registers_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registers_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registers_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registers_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registers_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registers_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registers_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registers_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registers_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registers_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registers_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registers_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registers_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registers_30 = _RAND_30[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BranchTargetBuffer(
  input         clock,
  input         reset,
  input  [31:0] io_pc, // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
  output [31:0] io_predicted_pc, // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
  output        io_predicted_taken, // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
  input         io_update_valid, // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
  input  [31:0] io_update_pc, // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
  input  [31:0] io_update_target, // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
  input         io_update_taken // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 36:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_2; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_3; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_5; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_6; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_7; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_8; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_9; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_10; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_11; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_12; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_13; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_14; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg  valid_15; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
  reg [25:0] tags_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_2; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_3; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_5; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_6; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_7; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_8; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_9; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_10; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_11; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_12; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_13; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_14; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [25:0] tags_15; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 51:20]
  reg [31:0] targets_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_2; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_3; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_5; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_6; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_7; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_8; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_9; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_10; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_11; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_12; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_13; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_14; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  reg [31:0] targets_15; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 52:20]
  wire [3:0] pred_index = io_pc[5:2]; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 55:36]
  wire [25:0] pred_tag = io_pc[31:6]; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 56:36]
  wire [25:0] _GEN_1 = 4'h1 == pred_index ? tags_1 : tags_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_2 = 4'h2 == pred_index ? tags_2 : _GEN_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_3 = 4'h3 == pred_index ? tags_3 : _GEN_2; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_4 = 4'h4 == pred_index ? tags_4 : _GEN_3; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_5 = 4'h5 == pred_index ? tags_5 : _GEN_4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_6 = 4'h6 == pred_index ? tags_6 : _GEN_5; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_7 = 4'h7 == pred_index ? tags_7 : _GEN_6; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_8 = 4'h8 == pred_index ? tags_8 : _GEN_7; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_9 = 4'h9 == pred_index ? tags_9 : _GEN_8; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_10 = 4'ha == pred_index ? tags_10 : _GEN_9; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_11 = 4'hb == pred_index ? tags_11 : _GEN_10; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_12 = 4'hc == pred_index ? tags_12 : _GEN_11; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_13 = 4'hd == pred_index ? tags_13 : _GEN_12; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_14 = 4'he == pred_index ? tags_14 : _GEN_13; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire [25:0] _GEN_15 = 4'hf == pred_index ? tags_15 : _GEN_14; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{59,59}]
  wire  _GEN_17 = 4'h1 == pred_index ? valid_1 : valid_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_18 = 4'h2 == pred_index ? valid_2 : _GEN_17; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_19 = 4'h3 == pred_index ? valid_3 : _GEN_18; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_20 = 4'h4 == pred_index ? valid_4 : _GEN_19; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_21 = 4'h5 == pred_index ? valid_5 : _GEN_20; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_22 = 4'h6 == pred_index ? valid_6 : _GEN_21; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_23 = 4'h7 == pred_index ? valid_7 : _GEN_22; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_24 = 4'h8 == pred_index ? valid_8 : _GEN_23; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_25 = 4'h9 == pred_index ? valid_9 : _GEN_24; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_26 = 4'ha == pred_index ? valid_10 : _GEN_25; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_27 = 4'hb == pred_index ? valid_11 : _GEN_26; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_28 = 4'hc == pred_index ? valid_12 : _GEN_27; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_29 = 4'hd == pred_index ? valid_13 : _GEN_28; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_30 = 4'he == pred_index ? valid_14 : _GEN_29; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  _GEN_31 = 4'hf == pred_index ? valid_15 : _GEN_30; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:{38,38}]
  wire  hit = _GEN_31 & _GEN_15 == pred_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:38]
  wire [31:0] _io_predicted_pc_T_1 = io_pc + 32'h4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:61]
  wire [31:0] _GEN_33 = 4'h1 == pred_index ? targets_1 : targets_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_34 = 4'h2 == pred_index ? targets_2 : _GEN_33; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_35 = 4'h3 == pred_index ? targets_3 : _GEN_34; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_36 = 4'h4 == pred_index ? targets_4 : _GEN_35; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_37 = 4'h5 == pred_index ? targets_5 : _GEN_36; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_38 = 4'h6 == pred_index ? targets_6 : _GEN_37; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_39 = 4'h7 == pred_index ? targets_7 : _GEN_38; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_40 = 4'h8 == pred_index ? targets_8 : _GEN_39; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_41 = 4'h9 == pred_index ? targets_9 : _GEN_40; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_42 = 4'ha == pred_index ? targets_10 : _GEN_41; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_43 = 4'hb == pred_index ? targets_11 : _GEN_42; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_44 = 4'hc == pred_index ? targets_12 : _GEN_43; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_45 = 4'hd == pred_index ? targets_13 : _GEN_44; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_46 = 4'he == pred_index ? targets_14 : _GEN_45; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [31:0] _GEN_47 = 4'hf == pred_index ? targets_15 : _GEN_46; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:{28,28}]
  wire [3:0] upd_index = io_update_pc[5:2]; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 55:36]
  wire [25:0] upd_tag = io_update_pc[31:6]; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 56:36]
  wire  _GEN_48 = 4'h0 == upd_index | valid_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_49 = 4'h1 == upd_index | valid_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_50 = 4'h2 == upd_index | valid_2; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_51 = 4'h3 == upd_index | valid_3; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_52 = 4'h4 == upd_index | valid_4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_53 = 4'h5 == upd_index | valid_5; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_54 = 4'h6 == upd_index | valid_6; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_55 = 4'h7 == upd_index | valid_7; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_56 = 4'h8 == upd_index | valid_8; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_57 = 4'h9 == upd_index | valid_9; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_58 = 4'ha == upd_index | valid_10; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_59 = 4'hb == upd_index | valid_11; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_60 = 4'hc == upd_index | valid_12; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_61 = 4'hd == upd_index | valid_13; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_62 = 4'he == upd_index | valid_14; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire  _GEN_63 = 4'hf == upd_index | valid_15; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 73:{26,26}]
  wire [25:0] _GEN_97 = 4'h1 == upd_index ? tags_1 : tags_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_98 = 4'h2 == upd_index ? tags_2 : _GEN_97; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_99 = 4'h3 == upd_index ? tags_3 : _GEN_98; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_100 = 4'h4 == upd_index ? tags_4 : _GEN_99; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_101 = 4'h5 == upd_index ? tags_5 : _GEN_100; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_102 = 4'h6 == upd_index ? tags_6 : _GEN_101; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_103 = 4'h7 == upd_index ? tags_7 : _GEN_102; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_104 = 4'h8 == upd_index ? tags_8 : _GEN_103; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_105 = 4'h9 == upd_index ? tags_9 : _GEN_104; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_106 = 4'ha == upd_index ? tags_10 : _GEN_105; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_107 = 4'hb == upd_index ? tags_11 : _GEN_106; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_108 = 4'hc == upd_index ? tags_12 : _GEN_107; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_109 = 4'hd == upd_index ? tags_13 : _GEN_108; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_110 = 4'he == upd_index ? tags_14 : _GEN_109; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire [25:0] _GEN_111 = 4'hf == upd_index ? tags_15 : _GEN_110; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{49,49}]
  wire  _GEN_113 = 4'h1 == upd_index ? valid_1 : valid_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_114 = 4'h2 == upd_index ? valid_2 : _GEN_113; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_115 = 4'h3 == upd_index ? valid_3 : _GEN_114; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_116 = 4'h4 == upd_index ? valid_4 : _GEN_115; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_117 = 4'h5 == upd_index ? valid_5 : _GEN_116; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_118 = 4'h6 == upd_index ? valid_6 : _GEN_117; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_119 = 4'h7 == upd_index ? valid_7 : _GEN_118; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_120 = 4'h8 == upd_index ? valid_8 : _GEN_119; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_121 = 4'h9 == upd_index ? valid_9 : _GEN_120; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_122 = 4'ha == upd_index ? valid_10 : _GEN_121; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_123 = 4'hb == upd_index ? valid_11 : _GEN_122; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_124 = 4'hc == upd_index ? valid_12 : _GEN_123; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_125 = 4'hd == upd_index ? valid_13 : _GEN_124; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_126 = 4'he == upd_index ? valid_14 : _GEN_125; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_127 = 4'hf == upd_index ? valid_15 : _GEN_126; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:{29,29}]
  wire  _GEN_128 = 4'h0 == upd_index ? 1'h0 : valid_0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_129 = 4'h1 == upd_index ? 1'h0 : valid_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_130 = 4'h2 == upd_index ? 1'h0 : valid_2; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_131 = 4'h3 == upd_index ? 1'h0 : valid_3; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_132 = 4'h4 == upd_index ? 1'h0 : valid_4; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_133 = 4'h5 == upd_index ? 1'h0 : valid_5; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_134 = 4'h6 == upd_index ? 1'h0 : valid_6; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_135 = 4'h7 == upd_index ? 1'h0 : valid_7; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_136 = 4'h8 == upd_index ? 1'h0 : valid_8; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_137 = 4'h9 == upd_index ? 1'h0 : valid_9; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_138 = 4'ha == upd_index ? 1'h0 : valid_10; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_139 = 4'hb == upd_index ? 1'h0 : valid_11; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_140 = 4'hc == upd_index ? 1'h0 : valid_12; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_141 = 4'hd == upd_index ? 1'h0 : valid_13; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_142 = 4'he == upd_index ? 1'h0 : valid_14; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  wire  _GEN_143 = 4'hf == upd_index ? 1'h0 : valid_15; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24 79:{26,26}]
  assign io_predicted_pc = hit ? _GEN_47 : _io_predicted_pc_T_1; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 64:28]
  assign io_predicted_taken = _GEN_31 & _GEN_15 == pred_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 61:38]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_0 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_0 <= _GEN_48;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_0 <= _GEN_128;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_1 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_1 <= _GEN_49;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_1 <= _GEN_129;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_2 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_2 <= _GEN_50;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_2 <= _GEN_130;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_3 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_3 <= _GEN_51;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_3 <= _GEN_131;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_4 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_4 <= _GEN_52;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_4 <= _GEN_132;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_5 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_5 <= _GEN_53;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_5 <= _GEN_133;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_6 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_6 <= _GEN_54;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_6 <= _GEN_134;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_7 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_7 <= _GEN_55;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_7 <= _GEN_135;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_8 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_8 <= _GEN_56;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_8 <= _GEN_136;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_9 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_9 <= _GEN_57;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_9 <= _GEN_137;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_10 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_10 <= _GEN_58;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_10 <= _GEN_138;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_11 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_11 <= _GEN_59;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_11 <= _GEN_139;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_12 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_12 <= _GEN_60;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_12 <= _GEN_140;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_13 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_13 <= _GEN_61;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_13 <= _GEN_141;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_14 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_14 <= _GEN_62;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_14 <= _GEN_142;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
      valid_15 <= 1'h0; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 50:24]
    end else if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        valid_15 <= _GEN_63;
      end else if (_GEN_127 & _GEN_111 == upd_tag) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 78:63]
        valid_15 <= _GEN_143;
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h0 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_0 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h1 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_1 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h2 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_2 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h3 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_3 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h4 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_4 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h5 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_5 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h6 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_6 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h7 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_7 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h8 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_8 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h9 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_9 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'ha == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_10 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hb == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_11 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hc == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_12 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hd == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_13 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'he == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_14 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hf == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
          tags_15 <= upd_tag; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 74:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h0 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_0 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h1 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_1 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h2 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_2 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h3 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_3 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h4 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_4 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h5 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_5 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h6 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_6 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h7 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_7 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h8 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_8 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'h9 == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_9 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'ha == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_10 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hb == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_11 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hc == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_12 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hd == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_13 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'he == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_14 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
    if (io_update_valid) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 67:25]
      if (io_update_taken) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 71:27]
        if (4'hf == upd_index) begin // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
          targets_15 <= io_update_target; // @[src/main/scala/riscv/core/BranchTargetBuffer.scala 75:26]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  valid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valid_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valid_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  valid_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  valid_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  valid_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  valid_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  valid_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  valid_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  valid_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  valid_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  valid_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  valid_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  valid_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  tags_0 = _RAND_16[25:0];
  _RAND_17 = {1{`RANDOM}};
  tags_1 = _RAND_17[25:0];
  _RAND_18 = {1{`RANDOM}};
  tags_2 = _RAND_18[25:0];
  _RAND_19 = {1{`RANDOM}};
  tags_3 = _RAND_19[25:0];
  _RAND_20 = {1{`RANDOM}};
  tags_4 = _RAND_20[25:0];
  _RAND_21 = {1{`RANDOM}};
  tags_5 = _RAND_21[25:0];
  _RAND_22 = {1{`RANDOM}};
  tags_6 = _RAND_22[25:0];
  _RAND_23 = {1{`RANDOM}};
  tags_7 = _RAND_23[25:0];
  _RAND_24 = {1{`RANDOM}};
  tags_8 = _RAND_24[25:0];
  _RAND_25 = {1{`RANDOM}};
  tags_9 = _RAND_25[25:0];
  _RAND_26 = {1{`RANDOM}};
  tags_10 = _RAND_26[25:0];
  _RAND_27 = {1{`RANDOM}};
  tags_11 = _RAND_27[25:0];
  _RAND_28 = {1{`RANDOM}};
  tags_12 = _RAND_28[25:0];
  _RAND_29 = {1{`RANDOM}};
  tags_13 = _RAND_29[25:0];
  _RAND_30 = {1{`RANDOM}};
  tags_14 = _RAND_30[25:0];
  _RAND_31 = {1{`RANDOM}};
  tags_15 = _RAND_31[25:0];
  _RAND_32 = {1{`RANDOM}};
  targets_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  targets_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  targets_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  targets_3 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  targets_4 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  targets_5 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  targets_6 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  targets_7 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  targets_8 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  targets_9 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  targets_10 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  targets_11 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  targets_12 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  targets_13 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  targets_14 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  targets_15 = _RAND_47[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstructionFetch(
  input         clock,
  input         reset,
  input         io_stall_flag_ctrl, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input         io_jump_flag_id, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input  [31:0] io_jump_address_id, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input  [31:0] io_rom_instruction, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input         io_btb_mispredict, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input  [31:0] io_btb_correction_addr, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input         io_btb_correct_prediction, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  output [31:0] io_instruction_address, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  output [31:0] io_id_instruction, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  output        io_btb_predicted_taken, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  output [31:0] io_btb_predicted_target, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input         io_btb_update_valid, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input  [31:0] io_btb_update_pc, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input  [31:0] io_btb_update_target, // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
  input         io_btb_update_taken // @[src/main/scala/riscv/core/InstructionFetch.scala 16:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  btb_clock; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire  btb_reset; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire [31:0] btb_io_pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire [31:0] btb_io_predicted_pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire  btb_io_predicted_taken; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire  btb_io_update_valid; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire [31:0] btb_io_update_pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire [31:0] btb_io_update_target; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  wire  btb_io_update_taken; // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
  reg [31:0] pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 41:19]
  reg  pending_jump; // @[src/main/scala/riscv/core/InstructionFetch.scala 56:34]
  reg [31:0] pending_jump_addr; // @[src/main/scala/riscv/core/InstructionFetch.scala 57:34]
  reg  prev_jump_flag; // @[src/main/scala/riscv/core/InstructionFetch.scala 65:31]
  reg [31:0] prev_jump_addr; // @[src/main/scala/riscv/core/InstructionFetch.scala 66:31]
  wire  _T_2 = ~io_stall_flag_ctrl; // @[src/main/scala/riscv/core/InstructionFetch.scala 73:14]
  wire  _GEN_0 = ~io_stall_flag_ctrl ? 1'h0 : pending_jump; // @[src/main/scala/riscv/core/InstructionFetch.scala 73:35 75:18 56:34]
  wire  _GEN_1 = io_stall_flag_ctrl & (io_jump_flag_id | prev_jump_flag) | _GEN_0; // @[src/main/scala/riscv/core/InstructionFetch.scala 70:67 71:23]
  wire  take_pending = pending_jump & _T_2; // @[src/main/scala/riscv/core/InstructionFetch.scala 79:35]
  wire  take_current = io_jump_flag_id & _T_2 & ~pending_jump & ~io_btb_correct_prediction; // @[src/main/scala/riscv/core/InstructionFetch.scala 81:78]
  wire  take_btb_correction = io_btb_mispredict & _T_2; // @[src/main/scala/riscv/core/InstructionFetch.scala 83:47]
  wire [31:0] _next_pc_T_1 = pc + 32'h4; // @[src/main/scala/riscv/core/InstructionFetch.scala 92:49]
  wire [31:0] _next_pc_T_2 = btb_io_predicted_taken ? btb_io_predicted_pc : _next_pc_T_1; // @[src/main/scala/riscv/core/InstructionFetch.scala 92:8]
  wire  _next_pc_T_4 = io_stall_flag_ctrl | ~io_instruction_valid; // @[src/main/scala/riscv/core/InstructionFetch.scala 97:27]
  wire [31:0] _next_pc_T_5 = _next_pc_T_4 ? pc : _next_pc_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  BranchTargetBuffer btb ( // @[src/main/scala/riscv/core/InstructionFetch.scala 44:19]
    .clock(btb_clock),
    .reset(btb_reset),
    .io_pc(btb_io_pc),
    .io_predicted_pc(btb_io_predicted_pc),
    .io_predicted_taken(btb_io_predicted_taken),
    .io_update_valid(btb_io_update_valid),
    .io_update_pc(btb_io_update_pc),
    .io_update_target(btb_io_update_target),
    .io_update_taken(btb_io_update_taken)
  );
  assign io_instruction_address = pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 103:26]
  assign io_id_instruction = io_instruction_valid ? io_rom_instruction : 32'h13; // @[src/main/scala/riscv/core/InstructionFetch.scala 104:32]
  assign io_btb_predicted_taken = btb_io_predicted_taken; // @[src/main/scala/riscv/core/InstructionFetch.scala 49:27]
  assign io_btb_predicted_target = btb_io_predicted_pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 50:27]
  assign btb_clock = clock;
  assign btb_reset = reset;
  assign btb_io_pc = pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 45:13]
  assign btb_io_update_valid = io_btb_update_valid; // @[src/main/scala/riscv/core/InstructionFetch.scala 107:24]
  assign btb_io_update_pc = io_btb_update_pc; // @[src/main/scala/riscv/core/InstructionFetch.scala 108:24]
  assign btb_io_update_target = io_btb_update_target; // @[src/main/scala/riscv/core/InstructionFetch.scala 109:24]
  assign btb_io_update_taken = io_btb_update_taken; // @[src/main/scala/riscv/core/InstructionFetch.scala 110:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 41:19]
      pc <= 32'h1000; // @[src/main/scala/riscv/core/InstructionFetch.scala 41:19]
    end else if (take_pending) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= pending_jump_addr;
    end else if (take_btb_correction) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= io_btb_correction_addr;
    end else if (take_current) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= io_jump_address_id;
    end else begin
      pc <= _next_pc_T_5;
    end
    if (reset) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 56:34]
      pending_jump <= 1'h0; // @[src/main/scala/riscv/core/InstructionFetch.scala 56:34]
    end else begin
      pending_jump <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 57:34]
      pending_jump_addr <= 32'h0; // @[src/main/scala/riscv/core/InstructionFetch.scala 57:34]
    end else if (io_stall_flag_ctrl & (io_jump_flag_id | prev_jump_flag)) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 70:67]
      if (io_jump_flag_id) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 72:29]
        pending_jump_addr <= io_jump_address_id;
      end else begin
        pending_jump_addr <= prev_jump_addr;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 65:31]
      prev_jump_flag <= 1'h0; // @[src/main/scala/riscv/core/InstructionFetch.scala 65:31]
    end else begin
      prev_jump_flag <= io_jump_flag_id; // @[src/main/scala/riscv/core/InstructionFetch.scala 65:31]
    end
    if (reset) begin // @[src/main/scala/riscv/core/InstructionFetch.scala 66:31]
      prev_jump_addr <= 32'h0; // @[src/main/scala/riscv/core/InstructionFetch.scala 66:31]
    end else begin
      prev_jump_addr <= io_jump_address_id; // @[src/main/scala/riscv/core/InstructionFetch.scala 66:31]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pending_jump = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pending_jump_addr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  prev_jump_flag = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  prev_jump_addr = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [31:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 32'h13; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 32'h13; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 32'h13; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 32'h13; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_1(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [31:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 32'h1000; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 32'h1000; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 32'h1000; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 32'h1000; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_2(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [31:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 32'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 32'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 32'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 32'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_3(
  input   clock,
  input   reset,
  input   io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input   io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input   io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output  io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg  out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 1'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 1'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 1'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 1'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IF2ID(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  input         io_flush, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  input         io_btb_predicted_taken, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  input  [31:0] io_btb_predicted_target, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  output        io_output_btb_predicted_taken, // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
  output [31:0] io_output_btb_predicted_target // @[src/main/scala/riscv/core/IF2ID.scala 12:14]
);
  wire  instruction_clock; // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
  wire  instruction_io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
  wire  instruction_io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
  wire  interrupt_flag_clock; // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
  wire  interrupt_flag_reset; // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
  wire  interrupt_flag_io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
  wire  interrupt_flag_io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
  wire [31:0] interrupt_flag_io_in; // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
  wire [31:0] interrupt_flag_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
  wire  btb_predicted_taken_clock; // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
  wire  btb_predicted_taken_reset; // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
  wire  btb_predicted_taken_io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
  wire  btb_predicted_taken_io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
  wire  btb_predicted_taken_io_in; // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
  wire  btb_predicted_taken_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
  wire  btb_predicted_target_clock; // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
  wire  btb_predicted_target_reset; // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
  wire  btb_predicted_target_io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
  wire  btb_predicted_target_io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
  wire [31:0] btb_predicted_target_io_in; // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
  wire [31:0] btb_predicted_target_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
  PipelineRegister instruction ( // @[src/main/scala/riscv/core/IF2ID.scala 28:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_stall(instruction_io_stall),
    .io_flush(instruction_io_flush),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_1 instruction_address ( // @[src/main/scala/riscv/core/IF2ID.scala 34:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 interrupt_flag ( // @[src/main/scala/riscv/core/IF2ID.scala 40:30]
    .clock(interrupt_flag_clock),
    .reset(interrupt_flag_reset),
    .io_stall(interrupt_flag_io_stall),
    .io_flush(interrupt_flag_io_flush),
    .io_in(interrupt_flag_io_in),
    .io_out(interrupt_flag_io_out)
  );
  PipelineRegister_3 btb_predicted_taken ( // @[src/main/scala/riscv/core/IF2ID.scala 47:35]
    .clock(btb_predicted_taken_clock),
    .reset(btb_predicted_taken_reset),
    .io_stall(btb_predicted_taken_io_stall),
    .io_flush(btb_predicted_taken_io_flush),
    .io_in(btb_predicted_taken_io_in),
    .io_out(btb_predicted_taken_io_out)
  );
  PipelineRegister_2 btb_predicted_target ( // @[src/main/scala/riscv/core/IF2ID.scala 53:36]
    .clock(btb_predicted_target_clock),
    .reset(btb_predicted_target_reset),
    .io_stall(btb_predicted_target_io_stall),
    .io_flush(btb_predicted_target_io_flush),
    .io_in(btb_predicted_target_io_in),
    .io_out(btb_predicted_target_io_out)
  );
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 32:25]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 38:33]
  assign io_output_btb_predicted_taken = btb_predicted_taken_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 51:63]
  assign io_output_btb_predicted_target = btb_predicted_target_io_out; // @[src/main/scala/riscv/core/IF2ID.scala 57:34]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_stall = io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 30:25]
  assign instruction_io_flush = io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 31:25]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/IF2ID.scala 29:25]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 36:33]
  assign instruction_address_io_flush = io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 37:33]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/IF2ID.scala 35:33]
  assign interrupt_flag_clock = clock;
  assign interrupt_flag_reset = reset;
  assign interrupt_flag_io_stall = io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 42:28]
  assign interrupt_flag_io_flush = io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 43:28]
  assign interrupt_flag_io_in = io_interrupt_flag; // @[src/main/scala/riscv/core/IF2ID.scala 41:28]
  assign btb_predicted_taken_clock = clock;
  assign btb_predicted_taken_reset = reset;
  assign btb_predicted_taken_io_stall = io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 49:33]
  assign btb_predicted_taken_io_flush = io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 50:33]
  assign btb_predicted_taken_io_in = io_btb_predicted_taken; // @[src/main/scala/riscv/core/IF2ID.scala 48:33]
  assign btb_predicted_target_clock = clock;
  assign btb_predicted_target_reset = reset;
  assign btb_predicted_target_io_stall = io_stall; // @[src/main/scala/riscv/core/IF2ID.scala 55:34]
  assign btb_predicted_target_io_flush = io_flush; // @[src/main/scala/riscv/core/IF2ID.scala 56:34]
  assign btb_predicted_target_io_in = io_btb_predicted_target; // @[src/main/scala/riscv/core/IF2ID.scala 54:34]
endmodule
module InstructionDecode(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [1:0]  io_reg1_forward, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [1:0]  io_reg2_forward, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input         io_interrupt_assert, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input  [31:0] io_interrupt_handler_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  input         io_branch_hazard, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [4:0]  io_regs_reg1_read_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [4:0]  io_regs_reg2_read_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [31:0] io_ex_immediate, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ex_aluop1_source, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ex_aluop2_source, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ex_memory_read_enable, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ex_memory_write_enable, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [1:0]  io_ex_reg_write_source, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ex_reg_write_enable, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [4:0]  io_ex_reg_write_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [11:0] io_ex_csr_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ex_csr_write_enable, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_ctrl_jump_instruction, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_clint_jump_flag, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [31:0] io_clint_jump_address, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output        io_if_jump_flag, // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
  output [31:0] io_if_jump_address // @[src/main/scala/riscv/core/InstructionDecode.scala 12:14]
);
  wire [6:0] opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/InstructionDecode.scala 45:30]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/InstructionDecode.scala 46:30]
  wire [4:0] rs1 = io_instruction[19:15]; // @[src/main/scala/riscv/core/InstructionDecode.scala 49:30]
  wire [4:0] rs2 = io_instruction[24:20]; // @[src/main/scala/riscv/core/InstructionDecode.scala 50:30]
  wire  _csr_uses_uimm_T = opcode == 7'h73; // @[src/main/scala/riscv/core/InstructionDecode.scala 54:30]
  wire  _csr_uses_uimm_T_1 = funct3 == 3'h5; // @[src/main/scala/riscv/core/InstructionDecode.scala 55:12]
  wire  _csr_uses_uimm_T_2 = funct3 == 3'h7; // @[src/main/scala/riscv/core/InstructionDecode.scala 56:14]
  wire  _csr_uses_uimm_T_3 = funct3 == 3'h5 | _csr_uses_uimm_T_2; // @[src/main/scala/riscv/core/InstructionDecode.scala 55:43]
  wire  _csr_uses_uimm_T_4 = funct3 == 3'h6; // @[src/main/scala/riscv/core/InstructionDecode.scala 57:14]
  wire  _csr_uses_uimm_T_5 = _csr_uses_uimm_T_3 | _csr_uses_uimm_T_4; // @[src/main/scala/riscv/core/InstructionDecode.scala 56:45]
  wire  csr_uses_uimm = opcode == 7'h73 & _csr_uses_uimm_T_5; // @[src/main/scala/riscv/core/InstructionDecode.scala 54:51]
  wire  _uses_rs1_T = opcode == 7'h33; // @[src/main/scala/riscv/core/InstructionDecode.scala 59:26]
  wire  _uses_rs1_T_3 = opcode == 7'h3; // @[src/main/scala/riscv/core/InstructionDecode.scala 60:13]
  wire  _uses_rs1_T_4 = opcode == 7'h33 | opcode == 7'h13 | _uses_rs1_T_3; // @[src/main/scala/riscv/core/InstructionDecode.scala 59:86]
  wire  _uses_rs1_T_5 = opcode == 7'h23; // @[src/main/scala/riscv/core/InstructionDecode.scala 60:48]
  wire  _uses_rs1_T_7 = opcode == 7'h63; // @[src/main/scala/riscv/core/InstructionDecode.scala 60:83]
  wire  _uses_rs1_T_9 = opcode == 7'h67; // @[src/main/scala/riscv/core/InstructionDecode.scala 61:13]
  wire  _uses_rs1_T_10 = _uses_rs1_T_4 | opcode == 7'h23 | opcode == 7'h63 | _uses_rs1_T_9; // @[src/main/scala/riscv/core/InstructionDecode.scala 60:107]
  wire  uses_rs1 = _uses_rs1_T_10 | _csr_uses_uimm_T & ~csr_uses_uimm; // @[src/main/scala/riscv/core/InstructionDecode.scala 61:36]
  wire  uses_rs2 = _uses_rs1_T | _uses_rs1_T_5 | _uses_rs1_T_7; // @[src/main/scala/riscv/core/InstructionDecode.scala 62:86]
  wire [19:0] _io_ex_immediate_T_1 = io_instruction[31] ? 20'hfffff : 20'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 68:13]
  wire [31:0] _io_ex_immediate_T_3 = {_io_ex_immediate_T_1,io_instruction[31:20]}; // @[src/main/scala/riscv/core/InstructionDecode.scala 68:8]
  wire [20:0] _io_ex_immediate_T_5 = io_instruction[31] ? 21'h1fffff : 21'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 71:37]
  wire [31:0] _io_ex_immediate_T_7 = {_io_ex_immediate_T_5,io_instruction[30:20]}; // @[src/main/scala/riscv/core/InstructionDecode.scala 71:32]
  wire [31:0] _io_ex_immediate_T_20 = {_io_ex_immediate_T_5,io_instruction[30:25],io_instruction[11:7]}; // @[src/main/scala/riscv/core/InstructionDecode.scala 74:32]
  wire [31:0] _io_ex_immediate_T_26 = {_io_ex_immediate_T_1,io_instruction[7],io_instruction[30:25],io_instruction[11:8]
    ,1'h0}; // @[src/main/scala/riscv/core/InstructionDecode.scala 75:32]
  wire [31:0] _io_ex_immediate_T_28 = {io_instruction[31:12],12'h0}; // @[src/main/scala/riscv/core/InstructionDecode.scala 82:32]
  wire [11:0] _io_ex_immediate_T_32 = io_instruction[31] ? 12'hfff : 12'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 85:13]
  wire [31:0] _io_ex_immediate_T_36 = {_io_ex_immediate_T_32,io_instruction[19:12],io_instruction[20],io_instruction[30:
    21],1'h0}; // @[src/main/scala/riscv/core/InstructionDecode.scala 84:30]
  wire [31:0] _io_ex_immediate_T_38 = 7'h13 == opcode ? _io_ex_immediate_T_7 : _io_ex_immediate_T_3; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire  _io_ex_immediate_T_39 = 7'h3 == opcode; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire [31:0] _io_ex_immediate_T_40 = 7'h3 == opcode ? _io_ex_immediate_T_7 : _io_ex_immediate_T_38; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire  _io_ex_immediate_T_41 = 7'h67 == opcode; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire [31:0] _io_ex_immediate_T_42 = 7'h67 == opcode ? _io_ex_immediate_T_7 : _io_ex_immediate_T_40; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire [31:0] _io_ex_immediate_T_44 = 7'h23 == opcode ? _io_ex_immediate_T_20 : _io_ex_immediate_T_42; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire  _io_ex_immediate_T_45 = 7'h63 == opcode; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire [31:0] _io_ex_immediate_T_46 = 7'h63 == opcode ? _io_ex_immediate_T_26 : _io_ex_immediate_T_44; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire [31:0] _io_ex_immediate_T_48 = 7'h37 == opcode ? _io_ex_immediate_T_28 : _io_ex_immediate_T_46; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire [31:0] _io_ex_immediate_T_50 = 7'h17 == opcode ? _io_ex_immediate_T_28 : _io_ex_immediate_T_48; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire  _io_ex_immediate_T_51 = 7'h6f == opcode; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  wire  _io_ex_aluop1_source_T = opcode == 7'h17; // @[src/main/scala/riscv/core/InstructionDecode.scala 94:12]
  wire  _io_ex_aluop1_source_T_3 = opcode == 7'h6f; // @[src/main/scala/riscv/core/InstructionDecode.scala 94:78]
  wire [1:0] _io_ex_reg_write_source_T_1 = _io_ex_immediate_T_39 ? 2'h1 : 2'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
  wire [1:0] _io_ex_reg_write_source_T_3 = 7'h73 == opcode ? 2'h2 : _io_ex_reg_write_source_T_1; // @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
  wire [1:0] _io_ex_reg_write_source_T_5 = _io_ex_immediate_T_51 ? 2'h3 : _io_ex_reg_write_source_T_3; // @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
  wire  _io_ex_reg_write_enable_T_10 = _uses_rs1_T_4 | _io_ex_aluop1_source_T | opcode == 7'h37 |
    _io_ex_aluop1_source_T_3; // @[src/main/scala/riscv/core/InstructionDecode.scala 117:105]
  wire  _io_ex_csr_write_enable_T_4 = funct3 == 3'h2; // @[src/main/scala/riscv/core/InstructionDecode.scala 123:14]
  wire  _io_ex_csr_write_enable_T_5 = funct3 == 3'h1 | _csr_uses_uimm_T_1 | _io_ex_csr_write_enable_T_4; // @[src/main/scala/riscv/core/InstructionDecode.scala 122:83]
  wire  _io_ex_csr_write_enable_T_8 = funct3 == 3'h3; // @[src/main/scala/riscv/core/InstructionDecode.scala 124:14]
  wire  _io_ex_csr_write_enable_T_9 = _io_ex_csr_write_enable_T_5 | _csr_uses_uimm_T_4 | _io_ex_csr_write_enable_T_8; // @[src/main/scala/riscv/core/InstructionDecode.scala 123:85]
  wire  _io_ex_csr_write_enable_T_11 = _io_ex_csr_write_enable_T_9 | _csr_uses_uimm_T_2; // @[src/main/scala/riscv/core/InstructionDecode.scala 124:44]
  wire [31:0] _reg1_data_forwarded_T_1 = 2'h0 == io_reg1_forward ? io_reg1_data : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
  wire [31:0] _reg1_data_forwarded_T_3 = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_forwarded_T_1; // @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
  wire [31:0] reg1_data_forwarded = 2'h1 == io_reg1_forward ? io_forward_from_mem : _reg1_data_forwarded_T_3; // @[src/main/scala/riscv/core/InstructionDecode.scala 129:60]
  wire [31:0] _reg2_data_forwarded_T_1 = 2'h0 == io_reg2_forward ? io_reg2_data : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
  wire [31:0] _reg2_data_forwarded_T_3 = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_forwarded_T_1; // @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
  wire [31:0] reg2_data_forwarded = 2'h1 == io_reg2_forward ? io_forward_from_mem : _reg2_data_forwarded_T_3; // @[src/main/scala/riscv/core/InstructionDecode.scala 136:60]
  wire [31:0] reg1_data = uses_rs1 ? reg1_data_forwarded : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 143:22]
  wire [31:0] reg2_data = uses_rs2 ? reg2_data_forwarded : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 144:22]
  wire  _io_ctrl_jump_instruction_T_2 = _io_ex_aluop1_source_T_3 | _uses_rs1_T_9; // @[src/main/scala/riscv/core/InstructionDecode.scala 145:59]
  wire  _branch_taken_T_5 = reg1_data == reg2_data; // @[src/main/scala/riscv/core/InstructionDecode.scala 162:48]
  wire  _branch_taken_T_6 = reg1_data != reg2_data; // @[src/main/scala/riscv/core/InstructionDecode.scala 163:48]
  wire [31:0] _branch_taken_T_7 = uses_rs1 ? reg1_data_forwarded : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 164:48]
  wire [31:0] _branch_taken_T_8 = uses_rs2 ? reg2_data_forwarded : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 164:67]
  wire  _branch_taken_T_9 = $signed(_branch_taken_T_7) < $signed(_branch_taken_T_8); // @[src/main/scala/riscv/core/InstructionDecode.scala 164:55]
  wire  _branch_taken_T_12 = $signed(_branch_taken_T_7) >= $signed(_branch_taken_T_8); // @[src/main/scala/riscv/core/InstructionDecode.scala 165:55]
  wire  _branch_taken_T_13 = reg1_data < reg2_data; // @[src/main/scala/riscv/core/InstructionDecode.scala 166:55]
  wire  _branch_taken_T_14 = reg1_data >= reg2_data; // @[src/main/scala/riscv/core/InstructionDecode.scala 167:55]
  wire  _branch_taken_T_18 = 3'h1 == funct3 ? _branch_taken_T_6 : 3'h0 == funct3 & _branch_taken_T_5; // @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
  wire  _branch_taken_T_20 = 3'h4 == funct3 ? _branch_taken_T_9 : _branch_taken_T_18; // @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
  wire  _branch_taken_T_22 = 3'h5 == funct3 ? _branch_taken_T_12 : _branch_taken_T_20; // @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
  wire  _branch_taken_T_24 = 3'h6 == funct3 ? _branch_taken_T_13 : _branch_taken_T_22; // @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
  wire  _branch_taken_T_26 = 3'h7 == funct3 ? _branch_taken_T_14 : _branch_taken_T_24; // @[src/main/scala/riscv/core/InstructionDecode.scala 160:8]
  wire  _branch_taken_T_27 = _uses_rs1_T_7 & _branch_taken_T_26; // @[src/main/scala/riscv/core/InstructionDecode.scala 157:39]
  wire  _branch_taken_T_28 = _io_ctrl_jump_instruction_T_2 | _branch_taken_T_27; // @[src/main/scala/riscv/core/InstructionDecode.scala 156:38]
  wire  branch_taken = ~io_branch_hazard & _branch_taken_T_28; // @[src/main/scala/riscv/core/InstructionDecode.scala 154:40]
  wire [31:0] _jalr_target_T_1 = reg1_data + io_ex_immediate; // @[src/main/scala/riscv/core/InstructionDecode.scala 174:36]
  wire [31:0] jalr_target = {_jalr_target_T_1[31:1],1'h0}; // @[src/main/scala/riscv/core/InstructionDecode.scala 174:24]
  wire [31:0] _io_if_jump_address_T_1 = io_instruction_address + io_ex_immediate; // @[src/main/scala/riscv/core/InstructionDecode.scala 181:55]
  wire [31:0] _io_if_jump_address_T_5 = _io_ex_immediate_T_45 ? _io_if_jump_address_T_1 : 32'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
  wire [31:0] _io_if_jump_address_T_7 = _io_ex_immediate_T_51 ? _io_if_jump_address_T_1 : _io_if_jump_address_T_5; // @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
  wire [31:0] _io_if_jump_address_T_9 = _io_ex_immediate_T_41 ? jalr_target : _io_if_jump_address_T_7; // @[src/main/scala/riscv/core/InstructionDecode.scala 179:27]
  assign io_regs_reg1_read_address = uses_rs1 ? rs1 : 5'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 64:35]
  assign io_regs_reg2_read_address = uses_rs2 ? rs2 : 5'h0; // @[src/main/scala/riscv/core/InstructionDecode.scala 65:35]
  assign io_ex_immediate = 7'h6f == opcode ? _io_ex_immediate_T_36 : _io_ex_immediate_T_50; // @[src/main/scala/riscv/core/InstructionDecode.scala 69:4]
  assign io_ex_aluop1_source = opcode == 7'h17 | _uses_rs1_T_7 | opcode == 7'h6f; // @[src/main/scala/riscv/core/InstructionDecode.scala 94:68]
  assign io_ex_aluop2_source = _uses_rs1_T ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/InstructionDecode.scala 98:29]
  assign io_ex_memory_read_enable = opcode == 7'h3; // @[src/main/scala/riscv/core/InstructionDecode.scala 103:39]
  assign io_ex_memory_write_enable = opcode == 7'h23; // @[src/main/scala/riscv/core/InstructionDecode.scala 104:39]
  assign io_ex_reg_write_source = _io_ex_immediate_T_41 ? 2'h3 : _io_ex_reg_write_source_T_5; // @[src/main/scala/riscv/core/InstructionDecode.scala 108:4]
  assign io_ex_reg_write_enable = _io_ex_reg_write_enable_T_10 | _uses_rs1_T_9 | _csr_uses_uimm_T; // @[src/main/scala/riscv/core/InstructionDecode.scala 118:69]
  assign io_ex_reg_write_address = io_instruction[11:7]; // @[src/main/scala/riscv/core/InstructionDecode.scala 119:44]
  assign io_ex_csr_address = io_instruction[31:20]; // @[src/main/scala/riscv/core/InstructionDecode.scala 120:44]
  assign io_ex_csr_write_enable = _csr_uses_uimm_T & _io_ex_csr_write_enable_T_11; // @[src/main/scala/riscv/core/InstructionDecode.scala 121:59]
  assign io_ctrl_jump_instruction = _io_ctrl_jump_instruction_T_2 | _uses_rs1_T_7; // @[src/main/scala/riscv/core/InstructionDecode.scala 146:36]
  assign io_clint_jump_flag = io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/InstructionDecode.scala 187:22]
  assign io_clint_jump_address = _io_ex_immediate_T_41 ? jalr_target : _io_if_jump_address_T_7; // @[src/main/scala/riscv/core/InstructionDecode.scala 191:4]
  assign io_if_jump_flag = branch_taken | io_interrupt_assert; // @[src/main/scala/riscv/core/InstructionDecode.scala 172:35]
  assign io_if_jump_address = io_interrupt_assert ? io_interrupt_handler_address : _io_if_jump_address_T_9; // @[src/main/scala/riscv/core/InstructionDecode.scala 176:28]
endmodule
module PipelineRegister_7(
  input        clock,
  input        reset,
  input        io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input        io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [4:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [4:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [4:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 5'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 5'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 5'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 5'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_11(
  input        clock,
  input        reset,
  input        io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input        io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [1:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [1:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [1:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 2'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 2'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 2'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 2'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_18(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [11:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [11:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [11:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 12'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      myreg <= 12'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 12'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 19:18]
      out <= 12'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 20:11]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID2EX(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_flush, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [4:0]  io_regs_reg1_read_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [4:0]  io_regs_reg2_read_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [4:0]  io_regs_write_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_csr_write_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [11:0] io_csr_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [4:0]  io_output_regs_reg1_read_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [4:0]  io_output_regs_reg2_read_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [4:0]  io_output_regs_write_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [31:0] io_output_reg1_data, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [31:0] io_output_reg2_data, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [31:0] io_output_immediate, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output        io_output_aluop1_source, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output        io_output_aluop2_source, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output        io_output_csr_write_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [11:0] io_output_csr_address, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output        io_output_memory_read_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output        io_output_memory_write_enable, // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/ID2EX.scala 12:14]
);
  wire  instruction_clock; // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
  wire  instruction_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
  wire  instruction_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
  wire  regs_reg1_read_address_clock; // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
  wire  regs_reg1_read_address_reset; // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
  wire  regs_reg1_read_address_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
  wire  regs_reg1_read_address_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
  wire [4:0] regs_reg1_read_address_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
  wire [4:0] regs_reg1_read_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
  wire  regs_reg2_read_address_clock; // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
  wire  regs_reg2_read_address_reset; // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
  wire  regs_reg2_read_address_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
  wire  regs_reg2_read_address_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
  wire [4:0] regs_reg2_read_address_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
  wire [4:0] regs_reg2_read_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
  wire  regs_write_enable_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
  wire  regs_write_enable_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
  wire  regs_write_address_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
  wire  regs_write_address_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
  wire  regs_write_source_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
  wire  regs_write_source_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
  wire  reg1_data_clock; // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
  wire  reg1_data_reset; // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
  wire  reg1_data_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
  wire  reg1_data_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
  wire [31:0] reg1_data_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
  wire [31:0] reg1_data_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
  wire  reg2_data_clock; // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
  wire  reg2_data_reset; // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
  wire  reg2_data_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
  wire  reg2_data_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
  wire [31:0] reg2_data_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
  wire [31:0] reg2_data_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
  wire  immediate_clock; // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
  wire  immediate_reset; // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
  wire  immediate_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
  wire  immediate_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
  wire [31:0] immediate_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
  wire [31:0] immediate_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
  wire  aluop1_source_clock; // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
  wire  aluop1_source_reset; // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
  wire  aluop1_source_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
  wire  aluop1_source_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
  wire  aluop1_source_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
  wire  aluop1_source_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
  wire  aluop2_source_clock; // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
  wire  aluop2_source_reset; // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
  wire  aluop2_source_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
  wire  aluop2_source_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
  wire  aluop2_source_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
  wire  aluop2_source_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
  wire  csr_write_enable_clock; // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
  wire  csr_write_enable_reset; // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
  wire  csr_write_enable_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
  wire  csr_write_enable_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
  wire  csr_write_enable_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
  wire  csr_write_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
  wire  csr_address_clock; // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
  wire  csr_address_reset; // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
  wire  csr_address_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
  wire  csr_address_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
  wire [11:0] csr_address_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
  wire [11:0] csr_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
  wire  memory_read_enable_clock; // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
  wire  memory_read_enable_reset; // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
  wire  memory_read_enable_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
  wire  memory_read_enable_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
  wire  memory_read_enable_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
  wire  memory_read_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
  wire  memory_write_enable_clock; // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
  wire  memory_write_enable_reset; // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
  wire  memory_write_enable_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
  wire  memory_write_enable_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
  wire  memory_write_enable_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
  wire  memory_write_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
  wire  csr_read_data_io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
  wire  csr_read_data_io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
  PipelineRegister instruction ( // @[src/main/scala/riscv/core/ID2EX.scala 53:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_stall(instruction_io_stall),
    .io_flush(instruction_io_flush),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_1 instruction_address ( // @[src/main/scala/riscv/core/ID2EX.scala 59:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_7 regs_reg1_read_address ( // @[src/main/scala/riscv/core/ID2EX.scala 65:38]
    .clock(regs_reg1_read_address_clock),
    .reset(regs_reg1_read_address_reset),
    .io_stall(regs_reg1_read_address_io_stall),
    .io_flush(regs_reg1_read_address_io_flush),
    .io_in(regs_reg1_read_address_io_in),
    .io_out(regs_reg1_read_address_io_out)
  );
  PipelineRegister_7 regs_reg2_read_address ( // @[src/main/scala/riscv/core/ID2EX.scala 71:38]
    .clock(regs_reg2_read_address_clock),
    .reset(regs_reg2_read_address_reset),
    .io_stall(regs_reg2_read_address_io_stall),
    .io_flush(regs_reg2_read_address_io_flush),
    .io_in(regs_reg2_read_address_io_in),
    .io_out(regs_reg2_read_address_io_out)
  );
  PipelineRegister_3 regs_write_enable ( // @[src/main/scala/riscv/core/ID2EX.scala 77:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_stall(regs_write_enable_io_stall),
    .io_flush(regs_write_enable_io_flush),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_7 regs_write_address ( // @[src/main/scala/riscv/core/ID2EX.scala 83:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_stall(regs_write_address_io_stall),
    .io_flush(regs_write_address_io_flush),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_11 regs_write_source ( // @[src/main/scala/riscv/core/ID2EX.scala 89:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_stall(regs_write_source_io_stall),
    .io_flush(regs_write_source_io_flush),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_2 reg1_data ( // @[src/main/scala/riscv/core/ID2EX.scala 95:25]
    .clock(reg1_data_clock),
    .reset(reg1_data_reset),
    .io_stall(reg1_data_io_stall),
    .io_flush(reg1_data_io_flush),
    .io_in(reg1_data_io_in),
    .io_out(reg1_data_io_out)
  );
  PipelineRegister_2 reg2_data ( // @[src/main/scala/riscv/core/ID2EX.scala 101:25]
    .clock(reg2_data_clock),
    .reset(reg2_data_reset),
    .io_stall(reg2_data_io_stall),
    .io_flush(reg2_data_io_flush),
    .io_in(reg2_data_io_in),
    .io_out(reg2_data_io_out)
  );
  PipelineRegister_2 immediate ( // @[src/main/scala/riscv/core/ID2EX.scala 107:25]
    .clock(immediate_clock),
    .reset(immediate_reset),
    .io_stall(immediate_io_stall),
    .io_flush(immediate_io_flush),
    .io_in(immediate_io_in),
    .io_out(immediate_io_out)
  );
  PipelineRegister_3 aluop1_source ( // @[src/main/scala/riscv/core/ID2EX.scala 113:29]
    .clock(aluop1_source_clock),
    .reset(aluop1_source_reset),
    .io_stall(aluop1_source_io_stall),
    .io_flush(aluop1_source_io_flush),
    .io_in(aluop1_source_io_in),
    .io_out(aluop1_source_io_out)
  );
  PipelineRegister_3 aluop2_source ( // @[src/main/scala/riscv/core/ID2EX.scala 119:29]
    .clock(aluop2_source_clock),
    .reset(aluop2_source_reset),
    .io_stall(aluop2_source_io_stall),
    .io_flush(aluop2_source_io_flush),
    .io_in(aluop2_source_io_in),
    .io_out(aluop2_source_io_out)
  );
  PipelineRegister_3 csr_write_enable ( // @[src/main/scala/riscv/core/ID2EX.scala 125:32]
    .clock(csr_write_enable_clock),
    .reset(csr_write_enable_reset),
    .io_stall(csr_write_enable_io_stall),
    .io_flush(csr_write_enable_io_flush),
    .io_in(csr_write_enable_io_in),
    .io_out(csr_write_enable_io_out)
  );
  PipelineRegister_18 csr_address ( // @[src/main/scala/riscv/core/ID2EX.scala 131:27]
    .clock(csr_address_clock),
    .reset(csr_address_reset),
    .io_stall(csr_address_io_stall),
    .io_flush(csr_address_io_flush),
    .io_in(csr_address_io_in),
    .io_out(csr_address_io_out)
  );
  PipelineRegister_3 memory_read_enable ( // @[src/main/scala/riscv/core/ID2EX.scala 137:34]
    .clock(memory_read_enable_clock),
    .reset(memory_read_enable_reset),
    .io_stall(memory_read_enable_io_stall),
    .io_flush(memory_read_enable_io_flush),
    .io_in(memory_read_enable_io_in),
    .io_out(memory_read_enable_io_out)
  );
  PipelineRegister_3 memory_write_enable ( // @[src/main/scala/riscv/core/ID2EX.scala 143:35]
    .clock(memory_write_enable_clock),
    .reset(memory_write_enable_reset),
    .io_stall(memory_write_enable_io_stall),
    .io_flush(memory_write_enable_io_flush),
    .io_in(memory_write_enable_io_in),
    .io_out(memory_write_enable_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/ID2EX.scala 149:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_stall(csr_read_data_io_stall),
    .io_flush(csr_read_data_io_flush),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 57:25]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 63:33]
  assign io_output_regs_reg1_read_address = regs_reg1_read_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 69:36]
  assign io_output_regs_reg2_read_address = regs_reg2_read_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 75:36]
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 81:31]
  assign io_output_regs_write_address = regs_write_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 87:32]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 93:31]
  assign io_output_reg1_data = reg1_data_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 99:23]
  assign io_output_reg2_data = reg2_data_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 105:23]
  assign io_output_immediate = immediate_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 111:23]
  assign io_output_aluop1_source = aluop1_source_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 117:27]
  assign io_output_aluop2_source = aluop2_source_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 123:27]
  assign io_output_csr_write_enable = csr_write_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 129:30]
  assign io_output_csr_address = csr_address_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 135:25]
  assign io_output_memory_read_enable = memory_read_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 141:32]
  assign io_output_memory_write_enable = memory_write_enable_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 147:33]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/ID2EX.scala 153:27]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 55:25]
  assign instruction_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 56:25]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/ID2EX.scala 54:25]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 61:33]
  assign instruction_address_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 62:33]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/ID2EX.scala 60:33]
  assign regs_reg1_read_address_clock = clock;
  assign regs_reg1_read_address_reset = reset;
  assign regs_reg1_read_address_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 67:36]
  assign regs_reg1_read_address_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 68:36]
  assign regs_reg1_read_address_io_in = io_regs_reg1_read_address; // @[src/main/scala/riscv/core/ID2EX.scala 66:36]
  assign regs_reg2_read_address_clock = clock;
  assign regs_reg2_read_address_reset = reset;
  assign regs_reg2_read_address_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 73:36]
  assign regs_reg2_read_address_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 74:36]
  assign regs_reg2_read_address_io_in = io_regs_reg2_read_address; // @[src/main/scala/riscv/core/ID2EX.scala 72:36]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 79:31]
  assign regs_write_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 80:31]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/ID2EX.scala 78:31]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 85:32]
  assign regs_write_address_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 86:32]
  assign regs_write_address_io_in = io_regs_write_address; // @[src/main/scala/riscv/core/ID2EX.scala 84:32]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 91:31]
  assign regs_write_source_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 92:31]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/ID2EX.scala 90:31]
  assign reg1_data_clock = clock;
  assign reg1_data_reset = reset;
  assign reg1_data_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 97:23]
  assign reg1_data_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 98:23]
  assign reg1_data_io_in = io_reg1_data; // @[src/main/scala/riscv/core/ID2EX.scala 96:23]
  assign reg2_data_clock = clock;
  assign reg2_data_reset = reset;
  assign reg2_data_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 103:23]
  assign reg2_data_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 104:23]
  assign reg2_data_io_in = io_reg2_data; // @[src/main/scala/riscv/core/ID2EX.scala 102:23]
  assign immediate_clock = clock;
  assign immediate_reset = reset;
  assign immediate_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 109:23]
  assign immediate_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 110:23]
  assign immediate_io_in = io_immediate; // @[src/main/scala/riscv/core/ID2EX.scala 108:23]
  assign aluop1_source_clock = clock;
  assign aluop1_source_reset = reset;
  assign aluop1_source_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 115:27]
  assign aluop1_source_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 116:27]
  assign aluop1_source_io_in = io_aluop1_source; // @[src/main/scala/riscv/core/ID2EX.scala 114:27]
  assign aluop2_source_clock = clock;
  assign aluop2_source_reset = reset;
  assign aluop2_source_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 121:27]
  assign aluop2_source_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 122:27]
  assign aluop2_source_io_in = io_aluop2_source; // @[src/main/scala/riscv/core/ID2EX.scala 120:27]
  assign csr_write_enable_clock = clock;
  assign csr_write_enable_reset = reset;
  assign csr_write_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 127:30]
  assign csr_write_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 128:30]
  assign csr_write_enable_io_in = io_csr_write_enable; // @[src/main/scala/riscv/core/ID2EX.scala 126:30]
  assign csr_address_clock = clock;
  assign csr_address_reset = reset;
  assign csr_address_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 133:25]
  assign csr_address_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 134:25]
  assign csr_address_io_in = io_csr_address; // @[src/main/scala/riscv/core/ID2EX.scala 132:25]
  assign memory_read_enable_clock = clock;
  assign memory_read_enable_reset = reset;
  assign memory_read_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 139:32]
  assign memory_read_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 140:32]
  assign memory_read_enable_io_in = io_memory_read_enable; // @[src/main/scala/riscv/core/ID2EX.scala 138:32]
  assign memory_write_enable_clock = clock;
  assign memory_write_enable_reset = reset;
  assign memory_write_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 145:33]
  assign memory_write_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 146:33]
  assign memory_write_enable_io_in = io_memory_write_enable; // @[src/main/scala/riscv/core/ID2EX.scala 144:33]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_stall = io_stall; // @[src/main/scala/riscv/core/ID2EX.scala 151:27]
  assign csr_read_data_io_flush = io_flush; // @[src/main/scala/riscv/core/ID2EX.scala 152:27]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/ID2EX.scala 150:27]
endmodule
module ALU(
  input  [3:0]  io_func, // @[src/main/scala/riscv/core/ALU.scala 27:14]
  input  [31:0] io_op1, // @[src/main/scala/riscv/core/ALU.scala 27:14]
  input  [31:0] io_op2, // @[src/main/scala/riscv/core/ALU.scala 27:14]
  output [31:0] io_result // @[src/main/scala/riscv/core/ALU.scala 27:14]
);
  wire [31:0] _io_result_T_1 = io_op1 + io_op2; // @[src/main/scala/riscv/core/ALU.scala 39:27]
  wire [31:0] _io_result_T_3 = io_op1 - io_op2; // @[src/main/scala/riscv/core/ALU.scala 42:27]
  wire [62:0] _GEN_10 = {{31'd0}, io_op1}; // @[src/main/scala/riscv/core/ALU.scala 45:27]
  wire [62:0] _io_result_T_5 = _GEN_10 << io_op2[4:0]; // @[src/main/scala/riscv/core/ALU.scala 45:27]
  wire [31:0] _io_result_T_6 = io_op1; // @[src/main/scala/riscv/core/ALU.scala 48:27]
  wire [31:0] _io_result_T_7 = io_op2; // @[src/main/scala/riscv/core/ALU.scala 48:43]
  wire [31:0] _io_result_T_9 = io_op1 ^ io_op2; // @[src/main/scala/riscv/core/ALU.scala 51:27]
  wire [31:0] _io_result_T_10 = io_op1 | io_op2; // @[src/main/scala/riscv/core/ALU.scala 54:27]
  wire [31:0] _io_result_T_11 = io_op1 & io_op2; // @[src/main/scala/riscv/core/ALU.scala 57:27]
  wire [31:0] _io_result_T_13 = io_op1 >> io_op2[4:0]; // @[src/main/scala/riscv/core/ALU.scala 60:27]
  wire [31:0] _io_result_T_17 = $signed(io_op1) >>> io_op2[4:0]; // @[src/main/scala/riscv/core/ALU.scala 63:52]
  wire  _GEN_0 = 4'ha == io_func & io_op1 < io_op2; // @[src/main/scala/riscv/core/ALU.scala 36:13 37:19 66:17]
  wire [31:0] _GEN_1 = 4'h9 == io_func ? _io_result_T_17 : {{31'd0}, _GEN_0}; // @[src/main/scala/riscv/core/ALU.scala 37:19 63:17]
  wire [31:0] _GEN_2 = 4'h8 == io_func ? _io_result_T_13 : _GEN_1; // @[src/main/scala/riscv/core/ALU.scala 37:19 60:17]
  wire [31:0] _GEN_3 = 4'h7 == io_func ? _io_result_T_11 : _GEN_2; // @[src/main/scala/riscv/core/ALU.scala 37:19 57:17]
  wire [31:0] _GEN_4 = 4'h6 == io_func ? _io_result_T_10 : _GEN_3; // @[src/main/scala/riscv/core/ALU.scala 37:19 54:17]
  wire [31:0] _GEN_5 = 4'h5 == io_func ? _io_result_T_9 : _GEN_4; // @[src/main/scala/riscv/core/ALU.scala 37:19 51:17]
  wire [31:0] _GEN_6 = 4'h4 == io_func ? {{31'd0}, $signed(_io_result_T_6) < $signed(_io_result_T_7)} : _GEN_5; // @[src/main/scala/riscv/core/ALU.scala 37:19 48:17]
  wire [62:0] _GEN_7 = 4'h3 == io_func ? _io_result_T_5 : {{31'd0}, _GEN_6}; // @[src/main/scala/riscv/core/ALU.scala 37:19 45:17]
  wire [62:0] _GEN_8 = 4'h2 == io_func ? {{31'd0}, _io_result_T_3} : _GEN_7; // @[src/main/scala/riscv/core/ALU.scala 37:19 42:17]
  wire [62:0] _GEN_9 = 4'h1 == io_func ? {{31'd0}, _io_result_T_1} : _GEN_8; // @[src/main/scala/riscv/core/ALU.scala 37:19 39:17]
  assign io_result = _GEN_9[31:0];
endmodule
module ALUControl(
  input  [6:0] io_opcode, // @[src/main/scala/riscv/core/ALUControl.scala 15:14]
  input  [2:0] io_funct3, // @[src/main/scala/riscv/core/ALUControl.scala 15:14]
  input  [6:0] io_funct7, // @[src/main/scala/riscv/core/ALUControl.scala 15:14]
  output [3:0] io_alu_funct // @[src/main/scala/riscv/core/ALUControl.scala 15:14]
);
  wire [3:0] _io_alu_funct_T_1 = io_funct7[5] ? 4'h9 : 4'h8; // @[src/main/scala/riscv/core/ALUControl.scala 39:41]
  wire  _io_alu_funct_T_2 = 3'h1 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [1:0] _io_alu_funct_T_3 = 3'h1 == io_funct3 ? 2'h3 : 2'h1; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire  _io_alu_funct_T_4 = 3'h2 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [2:0] _io_alu_funct_T_5 = 3'h2 == io_funct3 ? 3'h4 : {{1'd0}, _io_alu_funct_T_3}; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire  _io_alu_funct_T_6 = 3'h3 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [3:0] _io_alu_funct_T_7 = 3'h3 == io_funct3 ? 4'ha : {{1'd0}, _io_alu_funct_T_5}; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire  _io_alu_funct_T_8 = 3'h4 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [3:0] _io_alu_funct_T_9 = 3'h4 == io_funct3 ? 4'h5 : _io_alu_funct_T_7; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire  _io_alu_funct_T_10 = 3'h6 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [3:0] _io_alu_funct_T_11 = 3'h6 == io_funct3 ? 4'h6 : _io_alu_funct_T_9; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire  _io_alu_funct_T_12 = 3'h7 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [3:0] _io_alu_funct_T_13 = 3'h7 == io_funct3 ? 4'h7 : _io_alu_funct_T_11; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire  _io_alu_funct_T_14 = 3'h5 == io_funct3; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [3:0] _io_alu_funct_T_15 = 3'h5 == io_funct3 ? _io_alu_funct_T_1 : _io_alu_funct_T_13; // @[src/main/scala/riscv/core/ALUControl.scala 30:8]
  wire [1:0] _io_alu_funct_T_17 = io_funct7[5] ? 2'h2 : 2'h1; // @[src/main/scala/riscv/core/ALUControl.scala 49:43]
  wire [1:0] _io_alu_funct_T_21 = _io_alu_funct_T_2 ? 2'h3 : _io_alu_funct_T_17; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire [2:0] _io_alu_funct_T_23 = _io_alu_funct_T_4 ? 3'h4 : {{1'd0}, _io_alu_funct_T_21}; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire [3:0] _io_alu_funct_T_25 = _io_alu_funct_T_6 ? 4'ha : {{1'd0}, _io_alu_funct_T_23}; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire [3:0] _io_alu_funct_T_27 = _io_alu_funct_T_8 ? 4'h5 : _io_alu_funct_T_25; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire [3:0] _io_alu_funct_T_29 = _io_alu_funct_T_10 ? 4'h6 : _io_alu_funct_T_27; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire [3:0] _io_alu_funct_T_31 = _io_alu_funct_T_12 ? 4'h7 : _io_alu_funct_T_29; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire [3:0] _io_alu_funct_T_33 = _io_alu_funct_T_14 ? _io_alu_funct_T_1 : _io_alu_funct_T_31; // @[src/main/scala/riscv/core/ALUControl.scala 47:8]
  wire  _GEN_1 = 7'h37 == io_opcode | 7'h17 == io_opcode; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 76:20]
  wire  _GEN_2 = 7'h67 == io_opcode | _GEN_1; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 73:20]
  wire  _GEN_3 = 7'h6f == io_opcode | _GEN_2; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 70:20]
  wire  _GEN_4 = 7'h23 == io_opcode | _GEN_3; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 67:20]
  wire  _GEN_5 = 7'h3 == io_opcode | _GEN_4; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 64:20]
  wire  _GEN_6 = 7'h63 == io_opcode | _GEN_5; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 61:20]
  wire [3:0] _GEN_7 = 7'h33 == io_opcode ? _io_alu_funct_T_33 : {{3'd0}, _GEN_6}; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 44:20]
  assign io_alu_funct = 7'h13 == io_opcode ? _io_alu_funct_T_15 : _GEN_7; // @[src/main/scala/riscv/core/ALUControl.scala 25:21 27:20]
endmodule
module Execute(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [1:0]  io_reg1_forward, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  input  [1:0]  io_reg2_forward, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  output [31:0] io_mem_alu_result, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  output [31:0] io_mem_reg2_data, // @[src/main/scala/riscv/core/Execute.scala 14:14]
  output [31:0] io_csr_write_data // @[src/main/scala/riscv/core/Execute.scala 14:14]
);
  wire [3:0] alu_io_func; // @[src/main/scala/riscv/core/Execute.scala 38:24]
  wire [31:0] alu_io_op1; // @[src/main/scala/riscv/core/Execute.scala 38:24]
  wire [31:0] alu_io_op2; // @[src/main/scala/riscv/core/Execute.scala 38:24]
  wire [31:0] alu_io_result; // @[src/main/scala/riscv/core/Execute.scala 38:24]
  wire [6:0] alu_ctrl_io_opcode; // @[src/main/scala/riscv/core/Execute.scala 39:24]
  wire [2:0] alu_ctrl_io_funct3; // @[src/main/scala/riscv/core/Execute.scala 39:24]
  wire [6:0] alu_ctrl_io_funct7; // @[src/main/scala/riscv/core/Execute.scala 39:24]
  wire [3:0] alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/Execute.scala 39:24]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/Execute.scala 34:30]
  wire [4:0] uimm = io_instruction[19:15]; // @[src/main/scala/riscv/core/Execute.scala 36:30]
  wire [31:0] _reg1_data_T_1 = 2'h1 == io_reg1_forward ? io_forward_from_mem : io_reg1_data; // @[src/main/scala/riscv/core/Execute.scala 49:4]
  wire [31:0] reg1_data = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_T_1; // @[src/main/scala/riscv/core/Execute.scala 49:4]
  wire [31:0] _reg2_data_T_1 = 2'h1 == io_reg2_forward ? io_forward_from_mem : io_reg2_data; // @[src/main/scala/riscv/core/Execute.scala 64:4]
  wire [31:0] reg2_data = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/riscv/core/Execute.scala 64:4]
  wire [31:0] _io_csr_write_data_T = ~reg1_data; // @[src/main/scala/riscv/core/Execute.scala 83:57]
  wire [31:0] _io_csr_write_data_T_1 = io_csr_read_data & _io_csr_write_data_T; // @[src/main/scala/riscv/core/Execute.scala 83:55]
  wire [31:0] _io_csr_write_data_T_2 = io_csr_read_data | reg1_data; // @[src/main/scala/riscv/core/Execute.scala 84:55]
  wire [31:0] _io_csr_write_data_T_3 = {27'h0,uimm}; // @[src/main/scala/riscv/core/Execute.scala 85:40]
  wire [31:0] _io_csr_write_data_T_5 = ~_io_csr_write_data_T_3; // @[src/main/scala/riscv/core/Execute.scala 86:57]
  wire [31:0] _io_csr_write_data_T_6 = io_csr_read_data & _io_csr_write_data_T_5; // @[src/main/scala/riscv/core/Execute.scala 86:55]
  wire [31:0] _io_csr_write_data_T_8 = io_csr_read_data | _io_csr_write_data_T_3; // @[src/main/scala/riscv/core/Execute.scala 87:55]
  wire [31:0] _io_csr_write_data_T_10 = 3'h1 == funct3 ? reg1_data : 32'h0; // @[src/main/scala/riscv/core/Execute.scala 80:4]
  wire [31:0] _io_csr_write_data_T_12 = 3'h3 == funct3 ? _io_csr_write_data_T_1 : _io_csr_write_data_T_10; // @[src/main/scala/riscv/core/Execute.scala 80:4]
  wire [31:0] _io_csr_write_data_T_14 = 3'h2 == funct3 ? _io_csr_write_data_T_2 : _io_csr_write_data_T_12; // @[src/main/scala/riscv/core/Execute.scala 80:4]
  wire [31:0] _io_csr_write_data_T_16 = 3'h5 == funct3 ? _io_csr_write_data_T_3 : _io_csr_write_data_T_14; // @[src/main/scala/riscv/core/Execute.scala 80:4]
  wire [31:0] _io_csr_write_data_T_18 = 3'h7 == funct3 ? _io_csr_write_data_T_6 : _io_csr_write_data_T_16; // @[src/main/scala/riscv/core/Execute.scala 80:4]
  ALU alu ( // @[src/main/scala/riscv/core/Execute.scala 38:24]
    .io_func(alu_io_func),
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_result(alu_io_result)
  );
  ALUControl alu_ctrl ( // @[src/main/scala/riscv/core/Execute.scala 39:24]
    .io_opcode(alu_ctrl_io_opcode),
    .io_funct3(alu_ctrl_io_funct3),
    .io_funct7(alu_ctrl_io_funct7),
    .io_alu_funct(alu_ctrl_io_alu_funct)
  );
  assign io_mem_alu_result = alu_io_result; // @[src/main/scala/riscv/core/Execute.scala 75:21]
  assign io_mem_reg2_data = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/riscv/core/Execute.scala 64:4]
  assign io_csr_write_data = 3'h6 == funct3 ? _io_csr_write_data_T_8 : _io_csr_write_data_T_18; // @[src/main/scala/riscv/core/Execute.scala 80:4]
  assign alu_io_func = alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/Execute.scala 44:22]
  assign alu_io_op1 = io_aluop1_source ? io_instruction_address : reg1_data; // @[src/main/scala/riscv/core/Execute.scala 55:20]
  assign alu_io_op2 = io_aluop2_source ? io_immediate : reg2_data; // @[src/main/scala/riscv/core/Execute.scala 70:20]
  assign alu_ctrl_io_opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/Execute.scala 33:30]
  assign alu_ctrl_io_funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/Execute.scala 34:30]
  assign alu_ctrl_io_funct7 = io_instruction[31:25]; // @[src/main/scala/riscv/core/Execute.scala 35:30]
endmodule
module PipelineRegister_26(
  input        clock,
  input        reset,
  input        io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  input  [2:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
  output [2:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
  reg [2:0] out; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
  assign io_out = out; // @[src/main/scala/riscv/core/PipelineRegister.scala 30:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
      myreg <= 3'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 17:22]
    end else if (!(io_stall)) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      myreg <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
      out <= 3'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 18:22]
    end else if (io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 23:25]
      out <= myreg; // @[src/main/scala/riscv/core/PipelineRegister.scala 24:11]
    end else begin
      out <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  myreg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  out = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EX2MEM(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [31:0] io_regs_write_address, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [2:0]  io_funct3, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [31:0] io_output_regs_write_address, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [31:0] io_output_funct3, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [31:0] io_output_reg2_data, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output        io_output_memory_read_enable, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output        io_output_memory_write_enable, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [31:0] io_output_alu_result, // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/EX2MEM.scala 12:14]
);
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
  wire  regs_write_enable_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
  wire  regs_write_enable_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
  wire  regs_write_source_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
  wire  regs_write_source_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
  wire  regs_write_address_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
  wire  regs_write_address_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
  wire  funct3_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
  wire  funct3_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
  wire  funct3_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
  wire [2:0] funct3_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
  wire [2:0] funct3_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
  wire  reg2_data_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
  wire  reg2_data_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
  wire  reg2_data_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
  wire  reg2_data_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
  wire [31:0] reg2_data_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
  wire [31:0] reg2_data_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
  wire  alu_result_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
  wire  alu_result_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
  wire  alu_result_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
  wire  alu_result_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
  wire [31:0] alu_result_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
  wire [31:0] alu_result_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
  wire  memory_read_enable_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
  wire  memory_read_enable_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
  wire  memory_read_enable_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
  wire  memory_read_enable_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
  wire  memory_read_enable_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
  wire  memory_read_enable_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
  wire  memory_write_enable_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
  wire  memory_write_enable_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
  wire  memory_write_enable_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
  wire  memory_write_enable_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
  wire  memory_write_enable_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
  wire  memory_write_enable_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
  wire  csr_read_data_io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
  wire  csr_read_data_io_flush; // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
  PipelineRegister_3 regs_write_enable ( // @[src/main/scala/riscv/core/EX2MEM.scala 40:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_stall(regs_write_enable_io_stall),
    .io_flush(regs_write_enable_io_flush),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_11 regs_write_source ( // @[src/main/scala/riscv/core/EX2MEM.scala 46:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_stall(regs_write_source_io_stall),
    .io_flush(regs_write_source_io_flush),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_7 regs_write_address ( // @[src/main/scala/riscv/core/EX2MEM.scala 52:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_stall(regs_write_address_io_stall),
    .io_flush(regs_write_address_io_flush),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_2 instruction_address ( // @[src/main/scala/riscv/core/EX2MEM.scala 58:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_26 funct3 ( // @[src/main/scala/riscv/core/EX2MEM.scala 64:22]
    .clock(funct3_clock),
    .reset(funct3_reset),
    .io_stall(funct3_io_stall),
    .io_in(funct3_io_in),
    .io_out(funct3_io_out)
  );
  PipelineRegister_2 reg2_data ( // @[src/main/scala/riscv/core/EX2MEM.scala 70:25]
    .clock(reg2_data_clock),
    .reset(reg2_data_reset),
    .io_stall(reg2_data_io_stall),
    .io_flush(reg2_data_io_flush),
    .io_in(reg2_data_io_in),
    .io_out(reg2_data_io_out)
  );
  PipelineRegister_2 alu_result ( // @[src/main/scala/riscv/core/EX2MEM.scala 76:26]
    .clock(alu_result_clock),
    .reset(alu_result_reset),
    .io_stall(alu_result_io_stall),
    .io_flush(alu_result_io_flush),
    .io_in(alu_result_io_in),
    .io_out(alu_result_io_out)
  );
  PipelineRegister_3 memory_read_enable ( // @[src/main/scala/riscv/core/EX2MEM.scala 82:34]
    .clock(memory_read_enable_clock),
    .reset(memory_read_enable_reset),
    .io_stall(memory_read_enable_io_stall),
    .io_flush(memory_read_enable_io_flush),
    .io_in(memory_read_enable_io_in),
    .io_out(memory_read_enable_io_out)
  );
  PipelineRegister_3 memory_write_enable ( // @[src/main/scala/riscv/core/EX2MEM.scala 88:35]
    .clock(memory_write_enable_clock),
    .reset(memory_write_enable_reset),
    .io_stall(memory_write_enable_io_stall),
    .io_flush(memory_write_enable_io_flush),
    .io_in(memory_write_enable_io_in),
    .io_out(memory_write_enable_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/EX2MEM.scala 94:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_stall(csr_read_data_io_stall),
    .io_flush(csr_read_data_io_flush),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 44:31]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 50:31]
  assign io_output_regs_write_address = {{27'd0}, regs_write_address_io_out}; // @[src/main/scala/riscv/core/EX2MEM.scala 56:32]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 62:33]
  assign io_output_funct3 = {{29'd0}, funct3_io_out}; // @[src/main/scala/riscv/core/EX2MEM.scala 68:20]
  assign io_output_reg2_data = reg2_data_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 74:23]
  assign io_output_memory_read_enable = memory_read_enable_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 86:32]
  assign io_output_memory_write_enable = memory_write_enable_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 92:33]
  assign io_output_alu_result = alu_result_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 80:24]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/EX2MEM.scala 98:27]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 42:31]
  assign regs_write_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 43:31]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/EX2MEM.scala 41:31]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 48:31]
  assign regs_write_source_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 49:31]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/EX2MEM.scala 47:31]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 54:32]
  assign regs_write_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 55:32]
  assign regs_write_address_io_in = io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/EX2MEM.scala 53:32]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 60:33]
  assign instruction_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 61:33]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/EX2MEM.scala 59:33]
  assign funct3_clock = clock;
  assign funct3_reset = reset;
  assign funct3_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 66:20]
  assign funct3_io_in = io_funct3; // @[src/main/scala/riscv/core/EX2MEM.scala 65:20]
  assign reg2_data_clock = clock;
  assign reg2_data_reset = reset;
  assign reg2_data_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 72:23]
  assign reg2_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 73:23]
  assign reg2_data_io_in = io_reg2_data; // @[src/main/scala/riscv/core/EX2MEM.scala 71:23]
  assign alu_result_clock = clock;
  assign alu_result_reset = reset;
  assign alu_result_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 78:24]
  assign alu_result_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 79:24]
  assign alu_result_io_in = io_alu_result; // @[src/main/scala/riscv/core/EX2MEM.scala 77:24]
  assign memory_read_enable_clock = clock;
  assign memory_read_enable_reset = reset;
  assign memory_read_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 84:32]
  assign memory_read_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 85:32]
  assign memory_read_enable_io_in = io_memory_read_enable; // @[src/main/scala/riscv/core/EX2MEM.scala 83:32]
  assign memory_write_enable_clock = clock;
  assign memory_write_enable_reset = reset;
  assign memory_write_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 90:33]
  assign memory_write_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 91:33]
  assign memory_write_enable_io_in = io_memory_write_enable; // @[src/main/scala/riscv/core/EX2MEM.scala 89:33]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_stall = io_stall; // @[src/main/scala/riscv/core/EX2MEM.scala 96:27]
  assign csr_read_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/EX2MEM.scala 97:27]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/EX2MEM.scala 95:27]
endmodule
module MemoryAccess(
  input         clock,
  input         reset,
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input  [2:0]  io_funct3, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output [31:0] io_wb_memory_read_data, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output [31:0] io_forward_to_ex, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output [1:0]  io_wb_regs_write_source, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_read, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input  [31:0] io_bus_read_data, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input         io_bus_read_valid, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_write, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output [31:0] io_bus_write_data, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_write_strobe_0, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_write_strobe_1, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_write_strobe_2, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_write_strobe_3, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input         io_bus_write_valid, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  output        io_bus_request, // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
  input         io_bus_granted // @[src/main/scala/riscv/core/MemoryAccess.scala 17:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] mem_address_index = io_alu_result[1:0]; // @[src/main/scala/riscv/core/MemoryAccess.scala 36:40]
  reg [1:0] mem_access_state; // @[src/main/scala/riscv/core/MemoryAccess.scala 37:34]
  reg [31:0] latched_memory_read_data; // @[src/main/scala/riscv/core/MemoryAccess.scala 41:41]
  reg [1:0] latched_regs_write_source; // @[src/main/scala/riscv/core/MemoryAccess.scala 48:42]
  reg [2:0] latched_funct3; // @[src/main/scala/riscv/core/MemoryAccess.scala 49:42]
  reg [1:0] latched_address_index; // @[src/main/scala/riscv/core/MemoryAccess.scala 50:42]
  wire  _T_2 = mem_access_state == 2'h1; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:25]
  wire [23:0] _processed_data_T_1 = io_bus_read_data[31] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 116:21]
  wire [31:0] _processed_data_T_3 = {_processed_data_T_1,io_bus_read_data[31:24]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 116:16]
  wire [23:0] _processed_data_T_5 = io_bus_read_data[7] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 118:30]
  wire [31:0] _processed_data_T_7 = {_processed_data_T_5,io_bus_read_data[7:0]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 118:25]
  wire [23:0] _processed_data_T_9 = io_bus_read_data[15] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 119:30]
  wire [31:0] _processed_data_T_11 = {_processed_data_T_9,io_bus_read_data[15:8]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 119:25]
  wire [23:0] _processed_data_T_13 = io_bus_read_data[23] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 120:30]
  wire [31:0] _processed_data_T_15 = {_processed_data_T_13,io_bus_read_data[23:16]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 120:25]
  wire [31:0] _processed_data_T_17 = 2'h0 == latched_address_index ? _processed_data_T_7 : _processed_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_19 = 2'h1 == latched_address_index ? _processed_data_T_11 : _processed_data_T_17; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_21 = 2'h2 == latched_address_index ? _processed_data_T_15 : _processed_data_T_19; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_24 = {24'h0,io_bus_read_data[31:24]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 125:16]
  wire [31:0] _processed_data_T_27 = {24'h0,io_bus_read_data[7:0]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 127:25]
  wire [31:0] _processed_data_T_30 = {24'h0,io_bus_read_data[15:8]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 128:25]
  wire [31:0] _processed_data_T_33 = {24'h0,io_bus_read_data[23:16]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 129:25]
  wire [31:0] _processed_data_T_35 = 2'h0 == latched_address_index ? _processed_data_T_27 : _processed_data_T_24; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_37 = 2'h1 == latched_address_index ? _processed_data_T_30 : _processed_data_T_35; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_39 = 2'h2 == latched_address_index ? _processed_data_T_33 : _processed_data_T_37; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _processed_data_T_40 = latched_address_index == 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 133:35]
  wire [15:0] _processed_data_T_42 = io_bus_read_data[15] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 134:21]
  wire [31:0] _processed_data_T_44 = {_processed_data_T_42,io_bus_read_data[15:0]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 134:16]
  wire [15:0] _processed_data_T_46 = io_bus_read_data[31] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 135:21]
  wire [31:0] _processed_data_T_48 = {_processed_data_T_46,io_bus_read_data[31:16]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 135:16]
  wire [31:0] _processed_data_T_49 = _processed_data_T_40 ? _processed_data_T_44 : _processed_data_T_48; // @[src/main/scala/riscv/core/MemoryAccess.scala 132:38]
  wire [31:0] _processed_data_T_53 = {16'h0,io_bus_read_data[15:0]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 139:16]
  wire [31:0] _processed_data_T_56 = {16'h0,io_bus_read_data[31:16]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 140:16]
  wire [31:0] _processed_data_T_57 = _processed_data_T_40 ? _processed_data_T_53 : _processed_data_T_56; // @[src/main/scala/riscv/core/MemoryAccess.scala 137:39]
  wire [31:0] _processed_data_T_59 = 3'h0 == latched_funct3 ? _processed_data_T_21 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_61 = 3'h4 == latched_funct3 ? _processed_data_T_39 : _processed_data_T_59; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_63 = 3'h1 == latched_funct3 ? _processed_data_T_49 : _processed_data_T_61; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _processed_data_T_65 = 3'h5 == latched_funct3 ? _processed_data_T_57 : _processed_data_T_63; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] processed_data = 3'h2 == latched_funct3 ? io_bus_read_data : _processed_data_T_65; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _GEN_1 = io_bus_read_valid ? processed_data : latched_memory_read_data; // @[src/main/scala/riscv/core/MemoryAccess.scala 105:29 146:32 41:41]
  wire  _GEN_4 = io_bus_read_valid ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/MemoryAccess.scala 104:24 105:29 62:24]
  wire  _GEN_6 = io_bus_write_valid ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/MemoryAccess.scala 164:24 166:30 62:24]
  wire [1:0] _GEN_7 = io_bus_granted ? 2'h1 : mem_access_state; // @[src/main/scala/riscv/core/MemoryAccess.scala 182:28 183:26 37:34]
  wire  _GEN_8 = 2'h0 == mem_address_index; // @[src/main/scala/riscv/core/MemoryAccess.scala 190:27 192:{48,48}]
  wire  _GEN_9 = 2'h1 == mem_address_index; // @[src/main/scala/riscv/core/MemoryAccess.scala 190:27 192:{48,48}]
  wire  _GEN_10 = 2'h2 == mem_address_index; // @[src/main/scala/riscv/core/MemoryAccess.scala 190:27 192:{48,48}]
  wire  _GEN_11 = 2'h3 == mem_address_index; // @[src/main/scala/riscv/core/MemoryAccess.scala 190:27 192:{48,48}]
  wire [4:0] _io_bus_write_data_T_1 = {mem_address_index, 3'h0}; // @[src/main/scala/riscv/core/MemoryAccess.scala 194:93]
  wire [38:0] _GEN_0 = {{31'd0}, io_reg2_data[7:0]}; // @[src/main/scala/riscv/core/MemoryAccess.scala 194:71]
  wire [38:0] _io_bus_write_data_T_2 = _GEN_0 << _io_bus_write_data_T_1; // @[src/main/scala/riscv/core/MemoryAccess.scala 194:71]
  wire  _T_6 = mem_address_index == 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 198:32]
  wire [31:0] _io_bus_write_data_T_5 = {io_reg2_data[15:0], 16'h0}; // @[src/main/scala/riscv/core/MemoryAccess.scala 212:13]
  wire [31:0] _GEN_14 = mem_address_index == 2'h0 ? {{16'd0}, io_reg2_data[15:0]} : _io_bus_write_data_T_5; // @[src/main/scala/riscv/core/MemoryAccess.scala 198:41 203:29 209:29]
  wire  _GEN_15 = mem_address_index == 2'h0 ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/MemoryAccess.scala 190:27 198:41 206:36]
  wire  _T_7 = io_funct3 == 3'h2; // @[src/main/scala/riscv/core/MemoryAccess.scala 214:28]
  wire  _GEN_21 = io_funct3 == 3'h1 ? _T_6 : _T_7; // @[src/main/scala/riscv/core/MemoryAccess.scala 197:54]
  wire [31:0] _GEN_23 = io_funct3 == 3'h1 ? _GEN_14 : io_reg2_data; // @[src/main/scala/riscv/core/MemoryAccess.scala 188:27 197:54]
  wire  _GEN_24 = io_funct3 == 3'h1 ? _GEN_15 : _T_7; // @[src/main/scala/riscv/core/MemoryAccess.scala 197:54]
  wire  _GEN_26 = io_funct3 == 3'h0 ? _GEN_8 : _GEN_21; // @[src/main/scala/riscv/core/MemoryAccess.scala 191:48]
  wire  _GEN_27 = io_funct3 == 3'h0 ? _GEN_9 : _GEN_21; // @[src/main/scala/riscv/core/MemoryAccess.scala 191:48]
  wire  _GEN_28 = io_funct3 == 3'h0 ? _GEN_10 : _GEN_24; // @[src/main/scala/riscv/core/MemoryAccess.scala 191:48]
  wire  _GEN_29 = io_funct3 == 3'h0 ? _GEN_11 : _GEN_24; // @[src/main/scala/riscv/core/MemoryAccess.scala 191:48]
  wire [38:0] _GEN_30 = io_funct3 == 3'h0 ? _io_bus_write_data_T_2 : {{7'd0}, _GEN_23}; // @[src/main/scala/riscv/core/MemoryAccess.scala 191:48 194:27]
  wire [1:0] _GEN_31 = io_bus_granted ? 2'h2 : mem_access_state; // @[src/main/scala/riscv/core/MemoryAccess.scala 220:28 221:26 37:34]
  wire [38:0] _GEN_33 = io_memory_write_enable ? _GEN_30 : 39'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 185:40 78:26]
  wire  _GEN_34 = io_memory_write_enable & _GEN_26; // @[src/main/scala/riscv/core/MemoryAccess.scala 185:40 79:26]
  wire  _GEN_35 = io_memory_write_enable & _GEN_27; // @[src/main/scala/riscv/core/MemoryAccess.scala 185:40 79:26]
  wire  _GEN_36 = io_memory_write_enable & _GEN_28; // @[src/main/scala/riscv/core/MemoryAccess.scala 185:40 79:26]
  wire  _GEN_37 = io_memory_write_enable & _GEN_29; // @[src/main/scala/riscv/core/MemoryAccess.scala 185:40 79:26]
  wire [1:0] _GEN_38 = io_memory_write_enable ? _GEN_31 : mem_access_state; // @[src/main/scala/riscv/core/MemoryAccess.scala 185:40 37:34]
  wire  _GEN_39 = io_memory_read_enable | io_memory_write_enable; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 173:26]
  wire [38:0] _GEN_45 = io_memory_read_enable ? 39'h0 : _GEN_33; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 78:26]
  wire  _GEN_46 = io_memory_read_enable ? 1'h0 : io_memory_write_enable; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 80:26]
  wire  _GEN_47 = io_memory_read_enable ? 1'h0 : _GEN_34; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 79:26]
  wire  _GEN_48 = io_memory_read_enable ? 1'h0 : _GEN_35; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 79:26]
  wire  _GEN_49 = io_memory_read_enable ? 1'h0 : _GEN_36; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 79:26]
  wire  _GEN_50 = io_memory_read_enable ? 1'h0 : _GEN_37; // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33 79:26]
  wire  _GEN_51 = mem_access_state == 2'h2 | _GEN_39; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 163:24]
  wire  _GEN_52 = mem_access_state == 2'h2 ? _GEN_6 : _GEN_39; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61]
  wire  _GEN_54 = mem_access_state == 2'h2 ? 1'h0 : io_memory_read_enable; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 74:18]
  wire [38:0] _GEN_58 = mem_access_state == 2'h2 ? 39'h0 : _GEN_45; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 78:26]
  wire  _GEN_59 = mem_access_state == 2'h2 ? 1'h0 : _GEN_46; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 80:26]
  wire  _GEN_60 = mem_access_state == 2'h2 ? 1'h0 : _GEN_47; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 79:26]
  wire  _GEN_61 = mem_access_state == 2'h2 ? 1'h0 : _GEN_48; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 79:26]
  wire  _GEN_62 = mem_access_state == 2'h2 ? 1'h0 : _GEN_49; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 79:26]
  wire  _GEN_63 = mem_access_state == 2'h2 ? 1'h0 : _GEN_50; // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61 79:26]
  wire [38:0] _GEN_73 = mem_access_state == 2'h1 ? 39'h0 : _GEN_58; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 78:26]
  wire [1:0] forward_regs_write_source = _T_2 ? latched_regs_write_source : io_regs_write_source; // @[src/main/scala/riscv/core/MemoryAccess.scala 238:38]
  wire [31:0] _io_forward_to_ex_T_1 = io_instruction_address + 32'h4; // @[src/main/scala/riscv/core/MemoryAccess.scala 252:72]
  wire [31:0] _io_forward_to_ex_T_3 = 2'h1 == forward_regs_write_source ? io_wb_memory_read_data : io_alu_result; // @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
  wire [31:0] _io_forward_to_ex_T_5 = 2'h2 == forward_regs_write_source ? io_csr_read_data : _io_forward_to_ex_T_3; // @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
  assign io_wb_memory_read_data = mem_access_state == 2'h1 ? _GEN_1 : latched_memory_read_data; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 41:41]
  assign io_forward_to_ex = 2'h3 == forward_regs_write_source ? _io_forward_to_ex_T_1 : _io_forward_to_ex_T_5; // @[src/main/scala/riscv/core/MemoryAccess.scala 248:74]
  assign io_ctrl_stall_flag = mem_access_state == 2'h1 ? _GEN_4 : _GEN_52; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
  assign io_wb_regs_write_source = _T_2 ? latched_regs_write_source : io_regs_write_source; // @[src/main/scala/riscv/core/MemoryAccess.scala 262:43]
  assign io_bus_address = {io_alu_result[31:2],2'h0}; // @[src/main/scala/riscv/core/MemoryAccess.scala 75:89]
  assign io_bus_read = mem_access_state == 2'h1 ? 1'h0 : _GEN_54; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 74:18]
  assign io_bus_write = mem_access_state == 2'h1 ? 1'h0 : _GEN_59; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 80:26]
  assign io_bus_write_data = _GEN_73[31:0];
  assign io_bus_write_strobe_0 = mem_access_state == 2'h1 ? 1'h0 : _GEN_60; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 79:26]
  assign io_bus_write_strobe_1 = mem_access_state == 2'h1 ? 1'h0 : _GEN_61; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 79:26]
  assign io_bus_write_strobe_2 = mem_access_state == 2'h1 ? 1'h0 : _GEN_62; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 79:26]
  assign io_bus_write_strobe_3 = mem_access_state == 2'h1 ? 1'h0 : _GEN_63; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 79:26]
  assign io_bus_request = mem_access_state == 2'h1 | _GEN_51; // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54 103:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 37:34]
      mem_access_state <= 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 37:34]
    end else if (mem_access_state == 2'h1) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
      if (io_bus_read_valid) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 105:29]
        mem_access_state <= 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 61:24]
      end
    end else if (mem_access_state == 2'h2) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61]
      if (io_bus_write_valid) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 166:30]
        mem_access_state <= 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 61:24]
      end
    end else if (io_memory_read_enable) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33]
      mem_access_state <= _GEN_7;
    end else begin
      mem_access_state <= _GEN_38;
    end
    if (reset) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 41:41]
      latched_memory_read_data <= 32'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 41:41]
    end else if (mem_access_state == 2'h1) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
      if (io_bus_read_valid) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 105:29]
        if (3'h2 == latched_funct3) begin // @[src/main/scala/chisel3/util/Mux.scala 77:13]
          latched_memory_read_data <= io_bus_read_data;
        end else begin
          latched_memory_read_data <= _processed_data_T_65;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 48:42]
      latched_regs_write_source <= 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 48:42]
    end else if (!(mem_access_state == 2'h1)) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
      if (!(mem_access_state == 2'h2)) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61]
        if (io_memory_read_enable) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33]
          latched_regs_write_source <= io_regs_write_source; // @[src/main/scala/riscv/core/MemoryAccess.scala 179:33]
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 49:42]
      latched_funct3 <= 3'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 49:42]
    end else if (!(mem_access_state == 2'h1)) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
      if (!(mem_access_state == 2'h2)) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61]
        if (io_memory_read_enable) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33]
          latched_funct3 <= io_funct3; // @[src/main/scala/riscv/core/MemoryAccess.scala 180:33]
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 50:42]
      latched_address_index <= 2'h0; // @[src/main/scala/riscv/core/MemoryAccess.scala 50:42]
    end else if (!(mem_access_state == 2'h1)) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 101:54]
      if (!(mem_access_state == 2'h2)) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 155:61]
        if (io_memory_read_enable) begin // @[src/main/scala/riscv/core/MemoryAccess.scala 171:33]
          latched_address_index <= mem_address_index; // @[src/main/scala/riscv/core/MemoryAccess.scala 181:33]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mem_access_state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  latched_memory_read_data = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  latched_regs_write_source = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  latched_funct3 = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  latched_address_index = _RAND_4[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MEM2WB(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input  [31:0] io_regs_write_address, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input  [31:0] io_memory_read_data, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output [31:0] io_output_alu_result, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output [31:0] io_output_regs_write_address, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output [31:0] io_output_memory_read_data, // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/MEM2WB.scala 12:14]
);
  wire  alu_result_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
  wire  alu_result_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
  wire  alu_result_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
  wire  alu_result_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
  wire [31:0] alu_result_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
  wire [31:0] alu_result_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
  wire  memory_read_data_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
  wire  memory_read_data_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
  wire  memory_read_data_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
  wire  memory_read_data_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
  wire [31:0] memory_read_data_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
  wire [31:0] memory_read_data_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
  wire  regs_write_enable_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
  wire  regs_write_enable_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
  wire  regs_write_source_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
  wire  regs_write_source_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
  wire  regs_write_address_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
  wire  regs_write_address_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
  wire  csr_read_data_io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
  wire  csr_read_data_io_flush; // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
  PipelineRegister_2 alu_result ( // @[src/main/scala/riscv/core/MEM2WB.scala 33:26]
    .clock(alu_result_clock),
    .reset(alu_result_reset),
    .io_stall(alu_result_io_stall),
    .io_flush(alu_result_io_flush),
    .io_in(alu_result_io_in),
    .io_out(alu_result_io_out)
  );
  PipelineRegister_2 memory_read_data ( // @[src/main/scala/riscv/core/MEM2WB.scala 39:32]
    .clock(memory_read_data_clock),
    .reset(memory_read_data_reset),
    .io_stall(memory_read_data_io_stall),
    .io_flush(memory_read_data_io_flush),
    .io_in(memory_read_data_io_in),
    .io_out(memory_read_data_io_out)
  );
  PipelineRegister_3 regs_write_enable ( // @[src/main/scala/riscv/core/MEM2WB.scala 45:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_stall(regs_write_enable_io_stall),
    .io_flush(regs_write_enable_io_flush),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_11 regs_write_source ( // @[src/main/scala/riscv/core/MEM2WB.scala 51:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_stall(regs_write_source_io_stall),
    .io_flush(regs_write_source_io_flush),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_7 regs_write_address ( // @[src/main/scala/riscv/core/MEM2WB.scala 57:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_stall(regs_write_address_io_stall),
    .io_flush(regs_write_address_io_flush),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_2 instruction_address ( // @[src/main/scala/riscv/core/MEM2WB.scala 63:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/MEM2WB.scala 69:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_stall(csr_read_data_io_stall),
    .io_flush(csr_read_data_io_flush),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 67:33]
  assign io_output_alu_result = alu_result_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 37:24]
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 49:31]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 55:31]
  assign io_output_regs_write_address = {{27'd0}, regs_write_address_io_out}; // @[src/main/scala/riscv/core/MEM2WB.scala 61:32]
  assign io_output_memory_read_data = memory_read_data_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 43:30]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/MEM2WB.scala 73:27]
  assign alu_result_clock = clock;
  assign alu_result_reset = reset;
  assign alu_result_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 35:24]
  assign alu_result_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 36:24]
  assign alu_result_io_in = io_alu_result; // @[src/main/scala/riscv/core/MEM2WB.scala 34:24]
  assign memory_read_data_clock = clock;
  assign memory_read_data_reset = reset;
  assign memory_read_data_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 41:30]
  assign memory_read_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 42:30]
  assign memory_read_data_io_in = io_memory_read_data; // @[src/main/scala/riscv/core/MEM2WB.scala 40:30]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 47:31]
  assign regs_write_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 48:31]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/MEM2WB.scala 46:31]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 53:31]
  assign regs_write_source_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 54:31]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/MEM2WB.scala 52:31]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 59:32]
  assign regs_write_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 60:32]
  assign regs_write_address_io_in = io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/MEM2WB.scala 58:32]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 65:33]
  assign instruction_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 66:33]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/MEM2WB.scala 64:33]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_stall = io_stall; // @[src/main/scala/riscv/core/MEM2WB.scala 71:27]
  assign csr_read_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/MEM2WB.scala 72:27]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/MEM2WB.scala 70:27]
endmodule
module WriteBack(
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/WriteBack.scala 12:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/WriteBack.scala 12:14]
  input  [31:0] io_memory_read_data, // @[src/main/scala/riscv/core/WriteBack.scala 12:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/WriteBack.scala 12:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/WriteBack.scala 12:14]
  output [31:0] io_regs_write_data // @[src/main/scala/riscv/core/WriteBack.scala 12:14]
);
  wire [31:0] _io_regs_write_data_T_1 = io_instruction_address + 32'h4; // @[src/main/scala/riscv/core/WriteBack.scala 28:72]
  wire [31:0] _io_regs_write_data_T_3 = 2'h1 == io_regs_write_source ? io_memory_read_data : io_alu_result; // @[src/main/scala/riscv/core/WriteBack.scala 24:4]
  wire [31:0] _io_regs_write_data_T_5 = 2'h2 == io_regs_write_source ? io_csr_read_data : _io_regs_write_data_T_3; // @[src/main/scala/riscv/core/WriteBack.scala 24:4]
  assign io_regs_write_data = 2'h3 == io_regs_write_source ? _io_regs_write_data_T_1 : _io_regs_write_data_T_5; // @[src/main/scala/riscv/core/WriteBack.scala 24:4]
endmodule
module Forwarding(
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input  [4:0] io_rs1_ex, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input  [4:0] io_rs2_ex, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input        io_reg_write_enable_mem, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input  [4:0] io_rd_wb, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  input        io_reg_write_enable_wb, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  output [1:0] io_reg1_forward_id, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  output [1:0] io_reg2_forward_id, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  output [1:0] io_reg1_forward_ex, // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
  output [1:0] io_reg2_forward_ex // @[src/main/scala/riscv/core/Forwarding.scala 60:14]
);
  wire  _T_2 = io_rd_mem != 5'h0; // @[src/main/scala/riscv/core/Forwarding.scala 80:72]
  wire  _T_6 = io_rd_wb != 5'h0; // @[src/main/scala/riscv/core/Forwarding.scala 84:75]
  wire [1:0] _GEN_0 = io_reg_write_enable_wb & io_rs1_ex == io_rd_wb & io_rd_wb != 5'h0 ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/Forwarding.scala 84:84 87:24 90:24]
  wire [1:0] _GEN_2 = io_reg_write_enable_wb & io_rs2_ex == io_rd_wb & _T_6 ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/Forwarding.scala 100:24 103:24 98:84]
  wire [1:0] _GEN_4 = io_reg_write_enable_wb & io_rs1_id == io_rd_wb & _T_6 ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/Forwarding.scala 117:84 119:24 122:24]
  wire [1:0] _GEN_6 = io_reg_write_enable_wb & io_rs2_id == io_rd_wb & _T_6 ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/Forwarding.scala 131:84 133:24 136:24]
  assign io_reg1_forward_id = io_reg_write_enable_mem & io_rs1_id == io_rd_mem & _T_2 ? 2'h1 : _GEN_4; // @[src/main/scala/riscv/core/Forwarding.scala 111:81 116:24]
  assign io_reg2_forward_id = io_reg_write_enable_mem & io_rs2_id == io_rd_mem & _T_2 ? 2'h1 : _GEN_6; // @[src/main/scala/riscv/core/Forwarding.scala 126:81 130:24]
  assign io_reg1_forward_ex = io_reg_write_enable_mem & io_rs1_ex == io_rd_mem & io_rd_mem != 5'h0 ? 2'h1 : _GEN_0; // @[src/main/scala/riscv/core/Forwarding.scala 80:81 83:24]
  assign io_reg2_forward_ex = io_reg_write_enable_mem & io_rs2_ex == io_rd_mem & _T_2 ? 2'h1 : _GEN_2; // @[src/main/scala/riscv/core/Forwarding.scala 94:81 97:24]
endmodule
module CLINT(
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_instruction_id, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_instruction_address_if, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input         io_jump_flag, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_jump_address, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  output [31:0] io_id_interrupt_handler_address, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  output        io_id_interrupt_assert, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_csr_bundle_mstatus, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_csr_bundle_mepc, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_csr_bundle_mcause, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_csr_bundle_mtvec, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  input  [31:0] io_csr_bundle_mie, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  output [31:0] io_csr_bundle_mstatus_write_data, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  output [31:0] io_csr_bundle_mepc_write_data, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  output [31:0] io_csr_bundle_mcause_write_data, // @[src/main/scala/riscv/core/CLINT.scala 20:14]
  output        io_csr_bundle_direct_write_enable // @[src/main/scala/riscv/core/CLINT.scala 20:14]
);
  wire  interrupt_enable_global = io_csr_bundle_mstatus[3]; // @[src/main/scala/riscv/core/CLINT.scala 34:56]
  wire  interrupt_enable_timer = io_csr_bundle_mie[7]; // @[src/main/scala/riscv/core/CLINT.scala 35:52]
  wire  interrupt_enable_external = io_csr_bundle_mie[11]; // @[src/main/scala/riscv/core/CLINT.scala 36:52]
  wire [31:0] instruction_address = io_jump_flag ? io_jump_address : io_instruction_address_if; // @[src/main/scala/riscv/core/CLINT.scala 38:32]
  wire [31:0] mstatus_disable_interrupt = {io_csr_bundle_mstatus[31:4],1'h0,io_csr_bundle_mstatus[2:0]}; // @[src/main/scala/riscv/core/CLINT.scala 43:76]
  wire [31:0] mstatus_recover_interrupt = {io_csr_bundle_mstatus[31:4],io_csr_bundle_mstatus[7],io_csr_bundle_mstatus[2:
    0]}; // @[src/main/scala/riscv/core/CLINT.scala 45:62]
  wire  interrupt_source_enabled = io_interrupt_flag[0] ? interrupt_enable_timer : interrupt_enable_external; // @[src/main/scala/riscv/core/CLINT.scala 48:37]
  wire [3:0] _io_csr_bundle_mcause_write_data_T_1 = 32'h73 == io_instruction_id ? 4'hb : 4'ha; // @[src/main/scala/riscv/core/CLINT.scala 60:6]
  wire [3:0] _io_csr_bundle_mcause_write_data_T_3 = 32'h100073 == io_instruction_id ? 4'h3 :
    _io_csr_bundle_mcause_write_data_T_1; // @[src/main/scala/riscv/core/CLINT.scala 60:6]
  wire [31:0] _io_csr_bundle_mcause_write_data_T_5 = io_interrupt_flag[0] ? 32'h80000007 : 32'h8000000b; // @[src/main/scala/riscv/core/CLINT.scala 72:45]
  wire  _T_6 = io_instruction_id == 32'h30200073; // @[src/main/scala/riscv/core/CLINT.scala 76:32]
  wire [31:0] _GEN_0 = io_instruction_id == 32'h30200073 ? mstatus_recover_interrupt : io_csr_bundle_mstatus; // @[src/main/scala/riscv/core/CLINT.scala 76:58 77:39 84:39]
  wire [31:0] _GEN_4 = io_instruction_id == 32'h30200073 ? io_csr_bundle_mepc : 32'h0; // @[src/main/scala/riscv/core/CLINT.scala 76:58 82:39 89:39]
  wire [31:0] _GEN_5 = io_interrupt_flag != 32'h0 & interrupt_enable_global & interrupt_source_enabled ?
    mstatus_disable_interrupt : _GEN_0; // @[src/main/scala/riscv/core/CLINT.scala 69:113 70:39]
  wire [31:0] _GEN_6 = io_interrupt_flag != 32'h0 & interrupt_enable_global & interrupt_source_enabled ?
    instruction_address : io_csr_bundle_mepc; // @[src/main/scala/riscv/core/CLINT.scala 69:113 71:39]
  wire [31:0] _GEN_7 = io_interrupt_flag != 32'h0 & interrupt_enable_global & interrupt_source_enabled ?
    _io_csr_bundle_mcause_write_data_T_5 : io_csr_bundle_mcause; // @[src/main/scala/riscv/core/CLINT.scala 69:113 72:39]
  wire  _GEN_8 = io_interrupt_flag != 32'h0 & interrupt_enable_global & interrupt_source_enabled | _T_6; // @[src/main/scala/riscv/core/CLINT.scala 69:113 73:39]
  wire [31:0] _GEN_9 = io_interrupt_flag != 32'h0 & interrupt_enable_global & interrupt_source_enabled ?
    io_csr_bundle_mtvec : _GEN_4; // @[src/main/scala/riscv/core/CLINT.scala 69:113 75:39]
  assign io_id_interrupt_handler_address = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ?
    io_csr_bundle_mtvec : _GEN_9; // @[src/main/scala/riscv/core/CLINT.scala 54:101 68:39]
  assign io_id_interrupt_assert = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 | _GEN_8; // @[src/main/scala/riscv/core/CLINT.scala 54:101 66:39]
  assign io_csr_bundle_mstatus_write_data = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ?
    mstatus_disable_interrupt : _GEN_5; // @[src/main/scala/riscv/core/CLINT.scala 54:101 55:38]
  assign io_csr_bundle_mepc_write_data = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ?
    instruction_address : _GEN_6; // @[src/main/scala/riscv/core/CLINT.scala 54:101 56:38]
  assign io_csr_bundle_mcause_write_data = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ? {{28'd0},
    _io_csr_bundle_mcause_write_data_T_3} : _GEN_7; // @[src/main/scala/riscv/core/CLINT.scala 54:101 57:37]
  assign io_csr_bundle_direct_write_enable = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 | _GEN_8; // @[src/main/scala/riscv/core/CLINT.scala 54:101 66:39]
endmodule
module CSR(
  input         clock,
  input         reset,
  input  [11:0] io_reg_read_address_id, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input         io_reg_write_enable_ex, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input  [11:0] io_reg_write_address_ex, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input  [31:0] io_reg_write_data_ex, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input  [11:0] io_debug_reg_read_address, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_id_reg_read_data, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_debug_reg_read_data, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_clint_access_bundle_mstatus, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_clint_access_bundle_mepc, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_clint_access_bundle_mcause, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_clint_access_bundle_mtvec, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  output [31:0] io_clint_access_bundle_mie, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input  [31:0] io_clint_access_bundle_mstatus_write_data, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input  [31:0] io_clint_access_bundle_mepc_write_data, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input  [31:0] io_clint_access_bundle_mcause_write_data, // @[src/main/scala/riscv/core/CSR.scala 38:14]
  input         io_clint_access_bundle_direct_write_enable // @[src/main/scala/riscv/core/CSR.scala 38:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mstatus; // @[src/main/scala/riscv/core/CSR.scala 51:25]
  reg [31:0] mie; // @[src/main/scala/riscv/core/CSR.scala 52:25]
  reg [31:0] mtvec; // @[src/main/scala/riscv/core/CSR.scala 53:25]
  reg [31:0] mscratch; // @[src/main/scala/riscv/core/CSR.scala 54:25]
  reg [31:0] mepc; // @[src/main/scala/riscv/core/CSR.scala 55:25]
  reg [31:0] mcause; // @[src/main/scala/riscv/core/CSR.scala 56:25]
  reg [63:0] cycles; // @[src/main/scala/riscv/core/CSR.scala 57:25]
  wire [63:0] _cycles_T_1 = cycles + 64'h1; // @[src/main/scala/riscv/core/CSR.scala 69:20]
  wire [31:0] _io_id_reg_read_data_T_1 = 12'h300 == io_reg_read_address_id ? mstatus : 32'h0; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_id_reg_read_data_T_3 = 12'h304 == io_reg_read_address_id ? mie : _io_id_reg_read_data_T_1; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_id_reg_read_data_T_5 = 12'h305 == io_reg_read_address_id ? mtvec : _io_id_reg_read_data_T_3; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_id_reg_read_data_T_7 = 12'h340 == io_reg_read_address_id ? mscratch : _io_id_reg_read_data_T_5; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_id_reg_read_data_T_9 = 12'h341 == io_reg_read_address_id ? mepc : _io_id_reg_read_data_T_7; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_id_reg_read_data_T_11 = 12'h342 == io_reg_read_address_id ? mcause : _io_id_reg_read_data_T_9; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_id_reg_read_data_T_13 = 12'hc00 == io_reg_read_address_id ? cycles[31:0] : _io_id_reg_read_data_T_11; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  wire [31:0] _io_debug_reg_read_data_T_1 = 12'h300 == io_debug_reg_read_address ? mstatus : 32'h0; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire [31:0] _io_debug_reg_read_data_T_3 = 12'h304 == io_debug_reg_read_address ? mie : _io_debug_reg_read_data_T_1; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire [31:0] _io_debug_reg_read_data_T_5 = 12'h305 == io_debug_reg_read_address ? mtvec : _io_debug_reg_read_data_T_3; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire [31:0] _io_debug_reg_read_data_T_7 = 12'h340 == io_debug_reg_read_address ? mscratch :
    _io_debug_reg_read_data_T_5; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire [31:0] _io_debug_reg_read_data_T_9 = 12'h341 == io_debug_reg_read_address ? mepc : _io_debug_reg_read_data_T_7; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire [31:0] _io_debug_reg_read_data_T_11 = 12'h342 == io_debug_reg_read_address ? mcause : _io_debug_reg_read_data_T_9
    ; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire [31:0] _io_debug_reg_read_data_T_13 = 12'hc00 == io_debug_reg_read_address ? cycles[31:0] :
    _io_debug_reg_read_data_T_11; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  wire  _io_clint_access_bundle_mstatus_T = io_reg_write_address_ex == 12'h300; // @[src/main/scala/riscv/core/CSR.scala 77:55]
  wire  _io_clint_access_bundle_mstatus_T_1 = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h300; // @[src/main/scala/riscv/core/CSR.scala 77:28]
  wire  _io_clint_access_bundle_mtvec_T = io_reg_write_address_ex == 12'h305; // @[src/main/scala/riscv/core/CSR.scala 82:55]
  wire  _io_clint_access_bundle_mtvec_T_1 = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h305; // @[src/main/scala/riscv/core/CSR.scala 82:28]
  wire  _io_clint_access_bundle_mcause_T = io_reg_write_address_ex == 12'h342; // @[src/main/scala/riscv/core/CSR.scala 87:55]
  wire  _io_clint_access_bundle_mcause_T_1 = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h342; // @[src/main/scala/riscv/core/CSR.scala 87:28]
  wire  _io_clint_access_bundle_mepc_T = io_reg_write_address_ex == 12'h341; // @[src/main/scala/riscv/core/CSR.scala 92:55]
  wire  _io_clint_access_bundle_mepc_T_1 = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h341; // @[src/main/scala/riscv/core/CSR.scala 92:28]
  wire  _io_clint_access_bundle_mie_T = io_reg_write_address_ex == 12'h304; // @[src/main/scala/riscv/core/CSR.scala 97:55]
  wire  _io_clint_access_bundle_mie_T_1 = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h304; // @[src/main/scala/riscv/core/CSR.scala 97:28]
  wire [31:0] _GEN_0 = _io_clint_access_bundle_mcause_T ? io_reg_write_data_ex : mcause; // @[src/main/scala/riscv/core/CSR.scala 111:64 112:14 56:25]
  wire [31:0] _GEN_1 = _io_clint_access_bundle_mepc_T ? io_reg_write_data_ex : mepc; // @[src/main/scala/riscv/core/CSR.scala 109:62 110:12 55:25]
  wire [31:0] _GEN_2 = _io_clint_access_bundle_mepc_T ? mcause : _GEN_0; // @[src/main/scala/riscv/core/CSR.scala 109:62 56:25]
  wire [31:0] _GEN_12 = io_reg_write_address_ex == 12'h340 ? io_reg_write_data_ex : mscratch; // @[src/main/scala/riscv/core/CSR.scala 121:66 122:16 54:25]
  assign io_id_reg_read_data = 12'hc80 == io_reg_read_address_id ? cycles[63:32] : _io_id_reg_read_data_T_13; // @[src/main/scala/riscv/core/CSR.scala 73:67]
  assign io_debug_reg_read_data = 12'hc80 == io_debug_reg_read_address ? cycles[63:32] : _io_debug_reg_read_data_T_13; // @[src/main/scala/riscv/core/CSR.scala 74:70]
  assign io_clint_access_bundle_mstatus = _io_clint_access_bundle_mstatus_T_1 ? io_reg_write_data_ex : mstatus; // @[src/main/scala/riscv/core/CSR.scala 76:40]
  assign io_clint_access_bundle_mepc = _io_clint_access_bundle_mepc_T_1 ? io_reg_write_data_ex : mepc; // @[src/main/scala/riscv/core/CSR.scala 91:37]
  assign io_clint_access_bundle_mcause = _io_clint_access_bundle_mcause_T_1 ? io_reg_write_data_ex : mcause; // @[src/main/scala/riscv/core/CSR.scala 86:39]
  assign io_clint_access_bundle_mtvec = _io_clint_access_bundle_mtvec_T_1 ? io_reg_write_data_ex : mtvec; // @[src/main/scala/riscv/core/CSR.scala 81:38]
  assign io_clint_access_bundle_mie = _io_clint_access_bundle_mie_T_1 ? io_reg_write_data_ex : mie; // @[src/main/scala/riscv/core/CSR.scala 96:36]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 51:25]
      mstatus <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 51:25]
    end else if (io_clint_access_bundle_direct_write_enable) begin // @[src/main/scala/riscv/core/CSR.scala 102:52]
      mstatus <= io_clint_access_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/CSR.scala 103:13]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 106:38]
      if (_io_clint_access_bundle_mstatus_T) begin // @[src/main/scala/riscv/core/CSR.scala 107:59]
        mstatus <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/CSR.scala 108:15]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 52:25]
      mie <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 52:25]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 116:32]
      if (_io_clint_access_bundle_mie_T) begin // @[src/main/scala/riscv/core/CSR.scala 117:55]
        mie <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/CSR.scala 118:11]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 53:25]
      mtvec <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 53:25]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 116:32]
      if (!(_io_clint_access_bundle_mie_T)) begin // @[src/main/scala/riscv/core/CSR.scala 117:55]
        if (_io_clint_access_bundle_mtvec_T) begin // @[src/main/scala/riscv/core/CSR.scala 119:63]
          mtvec <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/CSR.scala 120:13]
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 54:25]
      mscratch <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 54:25]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 116:32]
      if (!(_io_clint_access_bundle_mie_T)) begin // @[src/main/scala/riscv/core/CSR.scala 117:55]
        if (!(_io_clint_access_bundle_mtvec_T)) begin // @[src/main/scala/riscv/core/CSR.scala 119:63]
          mscratch <= _GEN_12;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 55:25]
      mepc <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 55:25]
    end else if (io_clint_access_bundle_direct_write_enable) begin // @[src/main/scala/riscv/core/CSR.scala 102:52]
      mepc <= io_clint_access_bundle_mepc_write_data; // @[src/main/scala/riscv/core/CSR.scala 104:13]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 106:38]
      if (!(_io_clint_access_bundle_mstatus_T)) begin // @[src/main/scala/riscv/core/CSR.scala 107:59]
        mepc <= _GEN_1;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 56:25]
      mcause <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 56:25]
    end else if (io_clint_access_bundle_direct_write_enable) begin // @[src/main/scala/riscv/core/CSR.scala 102:52]
      mcause <= io_clint_access_bundle_mcause_write_data; // @[src/main/scala/riscv/core/CSR.scala 105:13]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 106:38]
      if (!(_io_clint_access_bundle_mstatus_T)) begin // @[src/main/scala/riscv/core/CSR.scala 107:59]
        mcause <= _GEN_2;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 57:25]
      cycles <= 64'h0; // @[src/main/scala/riscv/core/CSR.scala 57:25]
    end else begin
      cycles <= _cycles_T_1; // @[src/main/scala/riscv/core/CSR.scala 69:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mstatus = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mie = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mtvec = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mscratch = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mepc = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mcause = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  cycles = _RAND_6[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelinedCPU(
  input         clock,
  input         reset,
  output [31:0] io_instruction_address, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output [31:0] io_memory_bundle_address, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_read, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input  [31:0] io_memory_bundle_read_data, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input         io_memory_bundle_read_valid, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_write, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output [31:0] io_memory_bundle_write_data, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_write_strobe_0, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_write_strobe_1, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_write_strobe_2, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_write_strobe_3, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input         io_memory_bundle_write_valid, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output        io_memory_bundle_request, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input         io_memory_bundle_granted, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output [2:0]  io_device_select, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input  [4:0]  io_debug_read_address, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output [31:0] io_debug_read_data, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  input  [11:0] io_csr_debug_read_address, // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
  output [31:0] io_csr_debug_read_data // @[src/main/scala/riscv/core/PipelinedCPU.scala 116:14]
);
  wire  ctrl_io_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_jump_instruction_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [4:0] ctrl_io_rs1_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [4:0] ctrl_io_rs2_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_memory_read_enable_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [4:0] ctrl_io_rd_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_memory_read_enable_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [4:0] ctrl_io_rd_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_memory_write_enable_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [1:0] ctrl_io_regs_write_source_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [1:0] ctrl_io_regs_write_source_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [1:0] ctrl_io_regs_write_source_wb; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire [4:0] ctrl_io_rd_wb; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_if_flush; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_id_flush; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_pc_stall; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_if_stall; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_branch_hazard; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  ctrl_io_jal_jalr_hazard; // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
  wire  regs_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire  regs_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire  regs_io_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [4:0] regs_io_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [31:0] regs_io_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [4:0] regs_io_read_address1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [4:0] regs_io_read_address2; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [31:0] regs_io_read_data1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [31:0] regs_io_read_data2; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [4:0] regs_io_debug_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire [31:0] regs_io_debug_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
  wire  inst_fetch_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_stall_flag_ctrl; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_jump_flag_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_jump_address_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_rom_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_instruction_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_btb_mispredict; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_btb_correction_addr; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_btb_correct_prediction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_btb_predicted_taken; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_btb_predicted_target; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_btb_update_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_btb_update_pc; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire [31:0] inst_fetch_io_btb_update_target; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  inst_fetch_io_btb_update_taken; // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
  wire  if2id_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire  if2id_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire  if2id_io_stall; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire  if2id_io_flush; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_interrupt_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire  if2id_io_btb_predicted_taken; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_btb_predicted_target; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_output_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire  if2id_io_output_btb_predicted_taken; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] if2id_io_output_btb_predicted_target; // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
  wire [31:0] id_io_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_reg1_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_forward_from_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_forward_from_wb; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [1:0] id_io_reg1_forward; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [1:0] id_io_reg2_forward; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_interrupt_assert; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_interrupt_handler_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_branch_hazard; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [4:0] id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [4:0] id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_ex_immediate; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [1:0] id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [4:0] id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [11:0] id_io_ex_csr_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_clint_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_clint_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id_io_if_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire [31:0] id_io_if_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
  wire  id2ex_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_stall; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_flush; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [4:0] id2ex_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [4:0] id2ex_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [4:0] id2ex_io_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [1:0] id2ex_io_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_reg1_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_immediate; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_aluop1_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_aluop2_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_csr_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [11:0] id2ex_io_csr_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_output_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [4:0] id2ex_io_output_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [4:0] id2ex_io_output_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [4:0] id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [1:0] id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_output_immediate; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [11:0] id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire  id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
  wire [31:0] ex_io_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_reg1_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_immediate; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire  ex_io_aluop1_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire  ex_io_aluop2_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_forward_from_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_forward_from_wb; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [1:0] ex_io_reg1_forward; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [1:0] ex_io_reg2_forward; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_mem_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_mem_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire [31:0] ex_io_csr_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
  wire  ex2mem_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_stall; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [1:0] ex2mem_io_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [2:0] ex2mem_io_funct3; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [1:0] ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_output_funct3; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire [31:0] ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
  wire  mem_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [2:0] mem_io_funct3; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [1:0] mem_io_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_forward_to_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [1:0] mem_io_wb_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_bus_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_read; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_bus_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_read_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_write; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire [31:0] mem_io_bus_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_write_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_request; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem_io_bus_granted; // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
  wire  mem2wb_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire  mem2wb_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire  mem2wb_io_stall; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire  mem2wb_io_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [1:0] mem2wb_io_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_memory_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire  mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [1:0] mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_output_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
  wire [31:0] wb_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
  wire [31:0] wb_io_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
  wire [31:0] wb_io_memory_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
  wire [1:0] wb_io_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
  wire [31:0] wb_io_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
  wire [31:0] wb_io_regs_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
  wire [4:0] forwarding_io_rs1_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [4:0] forwarding_io_rs2_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [4:0] forwarding_io_rs1_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [4:0] forwarding_io_rs2_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [4:0] forwarding_io_rd_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire  forwarding_io_reg_write_enable_mem; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [4:0] forwarding_io_rd_wb; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire  forwarding_io_reg_write_enable_wb; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [1:0] forwarding_io_reg1_forward_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [1:0] forwarding_io_reg2_forward_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [1:0] forwarding_io_reg1_forward_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [1:0] forwarding_io_reg2_forward_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
  wire [31:0] clint_io_interrupt_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_instruction_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_instruction_address_if; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire  clint_io_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire  clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mstatus; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mepc; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mcause; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mtvec; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mie; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mepc_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire [31:0] clint_io_csr_bundle_mcause_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire  clint_io_csr_bundle_direct_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
  wire  csr_regs_clock; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire  csr_regs_reset; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [11:0] csr_regs_io_reg_read_address_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire  csr_regs_io_reg_write_enable_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [11:0] csr_regs_io_reg_write_address_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_reg_write_data_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [11:0] csr_regs_io_debug_reg_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_id_reg_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_debug_reg_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mstatus; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mepc; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mcause; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mtvec; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mie; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mepc_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire [31:0] csr_regs_io_clint_access_bundle_mcause_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire  csr_regs_io_clint_access_bundle_direct_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
  wire  btb_wrong_direction = if2id_io_output_btb_predicted_taken & id_io_ctrl_jump_instruction & ~id_io_if_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 180:64]
  wire  btb_non_branch = if2id_io_output_btb_predicted_taken & ~id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 183:38]
  wire  _btb_wrong_target_T = if2id_io_output_btb_predicted_taken & id_io_if_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 186:40]
  wire  btb_wrong_target = if2id_io_output_btb_predicted_taken & id_io_if_jump_flag &
    if2id_io_output_btb_predicted_target != id_io_if_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 186:56]
  wire  btb_correct_prediction = _btb_wrong_target_T & if2id_io_output_btb_predicted_target == id_io_if_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 189:62]
  wire  _btb_mispredict_T_2 = ~id_io_branch_hazard; // @[src/main/scala/riscv/core/PipelinedCPU.scala 192:87]
  wire  btb_mispredict = (btb_wrong_direction | btb_non_branch | btb_wrong_target) & ~id_io_branch_hazard; // @[src/main/scala/riscv/core/PipelinedCPU.scala 192:84]
  wire [31:0] _btb_correction_addr_T_1 = if2id_io_output_instruction_address + 32'h4; // @[src/main/scala/riscv/core/PipelinedCPU.scala 197:102]
  wire  _btb_should_update_T_3 = ~mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 206:98]
  wire  need_if_flush = ctrl_io_if_flush & ~btb_correct_prediction | btb_mispredict; // @[src/main/scala/riscv/core/PipelinedCPU.scala 237:69]
  wire [31:0] _id_reg1_data_forwarded_T_1 = 2'h1 == forwarding_io_reg1_forward_id ? mem_io_forward_to_ex :
    regs_io_read_data1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 276:92]
  wire [31:0] _id_reg2_data_forwarded_T_1 = 2'h1 == forwarding_io_reg2_forward_id ? mem_io_forward_to_ex :
    regs_io_read_data2; // @[src/main/scala/riscv/core/PipelinedCPU.scala 282:92]
  Control ctrl ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 118:26]
    .io_jump_flag(ctrl_io_jump_flag),
    .io_jump_instruction_id(ctrl_io_jump_instruction_id),
    .io_rs1_id(ctrl_io_rs1_id),
    .io_rs2_id(ctrl_io_rs2_id),
    .io_memory_read_enable_ex(ctrl_io_memory_read_enable_ex),
    .io_rd_ex(ctrl_io_rd_ex),
    .io_memory_read_enable_mem(ctrl_io_memory_read_enable_mem),
    .io_rd_mem(ctrl_io_rd_mem),
    .io_memory_write_enable_mem(ctrl_io_memory_write_enable_mem),
    .io_regs_write_source_ex(ctrl_io_regs_write_source_ex),
    .io_regs_write_source_mem(ctrl_io_regs_write_source_mem),
    .io_regs_write_source_wb(ctrl_io_regs_write_source_wb),
    .io_rd_wb(ctrl_io_rd_wb),
    .io_if_flush(ctrl_io_if_flush),
    .io_id_flush(ctrl_io_id_flush),
    .io_pc_stall(ctrl_io_pc_stall),
    .io_if_stall(ctrl_io_if_stall),
    .io_branch_hazard(ctrl_io_branch_hazard),
    .io_jal_jalr_hazard(ctrl_io_jal_jalr_hazard)
  );
  RegisterFile regs ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 119:26]
    .clock(regs_clock),
    .reset(regs_reset),
    .io_write_enable(regs_io_write_enable),
    .io_write_address(regs_io_write_address),
    .io_write_data(regs_io_write_data),
    .io_read_address1(regs_io_read_address1),
    .io_read_address2(regs_io_read_address2),
    .io_read_data1(regs_io_read_data1),
    .io_read_data2(regs_io_read_data2),
    .io_debug_read_address(regs_io_debug_read_address),
    .io_debug_read_data(regs_io_debug_read_data)
  );
  InstructionFetch inst_fetch ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 120:26]
    .clock(inst_fetch_clock),
    .reset(inst_fetch_reset),
    .io_stall_flag_ctrl(inst_fetch_io_stall_flag_ctrl),
    .io_jump_flag_id(inst_fetch_io_jump_flag_id),
    .io_jump_address_id(inst_fetch_io_jump_address_id),
    .io_rom_instruction(inst_fetch_io_rom_instruction),
    .io_instruction_valid(inst_fetch_io_instruction_valid),
    .io_btb_mispredict(inst_fetch_io_btb_mispredict),
    .io_btb_correction_addr(inst_fetch_io_btb_correction_addr),
    .io_btb_correct_prediction(inst_fetch_io_btb_correct_prediction),
    .io_instruction_address(inst_fetch_io_instruction_address),
    .io_id_instruction(inst_fetch_io_id_instruction),
    .io_btb_predicted_taken(inst_fetch_io_btb_predicted_taken),
    .io_btb_predicted_target(inst_fetch_io_btb_predicted_target),
    .io_btb_update_valid(inst_fetch_io_btb_update_valid),
    .io_btb_update_pc(inst_fetch_io_btb_update_pc),
    .io_btb_update_target(inst_fetch_io_btb_update_target),
    .io_btb_update_taken(inst_fetch_io_btb_update_taken)
  );
  IF2ID if2id ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 121:26]
    .clock(if2id_clock),
    .reset(if2id_reset),
    .io_stall(if2id_io_stall),
    .io_flush(if2id_io_flush),
    .io_instruction(if2id_io_instruction),
    .io_instruction_address(if2id_io_instruction_address),
    .io_interrupt_flag(if2id_io_interrupt_flag),
    .io_btb_predicted_taken(if2id_io_btb_predicted_taken),
    .io_btb_predicted_target(if2id_io_btb_predicted_target),
    .io_output_instruction(if2id_io_output_instruction),
    .io_output_instruction_address(if2id_io_output_instruction_address),
    .io_output_btb_predicted_taken(if2id_io_output_btb_predicted_taken),
    .io_output_btb_predicted_target(if2id_io_output_btb_predicted_target)
  );
  InstructionDecode id ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 122:26]
    .io_instruction(id_io_instruction),
    .io_instruction_address(id_io_instruction_address),
    .io_reg1_data(id_io_reg1_data),
    .io_reg2_data(id_io_reg2_data),
    .io_forward_from_mem(id_io_forward_from_mem),
    .io_forward_from_wb(id_io_forward_from_wb),
    .io_reg1_forward(id_io_reg1_forward),
    .io_reg2_forward(id_io_reg2_forward),
    .io_interrupt_assert(id_io_interrupt_assert),
    .io_interrupt_handler_address(id_io_interrupt_handler_address),
    .io_branch_hazard(id_io_branch_hazard),
    .io_regs_reg1_read_address(id_io_regs_reg1_read_address),
    .io_regs_reg2_read_address(id_io_regs_reg2_read_address),
    .io_ex_immediate(id_io_ex_immediate),
    .io_ex_aluop1_source(id_io_ex_aluop1_source),
    .io_ex_aluop2_source(id_io_ex_aluop2_source),
    .io_ex_memory_read_enable(id_io_ex_memory_read_enable),
    .io_ex_memory_write_enable(id_io_ex_memory_write_enable),
    .io_ex_reg_write_source(id_io_ex_reg_write_source),
    .io_ex_reg_write_enable(id_io_ex_reg_write_enable),
    .io_ex_reg_write_address(id_io_ex_reg_write_address),
    .io_ex_csr_address(id_io_ex_csr_address),
    .io_ex_csr_write_enable(id_io_ex_csr_write_enable),
    .io_ctrl_jump_instruction(id_io_ctrl_jump_instruction),
    .io_clint_jump_flag(id_io_clint_jump_flag),
    .io_clint_jump_address(id_io_clint_jump_address),
    .io_if_jump_flag(id_io_if_jump_flag),
    .io_if_jump_address(id_io_if_jump_address)
  );
  ID2EX id2ex ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 123:26]
    .clock(id2ex_clock),
    .reset(id2ex_reset),
    .io_stall(id2ex_io_stall),
    .io_flush(id2ex_io_flush),
    .io_instruction(id2ex_io_instruction),
    .io_instruction_address(id2ex_io_instruction_address),
    .io_regs_reg1_read_address(id2ex_io_regs_reg1_read_address),
    .io_regs_reg2_read_address(id2ex_io_regs_reg2_read_address),
    .io_regs_write_enable(id2ex_io_regs_write_enable),
    .io_regs_write_address(id2ex_io_regs_write_address),
    .io_regs_write_source(id2ex_io_regs_write_source),
    .io_reg1_data(id2ex_io_reg1_data),
    .io_reg2_data(id2ex_io_reg2_data),
    .io_immediate(id2ex_io_immediate),
    .io_aluop1_source(id2ex_io_aluop1_source),
    .io_aluop2_source(id2ex_io_aluop2_source),
    .io_csr_write_enable(id2ex_io_csr_write_enable),
    .io_csr_address(id2ex_io_csr_address),
    .io_memory_read_enable(id2ex_io_memory_read_enable),
    .io_memory_write_enable(id2ex_io_memory_write_enable),
    .io_csr_read_data(id2ex_io_csr_read_data),
    .io_output_instruction(id2ex_io_output_instruction),
    .io_output_instruction_address(id2ex_io_output_instruction_address),
    .io_output_regs_reg1_read_address(id2ex_io_output_regs_reg1_read_address),
    .io_output_regs_reg2_read_address(id2ex_io_output_regs_reg2_read_address),
    .io_output_regs_write_enable(id2ex_io_output_regs_write_enable),
    .io_output_regs_write_address(id2ex_io_output_regs_write_address),
    .io_output_regs_write_source(id2ex_io_output_regs_write_source),
    .io_output_reg1_data(id2ex_io_output_reg1_data),
    .io_output_reg2_data(id2ex_io_output_reg2_data),
    .io_output_immediate(id2ex_io_output_immediate),
    .io_output_aluop1_source(id2ex_io_output_aluop1_source),
    .io_output_aluop2_source(id2ex_io_output_aluop2_source),
    .io_output_csr_write_enable(id2ex_io_output_csr_write_enable),
    .io_output_csr_address(id2ex_io_output_csr_address),
    .io_output_memory_read_enable(id2ex_io_output_memory_read_enable),
    .io_output_memory_write_enable(id2ex_io_output_memory_write_enable),
    .io_output_csr_read_data(id2ex_io_output_csr_read_data)
  );
  Execute ex ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 124:26]
    .io_instruction(ex_io_instruction),
    .io_instruction_address(ex_io_instruction_address),
    .io_reg1_data(ex_io_reg1_data),
    .io_reg2_data(ex_io_reg2_data),
    .io_immediate(ex_io_immediate),
    .io_aluop1_source(ex_io_aluop1_source),
    .io_aluop2_source(ex_io_aluop2_source),
    .io_csr_read_data(ex_io_csr_read_data),
    .io_forward_from_mem(ex_io_forward_from_mem),
    .io_forward_from_wb(ex_io_forward_from_wb),
    .io_reg1_forward(ex_io_reg1_forward),
    .io_reg2_forward(ex_io_reg2_forward),
    .io_mem_alu_result(ex_io_mem_alu_result),
    .io_mem_reg2_data(ex_io_mem_reg2_data),
    .io_csr_write_data(ex_io_csr_write_data)
  );
  EX2MEM ex2mem ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 125:26]
    .clock(ex2mem_clock),
    .reset(ex2mem_reset),
    .io_stall(ex2mem_io_stall),
    .io_regs_write_enable(ex2mem_io_regs_write_enable),
    .io_regs_write_source(ex2mem_io_regs_write_source),
    .io_regs_write_address(ex2mem_io_regs_write_address),
    .io_instruction_address(ex2mem_io_instruction_address),
    .io_funct3(ex2mem_io_funct3),
    .io_reg2_data(ex2mem_io_reg2_data),
    .io_memory_read_enable(ex2mem_io_memory_read_enable),
    .io_memory_write_enable(ex2mem_io_memory_write_enable),
    .io_alu_result(ex2mem_io_alu_result),
    .io_csr_read_data(ex2mem_io_csr_read_data),
    .io_output_regs_write_enable(ex2mem_io_output_regs_write_enable),
    .io_output_regs_write_source(ex2mem_io_output_regs_write_source),
    .io_output_regs_write_address(ex2mem_io_output_regs_write_address),
    .io_output_instruction_address(ex2mem_io_output_instruction_address),
    .io_output_funct3(ex2mem_io_output_funct3),
    .io_output_reg2_data(ex2mem_io_output_reg2_data),
    .io_output_memory_read_enable(ex2mem_io_output_memory_read_enable),
    .io_output_memory_write_enable(ex2mem_io_output_memory_write_enable),
    .io_output_alu_result(ex2mem_io_output_alu_result),
    .io_output_csr_read_data(ex2mem_io_output_csr_read_data)
  );
  MemoryAccess mem ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 126:26]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_alu_result(mem_io_alu_result),
    .io_reg2_data(mem_io_reg2_data),
    .io_memory_read_enable(mem_io_memory_read_enable),
    .io_memory_write_enable(mem_io_memory_write_enable),
    .io_funct3(mem_io_funct3),
    .io_regs_write_source(mem_io_regs_write_source),
    .io_csr_read_data(mem_io_csr_read_data),
    .io_instruction_address(mem_io_instruction_address),
    .io_wb_memory_read_data(mem_io_wb_memory_read_data),
    .io_forward_to_ex(mem_io_forward_to_ex),
    .io_ctrl_stall_flag(mem_io_ctrl_stall_flag),
    .io_wb_regs_write_source(mem_io_wb_regs_write_source),
    .io_bus_address(mem_io_bus_address),
    .io_bus_read(mem_io_bus_read),
    .io_bus_read_data(mem_io_bus_read_data),
    .io_bus_read_valid(mem_io_bus_read_valid),
    .io_bus_write(mem_io_bus_write),
    .io_bus_write_data(mem_io_bus_write_data),
    .io_bus_write_strobe_0(mem_io_bus_write_strobe_0),
    .io_bus_write_strobe_1(mem_io_bus_write_strobe_1),
    .io_bus_write_strobe_2(mem_io_bus_write_strobe_2),
    .io_bus_write_strobe_3(mem_io_bus_write_strobe_3),
    .io_bus_write_valid(mem_io_bus_write_valid),
    .io_bus_request(mem_io_bus_request),
    .io_bus_granted(mem_io_bus_granted)
  );
  MEM2WB mem2wb ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 127:26]
    .clock(mem2wb_clock),
    .reset(mem2wb_reset),
    .io_stall(mem2wb_io_stall),
    .io_instruction_address(mem2wb_io_instruction_address),
    .io_alu_result(mem2wb_io_alu_result),
    .io_regs_write_enable(mem2wb_io_regs_write_enable),
    .io_regs_write_source(mem2wb_io_regs_write_source),
    .io_regs_write_address(mem2wb_io_regs_write_address),
    .io_memory_read_data(mem2wb_io_memory_read_data),
    .io_csr_read_data(mem2wb_io_csr_read_data),
    .io_output_instruction_address(mem2wb_io_output_instruction_address),
    .io_output_alu_result(mem2wb_io_output_alu_result),
    .io_output_regs_write_enable(mem2wb_io_output_regs_write_enable),
    .io_output_regs_write_source(mem2wb_io_output_regs_write_source),
    .io_output_regs_write_address(mem2wb_io_output_regs_write_address),
    .io_output_memory_read_data(mem2wb_io_output_memory_read_data),
    .io_output_csr_read_data(mem2wb_io_output_csr_read_data)
  );
  WriteBack wb ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 128:26]
    .io_instruction_address(wb_io_instruction_address),
    .io_alu_result(wb_io_alu_result),
    .io_memory_read_data(wb_io_memory_read_data),
    .io_regs_write_source(wb_io_regs_write_source),
    .io_csr_read_data(wb_io_csr_read_data),
    .io_regs_write_data(wb_io_regs_write_data)
  );
  Forwarding forwarding ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 129:26]
    .io_rs1_id(forwarding_io_rs1_id),
    .io_rs2_id(forwarding_io_rs2_id),
    .io_rs1_ex(forwarding_io_rs1_ex),
    .io_rs2_ex(forwarding_io_rs2_ex),
    .io_rd_mem(forwarding_io_rd_mem),
    .io_reg_write_enable_mem(forwarding_io_reg_write_enable_mem),
    .io_rd_wb(forwarding_io_rd_wb),
    .io_reg_write_enable_wb(forwarding_io_reg_write_enable_wb),
    .io_reg1_forward_id(forwarding_io_reg1_forward_id),
    .io_reg2_forward_id(forwarding_io_reg2_forward_id),
    .io_reg1_forward_ex(forwarding_io_reg1_forward_ex),
    .io_reg2_forward_ex(forwarding_io_reg2_forward_ex)
  );
  CLINT clint ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 130:26]
    .io_interrupt_flag(clint_io_interrupt_flag),
    .io_instruction_id(clint_io_instruction_id),
    .io_instruction_address_if(clint_io_instruction_address_if),
    .io_jump_flag(clint_io_jump_flag),
    .io_jump_address(clint_io_jump_address),
    .io_id_interrupt_handler_address(clint_io_id_interrupt_handler_address),
    .io_id_interrupt_assert(clint_io_id_interrupt_assert),
    .io_csr_bundle_mstatus(clint_io_csr_bundle_mstatus),
    .io_csr_bundle_mepc(clint_io_csr_bundle_mepc),
    .io_csr_bundle_mcause(clint_io_csr_bundle_mcause),
    .io_csr_bundle_mtvec(clint_io_csr_bundle_mtvec),
    .io_csr_bundle_mie(clint_io_csr_bundle_mie),
    .io_csr_bundle_mstatus_write_data(clint_io_csr_bundle_mstatus_write_data),
    .io_csr_bundle_mepc_write_data(clint_io_csr_bundle_mepc_write_data),
    .io_csr_bundle_mcause_write_data(clint_io_csr_bundle_mcause_write_data),
    .io_csr_bundle_direct_write_enable(clint_io_csr_bundle_direct_write_enable)
  );
  CSR csr_regs ( // @[src/main/scala/riscv/core/PipelinedCPU.scala 131:26]
    .clock(csr_regs_clock),
    .reset(csr_regs_reset),
    .io_reg_read_address_id(csr_regs_io_reg_read_address_id),
    .io_reg_write_enable_ex(csr_regs_io_reg_write_enable_ex),
    .io_reg_write_address_ex(csr_regs_io_reg_write_address_ex),
    .io_reg_write_data_ex(csr_regs_io_reg_write_data_ex),
    .io_debug_reg_read_address(csr_regs_io_debug_reg_read_address),
    .io_id_reg_read_data(csr_regs_io_id_reg_read_data),
    .io_debug_reg_read_data(csr_regs_io_debug_reg_read_data),
    .io_clint_access_bundle_mstatus(csr_regs_io_clint_access_bundle_mstatus),
    .io_clint_access_bundle_mepc(csr_regs_io_clint_access_bundle_mepc),
    .io_clint_access_bundle_mcause(csr_regs_io_clint_access_bundle_mcause),
    .io_clint_access_bundle_mtvec(csr_regs_io_clint_access_bundle_mtvec),
    .io_clint_access_bundle_mie(csr_regs_io_clint_access_bundle_mie),
    .io_clint_access_bundle_mstatus_write_data(csr_regs_io_clint_access_bundle_mstatus_write_data),
    .io_clint_access_bundle_mepc_write_data(csr_regs_io_clint_access_bundle_mepc_write_data),
    .io_clint_access_bundle_mcause_write_data(csr_regs_io_clint_access_bundle_mcause_write_data),
    .io_clint_access_bundle_direct_write_enable(csr_regs_io_clint_access_bundle_direct_write_enable)
  );
  assign io_instruction_address = inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 162:35]
  assign io_memory_bundle_address = {3'h0,mem_io_bus_address[28:0]}; // @[src/main/scala/riscv/core/PipelinedCPU.scala 341:70]
  assign io_memory_bundle_read = mem_io_bus_read; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_write = mem_io_bus_write; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_write_data = mem_io_bus_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_write_strobe_0 = mem_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_write_strobe_1 = mem_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_write_strobe_2 = mem_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_write_strobe_3 = mem_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_memory_bundle_request = mem_io_bus_request; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign io_device_select = mem_io_bus_address[31:29]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 339:13]
  assign io_debug_read_data = regs_io_debug_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 157:30]
  assign io_csr_debug_read_data = csr_regs_io_debug_reg_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 382:38]
  assign ctrl_io_jump_flag = id_io_if_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 133:35]
  assign ctrl_io_jump_instruction_id = id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 134:35]
  assign ctrl_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 135:35]
  assign ctrl_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 136:35]
  assign ctrl_io_memory_read_enable_ex = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 137:35]
  assign ctrl_io_rd_ex = id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 138:35]
  assign ctrl_io_memory_read_enable_mem = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 139:35]
  assign ctrl_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 140:35]
  assign ctrl_io_memory_write_enable_mem = ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 142:35]
  assign ctrl_io_regs_write_source_ex = id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 144:35]
  assign ctrl_io_regs_write_source_mem = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 145:35]
  assign ctrl_io_regs_write_source_wb = mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 147:32]
  assign ctrl_io_rd_wb = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 148:32]
  assign regs_clock = clock;
  assign regs_reset = reset;
  assign regs_io_write_enable = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 150:25]
  assign regs_io_write_address = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 151:25]
  assign regs_io_write_data = wb_io_regs_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 152:25]
  assign regs_io_read_address1 = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 153:25]
  assign regs_io_read_address2 = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 154:25]
  assign regs_io_debug_read_address = io_debug_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 156:30]
  assign inst_fetch_clock = clock;
  assign inst_fetch_reset = reset;
  assign inst_fetch_io_stall_flag_ctrl = ctrl_io_pc_stall | mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 163:55]
  assign inst_fetch_io_jump_flag_id = id_io_if_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 164:35]
  assign inst_fetch_io_jump_address_id = id_io_if_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 165:35]
  assign inst_fetch_io_rom_instruction = io_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 166:35]
  assign inst_fetch_io_instruction_valid = io_instruction_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 167:35]
  assign inst_fetch_io_btb_mispredict = (btb_wrong_direction | btb_non_branch | btb_wrong_target) & ~id_io_branch_hazard
    ; // @[src/main/scala/riscv/core/PipelinedCPU.scala 192:84]
  assign inst_fetch_io_btb_correction_addr = btb_wrong_target ? id_io_if_jump_address : _btb_correction_addr_T_1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 197:32]
  assign inst_fetch_io_btb_correct_prediction = _btb_wrong_target_T & if2id_io_output_btb_predicted_target ==
    id_io_if_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 189:62]
  assign inst_fetch_io_btb_update_valid = (id_io_ctrl_jump_instruction | btb_non_branch) & _btb_mispredict_T_2 & ~
    mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 206:95]
  assign inst_fetch_io_btb_update_pc = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 208:35]
  assign inst_fetch_io_btb_update_target = id_io_if_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 209:35]
  assign inst_fetch_io_btb_update_taken = id_io_if_jump_flag & id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 210:57]
  assign if2id_clock = clock;
  assign if2id_reset = reset;
  assign if2id_io_stall = ctrl_io_if_stall | mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 212:38]
  assign if2id_io_flush = need_if_flush & _btb_should_update_T_3; // @[src/main/scala/riscv/core/PipelinedCPU.scala 238:50]
  assign if2id_io_instruction = inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 239:33]
  assign if2id_io_instruction_address = inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 240:33]
  assign if2id_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 241:33]
  assign if2id_io_btb_predicted_taken = inst_fetch_io_btb_predicted_taken; // @[src/main/scala/riscv/core/PipelinedCPU.scala 242:33]
  assign if2id_io_btb_predicted_target = inst_fetch_io_btb_predicted_target; // @[src/main/scala/riscv/core/PipelinedCPU.scala 243:33]
  assign id_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 245:35]
  assign id_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 246:35]
  assign id_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 247:35]
  assign id_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/PipelinedCPU.scala 248:35]
  assign id_io_forward_from_mem = mem_io_forward_to_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 249:35]
  assign id_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 250:35]
  assign id_io_reg1_forward = forwarding_io_reg1_forward_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 251:35]
  assign id_io_reg2_forward = forwarding_io_reg2_forward_id; // @[src/main/scala/riscv/core/PipelinedCPU.scala 252:35]
  assign id_io_interrupt_assert = clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/PipelinedCPU.scala 253:35]
  assign id_io_interrupt_handler_address = clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 254:35]
  assign id_io_branch_hazard = ctrl_io_branch_hazard; // @[src/main/scala/riscv/core/PipelinedCPU.scala 255:35]
  assign id2ex_clock = clock;
  assign id2ex_reset = reset;
  assign id2ex_io_stall = mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 257:18]
  assign id2ex_io_flush = ctrl_io_id_flush & (_btb_should_update_T_3 | ctrl_io_jal_jalr_hazard); // @[src/main/scala/riscv/core/PipelinedCPU.scala 267:52]
  assign id2ex_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 268:32]
  assign id2ex_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 269:32]
  assign id2ex_io_regs_reg1_read_address = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 291:35]
  assign id2ex_io_regs_reg2_read_address = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 292:35]
  assign id2ex_io_regs_write_enable = id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 293:35]
  assign id2ex_io_regs_write_address = id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 294:35]
  assign id2ex_io_regs_write_source = id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 295:35]
  assign id2ex_io_reg1_data = 2'h2 == forwarding_io_reg1_forward_id ? wb_io_regs_write_data :
    _id_reg1_data_forwarded_T_1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 276:92]
  assign id2ex_io_reg2_data = 2'h2 == forwarding_io_reg2_forward_id ? wb_io_regs_write_data :
    _id_reg2_data_forwarded_T_1; // @[src/main/scala/riscv/core/PipelinedCPU.scala 282:92]
  assign id2ex_io_immediate = id_io_ex_immediate; // @[src/main/scala/riscv/core/PipelinedCPU.scala 296:35]
  assign id2ex_io_aluop1_source = id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 297:35]
  assign id2ex_io_aluop2_source = id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 298:35]
  assign id2ex_io_csr_write_enable = id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 299:35]
  assign id2ex_io_csr_address = id_io_ex_csr_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 300:35]
  assign id2ex_io_memory_read_enable = id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 301:35]
  assign id2ex_io_memory_write_enable = id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 302:35]
  assign id2ex_io_csr_read_data = csr_regs_io_id_reg_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 303:35]
  assign ex_io_instruction = id2ex_io_output_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 305:29]
  assign ex_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 306:29]
  assign ex_io_reg1_data = id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 307:29]
  assign ex_io_reg2_data = id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 308:29]
  assign ex_io_immediate = id2ex_io_output_immediate; // @[src/main/scala/riscv/core/PipelinedCPU.scala 309:29]
  assign ex_io_aluop1_source = id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 310:29]
  assign ex_io_aluop2_source = id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 311:29]
  assign ex_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 312:29]
  assign ex_io_forward_from_mem = mem_io_forward_to_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 313:29]
  assign ex_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 314:29]
  assign ex_io_reg1_forward = forwarding_io_reg1_forward_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 315:29]
  assign ex_io_reg2_forward = forwarding_io_reg2_forward_ex; // @[src/main/scala/riscv/core/PipelinedCPU.scala 316:29]
  assign ex2mem_clock = clock;
  assign ex2mem_reset = reset;
  assign ex2mem_io_stall = mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 318:33]
  assign ex2mem_io_regs_write_enable = id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 319:33]
  assign ex2mem_io_regs_write_source = id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 320:33]
  assign ex2mem_io_regs_write_address = {{27'd0}, id2ex_io_output_regs_write_address}; // @[src/main/scala/riscv/core/PipelinedCPU.scala 321:33]
  assign ex2mem_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 322:33]
  assign ex2mem_io_funct3 = id2ex_io_output_instruction[14:12]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 323:63]
  assign ex2mem_io_reg2_data = ex_io_mem_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 324:33]
  assign ex2mem_io_memory_read_enable = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 325:33]
  assign ex2mem_io_memory_write_enable = id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 326:33]
  assign ex2mem_io_alu_result = ex_io_mem_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 327:33]
  assign ex2mem_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 328:33]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 330:30]
  assign mem_io_reg2_data = ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 331:30]
  assign mem_io_memory_read_enable = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 332:30]
  assign mem_io_memory_write_enable = ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 333:30]
  assign mem_io_funct3 = ex2mem_io_output_funct3[2:0]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 334:30]
  assign mem_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 335:30]
  assign mem_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 336:30]
  assign mem_io_instruction_address = ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 337:30]
  assign mem_io_bus_read_data = io_memory_bundle_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign mem_io_bus_read_valid = io_memory_bundle_read_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign mem_io_bus_write_valid = io_memory_bundle_write_valid; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign mem_io_bus_granted = io_memory_bundle_granted; // @[src/main/scala/riscv/core/PipelinedCPU.scala 340:20]
  assign mem2wb_clock = clock;
  assign mem2wb_reset = reset;
  assign mem2wb_io_stall = mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 344:33]
  assign mem2wb_io_instruction_address = ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 345:33]
  assign mem2wb_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 346:33]
  assign mem2wb_io_regs_write_enable = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 347:33]
  assign mem2wb_io_regs_write_source = mem_io_wb_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 350:32]
  assign mem2wb_io_regs_write_address = ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 351:32]
  assign mem2wb_io_memory_read_data = mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 352:32]
  assign mem2wb_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 353:32]
  assign wb_io_instruction_address = mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 355:29]
  assign wb_io_alu_result = mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/PipelinedCPU.scala 356:29]
  assign wb_io_memory_read_data = mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 357:29]
  assign wb_io_regs_write_source = mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/PipelinedCPU.scala 358:29]
  assign wb_io_csr_read_data = mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 359:29]
  assign forwarding_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 361:38]
  assign forwarding_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 362:38]
  assign forwarding_io_rs1_ex = id2ex_io_output_regs_reg1_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 363:38]
  assign forwarding_io_rs2_ex = id2ex_io_output_regs_reg2_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 364:38]
  assign forwarding_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 365:38]
  assign forwarding_io_reg_write_enable_mem = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 366:38]
  assign forwarding_io_rd_wb = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/PipelinedCPU.scala 367:38]
  assign forwarding_io_reg_write_enable_wb = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 368:38]
  assign clint_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 374:35]
  assign clint_io_instruction_id = if2id_io_output_instruction; // @[src/main/scala/riscv/core/PipelinedCPU.scala 371:35]
  assign clint_io_instruction_address_if = inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 370:35]
  assign clint_io_jump_flag = id_io_clint_jump_flag; // @[src/main/scala/riscv/core/PipelinedCPU.scala 372:35]
  assign clint_io_jump_address = id_io_clint_jump_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 373:35]
  assign clint_io_csr_bundle_mstatus = csr_regs_io_clint_access_bundle_mstatus; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign clint_io_csr_bundle_mepc = csr_regs_io_clint_access_bundle_mepc; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign clint_io_csr_bundle_mcause = csr_regs_io_clint_access_bundle_mcause; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign clint_io_csr_bundle_mtvec = csr_regs_io_clint_access_bundle_mtvec; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign clint_io_csr_bundle_mie = csr_regs_io_clint_access_bundle_mie; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign csr_regs_clock = clock;
  assign csr_regs_reset = reset;
  assign csr_regs_io_reg_read_address_id = id_io_ex_csr_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 377:38]
  assign csr_regs_io_reg_write_enable_ex = id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 378:38]
  assign csr_regs_io_reg_write_address_ex = id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 379:38]
  assign csr_regs_io_reg_write_data_ex = ex_io_csr_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 380:38]
  assign csr_regs_io_debug_reg_read_address = io_csr_debug_read_address; // @[src/main/scala/riscv/core/PipelinedCPU.scala 381:38]
  assign csr_regs_io_clint_access_bundle_mstatus_write_data = clint_io_csr_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign csr_regs_io_clint_access_bundle_mepc_write_data = clint_io_csr_bundle_mepc_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign csr_regs_io_clint_access_bundle_mcause_write_data = clint_io_csr_bundle_mcause_write_data; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
  assign csr_regs_io_clint_access_bundle_direct_write_enable = clint_io_csr_bundle_direct_write_enable; // @[src/main/scala/riscv/core/PipelinedCPU.scala 375:23]
endmodule
module AXI4LiteMaster(
  input         clock,
  input         reset,
  output        io_channels_write_address_channel_AWVALID, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_channels_write_address_channel_AWREADY, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_channels_write_data_channel_WVALID, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_channels_write_data_channel_WREADY, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_channels_write_response_channel_BVALID, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_channels_write_response_channel_BREADY, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_channels_read_address_channel_ARVALID, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_channels_read_address_channel_ARREADY, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_channels_read_data_channel_RVALID, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_channels_read_data_channel_RREADY, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input  [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input  [31:0] io_bundle_address, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_bundle_read, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_bundle_write, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output [31:0] io_bundle_read_data, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input  [31:0] io_bundle_write_data, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_bundle_write_strobe_0, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_bundle_write_strobe_1, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_bundle_write_strobe_2, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  input         io_bundle_write_strobe_3, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_bundle_busy, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_bundle_read_valid, // @[src/main/scala/bus/AXI4Lite.scala 229:14]
  output        io_bundle_write_valid // @[src/main/scala/bus/AXI4Lite.scala 229:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/bus/AXI4Lite.scala 234:22]
  reg [31:0] addr; // @[src/main/scala/bus/AXI4Lite.scala 237:21]
  reg  read_valid; // @[src/main/scala/bus/AXI4Lite.scala 242:27]
  reg [31:0] read_data; // @[src/main/scala/bus/AXI4Lite.scala 244:26]
  reg  ARVALID; // @[src/main/scala/bus/AXI4Lite.scala 247:24]
  reg  RREADY; // @[src/main/scala/bus/AXI4Lite.scala 249:23]
  reg  write_valid; // @[src/main/scala/bus/AXI4Lite.scala 255:28]
  reg [31:0] write_data; // @[src/main/scala/bus/AXI4Lite.scala 257:27]
  reg  write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
  reg  write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
  reg  write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
  reg  write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
  wire [1:0] io_channels_write_data_channel_WSTRB_lo = {write_strobe_1,write_strobe_0}; // @[src/main/scala/bus/AXI4Lite.scala 260:56]
  wire [1:0] io_channels_write_data_channel_WSTRB_hi = {write_strobe_3,write_strobe_2}; // @[src/main/scala/bus/AXI4Lite.scala 260:56]
  reg  AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 262:24]
  reg  WVALID; // @[src/main/scala/bus/AXI4Lite.scala 264:23]
  reg  BREADY; // @[src/main/scala/bus/AXI4Lite.scala 266:23]
  wire  _GEN_6 = io_bundle_write | AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 291:35 296:22 262:24]
  wire  _GEN_7 = io_bundle_write | WVALID; // @[src/main/scala/bus/AXI4Lite.scala 291:35 297:22 264:23]
  wire  _GEN_10 = io_bundle_read & ~io_bundle_write | ARVALID; // @[src/main/scala/bus/AXI4Lite.scala 285:48 288:17 247:24]
  wire  _GEN_11 = io_bundle_read & ~io_bundle_write | RREADY; // @[src/main/scala/bus/AXI4Lite.scala 285:48 289:17 249:23]
  wire  _GEN_23 = io_channels_read_data_channel_RVALID & RREADY | read_valid; // @[src/main/scala/bus/AXI4Lite.scala 308:60 312:20 242:27]
  wire  _GEN_25 = AWVALID & io_channels_write_address_channel_AWREADY ? 1'h0 : AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 319:66 320:17 262:24]
  wire  _GEN_26 = WVALID & io_channels_write_data_channel_WREADY ? 1'h0 : WVALID; // @[src/main/scala/bus/AXI4Lite.scala 264:23 323:61 325:29]
  wire  _GEN_27 = WVALID & io_channels_write_data_channel_WREADY | BREADY; // @[src/main/scala/bus/AXI4Lite.scala 266:23 323:61 326:29]
  wire [2:0] _GEN_29 = WVALID & io_channels_write_data_channel_WREADY ? 3'h5 : state; // @[src/main/scala/bus/AXI4Lite.scala 234:22 323:61 328:29]
  wire  _GEN_31 = io_channels_write_response_channel_BVALID & BREADY ? 1'h0 : BREADY; // @[src/main/scala/bus/AXI4Lite.scala 339:65 341:21 266:23]
  wire  _GEN_32 = io_channels_write_response_channel_BVALID & BREADY | write_valid; // @[src/main/scala/bus/AXI4Lite.scala 339:65 342:21 255:28]
  wire [2:0] _GEN_33 = io_channels_write_response_channel_BVALID & BREADY ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 339:65 343:21 234:22]
  wire [2:0] _GEN_34 = 3'h3 == state ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 279:17 352:13 234:22]
  wire [2:0] _GEN_35 = 3'h1 == state ? 3'h0 : _GEN_34; // @[src/main/scala/bus/AXI4Lite.scala 279:17 349:13]
  wire  _GEN_36 = 3'h5 == state ? _GEN_25 : AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 279:17 262:24]
  wire  _GEN_37 = 3'h5 == state ? _GEN_31 : BREADY; // @[src/main/scala/bus/AXI4Lite.scala 279:17 266:23]
  wire  _GEN_38 = 3'h5 == state ? _GEN_32 : write_valid; // @[src/main/scala/bus/AXI4Lite.scala 279:17 255:28]
  wire [2:0] _GEN_39 = 3'h5 == state ? _GEN_33 : _GEN_35; // @[src/main/scala/bus/AXI4Lite.scala 279:17]
  assign io_channels_write_address_channel_AWVALID = AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 263:45]
  assign io_channels_write_address_channel_AWADDR = addr; // @[src/main/scala/bus/AXI4Lite.scala 239:44]
  assign io_channels_write_data_channel_WVALID = WVALID; // @[src/main/scala/bus/AXI4Lite.scala 265:41]
  assign io_channels_write_data_channel_WDATA = write_data; // @[src/main/scala/bus/AXI4Lite.scala 258:40]
  assign io_channels_write_data_channel_WSTRB = {io_channels_write_data_channel_WSTRB_hi,
    io_channels_write_data_channel_WSTRB_lo}; // @[src/main/scala/bus/AXI4Lite.scala 260:56]
  assign io_channels_write_response_channel_BREADY = BREADY; // @[src/main/scala/bus/AXI4Lite.scala 267:45]
  assign io_channels_read_address_channel_ARVALID = ARVALID; // @[src/main/scala/bus/AXI4Lite.scala 248:44]
  assign io_channels_read_address_channel_ARADDR = addr; // @[src/main/scala/bus/AXI4Lite.scala 238:44]
  assign io_channels_read_data_channel_RREADY = RREADY; // @[src/main/scala/bus/AXI4Lite.scala 250:40]
  assign io_bundle_read_data = read_data; // @[src/main/scala/bus/AXI4Lite.scala 245:23]
  assign io_bundle_busy = state != 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 235:27]
  assign io_bundle_read_valid = read_valid; // @[src/main/scala/bus/AXI4Lite.scala 243:24]
  assign io_bundle_write_valid = write_valid; // @[src/main/scala/bus/AXI4Lite.scala 256:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 234:22]
      state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 234:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (io_bundle_read & ~io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        state <= 3'h2; // @[src/main/scala/bus/AXI4Lite.scala 290:17]
      end else if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
        state <= 3'h4; // @[src/main/scala/bus/AXI4Lite.scala 298:22]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (io_channels_read_data_channel_RVALID & RREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 308:60]
        state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 313:20]
      end
    end else if (3'h4 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      state <= _GEN_29;
    end else begin
      state <= _GEN_39;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 237:21]
      addr <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 237:21]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (io_bundle_read & ~io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        addr <= io_bundle_address; // @[src/main/scala/bus/AXI4Lite.scala 287:17]
      end else if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
        addr <= io_bundle_address; // @[src/main/scala/bus/AXI4Lite.scala 293:22]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 242:27]
      read_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 242:27]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      read_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 281:27]
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      read_valid <= _GEN_23;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 244:26]
      read_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 244:26]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
        if (io_channels_read_data_channel_RVALID & RREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 308:60]
          read_data <= io_channels_read_data_channel_RDATA; // @[src/main/scala/bus/AXI4Lite.scala 310:20]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 247:24]
      ARVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 247:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      ARVALID <= _GEN_10;
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (ARVALID & io_channels_read_address_channel_ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 304:65]
        ARVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 305:17]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 249:23]
      RREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 249:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      RREADY <= _GEN_11;
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (io_channels_read_data_channel_RVALID & RREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 308:60]
        RREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 311:20]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 255:28]
      write_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 255:28]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      write_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 282:27]
    end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(3'h4 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
        write_valid <= _GEN_38;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 257:27]
      write_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 257:27]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
          write_data <= io_bundle_write_data; // @[src/main/scala/bus/AXI4Lite.scala 294:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 259:29]
      write_strobe_0 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
          write_strobe_0 <= io_bundle_write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 295:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 259:29]
      write_strobe_1 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
          write_strobe_1 <= io_bundle_write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 295:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 259:29]
      write_strobe_2 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
          write_strobe_2 <= io_bundle_write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 295:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 259:29]
      write_strobe_3 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 259:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 291:35]
          write_strobe_3 <= io_bundle_write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 295:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 262:24]
      AWVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 262:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        AWVALID <= _GEN_6;
      end
    end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (3'h4 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
        AWVALID <= _GEN_25;
      end else begin
        AWVALID <= _GEN_36;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 264:23]
      WVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 264:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(io_bundle_read & ~io_bundle_write)) begin // @[src/main/scala/bus/AXI4Lite.scala 285:48]
        WVALID <= _GEN_7;
      end
    end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (3'h4 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
        WVALID <= _GEN_26;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 266:23]
      BREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 266:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
        if (3'h4 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 279:17]
          BREADY <= _GEN_27;
        end else begin
          BREADY <= _GEN_37;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  read_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  read_data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  ARVALID = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  RREADY = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  write_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  write_data = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  write_strobe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  write_strobe_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  write_strobe_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  write_strobe_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  AWVALID = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  WVALID = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  BREADY = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CPU(
  input         clock,
  input         reset,
  output [31:0] io_instruction_address, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output        io_axi4_channels_write_address_channel_AWVALID, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input         io_axi4_channels_write_address_channel_AWREADY, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [31:0] io_axi4_channels_write_address_channel_AWADDR, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output        io_axi4_channels_write_data_channel_WVALID, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input         io_axi4_channels_write_data_channel_WREADY, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [31:0] io_axi4_channels_write_data_channel_WDATA, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [3:0]  io_axi4_channels_write_data_channel_WSTRB, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input         io_axi4_channels_write_response_channel_BVALID, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output        io_axi4_channels_write_response_channel_BREADY, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output        io_axi4_channels_read_address_channel_ARVALID, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input         io_axi4_channels_read_address_channel_ARREADY, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [31:0] io_axi4_channels_read_address_channel_ARADDR, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input         io_axi4_channels_read_data_channel_RVALID, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output        io_axi4_channels_read_data_channel_RREADY, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input  [31:0] io_axi4_channels_read_data_channel_RDATA, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input  [4:0]  io_debug_read_address, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [31:0] io_debug_read_data, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  input  [11:0] io_csr_debug_read_address, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [31:0] io_csr_debug_read_data, // @[src/main/scala/riscv/core/CPU.scala 14:14]
  output [31:0] io_bus_address // @[src/main/scala/riscv/core/CPU.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  cpu_clock; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_reset; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_instruction_address; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_instruction; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_instruction_valid; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_memory_bundle_address; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_read; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_memory_bundle_read_data; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_read_valid; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_write; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_memory_bundle_write_data; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_write_strobe_0; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_write_strobe_1; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_write_strobe_2; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_write_strobe_3; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_write_valid; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_request; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  cpu_io_memory_bundle_granted; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [2:0] cpu_io_device_select; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_interrupt_flag; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [4:0] cpu_io_debug_read_address; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_debug_read_data; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [11:0] cpu_io_csr_debug_read_address; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire [31:0] cpu_io_csr_debug_read_data; // @[src/main/scala/riscv/core/CPU.scala 18:23]
  wire  axi_master_clock; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_reset; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [3:0] axi_master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_bundle_address; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_read; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_write; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_bundle_read_data; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] axi_master_io_bundle_write_data; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_write_strobe_0; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_write_strobe_1; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_write_strobe_2; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_write_strobe_3; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_busy; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire  axi_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/CPU.scala 26:30]
  wire [31:0] full_bus_address = {cpu_io_device_select,cpu_io_memory_bundle_address[28:0]}; // @[src/main/scala/riscv/core/CPU.scala 29:51]
  wire  _cpu_io_memory_bundle_granted_T = ~axi_master_io_bundle_busy; // @[src/main/scala/riscv/core/CPU.scala 44:51]
  reg [31:0] bus_address_reg; // @[src/main/scala/riscv/core/CPU.scala 69:37]
  wire  _start_bus_transaction_T_1 = _cpu_io_memory_bundle_granted_T & cpu_io_memory_bundle_request; // @[src/main/scala/riscv/core/CPU.scala 75:36]
  wire  _start_bus_transaction_T_2 = cpu_io_memory_bundle_read | cpu_io_memory_bundle_write; // @[src/main/scala/riscv/core/CPU.scala 77:38]
  wire  start_bus_transaction = _start_bus_transaction_T_1 & _start_bus_transaction_T_2; // @[src/main/scala/riscv/core/CPU.scala 76:40]
  PipelinedCPU cpu ( // @[src/main/scala/riscv/core/CPU.scala 18:23]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_instruction_address(cpu_io_instruction_address),
    .io_instruction(cpu_io_instruction),
    .io_instruction_valid(cpu_io_instruction_valid),
    .io_memory_bundle_address(cpu_io_memory_bundle_address),
    .io_memory_bundle_read(cpu_io_memory_bundle_read),
    .io_memory_bundle_read_data(cpu_io_memory_bundle_read_data),
    .io_memory_bundle_read_valid(cpu_io_memory_bundle_read_valid),
    .io_memory_bundle_write(cpu_io_memory_bundle_write),
    .io_memory_bundle_write_data(cpu_io_memory_bundle_write_data),
    .io_memory_bundle_write_strobe_0(cpu_io_memory_bundle_write_strobe_0),
    .io_memory_bundle_write_strobe_1(cpu_io_memory_bundle_write_strobe_1),
    .io_memory_bundle_write_strobe_2(cpu_io_memory_bundle_write_strobe_2),
    .io_memory_bundle_write_strobe_3(cpu_io_memory_bundle_write_strobe_3),
    .io_memory_bundle_write_valid(cpu_io_memory_bundle_write_valid),
    .io_memory_bundle_request(cpu_io_memory_bundle_request),
    .io_memory_bundle_granted(cpu_io_memory_bundle_granted),
    .io_device_select(cpu_io_device_select),
    .io_interrupt_flag(cpu_io_interrupt_flag),
    .io_debug_read_address(cpu_io_debug_read_address),
    .io_debug_read_data(cpu_io_debug_read_data),
    .io_csr_debug_read_address(cpu_io_csr_debug_read_address),
    .io_csr_debug_read_data(cpu_io_csr_debug_read_data)
  );
  AXI4LiteMaster axi_master ( // @[src/main/scala/riscv/core/CPU.scala 26:30]
    .clock(axi_master_clock),
    .reset(axi_master_reset),
    .io_channels_write_address_channel_AWVALID(axi_master_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(axi_master_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(axi_master_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(axi_master_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(axi_master_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(axi_master_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(axi_master_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(axi_master_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(axi_master_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(axi_master_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(axi_master_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(axi_master_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(axi_master_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(axi_master_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(axi_master_io_channels_read_data_channel_RDATA),
    .io_bundle_address(axi_master_io_bundle_address),
    .io_bundle_read(axi_master_io_bundle_read),
    .io_bundle_write(axi_master_io_bundle_write),
    .io_bundle_read_data(axi_master_io_bundle_read_data),
    .io_bundle_write_data(axi_master_io_bundle_write_data),
    .io_bundle_write_strobe_0(axi_master_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(axi_master_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(axi_master_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(axi_master_io_bundle_write_strobe_3),
    .io_bundle_busy(axi_master_io_bundle_busy),
    .io_bundle_read_valid(axi_master_io_bundle_read_valid),
    .io_bundle_write_valid(axi_master_io_bundle_write_valid)
  );
  assign io_instruction_address = cpu_io_instruction_address; // @[src/main/scala/riscv/core/CPU.scala 21:32]
  assign io_axi4_channels_write_address_channel_AWVALID = axi_master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_write_address_channel_AWADDR = axi_master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_write_data_channel_WVALID = axi_master_io_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_write_data_channel_WDATA = axi_master_io_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_write_data_channel_WSTRB = axi_master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_write_response_channel_BREADY = axi_master_io_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_read_address_channel_ARVALID = axi_master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_read_address_channel_ARADDR = axi_master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_axi4_channels_read_data_channel_RREADY = axi_master_io_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign io_debug_read_data = cpu_io_debug_read_data; // @[src/main/scala/riscv/core/CPU.scala 102:33]
  assign io_csr_debug_read_data = cpu_io_csr_debug_read_data; // @[src/main/scala/riscv/core/CPU.scala 105:37]
  assign io_bus_address = bus_address_reg; // @[src/main/scala/riscv/core/CPU.scala 83:22]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_instruction = io_instruction; // @[src/main/scala/riscv/core/CPU.scala 22:32]
  assign cpu_io_instruction_valid = io_instruction_valid; // @[src/main/scala/riscv/core/CPU.scala 23:32]
  assign cpu_io_memory_bundle_read_data = axi_master_io_bundle_read_data; // @[src/main/scala/riscv/core/CPU.scala 39:48]
  assign cpu_io_memory_bundle_read_valid = axi_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/CPU.scala 40:48]
  assign cpu_io_memory_bundle_write_valid = axi_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/CPU.scala 41:48]
  assign cpu_io_memory_bundle_granted = ~axi_master_io_bundle_busy; // @[src/main/scala/riscv/core/CPU.scala 44:51]
  assign cpu_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/CPU.scala 98:29]
  assign cpu_io_debug_read_address = io_debug_read_address; // @[src/main/scala/riscv/core/CPU.scala 101:33]
  assign cpu_io_csr_debug_read_address = io_csr_debug_read_address; // @[src/main/scala/riscv/core/CPU.scala 104:37]
  assign axi_master_clock = clock;
  assign axi_master_reset = reset;
  assign axi_master_io_channels_write_address_channel_AWREADY = io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign axi_master_io_channels_write_data_channel_WREADY = io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign axi_master_io_channels_write_response_channel_BVALID = io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign axi_master_io_channels_read_address_channel_ARREADY = io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign axi_master_io_channels_read_data_channel_RVALID = io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign axi_master_io_channels_read_data_channel_RDATA = io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/CPU.scala 47:24]
  assign axi_master_io_bundle_address = {cpu_io_device_select,cpu_io_memory_bundle_address[28:0]}; // @[src/main/scala/riscv/core/CPU.scala 29:51]
  assign axi_master_io_bundle_read = cpu_io_memory_bundle_request & cpu_io_memory_bundle_read; // @[src/main/scala/riscv/core/CPU.scala 34:73]
  assign axi_master_io_bundle_write = cpu_io_memory_bundle_request & cpu_io_memory_bundle_write; // @[src/main/scala/riscv/core/CPU.scala 35:73]
  assign axi_master_io_bundle_write_data = cpu_io_memory_bundle_write_data; // @[src/main/scala/riscv/core/CPU.scala 36:41]
  assign axi_master_io_bundle_write_strobe_0 = cpu_io_memory_bundle_write_strobe_0; // @[src/main/scala/riscv/core/CPU.scala 37:41]
  assign axi_master_io_bundle_write_strobe_1 = cpu_io_memory_bundle_write_strobe_1; // @[src/main/scala/riscv/core/CPU.scala 37:41]
  assign axi_master_io_bundle_write_strobe_2 = cpu_io_memory_bundle_write_strobe_2; // @[src/main/scala/riscv/core/CPU.scala 37:41]
  assign axi_master_io_bundle_write_strobe_3 = cpu_io_memory_bundle_write_strobe_3; // @[src/main/scala/riscv/core/CPU.scala 37:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/CPU.scala 69:37]
      bus_address_reg <= 32'h0; // @[src/main/scala/riscv/core/CPU.scala 69:37]
    end else if (start_bus_transaction) begin // @[src/main/scala/riscv/core/CPU.scala 79:35]
      bus_address_reg <= full_bus_address; // @[src/main/scala/riscv/core/CPU.scala 80:25]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  bus_address_reg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BusSwitch(
  input  [31:0] io_address, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_0_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_0_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_0_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_0_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_0_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_0_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [3:0]  io_slaves_0_write_data_channel_WSTRB, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_0_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_0_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_0_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_0_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_0_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_0_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_0_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_slaves_0_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_1_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_1_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_1_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_1_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_1_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_1_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_1_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_1_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_1_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_1_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_1_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_1_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_1_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_slaves_1_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_2_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_2_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_2_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_2_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_2_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_2_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_2_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_2_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_2_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_2_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_2_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_2_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_2_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_slaves_2_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_3_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_3_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_3_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_3_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_3_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_3_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [3:0]  io_slaves_3_write_data_channel_WSTRB, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_3_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_3_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_3_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_3_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_3_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_3_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_3_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_slaves_3_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_4_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_4_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_4_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_4_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_4_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_4_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [3:0]  io_slaves_4_write_data_channel_WSTRB, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_4_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_4_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_4_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_4_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_slaves_4_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_slaves_4_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_slaves_4_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_slaves_4_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_master_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_master_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_master_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_master_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_master_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_master_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [3:0]  io_master_write_data_channel_WSTRB, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_master_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_master_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_master_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_master_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input  [31:0] io_master_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output        io_master_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  input         io_master_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 12:14]
  output [31:0] io_master_read_data_channel_RDATA // @[src/main/scala/bus/BusSwitch.scala 12:14]
);
  wire [2:0] index = io_address[31:29]; // @[src/main/scala/bus/BusSwitch.scala 18:25]
  wire [7:0] sel = 8'h1 << index; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  wire  hit = sel[0]; // @[src/main/scala/bus/BusSwitch.scala 23:18]
  wire  hit_1 = sel[1]; // @[src/main/scala/bus/BusSwitch.scala 23:18]
  wire  hit_2 = sel[2]; // @[src/main/scala/bus/BusSwitch.scala 23:18]
  wire  hit_3 = sel[3]; // @[src/main/scala/bus/BusSwitch.scala 23:18]
  wire  hit_4 = sel[4]; // @[src/main/scala/bus/BusSwitch.scala 23:18]
  wire [31:0] _io_master_read_data_channel_RDATA_T_8 = hit ? io_slaves_0_read_data_channel_RDATA : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_9 = hit_1 ? io_slaves_1_read_data_channel_RDATA : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_10 = hit_2 ? io_slaves_2_read_data_channel_RDATA : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_11 = hit_3 ? io_slaves_3_read_data_channel_RDATA : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_12 = hit_4 ? io_slaves_4_read_data_channel_RDATA : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_16 = _io_master_read_data_channel_RDATA_T_8 |
    _io_master_read_data_channel_RDATA_T_9; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_17 = _io_master_read_data_channel_RDATA_T_16 |
    _io_master_read_data_channel_RDATA_T_10; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_master_read_data_channel_RDATA_T_18 = _io_master_read_data_channel_RDATA_T_17 |
    _io_master_read_data_channel_RDATA_T_11; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_slaves_0_write_address_channel_AWVALID = io_master_write_address_channel_AWVALID & hit; // @[src/main/scala/bus/BusSwitch.scala 25:91]
  assign io_slaves_0_write_address_channel_AWADDR = io_master_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 26:48]
  assign io_slaves_0_write_data_channel_WVALID = io_master_write_data_channel_WVALID & hit; // @[src/main/scala/bus/BusSwitch.scala 29:83]
  assign io_slaves_0_write_data_channel_WDATA = io_master_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 30:44]
  assign io_slaves_0_write_data_channel_WSTRB = io_master_write_data_channel_WSTRB; // @[src/main/scala/bus/BusSwitch.scala 31:44]
  assign io_slaves_0_write_response_channel_BREADY = io_master_write_response_channel_BREADY & hit; // @[src/main/scala/bus/BusSwitch.scala 33:91]
  assign io_slaves_0_read_address_channel_ARVALID = io_master_read_address_channel_ARVALID & hit; // @[src/main/scala/bus/BusSwitch.scala 35:89]
  assign io_slaves_0_read_address_channel_ARADDR = io_master_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 36:47]
  assign io_slaves_0_read_data_channel_RREADY = io_master_read_data_channel_RREADY & hit; // @[src/main/scala/bus/BusSwitch.scala 39:81]
  assign io_slaves_1_write_address_channel_AWVALID = io_master_write_address_channel_AWVALID & hit_1; // @[src/main/scala/bus/BusSwitch.scala 25:91]
  assign io_slaves_1_write_address_channel_AWADDR = io_master_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 26:48]
  assign io_slaves_1_write_data_channel_WVALID = io_master_write_data_channel_WVALID & hit_1; // @[src/main/scala/bus/BusSwitch.scala 29:83]
  assign io_slaves_1_write_data_channel_WDATA = io_master_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 30:44]
  assign io_slaves_1_write_response_channel_BREADY = io_master_write_response_channel_BREADY & hit_1; // @[src/main/scala/bus/BusSwitch.scala 33:91]
  assign io_slaves_1_read_address_channel_ARVALID = io_master_read_address_channel_ARVALID & hit_1; // @[src/main/scala/bus/BusSwitch.scala 35:89]
  assign io_slaves_1_read_address_channel_ARADDR = io_master_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 36:47]
  assign io_slaves_1_read_data_channel_RREADY = io_master_read_data_channel_RREADY & hit_1; // @[src/main/scala/bus/BusSwitch.scala 39:81]
  assign io_slaves_2_write_address_channel_AWVALID = io_master_write_address_channel_AWVALID & hit_2; // @[src/main/scala/bus/BusSwitch.scala 25:91]
  assign io_slaves_2_write_address_channel_AWADDR = io_master_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 26:48]
  assign io_slaves_2_write_data_channel_WVALID = io_master_write_data_channel_WVALID & hit_2; // @[src/main/scala/bus/BusSwitch.scala 29:83]
  assign io_slaves_2_write_data_channel_WDATA = io_master_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 30:44]
  assign io_slaves_2_write_response_channel_BREADY = io_master_write_response_channel_BREADY & hit_2; // @[src/main/scala/bus/BusSwitch.scala 33:91]
  assign io_slaves_2_read_address_channel_ARVALID = io_master_read_address_channel_ARVALID & hit_2; // @[src/main/scala/bus/BusSwitch.scala 35:89]
  assign io_slaves_2_read_address_channel_ARADDR = io_master_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 36:47]
  assign io_slaves_2_read_data_channel_RREADY = io_master_read_data_channel_RREADY & hit_2; // @[src/main/scala/bus/BusSwitch.scala 39:81]
  assign io_slaves_3_write_address_channel_AWVALID = io_master_write_address_channel_AWVALID & hit_3; // @[src/main/scala/bus/BusSwitch.scala 25:91]
  assign io_slaves_3_write_address_channel_AWADDR = io_master_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 26:48]
  assign io_slaves_3_write_data_channel_WVALID = io_master_write_data_channel_WVALID & hit_3; // @[src/main/scala/bus/BusSwitch.scala 29:83]
  assign io_slaves_3_write_data_channel_WDATA = io_master_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 30:44]
  assign io_slaves_3_write_data_channel_WSTRB = io_master_write_data_channel_WSTRB; // @[src/main/scala/bus/BusSwitch.scala 31:44]
  assign io_slaves_3_write_response_channel_BREADY = io_master_write_response_channel_BREADY & hit_3; // @[src/main/scala/bus/BusSwitch.scala 33:91]
  assign io_slaves_3_read_address_channel_ARVALID = io_master_read_address_channel_ARVALID & hit_3; // @[src/main/scala/bus/BusSwitch.scala 35:89]
  assign io_slaves_3_read_address_channel_ARADDR = io_master_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 36:47]
  assign io_slaves_3_read_data_channel_RREADY = io_master_read_data_channel_RREADY & hit_3; // @[src/main/scala/bus/BusSwitch.scala 39:81]
  assign io_slaves_4_write_address_channel_AWVALID = io_master_write_address_channel_AWVALID & hit_4; // @[src/main/scala/bus/BusSwitch.scala 25:91]
  assign io_slaves_4_write_address_channel_AWADDR = io_master_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 26:48]
  assign io_slaves_4_write_data_channel_WVALID = io_master_write_data_channel_WVALID & hit_4; // @[src/main/scala/bus/BusSwitch.scala 29:83]
  assign io_slaves_4_write_data_channel_WDATA = io_master_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 30:44]
  assign io_slaves_4_write_data_channel_WSTRB = io_master_write_data_channel_WSTRB; // @[src/main/scala/bus/BusSwitch.scala 31:44]
  assign io_slaves_4_write_response_channel_BREADY = io_master_write_response_channel_BREADY & hit_4; // @[src/main/scala/bus/BusSwitch.scala 33:91]
  assign io_slaves_4_read_address_channel_ARVALID = io_master_read_address_channel_ARVALID & hit_4; // @[src/main/scala/bus/BusSwitch.scala 35:89]
  assign io_slaves_4_read_address_channel_ARADDR = io_master_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 36:47]
  assign io_slaves_4_read_data_channel_RREADY = io_master_read_data_channel_RREADY & hit_4; // @[src/main/scala/bus/BusSwitch.scala 39:81]
  assign io_master_write_address_channel_AWREADY = hit & io_slaves_0_write_address_channel_AWREADY | hit_1 &
    io_slaves_1_write_address_channel_AWREADY | hit_2 & io_slaves_2_write_address_channel_AWREADY | hit_3 &
    io_slaves_3_write_address_channel_AWREADY | hit_4 & io_slaves_4_write_address_channel_AWREADY; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_master_write_data_channel_WREADY = hit & io_slaves_0_write_data_channel_WREADY | hit_1 &
    io_slaves_1_write_data_channel_WREADY | hit_2 & io_slaves_2_write_data_channel_WREADY | hit_3 &
    io_slaves_3_write_data_channel_WREADY | hit_4 & io_slaves_4_write_data_channel_WREADY; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_master_write_response_channel_BVALID = hit & io_slaves_0_write_response_channel_BVALID | hit_1 &
    io_slaves_1_write_response_channel_BVALID | hit_2 & io_slaves_2_write_response_channel_BVALID | hit_3 &
    io_slaves_3_write_response_channel_BVALID | hit_4 & io_slaves_4_write_response_channel_BVALID; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_master_read_address_channel_ARREADY = hit & io_slaves_0_read_address_channel_ARREADY | hit_1 &
    io_slaves_1_read_address_channel_ARREADY | hit_2 & io_slaves_2_read_address_channel_ARREADY | hit_3 &
    io_slaves_3_read_address_channel_ARREADY | hit_4 & io_slaves_4_read_address_channel_ARREADY; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_master_read_data_channel_RVALID = hit & io_slaves_0_read_data_channel_RVALID | hit_1 &
    io_slaves_1_read_data_channel_RVALID | hit_2 & io_slaves_2_read_data_channel_RVALID | hit_3 &
    io_slaves_3_read_data_channel_RVALID | hit_4 & io_slaves_4_read_data_channel_RVALID; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_master_read_data_channel_RDATA = _io_master_read_data_channel_RDATA_T_18 |
    _io_master_read_data_channel_RDATA_T_12; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
endmodule
module Top(
  input         clock,
  input         reset,
  input         io_signal_interrupt, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [31:0] io_instruction_address, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input  [31:0] io_instruction, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_instruction_valid, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [31:0] io_mem_slave_address, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_mem_slave_read, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input  [31:0] io_mem_slave_read_data, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_mem_slave_read_valid, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_mem_slave_write, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [31:0] io_mem_slave_write_data, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_mem_slave_write_strobe_0, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_mem_slave_write_strobe_1, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_mem_slave_write_strobe_2, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_mem_slave_write_strobe_3, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_vga_pixclk, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_vga_hsync, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_vga_vsync, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [5:0]  io_vga_rrggbb, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_vga_activevideo, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [9:0]  io_vga_x_pos, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [9:0]  io_vga_y_pos, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_uart_txd, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_uart_rxd, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output        io_uart_interrupt, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input  [15:0] io_mouse_x, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input  [15:0] io_mouse_y, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_mouse_left_button, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_mouse_right_button, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input         io_mouse_middle_button, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input  [4:0]  io_cpu_debug_read_address, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [31:0] io_cpu_debug_read_data, // @[src/main/scala/board/verilator/Top.scala 22:14]
  input  [11:0] io_cpu_csr_debug_read_address, // @[src/main/scala/board/verilator/Top.scala 22:14]
  output [31:0] io_cpu_csr_debug_read_data // @[src/main/scala/board/verilator/Top.scala 22:14]
);
  wire  mem_slave_clock; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_reset; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [3:0] mem_slave_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_bundle_address; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_read; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_bundle_read_data; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_read_valid; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_write; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire [31:0] mem_slave_io_bundle_write_data; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_write_strobe_0; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_write_strobe_1; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_write_strobe_2; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  mem_slave_io_bundle_write_strobe_3; // @[src/main/scala/board/verilator/Top.scala 60:25]
  wire  vga_clock; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_reset; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [7:0] vga_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [31:0] vga_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [7:0] vga_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [31:0] vga_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_pixClock; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_hsync; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_vsync; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [5:0] vga_io_rrggbb; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  vga_io_activevideo; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [9:0] vga_io_x_pos; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [9:0] vga_io_y_pos; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [9:0] vga_io_cursor_x; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire [9:0] vga_io_cursor_y; // @[src/main/scala/board/verilator/Top.scala 64:19]
  wire  uart_clock; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_reset; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire [7:0] uart_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire [31:0] uart_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire [7:0] uart_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire [31:0] uart_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_rxd; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_txd; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  uart_io_signal_interrupt; // @[src/main/scala/board/verilator/Top.scala 67:20]
  wire  mouse_clock; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_reset; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [31:0] mouse_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [31:0] mouse_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [3:0] mouse_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [31:0] mouse_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [31:0] mouse_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [15:0] mouse_io_x; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire [15:0] mouse_io_y; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_leftButton; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_rightButton; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  mouse_io_middleButton; // @[src/main/scala/board/verilator/Top.scala 70:21]
  wire  timer_clock; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_reset; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire [31:0] timer_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire [31:0] timer_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire [3:0] timer_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire [31:0] timer_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire [31:0] timer_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  timer_io_signal_interrupt; // @[src/main/scala/board/verilator/Top.scala 73:21]
  wire  cpu_clock; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_reset; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_instruction_address; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_instruction; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_instruction_valid; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_axi4_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_axi4_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [3:0] cpu_io_axi4_channels_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_axi4_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire  cpu_io_axi4_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_interrupt_flag; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [4:0] cpu_io_debug_read_address; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_debug_read_data; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [11:0] cpu_io_csr_debug_read_address; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_csr_debug_read_data; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] cpu_io_bus_address; // @[src/main/scala/board/verilator/Top.scala 75:27]
  wire [31:0] bus_switch_io_address; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_0_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_0_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [3:0] bus_switch_io_slaves_0_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_0_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_0_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_0_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_1_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_1_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_1_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_1_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_1_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_2_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_2_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_2_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_2_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_2_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_3_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_3_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [3:0] bus_switch_io_slaves_3_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_3_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_3_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_3_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_4_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_4_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [3:0] bus_switch_io_slaves_4_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_4_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_slaves_4_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_slaves_4_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_master_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_master_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [3:0] bus_switch_io_master_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_master_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  bus_switch_io_master_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire [31:0] bus_switch_io_master_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 78:27]
  wire  _cpu_io_interrupt_flag_T_1 = io_signal_interrupt | uart_io_signal_interrupt | timer_io_signal_interrupt; // @[src/main/scala/board/verilator/Top.scala 135:76]
  AXI4LiteSlave mem_slave ( // @[src/main/scala/board/verilator/Top.scala 60:25]
    .clock(mem_slave_clock),
    .reset(mem_slave_reset),
    .io_channels_write_address_channel_AWVALID(mem_slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(mem_slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(mem_slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(mem_slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(mem_slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(mem_slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(mem_slave_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(mem_slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(mem_slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(mem_slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(mem_slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(mem_slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(mem_slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(mem_slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(mem_slave_io_channels_read_data_channel_RDATA),
    .io_bundle_address(mem_slave_io_bundle_address),
    .io_bundle_read(mem_slave_io_bundle_read),
    .io_bundle_read_data(mem_slave_io_bundle_read_data),
    .io_bundle_read_valid(mem_slave_io_bundle_read_valid),
    .io_bundle_write(mem_slave_io_bundle_write),
    .io_bundle_write_data(mem_slave_io_bundle_write_data),
    .io_bundle_write_strobe_0(mem_slave_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(mem_slave_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(mem_slave_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(mem_slave_io_bundle_write_strobe_3)
  );
  VGA vga ( // @[src/main/scala/board/verilator/Top.scala 64:19]
    .clock(vga_clock),
    .reset(vga_reset),
    .io_channels_write_address_channel_AWVALID(vga_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(vga_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(vga_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(vga_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(vga_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(vga_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(vga_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(vga_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(vga_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(vga_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(vga_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(vga_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(vga_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(vga_io_channels_read_data_channel_RDATA),
    .io_pixClock(vga_io_pixClock),
    .io_hsync(vga_io_hsync),
    .io_vsync(vga_io_vsync),
    .io_rrggbb(vga_io_rrggbb),
    .io_activevideo(vga_io_activevideo),
    .io_x_pos(vga_io_x_pos),
    .io_y_pos(vga_io_y_pos),
    .io_cursor_x(vga_io_cursor_x),
    .io_cursor_y(vga_io_cursor_y)
  );
  Uart uart ( // @[src/main/scala/board/verilator/Top.scala 67:20]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_channels_write_address_channel_AWVALID(uart_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(uart_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(uart_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(uart_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(uart_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(uart_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(uart_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(uart_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(uart_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(uart_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(uart_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(uart_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(uart_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(uart_io_channels_read_data_channel_RDATA),
    .io_rxd(uart_io_rxd),
    .io_txd(uart_io_txd),
    .io_signal_interrupt(uart_io_signal_interrupt)
  );
  Mouse mouse ( // @[src/main/scala/board/verilator/Top.scala 70:21]
    .clock(mouse_clock),
    .reset(mouse_reset),
    .io_channels_write_address_channel_AWVALID(mouse_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(mouse_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(mouse_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(mouse_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(mouse_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(mouse_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(mouse_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(mouse_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(mouse_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(mouse_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(mouse_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(mouse_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(mouse_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(mouse_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(mouse_io_channels_read_data_channel_RDATA),
    .io_x(mouse_io_x),
    .io_y(mouse_io_y),
    .io_leftButton(mouse_io_leftButton),
    .io_rightButton(mouse_io_rightButton),
    .io_middleButton(mouse_io_middleButton)
  );
  Timer timer ( // @[src/main/scala/board/verilator/Top.scala 73:21]
    .clock(timer_clock),
    .reset(timer_reset),
    .io_channels_write_address_channel_AWVALID(timer_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(timer_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(timer_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(timer_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(timer_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(timer_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(timer_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(timer_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(timer_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(timer_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(timer_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(timer_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(timer_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(timer_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(timer_io_channels_read_data_channel_RDATA),
    .io_signal_interrupt(timer_io_signal_interrupt)
  );
  CPU cpu ( // @[src/main/scala/board/verilator/Top.scala 75:27]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_instruction_address(cpu_io_instruction_address),
    .io_instruction(cpu_io_instruction),
    .io_instruction_valid(cpu_io_instruction_valid),
    .io_axi4_channels_write_address_channel_AWVALID(cpu_io_axi4_channels_write_address_channel_AWVALID),
    .io_axi4_channels_write_address_channel_AWREADY(cpu_io_axi4_channels_write_address_channel_AWREADY),
    .io_axi4_channels_write_address_channel_AWADDR(cpu_io_axi4_channels_write_address_channel_AWADDR),
    .io_axi4_channels_write_data_channel_WVALID(cpu_io_axi4_channels_write_data_channel_WVALID),
    .io_axi4_channels_write_data_channel_WREADY(cpu_io_axi4_channels_write_data_channel_WREADY),
    .io_axi4_channels_write_data_channel_WDATA(cpu_io_axi4_channels_write_data_channel_WDATA),
    .io_axi4_channels_write_data_channel_WSTRB(cpu_io_axi4_channels_write_data_channel_WSTRB),
    .io_axi4_channels_write_response_channel_BVALID(cpu_io_axi4_channels_write_response_channel_BVALID),
    .io_axi4_channels_write_response_channel_BREADY(cpu_io_axi4_channels_write_response_channel_BREADY),
    .io_axi4_channels_read_address_channel_ARVALID(cpu_io_axi4_channels_read_address_channel_ARVALID),
    .io_axi4_channels_read_address_channel_ARREADY(cpu_io_axi4_channels_read_address_channel_ARREADY),
    .io_axi4_channels_read_address_channel_ARADDR(cpu_io_axi4_channels_read_address_channel_ARADDR),
    .io_axi4_channels_read_data_channel_RVALID(cpu_io_axi4_channels_read_data_channel_RVALID),
    .io_axi4_channels_read_data_channel_RREADY(cpu_io_axi4_channels_read_data_channel_RREADY),
    .io_axi4_channels_read_data_channel_RDATA(cpu_io_axi4_channels_read_data_channel_RDATA),
    .io_interrupt_flag(cpu_io_interrupt_flag),
    .io_debug_read_address(cpu_io_debug_read_address),
    .io_debug_read_data(cpu_io_debug_read_data),
    .io_csr_debug_read_address(cpu_io_csr_debug_read_address),
    .io_csr_debug_read_data(cpu_io_csr_debug_read_data),
    .io_bus_address(cpu_io_bus_address)
  );
  BusSwitch bus_switch ( // @[src/main/scala/board/verilator/Top.scala 78:27]
    .io_address(bus_switch_io_address),
    .io_slaves_0_write_address_channel_AWVALID(bus_switch_io_slaves_0_write_address_channel_AWVALID),
    .io_slaves_0_write_address_channel_AWREADY(bus_switch_io_slaves_0_write_address_channel_AWREADY),
    .io_slaves_0_write_address_channel_AWADDR(bus_switch_io_slaves_0_write_address_channel_AWADDR),
    .io_slaves_0_write_data_channel_WVALID(bus_switch_io_slaves_0_write_data_channel_WVALID),
    .io_slaves_0_write_data_channel_WREADY(bus_switch_io_slaves_0_write_data_channel_WREADY),
    .io_slaves_0_write_data_channel_WDATA(bus_switch_io_slaves_0_write_data_channel_WDATA),
    .io_slaves_0_write_data_channel_WSTRB(bus_switch_io_slaves_0_write_data_channel_WSTRB),
    .io_slaves_0_write_response_channel_BVALID(bus_switch_io_slaves_0_write_response_channel_BVALID),
    .io_slaves_0_write_response_channel_BREADY(bus_switch_io_slaves_0_write_response_channel_BREADY),
    .io_slaves_0_read_address_channel_ARVALID(bus_switch_io_slaves_0_read_address_channel_ARVALID),
    .io_slaves_0_read_address_channel_ARREADY(bus_switch_io_slaves_0_read_address_channel_ARREADY),
    .io_slaves_0_read_address_channel_ARADDR(bus_switch_io_slaves_0_read_address_channel_ARADDR),
    .io_slaves_0_read_data_channel_RVALID(bus_switch_io_slaves_0_read_data_channel_RVALID),
    .io_slaves_0_read_data_channel_RREADY(bus_switch_io_slaves_0_read_data_channel_RREADY),
    .io_slaves_0_read_data_channel_RDATA(bus_switch_io_slaves_0_read_data_channel_RDATA),
    .io_slaves_1_write_address_channel_AWVALID(bus_switch_io_slaves_1_write_address_channel_AWVALID),
    .io_slaves_1_write_address_channel_AWREADY(bus_switch_io_slaves_1_write_address_channel_AWREADY),
    .io_slaves_1_write_address_channel_AWADDR(bus_switch_io_slaves_1_write_address_channel_AWADDR),
    .io_slaves_1_write_data_channel_WVALID(bus_switch_io_slaves_1_write_data_channel_WVALID),
    .io_slaves_1_write_data_channel_WREADY(bus_switch_io_slaves_1_write_data_channel_WREADY),
    .io_slaves_1_write_data_channel_WDATA(bus_switch_io_slaves_1_write_data_channel_WDATA),
    .io_slaves_1_write_response_channel_BVALID(bus_switch_io_slaves_1_write_response_channel_BVALID),
    .io_slaves_1_write_response_channel_BREADY(bus_switch_io_slaves_1_write_response_channel_BREADY),
    .io_slaves_1_read_address_channel_ARVALID(bus_switch_io_slaves_1_read_address_channel_ARVALID),
    .io_slaves_1_read_address_channel_ARREADY(bus_switch_io_slaves_1_read_address_channel_ARREADY),
    .io_slaves_1_read_address_channel_ARADDR(bus_switch_io_slaves_1_read_address_channel_ARADDR),
    .io_slaves_1_read_data_channel_RVALID(bus_switch_io_slaves_1_read_data_channel_RVALID),
    .io_slaves_1_read_data_channel_RREADY(bus_switch_io_slaves_1_read_data_channel_RREADY),
    .io_slaves_1_read_data_channel_RDATA(bus_switch_io_slaves_1_read_data_channel_RDATA),
    .io_slaves_2_write_address_channel_AWVALID(bus_switch_io_slaves_2_write_address_channel_AWVALID),
    .io_slaves_2_write_address_channel_AWREADY(bus_switch_io_slaves_2_write_address_channel_AWREADY),
    .io_slaves_2_write_address_channel_AWADDR(bus_switch_io_slaves_2_write_address_channel_AWADDR),
    .io_slaves_2_write_data_channel_WVALID(bus_switch_io_slaves_2_write_data_channel_WVALID),
    .io_slaves_2_write_data_channel_WREADY(bus_switch_io_slaves_2_write_data_channel_WREADY),
    .io_slaves_2_write_data_channel_WDATA(bus_switch_io_slaves_2_write_data_channel_WDATA),
    .io_slaves_2_write_response_channel_BVALID(bus_switch_io_slaves_2_write_response_channel_BVALID),
    .io_slaves_2_write_response_channel_BREADY(bus_switch_io_slaves_2_write_response_channel_BREADY),
    .io_slaves_2_read_address_channel_ARVALID(bus_switch_io_slaves_2_read_address_channel_ARVALID),
    .io_slaves_2_read_address_channel_ARREADY(bus_switch_io_slaves_2_read_address_channel_ARREADY),
    .io_slaves_2_read_address_channel_ARADDR(bus_switch_io_slaves_2_read_address_channel_ARADDR),
    .io_slaves_2_read_data_channel_RVALID(bus_switch_io_slaves_2_read_data_channel_RVALID),
    .io_slaves_2_read_data_channel_RREADY(bus_switch_io_slaves_2_read_data_channel_RREADY),
    .io_slaves_2_read_data_channel_RDATA(bus_switch_io_slaves_2_read_data_channel_RDATA),
    .io_slaves_3_write_address_channel_AWVALID(bus_switch_io_slaves_3_write_address_channel_AWVALID),
    .io_slaves_3_write_address_channel_AWREADY(bus_switch_io_slaves_3_write_address_channel_AWREADY),
    .io_slaves_3_write_address_channel_AWADDR(bus_switch_io_slaves_3_write_address_channel_AWADDR),
    .io_slaves_3_write_data_channel_WVALID(bus_switch_io_slaves_3_write_data_channel_WVALID),
    .io_slaves_3_write_data_channel_WREADY(bus_switch_io_slaves_3_write_data_channel_WREADY),
    .io_slaves_3_write_data_channel_WDATA(bus_switch_io_slaves_3_write_data_channel_WDATA),
    .io_slaves_3_write_data_channel_WSTRB(bus_switch_io_slaves_3_write_data_channel_WSTRB),
    .io_slaves_3_write_response_channel_BVALID(bus_switch_io_slaves_3_write_response_channel_BVALID),
    .io_slaves_3_write_response_channel_BREADY(bus_switch_io_slaves_3_write_response_channel_BREADY),
    .io_slaves_3_read_address_channel_ARVALID(bus_switch_io_slaves_3_read_address_channel_ARVALID),
    .io_slaves_3_read_address_channel_ARREADY(bus_switch_io_slaves_3_read_address_channel_ARREADY),
    .io_slaves_3_read_address_channel_ARADDR(bus_switch_io_slaves_3_read_address_channel_ARADDR),
    .io_slaves_3_read_data_channel_RVALID(bus_switch_io_slaves_3_read_data_channel_RVALID),
    .io_slaves_3_read_data_channel_RREADY(bus_switch_io_slaves_3_read_data_channel_RREADY),
    .io_slaves_3_read_data_channel_RDATA(bus_switch_io_slaves_3_read_data_channel_RDATA),
    .io_slaves_4_write_address_channel_AWVALID(bus_switch_io_slaves_4_write_address_channel_AWVALID),
    .io_slaves_4_write_address_channel_AWREADY(bus_switch_io_slaves_4_write_address_channel_AWREADY),
    .io_slaves_4_write_address_channel_AWADDR(bus_switch_io_slaves_4_write_address_channel_AWADDR),
    .io_slaves_4_write_data_channel_WVALID(bus_switch_io_slaves_4_write_data_channel_WVALID),
    .io_slaves_4_write_data_channel_WREADY(bus_switch_io_slaves_4_write_data_channel_WREADY),
    .io_slaves_4_write_data_channel_WDATA(bus_switch_io_slaves_4_write_data_channel_WDATA),
    .io_slaves_4_write_data_channel_WSTRB(bus_switch_io_slaves_4_write_data_channel_WSTRB),
    .io_slaves_4_write_response_channel_BVALID(bus_switch_io_slaves_4_write_response_channel_BVALID),
    .io_slaves_4_write_response_channel_BREADY(bus_switch_io_slaves_4_write_response_channel_BREADY),
    .io_slaves_4_read_address_channel_ARVALID(bus_switch_io_slaves_4_read_address_channel_ARVALID),
    .io_slaves_4_read_address_channel_ARREADY(bus_switch_io_slaves_4_read_address_channel_ARREADY),
    .io_slaves_4_read_address_channel_ARADDR(bus_switch_io_slaves_4_read_address_channel_ARADDR),
    .io_slaves_4_read_data_channel_RVALID(bus_switch_io_slaves_4_read_data_channel_RVALID),
    .io_slaves_4_read_data_channel_RREADY(bus_switch_io_slaves_4_read_data_channel_RREADY),
    .io_slaves_4_read_data_channel_RDATA(bus_switch_io_slaves_4_read_data_channel_RDATA),
    .io_master_write_address_channel_AWVALID(bus_switch_io_master_write_address_channel_AWVALID),
    .io_master_write_address_channel_AWREADY(bus_switch_io_master_write_address_channel_AWREADY),
    .io_master_write_address_channel_AWADDR(bus_switch_io_master_write_address_channel_AWADDR),
    .io_master_write_data_channel_WVALID(bus_switch_io_master_write_data_channel_WVALID),
    .io_master_write_data_channel_WREADY(bus_switch_io_master_write_data_channel_WREADY),
    .io_master_write_data_channel_WDATA(bus_switch_io_master_write_data_channel_WDATA),
    .io_master_write_data_channel_WSTRB(bus_switch_io_master_write_data_channel_WSTRB),
    .io_master_write_response_channel_BVALID(bus_switch_io_master_write_response_channel_BVALID),
    .io_master_write_response_channel_BREADY(bus_switch_io_master_write_response_channel_BREADY),
    .io_master_read_address_channel_ARVALID(bus_switch_io_master_read_address_channel_ARVALID),
    .io_master_read_address_channel_ARREADY(bus_switch_io_master_read_address_channel_ARREADY),
    .io_master_read_address_channel_ARADDR(bus_switch_io_master_read_address_channel_ARADDR),
    .io_master_read_data_channel_RVALID(bus_switch_io_master_read_data_channel_RVALID),
    .io_master_read_data_channel_RREADY(bus_switch_io_master_read_data_channel_RREADY),
    .io_master_read_data_channel_RDATA(bus_switch_io_master_read_data_channel_RDATA)
  );
  assign io_instruction_address = cpu_io_instruction_address; // @[src/main/scala/board/verilator/Top.scala 81:28]
  assign io_mem_slave_address = mem_slave_io_bundle_address; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_read = mem_slave_io_bundle_read; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_write = mem_slave_io_bundle_write; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_write_data = mem_slave_io_bundle_write_data; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_write_strobe_0 = mem_slave_io_bundle_write_strobe_0; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_write_strobe_1 = mem_slave_io_bundle_write_strobe_1; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_write_strobe_2 = mem_slave_io_bundle_write_strobe_2; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_mem_slave_write_strobe_3 = mem_slave_io_bundle_write_strobe_3; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign io_vga_hsync = vga_io_hsync; // @[src/main/scala/board/verilator/Top.scala 113:22]
  assign io_vga_vsync = vga_io_vsync; // @[src/main/scala/board/verilator/Top.scala 114:22]
  assign io_vga_rrggbb = vga_io_rrggbb; // @[src/main/scala/board/verilator/Top.scala 115:22]
  assign io_vga_activevideo = vga_io_activevideo; // @[src/main/scala/board/verilator/Top.scala 116:22]
  assign io_vga_x_pos = vga_io_x_pos; // @[src/main/scala/board/verilator/Top.scala 117:22]
  assign io_vga_y_pos = vga_io_y_pos; // @[src/main/scala/board/verilator/Top.scala 118:22]
  assign io_uart_txd = uart_io_txd; // @[src/main/scala/board/verilator/Top.scala 123:21]
  assign io_uart_interrupt = uart_io_signal_interrupt; // @[src/main/scala/board/verilator/Top.scala 125:21]
  assign io_cpu_debug_read_data = cpu_io_debug_read_data; // @[src/main/scala/board/verilator/Top.scala 139:33]
  assign io_cpu_csr_debug_read_data = cpu_io_csr_debug_read_data; // @[src/main/scala/board/verilator/Top.scala 141:33]
  assign mem_slave_clock = clock;
  assign mem_slave_reset = reset;
  assign mem_slave_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_0_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_0_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_0_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_0_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_write_data_channel_WSTRB = bus_switch_io_slaves_0_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_0_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_0_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_0_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_0_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign mem_slave_io_bundle_read_data = io_mem_slave_read_data; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign mem_slave_io_bundle_read_valid = io_mem_slave_read_valid; // @[src/main/scala/board/verilator/Top.scala 61:16]
  assign vga_clock = clock;
  assign vga_reset = reset;
  assign vga_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_1_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_1_write_address_channel_AWADDR[7:0]; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_1_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_1_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_1_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_1_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_1_read_address_channel_ARADDR[7:0]; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_1_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign vga_io_pixClock = io_vga_pixclk; // @[src/main/scala/board/verilator/Top.scala 112:22]
  assign vga_io_cursor_x = io_mouse_x[9:0]; // @[src/main/scala/board/verilator/Top.scala 119:32]
  assign vga_io_cursor_y = io_mouse_y[9:0]; // @[src/main/scala/board/verilator/Top.scala 120:32]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_2_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_2_write_address_channel_AWADDR[7:0]; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_2_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_2_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_2_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_2_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_2_read_address_channel_ARADDR[7:0]; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_2_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign uart_io_rxd = io_uart_rxd; // @[src/main/scala/board/verilator/Top.scala 124:21]
  assign mouse_clock = clock;
  assign mouse_reset = reset;
  assign mouse_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_3_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_3_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_3_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_3_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_write_data_channel_WSTRB = bus_switch_io_slaves_3_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_3_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_3_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_3_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_3_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign mouse_io_x = io_mouse_x; // @[src/main/scala/board/verilator/Top.scala 128:25]
  assign mouse_io_y = io_mouse_y; // @[src/main/scala/board/verilator/Top.scala 129:25]
  assign mouse_io_leftButton = io_mouse_left_button; // @[src/main/scala/board/verilator/Top.scala 130:25]
  assign mouse_io_rightButton = io_mouse_right_button; // @[src/main/scala/board/verilator/Top.scala 131:25]
  assign mouse_io_middleButton = io_mouse_middle_button; // @[src/main/scala/board/verilator/Top.scala 132:25]
  assign timer_clock = clock;
  assign timer_reset = reset;
  assign timer_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_4_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_4_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_4_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_4_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_write_data_channel_WSTRB = bus_switch_io_slaves_4_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_4_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_4_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_4_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign timer_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_4_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_instruction = io_instruction; // @[src/main/scala/board/verilator/Top.scala 82:28]
  assign cpu_io_instruction_valid = io_instruction_valid; // @[src/main/scala/board/verilator/Top.scala 83:28]
  assign cpu_io_axi4_channels_write_address_channel_AWREADY = bus_switch_io_master_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign cpu_io_axi4_channels_write_data_channel_WREADY = bus_switch_io_master_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign cpu_io_axi4_channels_write_response_channel_BVALID = bus_switch_io_master_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign cpu_io_axi4_channels_read_address_channel_ARREADY = bus_switch_io_master_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign cpu_io_axi4_channels_read_data_channel_RVALID = bus_switch_io_master_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign cpu_io_axi4_channels_read_data_channel_RDATA = bus_switch_io_master_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign cpu_io_interrupt_flag = {{31'd0}, _cpu_io_interrupt_flag_T_1}; // @[src/main/scala/board/verilator/Top.scala 135:25]
  assign cpu_io_debug_read_address = io_cpu_debug_read_address; // @[src/main/scala/board/verilator/Top.scala 138:33]
  assign cpu_io_csr_debug_read_address = io_cpu_csr_debug_read_address; // @[src/main/scala/board/verilator/Top.scala 140:33]
  assign bus_switch_io_address = cpu_io_bus_address; // @[src/main/scala/board/verilator/Top.scala 101:25]
  assign bus_switch_io_slaves_0_write_address_channel_AWREADY = mem_slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign bus_switch_io_slaves_0_write_data_channel_WREADY = mem_slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign bus_switch_io_slaves_0_write_response_channel_BVALID = mem_slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign bus_switch_io_slaves_0_read_address_channel_ARREADY = mem_slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign bus_switch_io_slaves_0_read_data_channel_RVALID = mem_slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign bus_switch_io_slaves_0_read_data_channel_RDATA = mem_slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 102:27]
  assign bus_switch_io_slaves_1_write_address_channel_AWREADY = vga_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign bus_switch_io_slaves_1_write_data_channel_WREADY = vga_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign bus_switch_io_slaves_1_write_response_channel_BVALID = vga_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign bus_switch_io_slaves_1_read_address_channel_ARREADY = vga_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign bus_switch_io_slaves_1_read_data_channel_RVALID = vga_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign bus_switch_io_slaves_1_read_data_channel_RDATA = vga_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 103:27]
  assign bus_switch_io_slaves_2_write_address_channel_AWREADY = uart_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign bus_switch_io_slaves_2_write_data_channel_WREADY = uart_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign bus_switch_io_slaves_2_write_response_channel_BVALID = uart_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign bus_switch_io_slaves_2_read_address_channel_ARREADY = uart_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign bus_switch_io_slaves_2_read_data_channel_RVALID = uart_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign bus_switch_io_slaves_2_read_data_channel_RDATA = uart_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 104:27]
  assign bus_switch_io_slaves_3_write_address_channel_AWREADY = mouse_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign bus_switch_io_slaves_3_write_data_channel_WREADY = mouse_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign bus_switch_io_slaves_3_write_response_channel_BVALID = mouse_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign bus_switch_io_slaves_3_read_address_channel_ARREADY = mouse_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign bus_switch_io_slaves_3_read_data_channel_RVALID = mouse_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign bus_switch_io_slaves_3_read_data_channel_RDATA = mouse_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 105:27]
  assign bus_switch_io_slaves_4_write_address_channel_AWREADY = timer_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign bus_switch_io_slaves_4_write_data_channel_WREADY = timer_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign bus_switch_io_slaves_4_write_response_channel_BVALID = timer_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign bus_switch_io_slaves_4_read_address_channel_ARREADY = timer_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign bus_switch_io_slaves_4_read_data_channel_RVALID = timer_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign bus_switch_io_slaves_4_read_data_channel_RDATA = timer_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/verilator/Top.scala 106:27]
  assign bus_switch_io_master_write_address_channel_AWVALID = cpu_io_axi4_channels_write_address_channel_AWVALID; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_write_address_channel_AWADDR = cpu_io_axi4_channels_write_address_channel_AWADDR; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_write_data_channel_WVALID = cpu_io_axi4_channels_write_data_channel_WVALID; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_write_data_channel_WDATA = cpu_io_axi4_channels_write_data_channel_WDATA; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_write_data_channel_WSTRB = cpu_io_axi4_channels_write_data_channel_WSTRB; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_write_response_channel_BREADY = cpu_io_axi4_channels_write_response_channel_BREADY; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_read_address_channel_ARVALID = cpu_io_axi4_channels_read_address_channel_ARVALID; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_read_address_channel_ARADDR = cpu_io_axi4_channels_read_address_channel_ARADDR; // @[src/main/scala/board/verilator/Top.scala 100:24]
  assign bus_switch_io_master_read_data_channel_RREADY = cpu_io_axi4_channels_read_data_channel_RREADY; // @[src/main/scala/board/verilator/Top.scala 100:24]
endmodule
