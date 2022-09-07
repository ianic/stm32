const std = @import("std");
const micro = @import("microzig/src/main.zig");
const chips = @import("chips.zig");

fn root() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}

const root_path = root() ++ "/";

pub const nucleo_stm32f411 = micro.Board{
    .name = "nucleo_stm32f411",
    .path = root_path ++ "boards/nucleo_stm32f411.zig",
    .chip = chips.stm32f411re,
};
