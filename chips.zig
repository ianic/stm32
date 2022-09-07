const std = @import("std");
const micro = @import("microzig/src/main.zig");

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}

const root_path = root() ++ "/";

// add fpu to the existing microzig m4 chip definition
pub const cortex_m4_fpu = micro.Cpu{
    .name = "ARM Cortex-M4 with FPU",
    .path = root_path ++ "microzig/src/modules/cpus/cortex-m/cortex-m.zig",
    .target = std.zig.CrossTarget{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .os_tag = .freestanding,
        .abi = .eabihf, // ref: https://rbino.com/posts/zig-stm32-blink/
    },
};

pub const stm32f411re = micro.Chip{
    .name = "STM32F411RE",
    .path = root_path ++ "chips/stm32f411re.zig",
    .cpu = cortex_m4_fpu,
    .memory_regions = &.{
        .{ .offset = 0x08000000, .length = 512 * 1024, .kind = .flash },
        .{ .offset = 0x20000000, .length = 128 * 1024, .kind = .ram },
    },
};
