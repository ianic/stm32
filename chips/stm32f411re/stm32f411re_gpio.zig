const hal = @import("gpio.zig");

pub const gpio = struct {
    pub const pa0 = struct {
        const pin = hal.Pin("PA0");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in0 = pin.analog;
        };
        pub const tim2 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
            pub fn etr(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim5 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart2 = struct {
            pub fn cts(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pa1 = struct {
        const pin = hal.Pin("PA1");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in1 = pin.analog;
        };
        pub const spi4 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim2 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim5 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart2 = struct {
            pub fn rts(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pa2 = struct {
        const pin = hal.Pin("PA2");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in2 = pin.analog;
        };
        pub const tim2 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim5 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const tim9 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(3).init(c);
            }
        };
        pub const usart2 = struct {
            pub fn tx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pa3 = struct {
        const pin = hal.Pin("PA3");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in3 = pin.analog;
        };
        pub const tim2 = struct {
            pub fn ch4(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim5 = struct {
            pub fn ch4(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const tim9 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(3).init(c);
            }
        };
        pub const usart2 = struct {
            pub fn rx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pa4 = struct {
        const pin = hal.Pin("PA4");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in4 = pin.analog;
        };
        pub const spi1 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const usart2 = struct {
            pub fn ck(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pa5 = struct {
        const pin = hal.Pin("PA5");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in5 = pin.analog;
        };
        pub const spi1 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim2 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
            pub fn etr(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
    };
    pub const pa6 = struct {
        const pin = hal.Pin("PA6");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in6 = pin.analog;
        };
        pub const sdio = struct {
            pub fn cmd(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi1 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn bkin(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pa7 = struct {
        const pin = hal.Pin("PA7");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in7 = pin.analog;
        };
        pub const spi1 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch1n(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pa8 = struct {
        const pin = hal.Pin("PA8");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c3 = struct {
            pub fn scl(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const rcc = struct {
            pub fn mco_1(c: hal.FunctionConfig) void {
                pin.Function(0).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d1(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn ck(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
        pub const usb_otg_fs = struct {
            pub fn sof(c: hal.FunctionConfig) void {
                pin.Function(10).init(c);
            }
        };
    };
    pub const pa9 = struct {
        const pin = hal.Pin("PA9");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c3 = struct {
            pub fn smba(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d2(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn tx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
        pub const usb_otg_fs = struct {
            pub fn vbus(c: hal.FunctionConfig) void {
                pin.Function(10).init(c);
            }
        };
    };
    pub const pa10 = struct {
        const pin = hal.Pin("PA10");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const spi5 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn rx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
        pub const usb_otg_fs = struct {
            pub fn id(c: hal.FunctionConfig) void {
                pin.Function(10).init(c);
            }
        };
    };
    pub const pa11 = struct {
        const pin = hal.Pin("PA11");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const spi4 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch4(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn cts(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
        pub const usart6 = struct {
            pub fn tx(c: hal.FunctionConfig) void {
                pin.Function(8).init(c);
            }
        };
        pub const usb_otg_fs = struct {
            pub fn dm(c: hal.FunctionConfig) void {
                pin.Function(10).init(c);
            }
        };
    };
    pub const pa12 = struct {
        const pin = hal.Pin("PA12");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const spi5 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn etr(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn rts(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
        pub const usart6 = struct {
            pub fn rx(c: hal.FunctionConfig) void {
                pin.Function(8).init(c);
            }
        };
        pub const usb_otg_fs = struct {
            pub fn dp(c: hal.FunctionConfig) void {
                pin.Function(10).init(c);
            }
        };
    };
    pub const pa13 = struct {
        const pin = hal.Pin("PA13");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
    };
    pub const pa14 = struct {
        const pin = hal.Pin("PA14");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
    };
    pub const pa15 = struct {
        const pin = hal.Pin("PA15");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const spi1 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim2 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
            pub fn etr(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn tx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pb0 = struct {
        const pin = hal.Pin("PB0");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in8 = pin.analog;
        };
        pub const spi5 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch2n(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pb1 = struct {
        const pin = hal.Pin("PB1");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in9 = pin.analog;
        };
        pub const spi5 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch3n(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch4(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pb2 = struct {
        const pin = hal.Pin("PB2");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
    };
    pub const pb3 = struct {
        const pin = hal.Pin("PB3");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c2 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(9).init(c);
            }
        };
        pub const spi1 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim2 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn rx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pb4 = struct {
        const pin = hal.Pin("PB4");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c3 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(9).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d0(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi1 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pb5 = struct {
        const pin = hal.Pin("PB5");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c1 = struct {
            pub fn smba(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d3(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi1 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pb6 = struct {
        const pin = hal.Pin("PB6");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c1 = struct {
            pub fn scl(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const tim4 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn tx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pb7 = struct {
        const pin = hal.Pin("PB7");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c1 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d0(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim4 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart1 = struct {
            pub fn rx(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
    };
    pub const pb8 = struct {
        const pin = hal.Pin("PB8");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c1 = struct {
            pub fn scl(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const i2c3 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(9).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d4(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi5 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim10 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(3).init(c);
            }
        };
        pub const tim4 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pb9 = struct {
        const pin = hal.Pin("PB9");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c1 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const i2c2 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(9).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d5(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi2 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim11 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(3).init(c);
            }
        };
        pub const tim4 = struct {
            pub fn ch4(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pb10 = struct {
        const pin = hal.Pin("PB10");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c2 = struct {
            pub fn scl(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d7(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi2 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim2 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
    };
    pub const pb12 = struct {
        const pin = hal.Pin("PB12");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c2 = struct {
            pub fn smba(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const spi2 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(7).init(c);
            }
        };
        pub const spi4 = struct {
            pub fn nss(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn bkin(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
    };
    pub const pb13 = struct {
        const pin = hal.Pin("PB13");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const spi2 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const spi4 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch1n(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
    };
    pub const pb14 = struct {
        const pin = hal.Pin("PB14");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn d6(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi2 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch2n(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
    };
    pub const pb15 = struct {
        const pin = hal.Pin("PB15");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const rtc = struct {
            pub fn refin(c: hal.FunctionConfig) void {
                pin.Function(0).init(c);
            }
        };
        pub const sdio = struct {
            pub fn ck(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi2 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim1 = struct {
            pub fn ch3n(c: hal.FunctionConfig) void {
                pin.Function(1).init(c);
            }
        };
    };
    pub const pc0 = struct {
        const pin = hal.Pin("PC0");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in10 = pin.analog;
        };
    };
    pub const pc1 = struct {
        const pin = hal.Pin("PC1");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in11 = pin.analog;
        };
    };
    pub const pc2 = struct {
        const pin = hal.Pin("PC2");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in12 = pin.analog;
        };
        pub const spi2 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
    };
    pub const pc3 = struct {
        const pin = hal.Pin("PC3");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in13 = pin.analog;
        };
        pub const spi2 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
    };
    pub const pc4 = struct {
        const pin = hal.Pin("PC4");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in14 = pin.analog;
        };
    };
    pub const pc5 = struct {
        const pin = hal.Pin("PC5");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const adc1 = struct {
            pub const in15 = pin.analog;
        };
    };
    pub const pc6 = struct {
        const pin = hal.Pin("PC6");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn d6(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch1(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart6 = struct {
            pub fn tx(c: hal.FunctionConfig) void {
                pin.Function(8).init(c);
            }
        };
    };
    pub const pc7 = struct {
        const pin = hal.Pin("PC7");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn d7(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi2 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(5).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch2(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart6 = struct {
            pub fn rx(c: hal.FunctionConfig) void {
                pin.Function(8).init(c);
            }
        };
    };
    pub const pc8 = struct {
        const pin = hal.Pin("PC8");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn d0(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch3(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
        pub const usart6 = struct {
            pub fn ck(c: hal.FunctionConfig) void {
                pin.Function(8).init(c);
            }
        };
    };
    pub const pc9 = struct {
        const pin = hal.Pin("PC9");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const i2c3 = struct {
            pub fn sda(c: hal.FunctionConfig) void {
                pin.Function(4).init(c);
            }
        };
        pub const rcc = struct {
            pub fn mco_2(c: hal.FunctionConfig) void {
                pin.Function(0).init(c);
            }
        };
        pub const sdio = struct {
            pub fn d1(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn ch4(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const pc10 = struct {
        const pin = hal.Pin("PC10");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn d2(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn sck(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
    };
    pub const pc11 = struct {
        const pin = hal.Pin("PC11");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn d3(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn miso(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
    };
    pub const pc12 = struct {
        const pin = hal.Pin("PC12");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn ck(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const spi3 = struct {
            pub fn mosi(c: hal.FunctionConfig) void {
                pin.Function(6).init(c);
            }
        };
    };
    pub const pc13 = struct {
        const pin = hal.Pin("PC13");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const rtc = struct {
            pub const af1 = pin.analog;
        };
    };
    pub const pc14 = struct {
        const pin = hal.Pin("PC14");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const rcc = struct {
            pub const osc32_in = pin.analog;
        };
    };
    pub const pc15 = struct {
        const pin = hal.Pin("PC15");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const rcc = struct {
            pub const osc32_out = pin.analog;
        };
    };
    pub const pd2 = struct {
        const pin = hal.Pin("PD2");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const sdio = struct {
            pub fn cmd(c: hal.FunctionConfig) void {
                pin.Function(12).init(c);
            }
        };
        pub const tim3 = struct {
            pub fn etr(c: hal.FunctionConfig) void {
                pin.Function(2).init(c);
            }
        };
    };
    pub const ph0 = struct {
        const pin = hal.Pin("PH0");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const rcc = struct {
            pub const osc_in = pin.analog;
        };
    };
    pub const ph1 = struct {
        const pin = hal.Pin("PH1");
        pub const Output = pin.Output;
        pub const Input = pin.Input;
        pub const analog = pin.analog;
        pub const rcc = struct {
            pub const osc_out = pin.analog;
        };
    };

    pub const adc1 = struct {
        pub const in0 = struct {
            pub const pa0 = gpio.pa0.adc1.in0;
        };
        pub const in1 = struct {
            pub const pa1 = gpio.pa1.adc1.in1;
        };
        pub const in2 = struct {
            pub const pa2 = gpio.pa2.adc1.in2;
        };
        pub const in3 = struct {
            pub const pa3 = gpio.pa3.adc1.in3;
        };
        pub const in4 = struct {
            pub const pa4 = gpio.pa4.adc1.in4;
        };
        pub const in5 = struct {
            pub const pa5 = gpio.pa5.adc1.in5;
        };
        pub const in6 = struct {
            pub const pa6 = gpio.pa6.adc1.in6;
        };
        pub const in7 = struct {
            pub const pa7 = gpio.pa7.adc1.in7;
        };
        pub const in8 = struct {
            pub const pb0 = gpio.pb0.adc1.in8;
        };
        pub const in9 = struct {
            pub const pb1 = gpio.pb1.adc1.in9;
        };
        pub const in10 = struct {
            pub const pc0 = gpio.pc0.adc1.in10;
        };
        pub const in11 = struct {
            pub const pc1 = gpio.pc1.adc1.in11;
        };
        pub const in12 = struct {
            pub const pc2 = gpio.pc2.adc1.in12;
        };
        pub const in13 = struct {
            pub const pc3 = gpio.pc3.adc1.in13;
        };
        pub const in14 = struct {
            pub const pc4 = gpio.pc4.adc1.in14;
        };
        pub const in15 = struct {
            pub const pc5 = gpio.pc5.adc1.in15;
        };
    };
    pub const i2c1 = struct {
        pub const smba = struct {
            pub const pb5 = gpio.pb5.i2c1.smba;
        };
        pub const scl = struct {
            pub const pb6 = gpio.pb6.i2c1.scl;
            pub const pb8 = gpio.pb8.i2c1.scl;
        };
        pub const sda = struct {
            pub const pb7 = gpio.pb7.i2c1.sda;
            pub const pb9 = gpio.pb9.i2c1.sda;
        };
    };
    pub const i2c2 = struct {
        pub const sda = struct {
            pub const pb3 = gpio.pb3.i2c2.sda;
            pub const pb9 = gpio.pb9.i2c2.sda;
        };
        pub const scl = struct {
            pub const pb10 = gpio.pb10.i2c2.scl;
        };
        pub const smba = struct {
            pub const pb12 = gpio.pb12.i2c2.smba;
        };
    };
    pub const i2c3 = struct {
        pub const scl = struct {
            pub const pa8 = gpio.pa8.i2c3.scl;
        };
        pub const smba = struct {
            pub const pa9 = gpio.pa9.i2c3.smba;
        };
        pub const sda = struct {
            pub const pb4 = gpio.pb4.i2c3.sda;
            pub const pb8 = gpio.pb8.i2c3.sda;
            pub const pc9 = gpio.pc9.i2c3.sda;
        };
    };
    pub const rcc = struct {
        pub const mco_1 = struct {
            pub const pa8 = gpio.pa8.rcc.mco_1;
        };
        pub const mco_2 = struct {
            pub const pc9 = gpio.pc9.rcc.mco_2;
        };
        pub const osc32_in = struct {
            pub const pc14 = gpio.pc14.rcc.osc32_in;
        };
        pub const osc32_out = struct {
            pub const pc15 = gpio.pc15.rcc.osc32_out;
        };
        pub const osc_in = struct {
            pub const ph0 = gpio.ph0.rcc.osc_in;
        };
        pub const osc_out = struct {
            pub const ph1 = gpio.ph1.rcc.osc_out;
        };
    };
    pub const rtc = struct {
        pub const refin = struct {
            pub const pb15 = gpio.pb15.rtc.refin;
        };
        pub const af1 = struct {
            pub const pc13 = gpio.pc13.rtc.af1;
        };
    };
    pub const sdio = struct {
        pub const cmd = struct {
            pub const pa6 = gpio.pa6.sdio.cmd;
            pub const pd2 = gpio.pd2.sdio.cmd;
        };
        pub const d1 = struct {
            pub const pa8 = gpio.pa8.sdio.d1;
            pub const pc9 = gpio.pc9.sdio.d1;
        };
        pub const d2 = struct {
            pub const pa9 = gpio.pa9.sdio.d2;
            pub const pc10 = gpio.pc10.sdio.d2;
        };
        pub const d0 = struct {
            pub const pb4 = gpio.pb4.sdio.d0;
            pub const pb7 = gpio.pb7.sdio.d0;
            pub const pc8 = gpio.pc8.sdio.d0;
        };
        pub const d3 = struct {
            pub const pb5 = gpio.pb5.sdio.d3;
            pub const pc11 = gpio.pc11.sdio.d3;
        };
        pub const d4 = struct {
            pub const pb8 = gpio.pb8.sdio.d4;
        };
        pub const d5 = struct {
            pub const pb9 = gpio.pb9.sdio.d5;
        };
        pub const d7 = struct {
            pub const pb10 = gpio.pb10.sdio.d7;
            pub const pc7 = gpio.pc7.sdio.d7;
        };
        pub const d6 = struct {
            pub const pb14 = gpio.pb14.sdio.d6;
            pub const pc6 = gpio.pc6.sdio.d6;
        };
        pub const ck = struct {
            pub const pb15 = gpio.pb15.sdio.ck;
            pub const pc12 = gpio.pc12.sdio.ck;
        };
    };
    pub const spi1 = struct {
        pub const nss = struct {
            pub const pa4 = gpio.pa4.spi1.nss;
            pub const pa15 = gpio.pa15.spi1.nss;
        };
        pub const sck = struct {
            pub const pa5 = gpio.pa5.spi1.sck;
            pub const pb3 = gpio.pb3.spi1.sck;
        };
        pub const miso = struct {
            pub const pa6 = gpio.pa6.spi1.miso;
            pub const pb4 = gpio.pb4.spi1.miso;
        };
        pub const mosi = struct {
            pub const pa7 = gpio.pa7.spi1.mosi;
            pub const pb5 = gpio.pb5.spi1.mosi;
        };
    };
    pub const spi2 = struct {
        pub const nss = struct {
            pub const pb9 = gpio.pb9.spi2.nss;
            pub const pb12 = gpio.pb12.spi2.nss;
        };
        pub const sck = struct {
            pub const pb10 = gpio.pb10.spi2.sck;
            pub const pb13 = gpio.pb13.spi2.sck;
            pub const pc7 = gpio.pc7.spi2.sck;
        };
        pub const miso = struct {
            pub const pb14 = gpio.pb14.spi2.miso;
            pub const pc2 = gpio.pc2.spi2.miso;
        };
        pub const mosi = struct {
            pub const pb15 = gpio.pb15.spi2.mosi;
            pub const pc3 = gpio.pc3.spi2.mosi;
        };
    };
    pub const spi3 = struct {
        pub const nss = struct {
            pub const pa4 = gpio.pa4.spi3.nss;
            pub const pa15 = gpio.pa15.spi3.nss;
        };
        pub const sck = struct {
            pub const pb3 = gpio.pb3.spi3.sck;
            pub const pb12 = gpio.pb12.spi3.sck;
            pub const pc10 = gpio.pc10.spi3.sck;
        };
        pub const miso = struct {
            pub const pb4 = gpio.pb4.spi3.miso;
            pub const pc11 = gpio.pc11.spi3.miso;
        };
        pub const mosi = struct {
            pub const pb5 = gpio.pb5.spi3.mosi;
            pub const pc12 = gpio.pc12.spi3.mosi;
        };
    };
    pub const spi4 = struct {
        pub const mosi = struct {
            pub const pa1 = gpio.pa1.spi4.mosi;
        };
        pub const miso = struct {
            pub const pa11 = gpio.pa11.spi4.miso;
        };
        pub const nss = struct {
            pub const pb12 = gpio.pb12.spi4.nss;
        };
        pub const sck = struct {
            pub const pb13 = gpio.pb13.spi4.sck;
        };
    };
    pub const spi5 = struct {
        pub const mosi = struct {
            pub const pa10 = gpio.pa10.spi5.mosi;
            pub const pb8 = gpio.pb8.spi5.mosi;
        };
        pub const miso = struct {
            pub const pa12 = gpio.pa12.spi5.miso;
        };
        pub const sck = struct {
            pub const pb0 = gpio.pb0.spi5.sck;
        };
        pub const nss = struct {
            pub const pb1 = gpio.pb1.spi5.nss;
        };
    };
    pub const tim1 = struct {
        pub const bkin = struct {
            pub const pa6 = gpio.pa6.tim1.bkin;
            pub const pb12 = gpio.pb12.tim1.bkin;
        };
        pub const ch1n = struct {
            pub const pa7 = gpio.pa7.tim1.ch1n;
            pub const pb13 = gpio.pb13.tim1.ch1n;
        };
        pub const ch1 = struct {
            pub const pa8 = gpio.pa8.tim1.ch1;
        };
        pub const ch2 = struct {
            pub const pa9 = gpio.pa9.tim1.ch2;
        };
        pub const ch3 = struct {
            pub const pa10 = gpio.pa10.tim1.ch3;
        };
        pub const ch4 = struct {
            pub const pa11 = gpio.pa11.tim1.ch4;
        };
        pub const etr = struct {
            pub const pa12 = gpio.pa12.tim1.etr;
        };
        pub const ch2n = struct {
            pub const pb0 = gpio.pb0.tim1.ch2n;
            pub const pb14 = gpio.pb14.tim1.ch2n;
        };
        pub const ch3n = struct {
            pub const pb1 = gpio.pb1.tim1.ch3n;
            pub const pb15 = gpio.pb15.tim1.ch3n;
        };
    };
    pub const tim10 = struct {
        pub const ch1 = struct {
            pub const pb8 = gpio.pb8.tim10.ch1;
        };
    };
    pub const tim11 = struct {
        pub const ch1 = struct {
            pub const pb9 = gpio.pb9.tim11.ch1;
        };
    };
    pub const tim2 = struct {
        pub const ch1 = struct {
            pub const pa0 = gpio.pa0.tim2.ch1;
            pub const pa5 = gpio.pa5.tim2.ch1;
            pub const pa15 = gpio.pa15.tim2.ch1;
        };
        pub const etr = struct {
            pub const pa0 = gpio.pa0.tim2.etr;
            pub const pa5 = gpio.pa5.tim2.etr;
            pub const pa15 = gpio.pa15.tim2.etr;
        };
        pub const ch2 = struct {
            pub const pa1 = gpio.pa1.tim2.ch2;
            pub const pb3 = gpio.pb3.tim2.ch2;
        };
        pub const ch3 = struct {
            pub const pa2 = gpio.pa2.tim2.ch3;
            pub const pb10 = gpio.pb10.tim2.ch3;
        };
        pub const ch4 = struct {
            pub const pa3 = gpio.pa3.tim2.ch4;
        };
    };
    pub const tim3 = struct {
        pub const ch1 = struct {
            pub const pa6 = gpio.pa6.tim3.ch1;
            pub const pb4 = gpio.pb4.tim3.ch1;
            pub const pc6 = gpio.pc6.tim3.ch1;
        };
        pub const ch2 = struct {
            pub const pa7 = gpio.pa7.tim3.ch2;
            pub const pb5 = gpio.pb5.tim3.ch2;
            pub const pc7 = gpio.pc7.tim3.ch2;
        };
        pub const ch3 = struct {
            pub const pb0 = gpio.pb0.tim3.ch3;
            pub const pc8 = gpio.pc8.tim3.ch3;
        };
        pub const ch4 = struct {
            pub const pb1 = gpio.pb1.tim3.ch4;
            pub const pc9 = gpio.pc9.tim3.ch4;
        };
        pub const etr = struct {
            pub const pd2 = gpio.pd2.tim3.etr;
        };
    };
    pub const tim4 = struct {
        pub const ch1 = struct {
            pub const pb6 = gpio.pb6.tim4.ch1;
        };
        pub const ch2 = struct {
            pub const pb7 = gpio.pb7.tim4.ch2;
        };
        pub const ch3 = struct {
            pub const pb8 = gpio.pb8.tim4.ch3;
        };
        pub const ch4 = struct {
            pub const pb9 = gpio.pb9.tim4.ch4;
        };
    };
    pub const tim5 = struct {
        pub const ch1 = struct {
            pub const pa0 = gpio.pa0.tim5.ch1;
        };
        pub const ch2 = struct {
            pub const pa1 = gpio.pa1.tim5.ch2;
        };
        pub const ch3 = struct {
            pub const pa2 = gpio.pa2.tim5.ch3;
        };
        pub const ch4 = struct {
            pub const pa3 = gpio.pa3.tim5.ch4;
        };
    };
    pub const tim9 = struct {
        pub const ch1 = struct {
            pub const pa2 = gpio.pa2.tim9.ch1;
        };
        pub const ch2 = struct {
            pub const pa3 = gpio.pa3.tim9.ch2;
        };
    };
    pub const usart1 = struct {
        pub const ck = struct {
            pub const pa8 = gpio.pa8.usart1.ck;
        };
        pub const tx = struct {
            pub const pa9 = gpio.pa9.usart1.tx;
            pub const pa15 = gpio.pa15.usart1.tx;
            pub const pb6 = gpio.pb6.usart1.tx;
        };
        pub const rx = struct {
            pub const pa10 = gpio.pa10.usart1.rx;
            pub const pb3 = gpio.pb3.usart1.rx;
            pub const pb7 = gpio.pb7.usart1.rx;
        };
        pub const cts = struct {
            pub const pa11 = gpio.pa11.usart1.cts;
        };
        pub const rts = struct {
            pub const pa12 = gpio.pa12.usart1.rts;
        };
    };
    pub const usart2 = struct {
        pub const cts = struct {
            pub const pa0 = gpio.pa0.usart2.cts;
        };
        pub const rts = struct {
            pub const pa1 = gpio.pa1.usart2.rts;
        };
        pub const tx = struct {
            pub const pa2 = gpio.pa2.usart2.tx;
        };
        pub const rx = struct {
            pub const pa3 = gpio.pa3.usart2.rx;
        };
        pub const ck = struct {
            pub const pa4 = gpio.pa4.usart2.ck;
        };
    };
    pub const usart6 = struct {
        pub const tx = struct {
            pub const pa11 = gpio.pa11.usart6.tx;
            pub const pc6 = gpio.pc6.usart6.tx;
        };
        pub const rx = struct {
            pub const pa12 = gpio.pa12.usart6.rx;
            pub const pc7 = gpio.pc7.usart6.rx;
        };
        pub const ck = struct {
            pub const pc8 = gpio.pc8.usart6.ck;
        };
    };
    pub const usb_otg_fs = struct {
        pub const sof = struct {
            pub const pa8 = gpio.pa8.usb_otg_fs.sof;
        };
        pub const vbus = struct {
            pub const pa9 = gpio.pa9.usb_otg_fs.vbus;
        };
        pub const id = struct {
            pub const pa10 = gpio.pa10.usb_otg_fs.id;
        };
        pub const dm = struct {
            pub const pa11 = gpio.pa11.usb_otg_fs.dm;
        };
        pub const dp = struct {
            pub const pa12 = gpio.pa12.usb_otg_fs.dp;
        };
    };
};
