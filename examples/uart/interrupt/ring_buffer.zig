const std = @import("std");

pub fn RingBuffer(comptime size: u16) type {
    return struct {
        buffer: [size]u8 = undefined,
        w: u16 = 0,
        r: u16 = 0,

        const Self = @This();

        pub fn init() Self {
            return .{};
        }

        pub fn push(self: *Self, b: u8) void {
            self.buffer[self.w] = b;
            self.w += 1;
            if (self.w == size) {
                self.w = 0;
            }
        }

        pub fn pop(self: *Self) ?u8 {
            if (self.r == self.w) {
                return null;
            }
            const b = self.buffer[self.r];
            self.r += 1;
            if (self.r == size) {
                self.r = 0;
            }
            return b;
        }
    };
}

test "push" {
    var rb = RingBuffer(4).init();
    rb.push(1);
    rb.push(2);
    rb.push(3);
    try std.testing.expectEqual(rb.pop().?, 1);
    try std.testing.expectEqual(rb.pop().?, 2);
    try std.testing.expectEqual(rb.pop().?, 3);
    try std.testing.expect(rb.pop() == null);
    try std.testing.expectEqual(rb.w, 3);
    try std.testing.expectEqual(rb.r, 3);

    rb.push(4);
    rb.push(5);
    rb.push(6);
    try std.testing.expectEqual(rb.w, 2);
    try std.testing.expectEqual(rb.r, 3);
    try std.testing.expectEqual(rb.pop().?, 4);
    try std.testing.expectEqual(rb.pop().?, 5);
    try std.testing.expectEqual(rb.pop().?, 6);
    try std.testing.expect(rb.pop() == null);
    try std.testing.expectEqual(rb.w, 2);
    try std.testing.expectEqual(rb.r, 2);
}
