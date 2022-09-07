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
        if (button.extiPending()) {
            changeBlinkSpeed();
        }
    }

    pub fn DMA2_Stream5() void {
        echo.rxInterrupt();
    }
    pub fn DMA2_Stream7() void {
        echo.txInterrupt();
    }
};

fn changeBlinkSpeed() void {
    blink_speed = switch (blink_speed) {
        500 => 100,
        100 => 50,
        else => 500,
    };
}

const Echo = struct {
    rxBuf: []u8 = undefined,
    txBuf: []u8 = undefined,

    const Self = @This();

    pub fn rxInterrupt(self: *Self) void {
        self.run();
    }

    pub fn txInterrupt(self: *Self) void {
        self.run();
    }

    pub fn run(self: *Self) void {
        if (uart1.rx.ready()) { // receive is finished
            self.confirmRx();
            self.startRx();
        }
        if (uart1.tx.ready()) { // transmit finished
            self.confirmTx();
            self.startTx();
        }
    }

    fn confirmTx(self: *Self) void {
        if (self.txBuf.len > 0) {
            bbuf.read(self.txBuf.len);
        }
    }

    fn startTx(self: *Self) void {
        self.txBuf = bbuf.readable();
        if (self.txBuf.len > 0) {
            uart1.tx.write(self.txBuf);
        } else {
            uart1.tx.irq.disable();
        }
    }

    fn confirmRx(self: *Self) void {
        if (self.rxBuf.len > 0) {
            bbuf.written(self.rxBuf.len);
        }
    }

    fn startRx(self: *Self) void {
        self.rxBuf = bbuf.writableWithLimit(rxChunk);
        if (self.rxBuf.len > 0) {
            uart1.rx.read(self.rxBuf);
        } else {
            uart1.rx.irq.disable();
        }
    }
};

const button = board.button;
const led = board.led;

var blink_speed: u32 = 500;
var ticker = chip.ticker();

const uart1 = uart.Uart1(.{}).dma();
var echo = Echo{};

pub fn init() void {
    const clock = chip.hsi_100;
    chip.init(.{ .clock = clock });
    button.init(.{ .exti = .{ .enable = true } });
    led.init(.{});

    uart1.init(clock.frequencies);
    gpio.pa15.usart1.tx(.{});
    gpio.pb7.usart1.rx(.{});

    bbuf = BipBuffer.init();
}

const rxChunk = 8;

const BipBuffer = @import("bip_buffer.zig").BipBuffer(1024);
var bbuf: BipBuffer = undefined;

pub fn main() !void {
    var itv = ticker.interval(blink_speed);

    echo.run();
    while (true) {
        if (itv.ready(blink_speed)) {
            led.toggle();
        }
        asm volatile ("nop");
    }
}
