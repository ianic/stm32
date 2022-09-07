const std = @import("std");
const micro = @import("microzig");
const chip = micro.chip;
const regs = chip.regs;

pub const Config = struct {
    // communication params
    baud_rate: u32 = 9600,
    stop_bits: StopBits = .one,
    parity: ?Parity = null,
    data_bits: DataBits = .eight,
    enable: Enable = .both,

    const Self = @This();

    // calculated parameters for configuring registers
    //
    fn parityControlEnable(comptime self: Self) u1 {
        return if (self.parity != null) 1 else 0;
    }
    fn paritySelection(comptime self: Self) u1 {
        return if (self.parity != null) @enumToInt(self.parity) else 0;
    }
    fn wordLength(comptime self: Config) u1 {
        // Per the reference manual, M means
        // - 0: 1 start bit, 8 data bits (7 data + 1 parity, or 8 data), n stop bits, the chip default
        // - 1: 1 start bit, 9 data bits (8 data + 1 parity, or 9 data), n stop bits
        return if (self.data_bits == .nine or (self.data_bits == .eight and self.parity != null)) 1 else 0;
    }
    fn parityReadMask(comptime self: Config) u8 {
        // m ==1 means 'the 9th bit (not the 8th bit) is the parity bit'.
        // So we always mask away the 9th bit, and if parity is enabled and it is in the 8th bit,
        // then we also mask away the 8th bit.
        return if (self.parity != null and self.wordLength() == 0) 0x7F else 0xFF;
    }
    fn usartDiv(comptime self: Self, bus_frequency: u32) u16 {
        // Despite the reference manual talking about fractional calculation and other buzzwords,
        // it is actually just a simple divider. Just ignore DIV_Mantissa and DIV_Fraction and
        // set the result of the division as the lower 16 bits of BRR.
        // TODO: We assume the default OVER8=0 configuration above (i.e. 16x oversampling).
        // TODO: Do some checks to see if the baud rate is too high (or perhaps too low)
        // TODO: Do a rounding div, instead of a truncating div?
        return @intCast(u16, @divTrunc(bus_frequency, self.baud_rate));
    }
    fn txEnable(comptime self: Self) bool {
        return self.enable == .both or self.enable == .tx_only;
    }
    fn rxEnable(comptime self: Self) bool {
        return self.enable == .both or self.enable == .rx_only;
    }
    fn te(comptime self: Self) u1 {
        return if (self.enable == .both or self.enable == .tx_only) return 1 else 0;
    }
    fn re(comptime self: Self) u1 {
        return if (self.enable == .both or self.enable == .rx_only) return 1 else 0;
    }
};

pub const DataBits = enum {
    seven,
    eight,
    nine,
};

/// uses the values of USARTx.CR2.STOP
pub const StopBits = enum(u2) {
    one = 0b00,
    half = 0b01,
    two = 0b10,
    one_and_half = 0b11,
};

/// uses the values of USARTx.CR1.PS
pub const Parity = enum(u1) {
    even = 0,
    odd = 1,
};

pub const Enable = enum {
    both,
    tx_only,
    rx_only,
};

test "Config.usartdiv" {
    const hsi_100 = struct {
        const frequencies = struct {
            const apb1 = 50_000_000;
            const apb2 = 100_000_000;
        };
    };

    try std.testing.expectEqual(100_000_000, @field(hsi_100.frequencies, "apb2"));
    try std.testing.expectEqual(50_000_000, @field(hsi_100.frequencies, "apb1"));

    const cfg1 = Config{};
    try std.testing.expectEqual(cfg1.usartDiv(hsi_100.frequencies.apb2), 10416);
    try std.testing.expectEqual(cfg1.usartDiv(hsi_100.frequencies.apb1), 5208);

    const cfg2 = Config{ .baud_rate = 153600 };
    try std.testing.expectEqual(cfg2.usartDiv(hsi_100.frequencies.apb2), 651);
}

pub fn UartX(comptime data: anytype, comptime config: Config) type {
    assertConfig(config);

    const base = Base(data, config);
    return struct {
        pub fn pooling() type {
            return struct {
                pub fn init(frequencies: anytype) void {
                    base.init(frequencies);
                }
                pub const tx = if (config.txEnable()) struct {
                    pub const ready = base.tx.ready;
                    pub const write = base.tx.write;
                    pub const flush = base.tx.flush;
                } else @compileError("tx not enabled");
                pub const rx = if (config.rxEnable()) struct {
                    pub const ready = base.rx.ready;
                    pub const read = base.rx.read;
                } else @compileError("rx not enabled");
            };
        }
        pub fn Pooling() type {
            return struct {
                const Tx = if (config.txEnable()) struct {
                    pub fn ready(_: Tx) bool {
                        return base.tx.ready();
                    }
                    pub fn write(_: Tx, b: u8) void {
                        return base.tx.write(b);
                    }
                } else struct {};
                const Rx = if (config.rxEnable()) struct {
                    pub fn ready(_: Rx) bool {
                        return base.rx.ready();
                    }
                    pub fn read(_: Rx) u8 {
                        return base.rx.read();
                    }
                } else struct {};

                tx: Tx = .{},
                rx: Rx = .{},

                const Self = @This();
                pub fn init(frequencies: anytype) Self {
                    base.init(frequencies);
                    return .{};
                }
            };
        }
        pub fn interrupt() type {
            return struct {
                pub fn init(frequencies: anytype) void {
                    base.init(frequencies);
                    base.initIrq();
                }
                pub const tx = if (config.txEnable()) base.tx else @compileError("tx not enabled");
                pub const rx = if (config.rxEnable()) base.rx else @compileError("rx not enabled");
            };
        }
        pub fn dma() type {
            const dmaTx = UartDma(.{
                .controller = data.dma.controller,
                .stream = data.dma.tx.stream,
                .channel = data.dma.tx.channel,
                .irq = data.dma.tx.irq,
                .peripheral_address = @ptrToInt(@field(regs, data.name).DR),
                .direction = .memory_to_peripheral,
            });
            const dmaRx = UartDma(.{
                .controller = data.dma.controller,
                .stream = data.dma.rx.stream,
                .channel = data.dma.rx.channel,
                .irq = data.dma.rx.irq,
                .peripheral_address = @ptrToInt(@field(regs, data.name).DR),
                .direction = .peripheral_to_memory,
            });

            return struct {
                pub fn init(frequencies: anytype) void {
                    base.init(frequencies);
                    base.initDma();
                    dmaTx.init();
                    dmaRx.init();
                }
                pub const tx = if (config.txEnable()) struct {
                    pub const write = dmaTx.start;
                    pub const ready = dmaTx.ready;
                    pub const irq = dmaTx.irq;
                } else @compileError("tx not enabled");
                pub const rx = if (config.rxEnable()) struct {
                    pub const read = dmaRx.start;
                    pub const ready = dmaRx.ready;
                    pub const irq = dmaRx.irq;
                } else @compileError("tx not enabled");
            };
        }
    };
}

fn Base(comptime data: anytype, comptime config: Config) type {
    const reg = @field(regs, data.name); // regs.USARTx
    const parity_read_mask = config.parityReadMask();

    return struct {
        pub fn init(freqencies: anytype) void {
            const bus_frequency = @field(freqencies, "apb" ++ data.rcc[3..]); // apb2 or apb1
            // The following must all be written when the USART is disabled (UE=0).
            if (reg.CR1.read().UE == 1) {
                reg.CR1.modify(.{ .UE = 0 });
                // TODO: do we need something more here
            }

            // enable the USART clock: reg.RCC.APBxENR.modify(.{.USARTyEN = 1});
            @field(regs.RCC, data.rcc ++ "ENR").set(data.name ++ "EN", 1);

            // clear configuration to its default
            reg.CR1.raw = 0;
            reg.CR2.raw = 0;
            reg.CR3.raw = 0;

            reg.BRR.raw = config.usartDiv(bus_frequency); // set baud rate
            reg.CR1.modify(.{
                .M = config.wordLength(),
                .PCE = config.parityControlEnable(),
                .PS = config.paritySelection(),
                .TE = config.te(),
                .RE = config.re(),
            });
            reg.CR2.modify(.{ .STOP = @enumToInt(config.stop_bits) }); // set number of stop bits
            reg.CR1.modify(.{ .UE = 1 }); // enable the USART
        }

        fn initIrq() void {
            data.irq.enable();
            rx.irq.enable();
        }

        fn initDma() void {
            reg.CR3.modify(.{
                .DMAT = 1, // enable dma transmitter
                .DMAR = 1, // enable dma receiver
            });
        }

        pub const tx = struct {
            pub fn ready() bool {
                return reg.SR.read().TXE == 1; // transmit data register empty
            }

            pub fn write(ch: u8) void {
                while (!ready()) {} // wait for Previous transmission
                tx.irq.enable(); // enable interrupt TODO this is executed in pooling mode also, no need for that
                reg.DR.modify(ch);
            }

            pub fn flush() void {
                while (reg.SR.read().TC == 0) {}
            }

            pub const irq = struct {
                // Raises interrupt whenever TXE == 1.
                // Interrupt handler should write data or disable interrupt if there is no data to send.
                // Writing data to DR clears TXE.
                pub fn enable() void {
                    reg.CR1.modify(.{ .TXEIE = 1 });
                }
                pub fn disable() void {
                    reg.CR1.modify(.{ .TXEIE = 0 });
                }
            };
        };

        pub const rx = struct {
            pub fn ready() bool {
                return reg.SR.read().RXNE == 1; // read data register not empty
            }

            pub fn read() u8 {
                while (!ready()) {} // wait till the data is received
                const data_with_parity_bit: u9 = reg.DR.read();
                return @intCast(u8, data_with_parity_bit & parity_read_mask);
            }

            pub const irq = struct {
                // Raises interrupt when read data register is not empty = when there is byte to read.
                // Reading from DR register clears RXNE flag.
                // So there is no need to disable interrupt just read incomming data in irq handler.
                // Interrupt is by default enabled.
                pub fn enable() void {
                    reg.CR1.modify(.{ .RXNEIE = 1 });
                }
                pub fn disable() void {
                    reg.CR1.modify(.{ .RXNEIE = 0 });
                }
            };
        };
    };
}

fn assertConfig(comptime config: Config) void {
    if ((config.data_bits == .nine and config.parity != null) or
        (config.data_bits == .seven and config.parity == null))
    {
        @compileError("unsupported word size");
    }
}

test "assertConfig" {
    assertConfig(.{ .baud_rate = 1, .data_bits = .nine });
    assertConfig(.{ .baud_rate = 1, .data_bits = .seven, .parity = .odd });
    //assertConfig(.{ .tx_enable = false, .rx_enable = false }); //TODO: how to test for compileError
}

const DmaConfig = struct {
    controller: []const u8,
    stream: u8,
    channel: u8,
    peripheral_address: u32,
    direction: DmaDirection,
    irq: chip.Irq,
};

const DmaDirection = enum(u2) {
    peripheral_to_memory = 0b00,
    memory_to_peripheral = 0b01,
};

fn UartDma(comptime config: DmaConfig) type {
    const stream = std.fmt.comptimePrint("{d}", .{config.stream}); // to string
    const base = @field(regs, config.controller); // regs.DMAx

    const cr_reg = @field(base, "S" ++ stream ++ "CR"); // control register: regs.DMAx.SyCR
    const ndtr_reg = @field(base, "S" ++ stream ++ "NDTR"); // number of data register, regs.DMAx.SyNDTR
    const pa_reg = @field(base, "S" ++ stream ++ "PAR"); // peripheral address register, regs.DMAx.SyPAR
    const ma_reg = @field(base, "S" ++ stream ++ "M0AR"); // memory address register, regs.DMAx.SyM0AR

    const hl_pre = if (config.stream > 3) "H" else "L"; // high/low interrupt status/flag register preffix
    const st_reg = @field(base, hl_pre ++ "ISR"); // interrupt status register, regs.DMAx.[H/L]ISR
    const fc_reg = @field(base, hl_pre ++ "IFCR"); // interrupt flag clear register, regs.DMAx.[H/L]IFCR

    return struct {
        // in interrupt handler to test the interrupt reason
        pub fn complete() bool {
            return readIntFlag("TC");
        }

        const Self = @This();

        pub const irq = struct {
            pub fn enable() void {
                cr_reg.modify(.{ .TCIE = 1 }); // transfer complete interrupt enable
            }
            pub fn disable() void {
                cr_reg.modify(.{ .TCIE = 0 });
            }
        };

        pub fn start(buf: []u8) void {
            const memory_address = @ptrToInt(&buf[0]);
            const number_of_data_items = @intCast(u16, buf.len);

            disable();
            pa_reg.modify(.{ .PA = config.peripheral_address });
            ma_reg.modify(.{ .M0A = memory_address });
            ndtr_reg.modify(.{ .NDT = number_of_data_items });
            Self.irq.enable();

            cr_reg.modify(.{ .EN = 1 }); // enable stream
        }

        // ready to start
        pub fn ready() bool {
            return if (enabled()) complete() else true;
        }

        fn enabled() bool {
            return cr_reg.read().EN == 1;
        }

        // read interrupt flag, where flag is TC, HT, TE, DME or FE
        fn readIntFlag(comptime flag: []const u8) bool {
            return @field(st_reg.read(), flag ++ "IF" ++ stream) == 1;
        }

        // clear interrupt flag, where flag is TC, HT, TE, DME or FE
        fn clearIntFlag(comptime flag: []const u8) void {
            fc_reg.set("C" ++ flag ++ "IF" ++ stream, 1);
        }

        fn clearIntFlags() void {
            clearIntFlag("TC"); // transfer complete
            clearIntFlag("HT"); // half transfer
            clearIntFlag("TE"); // transfer error
            clearIntFlag("DME"); // direct mode error
            clearIntFlag("FE"); // fifo error
        }

        fn disable() void {
            cr_reg.modify(.{ .EN = 0 }); // disable stream
            while (cr_reg.read().EN == 1) {} // wait for disable
            clearIntFlags();
        }

        pub fn init() void {
            // enable clock
            // regs.RCC.AHB1ENR.modify(.{ .DMAxEN = 1 });
            regs.RCC.AHB1ENR.set(config.controller ++ "EN", 1);
            disable();
            cr_reg.raw = 0; // reset to defaults
            cr_reg.modify(.{
                .CHSEL = config.channel, // channel
                .DIR = @enumToInt(config.direction), // direction
                .CIRC = 0, // circular mode disabled
                .PINC = 0, // periperal increment mode: fixed
                .MINC = 1, // memory address pointer is incremented after each data transfer
                .PSIZE = 0b00, // peripheral data size: byte
                .MSIZE = 0b00, // memory data size: byte
                .TCIE = 1, // transfer complete interrupt enable
            });
            config.irq.enable();
        }
    };
}
