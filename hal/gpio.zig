const std = @import("std");
const micro = @import("microzig");
const chip = micro.chip;
const regs = chip.eregs;

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
            regs.rcc.apb2enr.modify(.{ .syscfgen = .enabled }); // enable SYSCFG Clock

            // regs.syscfg.exticr[cr_reg_no].modify(.{ .exti[suffix] = [port_number] });
            const cr_reg = @field(regs.syscfg, "exticr" ++ pp.cr_suffix);
            cr_reg.setField("exti" ++ pp.suffix, pp.port_number);

            if (trigger == .falling or .trigger == .both) {
                regs.exti.ftsr.setField("tr" ++ pp.suffix, 1); // regs.exti.ftsr.modify(.{ .tr[suffix] = 1 });
            }
            if (trigger == .rising or .trigger == .both) {
                regs.exti.rtsr.setField("tr" ++ pp.suffix, 1); // regs.exti.rtsr.modify(.{ .tr[suffix] = 1 });
            }
            regs.exti.imr.setField("mr" ++ pp.suffix, 1); // regs.exti.imr.modify(.{ .mr[suffix] = 1 });

            irq.enable();
        }

        // regs.NVIC.IPR[x].modify(.{ .IPR_N[y] = value });
        pub fn setPriority(pri: u4) void {
            irq.setPriority(pri);
        }

        // get and clear pending exti interrupt
        // regs.EXTI.PR.read().PR[suffix]
        pub fn pending() bool {
            const field_name = "pr" ++ pp.suffix;
            var reg_value = regs.exti.pr.read();
            const is_pending = @field(reg_value, field_name) == .pending;
            if (is_pending) {
                // clear pending bit
                @field(reg_value, field_name) = .pending;
                regs.exti.pr.write(reg_value);
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
        //const port_reg = @field(regs, name); // regs.GPIOx
        const suffix = std.fmt.comptimePrint("{d}", .{pin_number}); // pin as string '0', '1', ...
        const cr_suffix = std.fmt.comptimePrint("{d}", .{pin_number / 4 + 1}); // 0-3 => '1', 4-7 => '2', ...
        const af_reg_name = if (pin_number < 8) "afrl" else "afrh";
        const per_name = "gpio" ++ std.fmt.comptimePrint("{c}", .{std.ascii.toLower(pin_name[1..2][0])});
        const peripheral = @field(regs, per_name);

        // regs.GPIOx.[reg_name].[field]y = value
        // fn set(comptime reg_name: []const u8, comptime prefix: []const u8, value: anytype) void {
        //     @field(port_reg, reg_name).set(prefix ++ suffix, value);
        // }

        fn eset(
            comptime reg_name: []const u8,
            comptime field_prefix: []const u8,
            comptime value: anytype,
        ) void {
            @field(peripheral, reg_name).setField(field_prefix ++ suffix, value);
        }

        fn initClock() void {
            regs.rcc.ahb1enr.setField(per_name ++ "en", .enabled); // regs.rcc.ahb1enr.gpioXen = 1
        }

        // fn initMode(m: Mode, p: Pull) void {
        //     set("MODER", "MODER", m); // regs.GPIOx.MODER.MODERy = z
        //     set("PUPDR", "PUPDR", p); // regs.GPIOx.PUPDR.PUPDRy = z
        // }

        // fn initOutput(c: OutputConfig) void {
        //     initMode(.output, c.pull);
        //     set("OTYPER", "OT", c.type); // regs.GPIOx.OTYPER.OTy = z
        //     set("OSPEEDR", "OSPEEDR", c.speed); // regs.GPIOx.OSPEEDR.OSPEEDRy = z
        // }

        // fn initInput(c: InputConfig) void {
        //     initMode(.input, c.pull);
        // }

        fn mode(comptime m: Mode) void {
            eset("moder", "moder", m); // regs.gpioX.moder.moderY = m
        }

        fn outputType(comptime ot: OutputType) void {
            eset("otyper", "ot", ot); // regs.gpioX.otyper.otY = ot
        }

        fn outputSpeed(comptime os: OutputSpeed) void {
            eset("ospeedr", "ospeedr", os); // regs.gpioX.ospeedr.ospeedrY = os
        }

        fn pull(comptime p: Pull) void {
            eset("pupdr", "pupdr", p); // regs.gpioX.pupdr.pupdrY = p
        }

        fn input(comptime c: InputConfig) void {
            initClock();
            mode(.input);
            pull(c.pull);
        }

        fn output(comptime c: OutputConfig) void {
            initClock();
            mode(.output);
            pull(c.pull);
            outputType(c.type);
            outputSpeed(c.speed);
        }

        fn analog() void {
            initClock();
        }

        fn function(comptime af: u4, comptime c: FunctionConfig) void {
            initClock();
            mode(.alternate_function);
            eset(af_reg_name, af_reg_name, af); // regs.gpioX.afrl.afrlY = af
            pull(c.pull);
        }

        // fn initAlternateFunction(comptime af: u4, c: FunctionConfig) void {
        //     initMode(.alternate_function, c.pull);
        //     set(af_reg_name, af_reg_name, af); // regs.GPIOx.AFRL.AFRLy = z
        // }

        fn read() u1 {
            return switch (@field(peripheral.idr.read(), "idr" ++ suffix)) {
                .high => 1,
                .low => 0,
            }; // regs.gpioX.idr.read().idrY
        }

        fn write(value: u1) void {
            switch (value) {
                0 => eset("bsrr", "br", 1), // regs.gpioX.bsrr.brY = 1
                1 => eset("bsrr", "bs", 1), // regs.gpioX.bsrr.bsY = 1
            }
        }
    };
}

// pin_name e.g. "PA0", "PA1"...
pub fn Pin(comptime pin_name: []const u8) type {
    const pin = Spec(pin_name);

    return struct {
        pub fn Input() type {
            const pin_exti = Exti(pin);
            return struct {
                pub fn init(comptime c: InputConfig) void {
                    pin.input(c);
                    if (c.exti.enable) {
                        pin_exti.enable(c.exti.trigger);
                        pin_exti.setPriority(c.exti.priority);
                    }
                }
                pub const read = pin.read;
                pub const exti = pin_exti;
            };
        }

        pub fn Output() type {
            return struct {
                pub fn init(comptime c: OutputConfig) void {
                    pin.output(c);
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
                pub fn init(comptime c: FunctionConfig) void {
                    pin.function(af, c);
                }
            };
        }
        pub fn function(comptime af: u4, c: FunctionConfig) void {
            pin.initClock();
            pin.initAlternateFunction(af, c);
        }

        pub fn analog() void {
            pin.analog();
        }
        pub fn Analog() type {
            return struct {
                pub fn init() void {
                    pin.analog();
                }
            };
        }
    };
}
