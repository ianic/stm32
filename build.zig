const std = @import("std");
const micro = @import("microzig/src/main.zig");
const chips = @import("chips.zig");
const boards = @import("boards.zig");

pub fn build(b: *std.build.Builder) !void {
    try std.os.chdir(root());

    const backing = .{
        .board = boards.nucleo_stm32f411,
    };

    const Example = struct {
        name: []const u8,
        source: []const u8,
    };

    const examples = [_]Example{
        .{ .name = "blink", .source = "examples/blink.zig" },
        .{ .name = "uart-pooling", .source = "examples/uart/pooling.zig" },
        .{ .name = "uart-interrupt", .source = "examples/uart/interrupt/main.zig" },
        .{ .name = "uart-dma", .source = "examples/uart/dma/main.zig" },
        .{ .name = "adc", .source = "examples/adc.zig" },
        .{ .name = "pwm", .source = "examples/pwm.zig" },
    };

    for (examples) |e| {
        const elf = micro.addEmbeddedExecutable(
            b,
            b.fmt("{s}.elf", .{e.name}),
            e.source,
            backing,
            .{
                .hal_package_path = .{ .path = root() ++ "/hal.zig" },
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

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}
