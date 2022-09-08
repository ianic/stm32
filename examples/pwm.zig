const micro = @import("microzig");
const chip = micro.chip;
const board = micro.board;
const regs = chip.regs;

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

var ticker = chip.Ticker.init();
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
    pwm();

    var itv = ticker.interval(blink_speed);
    while (true) {
        if (itv.ready(blink_speed)) {
            led.toggle();
        }
        asm volatile ("nop");
    }
}

fn pwm() void {
    // enable output pin for the timer
    // PB8, pin B port 8 to alternate function T10_CH1
    // regs.RCC.AHB1ENR.modify(.{ .GPIOBEN = 1 }); // enable gpio port B
    // regs.GPIOB.MODER.modify(.{ .MODER8 = 0b10 }); // set pin 8 to alternate function mode
    // regs.GPIOB.AFRH.modify(.{ .AFRH8 = 0b0011 }); // use AF3 alternate function 3 = TIM10_CH1

    chip.gpio.pb8.tim10.ch1(.{});

    // general timer
    regs.RCC.APB2ENR.modify(.{ .TIM10EN = 1 }); // enable Timer
    regs.TIM10.PSC.modify(100); // set the prescaler
    regs.TIM10.ARR.modify(1005); // set upper limit of the count

    // configure timer 10 channel 1
    regs.TIM10.CCMR1_Output.modify(.{ .OC1M = 0b110, .OC1PE = 1 }); // output compare mode, and enable
    regs.TIM10.CCER.modify(.{ .CC1E = 1 }); // enable output
    regs.TIM10.CCR1.modify(100); // upper limit of count

    // enable the counter
    regs.TIM10.CR1.modify(.{ .CEN = 1 });
}
