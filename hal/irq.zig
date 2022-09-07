const micro = @import("microzig");
const regs = micro.chip.regs;

// 0...31  => regs.NVIC.ISER0.modify(.{ .SETENA = bit }),
// 32...63 => regs.NVIC.ISER1.modify(.{ .SETENA = bit }),
// ...
pub fn enable(irqn: u8) void {
    setSERBit(@ptrToInt(regs.NVIC.ISER0), irqn);
}

// 0...31  => regs.NVIC.ICER0.modify(.{ .CLRENA = bit }),
// 32...63 => regs.NVIC.ICER1.modify(.{ .CLRENA = bit }),
// ...
pub fn disable(irqn: u8) void {
    setSERBit(@ptrToInt(regs.NVIC.ICER0), irqn);
}

// Cortex-M3/4/7 cores use only the four upper bits.
// reg.SCB.AIRCR.PRIGOROUP defines split between preemption priority and sub-priority
// regs.NVIC.IPR[x].modify(.{ .IPR_N[y] = value });
pub fn setPriority(irqn: u8, pri: u4) void {
    const base_addr = @ptrToInt(regs.NVIC.IPR0); // start from addres of the first register IPR0
    const addr = base_addr + 0x1 * @intCast(u32, irqn); // advance by byte for each irq
    const reg = @intToPtr(*u8, addr); // get pointer to location
    const value: u8 = @intCast(u8, pri) << 4; // shift pri to upper 4 bits, only those are used
    reg.* = value; // update value
}

// start from base_addr
// find word (4 byte) where irqn is
// set bit in that word
// for example 40 is second word ISER1/ICER1, 8 bit (0b1_0000_0000)
fn setSERBit(base_addr: u32, irqn: u8) void {
    const reg_no = irqn >> 5; // reg 0, 1, 2 ... (every 32 bits is another)
    const addr = base_addr + 0x4 * reg_no; // switch to the address of the register no x
    const reg = @intToPtr(*u32, addr); // get pointer to register
    reg.* = irqBit(irqn); // set bits in that word
}

fn irqBit(irqn: u8) u32 {
    return @intCast(u32, 1) << @intCast(u5, (irqn & 0x1f));
}

const std = @import("std");
const expectEqual = std.testing.expectEqual;

test "irq_bit" {
    try expectEqual(irqBit(6), 0x40);
    try expectEqual(irqBit(40), 0b1_0000_0000);
    try expectEqual(irqBit(32), 0x1);
    try expectEqual(irqBit(18), 0x40000);
}
