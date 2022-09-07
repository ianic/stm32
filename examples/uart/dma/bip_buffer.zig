pub fn BipBuffer(buflen: u16) type {
    return struct {
        buffer: [buflen]u8 = undefined,

        w: u16 = 0, // writer position
        r: u16 = 0, // reader position
        h: u16 = buflen, // high water mark

        const Self = @This();
        // returns writable part of the buffer
        // can be greater or lower than the required len size
        // it's up to the caller to check that
        pub fn writable(b: *Self, len: u16) []u8 {
            if (b.r <= b.w) {
                if ((b.w + len < buflen) // is there enough space at the end of the buffer
                or (buflen - b.w >= b.r) // or wrapping is useless
                ) {
                    return b.buffer[b.w..];
                }
                // wrap writer position
                b.h = b.w; // set hwm
                b.w = 0;
            }
            return b.buffer[b.w .. b.r - 1];
        }

        pub fn writableWithLimit(b: *Self, len: u16) []u8 {
            var buf = b.writable(len);
            if (buf.len > len) {
                return buf[0..len];
            }
            return buf;
        }

        // confirmation that len part of the writable buffer is written
        pub fn written(b: *Self, len: usize) void {
            b.w += @intCast(u16, len);
        }

        // returns readable buffer part, zero size if there is nothing new
        pub fn readable(b: *Self) []u8 {
            if (b.r == b.h and b.r > b.w) {
                // wrap reader position
                b.h = buflen;
                b.r = 0;
            }
            if (b.r <= b.w) {
                return b.buffer[b.r..b.w];
            }
            if (b.r <= b.h) {
                return b.buffer[b.r..b.h];
            }
            return b.buffer[0..0];
        }

        pub fn empty(b: *Self) bool {
            return b.r == b.w and b.h == buflen;
        }

        // confirmation that the len part of the readable buffer is processed
        pub fn read(b: *Self, len: usize) void {
            b.r += @intCast(u16, len);
        }

        pub fn init() Self {
            return .{};
        }
    };
}

const std = @import("std");
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;

test "init" {
    const len = 128;
    var b = BipBuffer(len).init();

    try expect(b.w == 0);
    try expect(b.r == 0);
    //try expect(b.buflen == len);
    try expect(b.h == len);

    try expect(b.writable(0).len == len);
    try expect(b.writable(10).len == len);
    try expect(b.writable(256).len == len);
    try expect(b.readable().len == 0);
}

test "w>r" {
    const len = 128;
    var b = BipBuffer(len).init();

    b.written(10);
    try expect(b.w == 10);
    try expect(b.r == 0);
    try expect(b.h == len);
    try expect(b.writable(10).len == 118);
    try expect(b.writable(0).len == 118);
    try expect(b.writable(256).len == 118);
    try expect(b.readable().len == 10);

    b.written(55);
    try expect(b.w == 65);
    try expect(b.r == 0);
    try expect(b.h == len);
    try expect(b.writable(10).len == 63);
    try expect(b.readable().len == 65);

    try expect(b.writable(64).len == 63);
    try expect(b.writable(100).len == 63);
    try expect(b.readable().len == 65);
    b.read(15);
    try expect(b.w == 65);
    try expect(b.r == 15);
    try expect(b.h == len);

    try expect(b.readable().len == 50);
    try expect(b.writable(100).len == 63);
    b.read(50);
    try expect(b.w == 65);
    try expect(b.r == 65);
    try expect(b.h == len);
}

test "r>w" {
    const len = 128;
    var b = BipBuffer(len).init();
    b.w = 10;
    b.r = 80;
    b.h = 100;

    try expect(b.writable(50).len == 70 - 1);
    try expect(b.writable(100).len == 70 - 1);
    try expect(b.readable().len == 20);

    b.written(20);
    try expect(b.w == 30);
    try expect(b.r == 80);
    try expect(b.h == 100);
    try expect(b.writable(40).len == 50 - 1);
    try expect(b.writable(100).len == 50 - 1);
    try expect(b.readable().len == 20);

    b.read(10);
    try expect(b.w == 30);
    try expect(b.r == 90);
    try expect(b.h == 100);
    try expect(b.readable().len == 10);

    b.read(10);
    try expect(b.w == 30);
    try expect(b.r == 100);
    try expect(b.h == 100);

    // warapping reader
    try expect(b.readable().len == 30);
    try expect(b.w == 30);
    try expect(b.r == 0);
    try expect(b.h == 128);
}

test "wrapping" {
    const len = 128;
    var b = BipBuffer(len).init();
    b.w = 65;
    b.r = 65;
    b.h = len;

    // writer wrap, requested more then there is at the right of the w
    try expect(b.writable(64).len == 65 - 1);
    try expect(b.w == 0);
    try expect(b.r == 65);
    try expect(b.h == 65);

    // reader wrap
    try expect(b.readable().len == 0);
    try expect(b.r == 0);

    b.written(10);
    try expect(b.w == 10);
    try expect(b.r == 0);
    try expect(b.h == 128);
    try expect(b.readable().len == 10);
}
