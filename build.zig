const std = @import("std");
const micro = @import("microzig/src/main.zig");
const hal = @import("hal/hal.zig");
const chips = @import("chips/chips.zig");
const boards = @import("boards/boards.zig");

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}

const root_path = root() ++ "/";

pub fn build(b: *std.build.Builder) !void {
    try std.os.chdir(srcDir());

    const backing = .{
        .board = boards.nucleo_stm32f411,
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
            .{
                .hal_package_path = .{ .path = root_path ++ "hal/hal.zig" },
            },
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
