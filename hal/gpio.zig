const std = @import("std");
const micro = @import("microzig");
const chip = micro.chip;
const regs = chip.regs;

pub const InputConfig = struct {
    pull: Pull = .none,
    exti: ExtiConfig,
};

pub const ExtiConfig = struct {
    enable: bool = false,
    trigger: IrqTrigger = .falling,
    priority: u4 = 0xf,
};

pub const OutputConfig = struct {
    pull: Pull = .none,
    speed: OutputSpeed = .low,
    @"type": OutputType = .push_pull,
};

pub const AlternateFunctionConfig = struct {
    pull: Pull = .none,
    af: u4,
};

pub const FunctionConfig = struct {
    pull: Pull = .none,
};

pub const Pull = enum(u2) {
    none,
    up,
    down,
};

pub const OutputType = enum(u1) {
    push_pull,
    open_drain,
};

pub const OutputSpeed = enum(u2) {
    low,
    medium,
    fast,
    high,
};

pub const IrqTrigger = enum {
    falling,
    rising,
    both,
};

const Mode = enum(u2) {
    input,
    output,
    alternate_function,
    analog,
};

// exti interrupt enabling for pin
fn Exti(comptime pp: anytype) type {
    const irq = switch (pp.pin_number) {
        10...15 => chip.Irq.exti15_10,
        5...9 => chip.Irq.exti9_5,
        else => @intToEnum(chip.Irq, pp.pin_number + 6),
    };
    return struct {
        pub fn enable(trigger: IrqTrigger) void {
            regs.RCC.APB2ENR.modify(.{ .SYSCFGEN = 1 }); // Enable SYSCFG Clock

            // regs.SYSCFG.EXTICR[cr_reg_no].modify(.{ .EXTI[suffix] = [port_number] });
            const cr_reg = @field(regs.SYSCFG, "EXTICR" ++ pp.cr_suffix);
            cr_reg.set("EXTI" ++ pp.suffix, pp.port_number);

            if (trigger == .falling or .trigger == .both) {
                regs.EXTI.FTSR.set("TR" ++ pp.suffix, 1); // regs.EXTI.FTSR.modify(.{ .TR[suffix] = 1 });
            }
            if (trigger == .rising or .trigger == .both) {
                regs.EXTI.RTSR.set("TR" ++ pp.suffix, 1); // regs.EXTI.RTSR.modify(.{ .TR[suffix] = 1 });
            }
            regs.EXTI.IMR.set("MR" ++ pp.suffix, 1); // regs.EXTI.IMR.modify(.{ .MR[suffix] = 1 });

            irq.enable();
        }

        // regs.NVIC.IPR[x].modify(.{ .IPR_N[y] = value });
        pub fn setPriority(pri: u4) void {
            irq.setPriority(pri);
        }

        // get and clear pending exti interrupt
        // regs.EXTI.PR.read().PR[suffix]
        pub fn pending() bool {
            const field_name = "PR" ++ pp.suffix;
            var reg_value = regs.EXTI.PR.read();
            const is_pending = @field(reg_value, field_name) == 1;
            if (is_pending) {
                // clear pending bit
                @field(reg_value, field_name) = 1;
                regs.EXTI.PR.write(reg_value);
            }
            return is_pending;
        }
    };
}

test "ParsedPin" {
    const pp = Spec("PC13");
    try std.testing.expectEqual(4, pp.pin_number / 4 + 1);
    try std.testing.expectEqual(2, pp.port_number);

    const pp2 = Spec("PH5");
    try std.testing.expectEqual(2, pp2.pin_number / 4 + 1);
    try std.testing.expectEqual(0b111, pp2.port_number);
}

fn Spec(comptime pin_name: []const u8) type {
    return struct {
        const pin_number: comptime_int = std.fmt.parseInt(u4, pin_name[2..], 10) catch unreachable;
        const port_number = @intCast(u4, pin_name[1..2][0] - 65); // A = 0, B = 1, ...
        const name = "GPIO" ++ pin_name[1..2]; // GPIOx = GPIOA or GPIOB or ...
        const port_reg = @field(regs, name); // regs.GPIOx
        const suffix = std.fmt.comptimePrint("{d}", .{pin_number}); // pin as string '0', '1', ...
        const cr_suffix = std.fmt.comptimePrint("{d}", .{pin_number / 4 + 1}); // 0-3 => '1', 4-7 => '2', ...
        const af_reg_name = if (pin_number < 8) "AFRL" else "AFRH";

        // regs.GPIOx.[reg_name].[field]y = value
        fn set(comptime reg_name: []const u8, comptime prefix: []const u8, value: anytype) void {
            @field(port_reg, reg_name).set(prefix ++ suffix, value);
        }

        fn initClock() void {
            regs.RCC.AHB1ENR.set(name ++ "EN", 1); // regs.RCC.AHB1ENR.GPIOxEN = 1
        }

        fn initMode(mode: Mode, pull: Pull) void {
            set("MODER", "MODER", mode); // regs.GPIOx.MODER.MODERy = z
            set("PUPDR", "PUPDR", pull); // regs.GPIOx.PUPDR.PUPDRy = z
        }

        fn initOutput(c: OutputConfig) void {
            initMode(.output, c.pull);
            set("OTYPER", "OT", c.type); // regs.GPIOx.OTYPER.OTy = z
            set("OSPEEDR", "OSPEEDR", c.speed); // regs.GPIOx.OSPEEDR.OSPEEDRy = z
        }

        fn initInput(c: InputConfig) void {
            initMode(.input, c.pull);
        }

        fn initAlternateFunction(comptime af: u4, c: FunctionConfig) void {
            initMode(.alternate_function, c.pull);
            set(af_reg_name, af_reg_name, af); // regs.GPIOx.AFRL.AFRLy = z
        }

        fn read() u1 {
            return @field(port_reg.IDR.read(), "IDR" ++ suffix); // regs.GPIOx.IDR.read().IDRy
        }

        fn write(value: u1) void {
            switch (value) {
                0 => set("BSRR", "BR", 1), // regs.GPIOx.BSRR.BRy = 1
                1 => set("BSRR", "BS", 1), // regs.GPIOx.BSRR.BSy = 1
            }
        }
    };
}

// pin_name e.g. "PA0", "PA1"...
pub fn Pin(comptime pin_name: []const u8) type {
    const pin = Spec(pin_name);

    return struct {
        pub fn Input() type {
            const exti = Exti(pin);
            return struct {
                pub fn init(c: InputConfig) void {
                    pin.initClock();
                    pin.initInput(c);
                    if (c.exti.enable) {
                        exti.enable(c.exti.trigger);
                        exti.setPriority(c.exti.priority);
                    }
                }
                pub const read = pin.read;
                pub const exti = exti;
                pub const extiPending = exti.pending;
            };
        }

        pub fn InputInstance() type {
            const exti = Exti(pin);
            return struct {
                const Self = @This();
                pub fn init(c: InputConfig) Self {
                    pin.initClock();
                    pin.initInput(c);
                    if (c.exti.enable) {
                        exti.enable(c.exti.trigger);
                        exti.setPriority(c.exti.priority);
                    }
                    return .{};
                }

                pub fn extiPending(_: Self) bool {
                    return exti.pending();
                }
            };
        }

        pub fn Output() type {
            return struct {
                pub fn init(c: OutputConfig) void {
                    pin.initClock();
                    pin.initOutput(c);
                }
                pub fn setToHigh() void {
                    pin.write(1);
                }
                pub fn setToLow() void {
                    pin.write(0);
                }
                pub fn toggle() void {
                    switch (pin.read()) {
                        1 => pin.write(0),
                        0 => pin.write(1),
                    }
                }
                pub fn on() void {
                    pin.write(1);
                }
                pub fn off() void {
                    pin.write(0);
                }
                pub const read = pin.read;
                pub const write = pin.write;
            };
        }

        pub fn Function(comptime af: u4) type {
            return struct {
                pub fn init(c: FunctionConfig) void {
                    pin.initClock();
                    pin.initAlternateFunction(af, c);
                }
            };
        }
        pub fn function(comptime af: u4, c: FunctionConfig) void {
            pin.initClock();
            pin.initAlternateFunction(af, c);
        }

        pub fn analog() void {
            pin.initClock();
            pin.initMode(.analog, .none);
        }
        pub fn Analog() type {
            return struct {
                pub fn init() void {
                    pin.initClock();
                    pin.initMode(.analog, .none);
                }
            };
        }
    };
}
