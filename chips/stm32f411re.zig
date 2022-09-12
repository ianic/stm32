const std = @import("std");
const hal = @import("microzig").hal;

pub usingnamespace @import("stm32f411re/vector_table.zig"); // re-export VectorTable and InterruptVector for microzig
pub const regs = @import("stm32f411re/registers.zig").registers;
pub const regsisters = regs;
pub const adc = @import("stm32f411re/adc.zig");
pub const gpio = @import("stm32f411re/gpio.zig").gpio;
pub const uart = @import("stm32f411re/uart.zig");
pub const Ticker = hal.Ticker;
pub const eregs = @import("stm32f411re/registers_with_enums.zig").registers;

const clock = hal.clock.Chip(chip_frequencies); // clock hal initialized with chip frequencies

pub const Config = struct {
    clock: clock.Config = hsi_100,
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

    clock.init(cfg.clock);
    // frequencies = cfg.clock.frequencies;
    if (cfg.systick_enabled) {
        clock.initSysTick(cfg.clock.frequencies.ahb, 1);
    }
}

fn initFeatures(comptime cfg: Config) void {
    eregs.fpu_cpacr.cpacr.modify(.{ .cp = 0b1111 }); // Enable FPU coprocessor
    eregs.flash.acr.modify(.{ .dcen = .enabled, .icen = .enabled, .prften = .enabled }); // Enable flash data and instruction cache

    // On writes, write 0x5FA to VECTKEY, otherwise the write is ignored.
    eregs.scb.aircr.modify(.{ .prigroup = cfg.prigroup, .vectkeystat = 0x5FA });
}

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
    clock.checkConfig(hsi_100);
    clock.checkConfig(hsi_96);
}
