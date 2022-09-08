const micro = @import("microzig");
const hal = micro.hal;
const chip = micro.chip;

pub fn Uart1(comptime config: hal.uart.Config) type {
    return hal.uart.UartX(.{
        .name = "USART1",
        .rcc = "APB2",
        .irq = chip.Irq.usart1,
        .dma = .{
            .controller = "DMA2",
            .rx = .{
                .stream = 5,
                .channel = 4,
                .irq = chip.Irq.dma2_stream5,
            },
            .tx = .{
                .stream = 7,
                .channel = 4,
                .irq = chip.Irq.dma2_stream7,
            },
        },
    }, config);
}

pub fn Uart2(comptime config: hal.uart.Config) type {
    return hal.uart.UartX(.{
        .name = "USART2",
        .rcc = "APB1",
        .irq = chip.Irq.usart2,
        .dma = .{
            .controller = "DMA1",
            .rx = .{
                .stream = 5,
                .channel = 4,
                .irq = chip.Irq.dma1_stream5,
            },
            .tx = .{
                .stream = 6,
                .channel = 4,
                .irq = chip.Irq.dma1_stream6,
            },
        },
    }, config);
}

pub fn Uart6(comptime config: hal.uart.Config) type {
    return hal.uart.UartX(.{
        .name = "USART6",
        .rcc = "APB2",
        .irq = chip.Irq.usart6,
        .dma = .{
            .controller = "DMA2",
            .rx = .{
                .stream = 1,
                .channel = 5,
                .irq = chip.Irq.dma2_stream1,
            },
            .tx = .{
                .stream = 2,
                .channel = 5,
                .irq = chip.Irq.dma2_stream1,
            },
        },
    }, config);
}
