const std = @import("std");
const micro = @import("microzig/src/main.zig");

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}

const root_path = root() ++ "/";

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
    .path = root_path ++ "chips/stm32f411re/main.zig",
    .cpu = cortex_m4_fpu,
    .memory_regions = &.{
        .{ .offset = 0x08000000, .length = 512 * 1024, .kind = .flash },
        .{ .offset = 0x20000000, .length = 128 * 1024, .kind = .ram },
    },
};

pub const nucleo_stm32f411 = micro.Board{
    .name = "nucleo_stm32f411",
    .path = root_path ++ "boards/nucleo_stm32f411/main.zig",
    .chip = stm32f411re,
};

pub fn build(b: *std.build.Builder) !void {
    try std.os.chdir(srcDir());

    const backing = .{
        .board = nucleo_stm32f411,
    };

    const Example = struct {
        name: []const u8,
        source: []const u8,
    };

    const examples = [_]Example{
        .{ .name = "blink", .source = "examples/blink/main.zig" },
        // .{ .name = "uart-pooling", .source = "uart/pooling/src/main.zig" },
        // .{ .name = "uart-interrupt", .source = "uart/interrupt/src/main.zig" },
        // .{ .name = "uart-dma", .source = "uart/dma_buffered/src/main.zig" },
        // .{ .name = "adc", .source = "adc/src/main.zig" },
        // .{ .name = "pwm", .source = "pwm/main.zig" },
    };

    for (examples) |e| {
        const elf = micro.addEmbeddedExecutable(
            b,
            b.fmt("{s}.elf", .{e.name}),
            e.source,
            backing,
            .{},
        );
        elf.inner.setBuildMode(.ReleaseSmall);
        const bin = b.addInstallRaw(
            elf.inner,
            b.fmt("{s}.bin", .{e.name}),
            .{},
        );
        b.getInstallStep().dependOn(&bin.step);
        elf.inner.install();
    }
}

pub fn srcDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}
