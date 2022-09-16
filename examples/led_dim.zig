const micro = @import("microzig");
const chip = micro.chip;
const board = micro.board;
const regs = chip.eregs;
const gpio = chip.gpio;

pub const interrupts = struct {
    pub fn SysTick() void {
        ticker.inc();
    }

    pub fn EXTI15_10() void {
        if (button.exti.pending()) {}
    }
};

var ticker = chip.Ticker.init();
const button = board.button;

pub fn init() void {
    chip.init(.{});
    button.init(.{ .exti = .{ .enable = true } });
}

pub fn main() void {
    pwm_tim2();

    var itv = ticker.interval(1);
    var dim_value: u12 = 0;
    var dir: enum { up, down } = .up;
    while (true) {
        if (itv.ready(1)) {
            switch (dir) {
                .up => dim_value += 1,
                .down => dim_value -= 1,
            }
            regs.tim2.ccr1.* = @intCast(u32, dim_value);
            regs.tim2.egr.modify(.{ .ug = .update });
            dir = switch (dim_value) {
                1536 => .down,
                0 => .up,
                else => dir,
            };
        }
        asm volatile ("nop");
    }
}

fn pwm_tim2() void {
    // on board led as tim2 ch1 output
    gpio.tim2.ch1.pa5(.{});

    regs.rcc.apb1enr.modify(.{ .tim2en = .enabled }); // enable timer
    regs.tim2.psc.modify(100); // set the prescaler
    regs.tim2.arr.* = 4095; // set upper limit of the count

    // configure timer 2 channel 1
    regs.tim2.ccmr1_output.modify(.{ .oc1m = .pwm_mode1, .oc1pe = .enabled }); // output compare mode, and enable
    regs.tim2.ccer.modify(.{ .cc1e = 1 }); // enable output
    regs.tim2.ccr1.* = 0; // upper limit of count

    // enable the counter
    regs.tim2.cr1.modify(.{ .cen = .enabled });
}
