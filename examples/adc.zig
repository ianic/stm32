const std = @import("std");
const micro = @import("microzig");
const chip = micro.chip;
const board = micro.board;
const adc = chip.adc;

pub const interrupts = struct {
    pub fn SysTick() void {
        ticker.inc();
    }

    pub fn ADC() void {
        conversions += 1;
    }
};

var ticker = chip.ticker();

pub fn init() void {
    const clock = chip.hsi_100;
    chip.init(.{ .clock = clock });

    chip.adc.init(.{
        .irq_enable = true,
        .apb2_clock = clock.frequencies.apb2,
        .data = &data,
        .inputs = &.{ .temp, .vref, .pa0, .pa1, .pc4 },
    });
}

var conversions: u32 = 0;
var data: [16]u16 = .{0xaaaa} ** 16;

pub fn main() void {
    const led = board.led;
    led.init(.{});

    var itv = ticker.interval(200);
    var testTicker = ticker.interval(2000);
    var testOk: bool = true;

    while (true) {
        if (itv.ready(200)) {
            if (testOk) {
                led.toggle();
            } else {
                led.on();
            }
        }
        if (testTicker.ready(2000)) {
            testOk = adcTests();
        }
        asm volatile ("nop");
    }
}

fn adcTests() bool {
    const regs = chip.regs;
    var tr = TestResults(32).init();

    // // test adc register values
    tr.add(regs.ADC1.SQR1.read().L == 4);
    tr.add(regs.ADC1.SQR3.read().SQ1 == 18);
    tr.add(regs.ADC1.SQR3.read().SQ2 == 17);
    tr.add(regs.ADC1.SQR3.read().SQ3 == 0);
    tr.add(regs.ADC1.SQR3.read().SQ4 == 1);
    tr.add(regs.ADC1.SQR3.read().SQ5 == 14);

    tr.add(regs.ADC1.SMPR1.read().SMP18 == 0b101);
    tr.add(regs.ADC1.SMPR1.read().SMP17 == 0b101);
    tr.add(regs.ADC1.SMPR2.read().SMP0 == 0b101);

    // gpio pins are in analog mode
    tr.add(regs.GPIOA.MODER.read().MODER0 == 3);
    tr.add(regs.GPIOA.MODER.read().MODER1 == 3);
    tr.add(regs.GPIOC.MODER.read().MODER4 == 3);

    // temerature sensor is reading value
    var temp: f32 = adc.tempValueToC(data[0]);
    tr.add(temp > 20 and temp < 40);

    var vref = data[1];
    tr.add(vref > 1480 and vref < 1490);

    // var results: []bool = tr.get();
    // _ = results;
    return tr.ok();
}

fn TestResults(comptime no: u8) type {
    return struct {
        results: [no]bool = [_]bool{false} ** no,
        current: u8 = 0,

        const Self = @This();

        pub fn init() Self {
            return Self{ .current = 0 };
        }

        pub fn add(self: *Self, r: bool) void {
            self.results[self.current] = r;
            self.current += 1;
        }

        pub fn ok(self: *Self) bool {
            var i: u8 = 0;
            while (i < self.current) : (i += 1) {
                if (!self.results[i]) {
                    return false;
                }
            }
            return true;
        }
        pub fn get(self: *Self) []bool {
            return self.results[0..self.current];
        }
    };
}
