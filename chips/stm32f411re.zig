const std = @import("std");
const hal = @import("microzig").hal;

const vector_table = @import("stm32f411re/vector_table.zig");
pub usingnamespace vector_table; // re-export VectorTable and InterruptVector for microzig

pub const regs = @import("stm32f411re/registers.zig").registers;
pub const regsisters = regs;

pub const clk = hal.clock.Chip(chip_frequencies); // clock hal initialized with chip frequencies
pub const adc = @import("stm32f411re/adc.zig");
pub const gpio = @import("stm32f411re/gpio.zig").gpio;

pub const Config = struct {
    clock: clk.Config = hsi_100,
    systick_enabled: bool = true,

    // Prigroup determines the split of group priority (preemption priority) from sub-priority.
    // Refer to page 229 in "PM0214 Rev 10" for possible values.
    // 0b0xx => 16 group / 0 sub priorities,
    // 0b100 => 8/2,
    // 0b101 => 4/4,
    // 0b110 => 2/8,
    // 0b111 => 0/16
    prigroup: u3 = 0b000,
};

pub fn init(comptime cfg: Config) void {
    initFeatures(cfg);

    clk.init(cfg.clock);
    // frequencies = cfg.clock.frequencies;
    if (cfg.systick_enabled) {
        clk.initSysTick(cfg.clock.frequencies.ahb, 1);
    }
}

// pub var frequencies: clk.Frequencies = undefined;

fn initFeatures(comptime cfg: Config) void {
    regs.FPU_CPACR.CPACR.modify(.{ .CP = 0b1111 }); // Enable FPU coprocessor
    regs.FLASH.ACR.modify(.{ .DCEN = 1, .ICEN = 1, .PRFTEN = 1 }); // Enable flash data and instruction cache

    // On writes, write 0x5FA to VECTKEY, otherwise the write is ignored.
    regs.SCB.AIRCR.modify(.{ .PRIGROUP = cfg.prigroup, .VECTKEYSTAT = 0x5FA });
}

// -------------- clock configuration
// chip clock frequency operating conditions
const chip_frequencies = struct {
    pub const hsi = 16_000_000; // chapter 6.3.9 in "DocID026289 Rev 7"
    pub const max_cpu = 100_000_000; // chapter 6.3.1 in "DocID026289 Rev 7"
    pub const max_apb1 = 50_000_000;
};

// max frequency using hsi as source
pub const hsi_100 = .{
    .source = .hsi,
    .pll = .{ .m = 16, .n = 400, .p = 4, .q = 8 },
    .latency = 3,
    .prescaler = .{ .ahb = 1, .apb1 = 2, .apb2 = 1 },
    .frequencies = .{
        .source = chip_frequencies.hsi,
        .cpu = 100_000_000,
        .ahb = 100_000_000,
        .apb1 = 50_000_000,
        .apb2 = 100_000_000,
        .usb = 50_000_000,
    },
};

// this configuration ensures that usb has required 48MHz
pub const hsi_96 = .{
    .source = .hsi,
    .pll = .{ .m = 2, .n = 72, .p = 6, .q = 12 },
    .latency = 3,
    .prescaler = .{ .ahb = 1, .apb1 = 2, .apb2 = 1 },
    .frequencies = .{
        .source = chip_frequencies.hsi,
        .cpu = 96_000_000,
        .ahb = 96_000_000,
        .apb1 = 48_000_000,
        .apb2 = 96_000_000,
        .usb = 48_000_000,
    },
};

test "configs are valid" {
    clk.checkConfig(hsi_100);
    clk.checkConfig(hsi_96);
}
// -------------- clock configuration

// -------------- tick counter
pub fn ticker() Ticker {
    return .{ .ticks = 0 };
}

pub const Ticker = struct {
    ticks: u32 = 0,

    const Self = @This();
    pub fn inc(self: *Self) void {
        _ = @addWithOverflow(u32, self.ticks, 1, &self.ticks);
    }

    pub fn interval(self: *Self, delay: u32) TickerInterval {
        var tc = TickerInterval{
            .ticks = &self.ticks,
        };
        tc.set(self.ticks, delay);
        return tc;
    }
};

pub const TickerInterval = struct {
    ticks: *u32 = undefined,
    next: u32 = 0,
    overflow: bool = false,

    const Self = @This();

    pub fn ready(self: *Self, delay: u32) bool {
        var current = self.ticks.*;
        if (self.overflow and current > 0x7FFFFFFF) {
            return false;
        }
        if (current >= self.next) {
            self.set(current, delay);
            return true;
        }
        return false;
    }

    fn set(self: *Self, current: u32, delay: u32) void {
        self.overflow = @addWithOverflow(u32, current, delay, &self.next);
    }
};

test "ticker overflow" {
    var t = ticker();
    t.ticks = 0xFFFFFFFF;
    t.inc();
    try std.testing.expectEqual(t.ticks, 0);
}

test "counter with overflow" {
    var t = ticker();
    t.ticks = 0xFFFFFFFF;

    var counter = t.interval(2);
    try std.testing.expect(!counter.ready(2));
    t.inc();
    try std.testing.expect(!counter.ready(2));
    try std.testing.expectEqual(t.ticks, 0);
    try std.testing.expectEqual(counter.next, 1);
    try std.testing.expectEqual(counter.overflow, true);
    t.inc();
    try std.testing.expect(counter.ready(2));
    try std.testing.expectEqual(counter.next, 3);
    try std.testing.expectEqual(counter.overflow, false);
}
// -------------- tick counter

// -------------- event loop
pub fn tasks(comptime no: u32, ticks_ptr: *u32) [no]Task {
    var a = [_]Task{Task{ .ticks = ticks_ptr }} ** 2;
    return a;
}

pub fn scheduler(tsks: []Task, ticks_ptr: *u32) Scheduler {
    return Scheduler.init(tsks, ticks_ptr);
}

pub const Scheduler = struct {
    tasks: []Task = undefined,
    ticks: *u32 = undefined,

    const Self = @This();

    pub fn init(tsks: []Task, ticks_ptr: *u32) Self {
        return .{ .tasks = tsks, .ticks = ticks_ptr };
    }

    pub fn getTask(self: *Self, no: u8) *Task {
        var task = &self.tasks[no];
        task.ticks = self.ticks;
        return task;
    }

    pub fn tick(self: *Self) void {
        // TODO: handle overrun in ticks
        //self.ticks += 1;
        self.run();
    }

    pub fn run(self: *Self) void {
        var i: u8 = 0;
        while (i < self.tasks.len) : (i += 1) {
            var task = &self.tasks[i];
            task.try_run();
        }
    }
};

pub const Task = struct {
    ticks: *u32 = undefined,
    frame: anyframe = undefined,
    resume_at: u32 = 0,

    const Self = @This();

    fn try_run(self: *Self) void {
        if (self.frame == undefined or
            self.resume_at == 0 or
            self.resume_at > self.ticks.*)
        {
            return;
        }

        var fr = self.frame;
        self.resume_at = 0;
        self.frame = undefined;
        resume fr;
    }

    pub fn sleep(self: *Self, ms: u32) void {
        suspend {
            self.resume_at = self.ticks.* + ms;
            self.frame = @frame();
        }
    }
};
// -------------- event loop

// -------------- uart
pub const uart = struct {
    pub fn Uart1(comptime config: hal.uart.Config) type {
        return hal.uart.UartX(.{
            .name = "USART1",
            .rcc = "APB2",
            .irq = vector_table.Irq.usart1,
            .dma = .{
                .controller = "DMA2",
                .rx = .{
                    .stream = 5,
                    .channel = 4,
                    .irq = vector_table.Irq.dma2_stream5,
                },
                .tx = .{
                    .stream = 7,
                    .channel = 4,
                    .irq = vector_table.Irq.dma2_stream7,
                },
            },
        }, config);
    }

    pub fn Uart2(comptime config: hal.uart.Config) type {
        return hal.uart.UartX(.{
            .name = "USART2",
            .rcc = "APB1",
            .irq = vector_table.Irq.usart2,
            .dma = .{
                .controller = "DMA1",
                .rx = .{
                    .stream = 5,
                    .channel = 4,
                    .irq = vector_table.Irq.dma1_stream5,
                },
                .tx = .{
                    .stream = 6,
                    .channel = 4,
                    .irq = vector_table.Irq.dma1_stream6,
                },
            },
        }, config);
    }

    pub fn Uart6(comptime config: hal.uart.Config) type {
        return hal.uart.UartX(.{
            .name = "USART6",
            .rcc = "APB2",
            .irq = vector_table.Irq.usart6,
            .dma = .{
                .controller = "DMA2",
                .rx = .{
                    .stream = 1,
                    .channel = 5,
                    .irq = vector_table.Irq.dma2_stream1,
                },
                .tx = .{
                    .stream = 2,
                    .channel = 5,
                    .irq = vector_table.Irq.dma2_stream1,
                },
            },
        }, config);
    }
};
// -------------- uart
