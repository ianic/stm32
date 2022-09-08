const std = @import("std");
const micro = @import("microzig");
const chip = micro.chip;
const board = micro.board;
const uart = chip.uart;
const gpio = chip.gpio;

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

fn changeBlinkSpeed() void {
    blink_speed = switch (blink_speed) {
        500 => 100,
        100 => 50,
        else => 500,
    };
}

const button = board.button;
const led = board.led;

var blink_speed: u32 = 500;
var ticker = chip.Ticker.init();

const uart1 = uart.Uart1(.{}).pooling();

pub fn init() void {
    const clock = chip.hsi_100;
    chip.init(.{ .clock = clock });
    button.init(.{ .exti = .{ .enable = true } });
    led.init(.{});

    uart1.init(clock.frequencies);
    //gpio.usart1.tx.pa15(.{});
    //gpio.usart1.rx.pb7(.{});
    gpio.pa15.usart1.tx(.{});
    gpio.pb7.usart1.rx(.{});
}

pub fn main() !void {
    var itv = ticker.interval(blink_speed);
    while (true) {
        if (itv.ready(blink_speed)) {
            led.toggle();
        }

        if (uart1.rx.ready()) { // read RXNE flag (receive not empty)
            const b = uart1.rx.read(); // read rx byte
            //_ = b;
            uart1.tx.write(b); // transmit (this will block until tx is ready)
        }

        asm volatile ("nop");
    }
}
