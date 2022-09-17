const std = @import("std");

pub fn mmio(addr: usize, comptime size: u8, comptime PackedT: type) *volatile Mmio(size, PackedT) {
    return @intToPtr(*volatile Mmio(size, PackedT), addr);
}

pub fn Mmio(comptime size: u8, comptime PackedT: type) type {
    if ((size % 8) != 0)
        @compileError("size must be divisible by 8!");

    if (!std.math.isPowerOfTwo(size / 8))
        @compileError("size must encode a power of two number of bytes!");

    const IntT = std.meta.Int(.unsigned, size);

    if (@sizeOf(PackedT) != (size / 8))
        @compileError(std.fmt.comptimePrint("IntT and PackedT must have the same size!, they are {} and {} bytes respectively", .{ size / 8, @sizeOf(PackedT) }));

    return extern struct {
        const Self = @This();

        raw: IntT,

        pub const underlying_type = PackedT;

        pub inline fn read(addr: *volatile Self) PackedT {
            return @bitCast(PackedT, addr.raw);
        }

        pub inline fn write(addr: *volatile Self, val: PackedT) void {
            // This is a workaround for a compiler bug related to miscompilation
            // If the tmp var is not used, result location will fuck things up
            var tmp = @bitCast(IntT, val);
            addr.raw = tmp;
        }

        pub inline fn modify(addr: *volatile Self, fields: anytype) void {
            var val = read(addr);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, field.name) = @field(fields, field.name);
            }
            write(addr, val);
        }

        pub inline fn toggle(addr: *volatile Self, fields: anytype) void {
            var val = read(addr);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, @tagName(field.default_value.?)) = !@field(val, @tagName(field.default_value.?));
            }
            write(addr, val);
        }

        // setField supports setting filed value in various ways
        // for example:
        // regs.gpioa.moder.set("moder3", regs.gpioh.Moder.Moder0.input) // exact type
        // regs.gpioa.moder.set("moder3", 1)     // int will be cast to enum by value
        // regs.gpioa.moder.set("moder3", mode)  // where mode is application enum with same values
        // regs.gpioa.moder.set("moder3", .input)// enum literal will be cast to enum by name
        pub inline fn setField(
            addr: *volatile Self,
            comptime name: []const u8,
            comptime value: anytype,
        ) void {
            var reg_val = read(addr);
            const field_type = @TypeOf(@field(reg_val, name));
            const value_type = @TypeOf(value);
            const value_ti = @typeInfo(value_type);
            @field(reg_val, name) = if (field_type == value_type)
                value
            else switch (@typeInfo(field_type)) {
                .Int => switch (value_ti) { // field type is int
                    .Int, .ComptimeInt => value,
                    .Enum => @enumToInt(value), // enum to int
                    else => @compileError("unable to set field value"),
                },
                .Enum => switch (value_ti) { // field type is enum
                    .Int, .ComptimeInt => @intToEnum(field_type, value), // int to enum, find by value
                    .Enum => @intToEnum(field_type, @enumToInt(value)), // enum to enum, find by value
                    .EnumLiteral => @field(field_type, @tagName(value)), // literal to enum, find by name
                    else => @compileError("unable to set field value"),
                },
                else => @compileError("unable to set field value"),
            };
            write(addr, reg_val);
        }
    };
}

pub fn MmioInt(comptime size: u8, comptime T: type) type {
    return extern struct {
        const Self = @This();

        raw: std.meta.Int(.unsigned, size),

        pub inline fn read(addr: *volatile Self) T {
            return @truncate(T, addr.raw);
        }

        pub inline fn modify(addr: *volatile Self, val: T) void {
            const Int = std.meta.Int(.unsigned, size);
            const mask = ~@as(Int, (1 << @bitSizeOf(T)) - 1);

            var tmp = addr.raw;
            addr.raw = (tmp & mask) | val;
        }
    };
}

pub fn mmioInt(addr: usize, comptime size: usize, comptime T: type) *volatile MmioInt(size, T) {
    return @intToPtr(*volatile MmioInt(size, T), addr);
}
