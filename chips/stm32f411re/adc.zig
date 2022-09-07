const std = @import("std");
const micro = @import("microzig");
const chip = micro.chip;
const regs = chip.regs;
const gpio = chip.gpio;

pub const Config = struct {
    irq_enable: bool = true, // enable rising adc interrupt on each conversion
    apb2_clock: u32 = 0, // for calculating prescaler
    inputs: []const Input, // adc input channels
    data: [*]const u16, // where results of conversion will be stored
    // value for the ADC sample time register SMPRx
    // 000: 3 cycles 001: 15 cycles 010: 28 cycles 011: 56 cycles 100: 84 cycles 101: 112 cycles 110: 144 cycles 111: 480 cycles
    sample_time: u3 = 0b101,
};

pub fn init(cfg: Config) void {
    adc_init(cfg);
    dma_init(@intCast(u16, cfg.inputs.len), @ptrToInt(cfg.data));
}

fn adc_init(cfg: Config) void {
    regs.RCC.APB2ENR.modify(.{ .ADC1EN = 1 }); // enable clock for adc1

    regs.ADC1.CR2.modify(.{ .ADON = 0 }); // disable ADC
    regs.ADC1.CR2.modify(.{ .CONT = 1 }); // continous mode, 0 for one conversion only
    regs.ADC1.CR2.modify(.{ .DMA = 1, .DDS = 1 }); // DMA mode enabled
    regs.ADC1.CR2.modify(.{ .EOCS = 1 }); // The EOC bit is set at the end of each regular conversion.

    initInputs(cfg.inputs, cfg.sample_time);
    const sequence_len = @intCast(u4, cfg.inputs.len - 1);

    regs.ADC1.SQR1.modify(.{ .L = sequence_len }); // sequnce 0 = 1 conversions ... 15 = 16 conversions
    regs.ADC1.CR1.modify(.{ .SCAN = 1 }); // scan mode must be set, if you are using more than 1 channel for the ADC
    regs.ADC1.CR1.modify(.{ .RES = 0b000 }); // resolution of the conversion, 12-bit (15 ADCCLK cycles), 0 to 4095

    // ADCCLK = APB2 / prescaler
    // This clock is generated from the APB2 clock divided by a programmable prescaler
    // that allows the ADC to work at fPCLK2/2, /4, /6 or /8.
    // Max clock is 36/18 MHz (high/low voltage)
    regs.ADC_Common.CCR.modify(.{ .ADCPRE = calcPrescaler(cfg.apb2_clock) }); // prescaler to divide apb2 clock

    if (cfg.irq_enable) {
        regs.ADC1.CR1.modify(.{ .EOCIE = 1 }); // enable interrupt
        chip.Irq.adc.enable();
    }

    regs.ADC1.SR.modify(.{ .EOC = 0, .OVR = 0, .STRT = 0 }); // clear status register
    regs.ADC1.CR2.modify(.{ .ADON = 1 }); // enable ADC
    regs.ADC1.CR2.modify(.{ .SWSTART = 1 }); // start the ADC conversion
}

// values from DocID026289 Rev 7 page 113
const max_adc_clock = 36_000_000; // VDDA = 2.4 to 3.6 V
//const max_adc_clock = 18_000_000; // VDDA = 1.7(1) to 2.4 V

fn calcPrescaler(apb2_clock: u32) u2 {
    if (apb2_clock == 0) {
        return 0b11;
    }
    if (apb2_clock / 2 <= max_adc_clock) {
        return 0b00;
    }
    if (apb2_clock / 4 <= max_adc_clock) {
        return 0b01;
    }
    if (apb2_clock / 6 <= max_adc_clock) {
        return 0b10;
    }
    return 0b11;
}

fn initInputs(inputs: []const Input, sample_time: u3) void {
    for (inputs) |input, idx| {
        input.enable();
        input.setSequence(idx);
        input.setSampleTime(sample_time);
    }
}

// transfer adc values from data register regs.ADC1.DR to the destintaion array of values
// array must have enough space for all input values (max 16)
fn dma_init(data_items: u16, destination: usize) void {
    regs.RCC.AHB1ENR.modify(.{ .DMA2EN = 1 }); // enable clock for dma2

    regs.DMA2.S0CR.modify(.{ .EN = 0 }); // disable DMA
    regs.DMA2.S0CR.modify(.{
        .DIR = 0b00, // direction peripheral to memoy
        .CIRC = 1, // circular mode
        .MINC = 1, // memory increment mode
        .PINC = 0, // periperal no incerment
        .MSIZE = 0b01, // memory data size 16 bits
        .PSIZE = 0b01, // peripheral data size 16 bits
        .CHSEL = 0b000, // channel 0 sleected
    });
    regs.DMA2.S0NDTR.modify(.{ .NDT = data_items }); // number of data items, that we want transfer using the DMA
    regs.DMA2.S0PAR.modify(.{ .PA = @ptrToInt(regs.ADC1.DR) }); // address of the Peripheral Register, ADC1 DR
    regs.DMA2.S0M0AR.modify(.{ .M0A = destination }); // memory destination address
    regs.DMA2.S0CR.modify(.{ .EN = 1 }); // enable DMA
}

pub const Input = enum(u5) {
    pa0 = 0, // channel 0
    pa1 = 1, // channel 1
    pa2 = 2, // channel 2
    pa3 = 3, // channel 3
    pa4 = 4, // channel 4
    pa5 = 5, // channel 5
    pa6 = 6, // channel 6
    pa7 = 7, // channel 7
    pb0 = 8, // channel 8
    pb1 = 9, // channel 9
    pc0 = 10, // channel 10
    pc1 = 11, // channel 11
    pc2 = 12, // channel 12
    pc3 = 13, // channel 13
    pc4 = 14, // channel 14
    pc5 = 15, // channel 15
    // 16
    vref = 17, // channel 17 internal reference voltage VREFINT
    temp = 18, // channel 18 internal temperature sensor
    vbat = 0b11111, // channel 18 battery voltage
    //
    // The VBAT and temperature sensor are connected to the same ADC internal
    // channel (ADC1_IN18). Only one conversion, either temperature sensor or VBAT,
    // must be selected at a time. When both conversion are enabled simultaneously,
    // only the VBAT conversion is performed.

    fn channel(self: Input) u5 {
        if (self == Input.vbat) {
            return 18;
        }
        return @enumToInt(self);
    }

    fn enable(self: Input) void {
        switch (self) {
            .pa0 => gpio.pa0.analog(),
            .pa1 => gpio.pa1.analog(),
            .pa2 => gpio.pa2.analog(),
            .pa3 => gpio.pa3.analog(),
            .pa4 => gpio.pa4.analog(),
            .pa5 => gpio.pa5.analog(),
            .pa6 => gpio.pa6.analog(),
            .pa7 => gpio.pa7.analog(),
            .pb0 => gpio.pb0.analog(),
            .pb1 => gpio.pb1.analog(),
            .pc0 => gpio.pc0.analog(),
            .pc1 => gpio.pc1.analog(),
            .pc2 => gpio.pc2.analog(),
            .pc3 => gpio.pc3.analog(),
            .pc4 => gpio.pc4.analog(),
            .pc5 => gpio.pc5.analog(),
            .vref => {},
            .temp => {
                regs.ADC_Common.CCR.modify(.{ .TSVREFE = 1 }); // wake up temperature sensor from power down
                ts.init(); // read calibration values used in calculation
            },
            .vbat => {},
        }
    }

    fn setSampleTime(self: Input, sample_time: u3) void {
        switch (self.channel()) {
            0 => regs.ADC1.SMPR2.modify(.{ .SMP0 = sample_time }),
            1 => regs.ADC1.SMPR2.modify(.{ .SMP1 = sample_time }),
            2 => regs.ADC1.SMPR2.modify(.{ .SMP2 = sample_time }),
            3 => regs.ADC1.SMPR2.modify(.{ .SMP3 = sample_time }),
            4 => regs.ADC1.SMPR2.modify(.{ .SMP4 = sample_time }),
            5 => regs.ADC1.SMPR2.modify(.{ .SMP5 = sample_time }),
            6 => regs.ADC1.SMPR2.modify(.{ .SMP6 = sample_time }),
            7 => regs.ADC1.SMPR2.modify(.{ .SMP7 = sample_time }),
            8 => regs.ADC1.SMPR2.modify(.{ .SMP8 = sample_time }),
            9 => regs.ADC1.SMPR2.modify(.{ .SMP9 = sample_time }),

            10 => regs.ADC1.SMPR1.modify(.{ .SMP10 = sample_time }),
            11 => regs.ADC1.SMPR1.modify(.{ .SMP11 = sample_time }),
            12 => regs.ADC1.SMPR1.modify(.{ .SMP12 = sample_time }),
            13 => regs.ADC1.SMPR1.modify(.{ .SMP13 = sample_time }),
            14 => regs.ADC1.SMPR1.modify(.{ .SMP14 = sample_time }),
            15 => regs.ADC1.SMPR1.modify(.{ .SMP15 = sample_time }),
            16 => regs.ADC1.SMPR1.modify(.{ .SMP16 = sample_time }),
            17 => regs.ADC1.SMPR1.modify(.{ .SMP17 = sample_time }),
            18 => regs.ADC1.SMPR1.modify(.{ .SMP18 = sample_time }),
            else => return,
        }
    }

    fn setSequence(self: Input, idx: usize) void {
        const ch: u5 = self.channel();
        switch (idx) {
            0 => regs.ADC1.SQR3.modify(.{ .SQ1 = ch }),
            1 => regs.ADC1.SQR3.modify(.{ .SQ2 = ch }),
            2 => regs.ADC1.SQR3.modify(.{ .SQ3 = ch }),
            3 => regs.ADC1.SQR3.modify(.{ .SQ4 = ch }),
            4 => regs.ADC1.SQR3.modify(.{ .SQ5 = ch }),
            5 => regs.ADC1.SQR3.modify(.{ .SQ6 = ch }),

            6 => regs.ADC1.SQR2.modify(.{ .SQ7 = ch }),
            7 => regs.ADC1.SQR2.modify(.{ .SQ8 = ch }),
            8 => regs.ADC1.SQR2.modify(.{ .SQ9 = ch }),
            9 => regs.ADC1.SQR2.modify(.{ .SQ10 = ch }),
            10 => regs.ADC1.SQR2.modify(.{ .SQ11 = ch }),
            11 => regs.ADC1.SQR2.modify(.{ .SQ12 = ch }),

            12 => regs.ADC1.SQR1.modify(.{ .SQ13 = ch }),
            13 => regs.ADC1.SQR1.modify(.{ .SQ14 = ch }),
            14 => regs.ADC1.SQR1.modify(.{ .SQ15 = ch }),
            15 => regs.ADC1.SQR1.modify(.{ .SQ16 = ch }),
            else => return,
        }
    }
};

// use temperature sensor calibration values
// to convert temprature value to celsius
pub fn tempValueToC(x: u16) f32 {
    if (ts.slope == 0) {
        ts.init();
    }
    return ts.slope * @intToFloat(f32, x) + ts.intercept;
}

// use temperatur sensor characteristics
fn f2(x: u16) f32 {
    const v_sense = @intToFloat(f32, x) / 0xfff * 3300; // in mV
    return (v_sense - ts_char.v25) / ts_char.avg_slope + 25;
}

const ts_char = struct {
    const avg_slope: f32 = 2.500; // mV/°C
    const v25: f32 = 760; // mV voltage at 25°C
};

// temperature sensor calibration values
const ts = struct {
    var slope: f32 = 0;
    var intercept: f32 = 0;

    const self = @This();

    fn init() void {
        self.slope = @intToFloat(f32, 110 - 30) / @intToFloat(f32, self.cal2() - self.cal1());
        self.intercept = 110 - self.slope * @intToFloat(f32, self.cal2());
    }

    fn cal1() u16 {
        const ptr = @intToPtr(*u16, 0x1FFF7A2C); //TS ADC raw data acquired at temperature of 30 °C, VDDA= 3.3
        return ptr.*;
    }

    fn cal2() u16 {
        const ptr = @intToPtr(*u16, 0x1FFF7A2E); //TS ADC raw data acquired at temperature of 110 °C, VDDA= 3.3 V
        return ptr.*;
    }
};

test "pero" {
    var data: [16]u16 = .{0xaaaa} ** 16;

    initTest(.{
        .irq_enable = true,
        .data = &data,
        .inputs = &.{ .temp, .vref, .pa0, .pa1, .pc4 },
    });
}

fn initTest(cfg: Config) void {
    testInputs(cfg.inputs, cfg.sample_time);
}

fn testInputs(inputs: []const Input, smp: u3) void {
    for (inputs) |input, idx| {
        const channel: u5 = @enumToInt(input);
        std.debug.print("{} {d} {d} 0b{b}\n", .{ input, idx, channel, smp });
    }
}
