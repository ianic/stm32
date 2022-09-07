const micro = @import("microzig");
const chip = micro.chip;
const board = micro.board;

pub const interrupts = struct {
    pub fn SysTick() void {
        ticker.inc();
    }

    pub fn EXTI15_10() void {
        if (button.exti.pending()) {
            changeBlinkSpeed();
        }
    }
};

var ticker = chip.ticker();
var blink_speed: u32 = 500;

fn changeBlinkSpeed() void {
    blink_speed = switch (blink_speed) {
        500 => 100,
        100 => 50,
        else => 500,
    };
}

const button = board.button;
const led = board.led;

pub fn init() void {
    chip.init(.{});
    button.init(.{ .exti = .{ .enable = true } });
    led.init(.{});
}

pub fn main() void {
    var itv = ticker.interval(blink_speed);
    while (true) {
        if (itv.ready(blink_speed)) {
            led.toggle();
        }
        asm volatile ("nop");
    }
}
