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

// -------------- irq

pub const Irq = enum(u8) {
    // zig fmt: off
    wwdg               = 0,      // Window WatchDog Interrupt
    pvd                = 1,      // PVD through EXTI Line detection Interrupt
    tamp_stamp         = 2,      // Tamper and TimeStamp interrupts through the EXTI line
    rtc_wkup           = 3,      // RTC Wakeup interrupt through the EXTI line
    flash              = 4,      // FLASH global Interrupt
    rcc                = 5,      // RCC global Interrupt
    exti0              = 6,      // EXTI Line0 Interrupt
    exti1              = 7,      // EXTI Line1 Interrupt
    exti2              = 8,      // EXTI Line2 Interrupt
    exti3              = 9,      // EXTI Line3 Interrupt
    exti4              = 10,     // EXTI Line4 Interrupt
    dma1_stream0       = 11,     // DMA1 Stream 0 global Interrupt
    dma1_stream1       = 12,     // DMA1 Stream 1 global Interrupt
    dma1_stream2       = 13,     // DMA1 Stream 2 global Interrupt
    dma1_stream3       = 14,     // DMA1 Stream 3 global Interrupt
    dma1_stream4       = 15,     // DMA1 Stream 4 global Interrupt
    dma1_stream5       = 16,     // DMA1 Stream 5 global Interrupt
    dma1_stream6       = 17,     // DMA1 Stream 6 global Interrupt
    adc                = 18,     // ADC1, ADC2 and ADC3 global Interrupts
    exti9_5            = 23,     // External Line[9:5] Interrupts
    tim1_brk_tim9      = 24,     // TIM1 Break interrupt and TIM9 global interrupt
    tim1_up_tim10      = 25,     // TIM1 Update Interrupt and TIM10 global interrupt
    tim1_trg_com_tim11 = 26,     // TIM1 Trigger and Commutation Interrupt and TIM11 global interrupt
    tim1_cc            = 27,     // TIM1 Capture Compare Interrupt
    tim2               = 28,     // TIM2 global Interrupt
    tim3               = 29,     // TIM3 global Interrupt
    tim4               = 30,     // TIM4 global Interrupt
    i2c1_ev            = 31,     // I2C1 Event Interrupt
    i2c1_er            = 32,     // I2C1 Error Interrupt
    i2c2_ev            = 33,     // I2C2 Event Interrupt
    i2c2_er            = 34,     // I2C2 Error Interrupt
    spi1               = 35,     // SPI1 global Interrupt
    spi2               = 36,     // SPI2 global Interrupt
    usart1             = 37,     // USART1 global Interrupt
    usart2             = 38,     // USART2 global Interrupt
    exti15_10          = 40,     // External Line[15:10] Interrupts
    rtc_alarm          = 41,     // RTC Alarm (A and B) through EXTI Line Interrupt
    otg_fs_wkup        = 42,     // USB OTG FS Wakeup through EXTI line interrupt
    dma1_stream7       = 47,     // DMA1 Stream7 Interrupt
    sdio               = 49,     // SDIO global Interrupt
    tim5               = 50,     // TIM5 global Interrupt
    spi3               = 51,     // SPI3 global Interrupt
    dma2_stream0       = 56,     // DMA2 Stream 0 global Interrupt
    dma2_stream1       = 57,     // DMA2 Stream 1 global Interrupt
    dma2_stream2       = 58,     // DMA2 Stream 2 global Interrupt
    dma2_stream3       = 59,     // DMA2 Stream 3 global Interrupt
    dma2_stream4       = 60,     // DMA2 Stream 4 global Interrupt
    otg_fs             = 67,     // USB OTG FS global Interrupt
    dma2_stream5       = 68,     // DMA2 Stream 5 global interrupt
    dma2_stream6       = 69,     // DMA2 Stream 6 global interrupt
    dma2_stream7       = 70,     // DMA2 Stream 7 global interrupt
    usart6             = 71,     // USART6 global interrupt
    i2c3_ev            = 72,     // I2C3 event interrupt
    i2c3_er            = 73,     // I2C3 error interrupt
    fpu                = 81,     // FPU global interrupt
    spi4               = 84,     // SPI4 global Interrupt
    spi5               = 85,     // SPI5 global Interrupt
    // zig fmt: on

    pub fn enable(self: Irq) void {
        hal.irq.enable(@enumToInt(self));
    }
    pub fn disable(self: Irq) void {
        hal.irq.disable(@enumToInt(self));
    }
    pub fn setPriority(self: Irq, pri: u4) void {
        hal.irq.setPriority(@enumToInt(self), pri);
    }
};
// -------------- irq

// -------------- uart
pub const uart = struct {
    pub fn Uart1(comptime config: hal.uart.Config) type {
        return hal.uart.UartX(.{
            .name = "USART1",
            .rcc = "APB2",
            .irq = Irq.usart1,
            .dma = .{
                .controller = "DMA2",
                .rx = .{
                    .stream = 5,
                    .channel = 4,
                    .irq = Irq.dma2_stream5,
                },
                .tx = .{
                    .stream = 7,
                    .channel = 4,
                    .irq = Irq.dma2_stream7,
                },
            },
        }, config);
    }

    pub fn Uart2(comptime config: hal.uart.Config) type {
        return hal.uart.UartX(.{
            .name = "USART2",
            .rcc = "APB1",
            .irq = Irq.usart2,
            .dma = .{
                .controller = "DMA1",
                .rx = .{
                    .stream = 5,
                    .channel = 4,
                    .irq = Irq.dma1_stream5,
                },
                .tx = .{
                    .stream = 6,
                    .channel = 4,
                    .irq = Irq.dma1_stream6,
                },
            },
        }, config);
    }

    pub fn Uart6(comptime config: hal.uart.Config) type {
        return hal.uart.UartX(.{
            .name = "USART6",
            .rcc = "APB2",
            .irq = Irq.usart6,
            .dma = .{
                .controller = "DMA2",
                .rx = .{
                    .stream = 1,
                    .channel = 5,
                    .irq = Irq.dma2_stream1,
                },
                .tx = .{
                    .stream = 2,
                    .channel = 5,
                    .irq = Irq.dma2_stream1,
                },
            },
        }, config);
    }
};
// -------------- uart
