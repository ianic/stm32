// this file was generated by cgen/vector_table.rb
pub const VectorTable = extern struct {
    // zig fmt: off
    initial_stack_pointer: u32,
    // Cortex-M4 Processor Exceptions
    Reset               : InterruptVector = unhandled,
    NMI                 : InterruptVector = unhandled, // -14 Non Maskable Interrupt
    HardFault           : InterruptVector = unhandled, // -13 All class of fault
    MemManage           : InterruptVector = unhandled, // -12 Memory Management Interrupt
    BusFault            : InterruptVector = unhandled, // -11 Bus Fault Interrupt
    UsageFault          : InterruptVector = unhandled, // -10 Usage Fault Interrupt
    reserved0           : [4]u32 = undefined,
    SVCall              : InterruptVector = unhandled, // -5  SV Call Interrupt
    DebugMonitor        : InterruptVector = unhandled, // -4  Pend SV Interrupt
    reserved1           : [1]u32 = undefined,
    PendSV              : InterruptVector = unhandled, // -2  Pend SV Interrupt
    SysTick             : InterruptVector = unhandled, // -1  System Tick Interrupt
    // STM32 specific Interrupts
    WWDG                : InterruptVector = unhandled, // 0   Window WatchDog Interrupt
    PVD                 : InterruptVector = unhandled, // 1   PVD through EXTI Line detection Interrupt
    TAMP_STAMP          : InterruptVector = unhandled, // 2   Tamper and TimeStamp interrupts through the EXTI line
    RTC_WKUP            : InterruptVector = unhandled, // 3   RTC Wakeup interrupt through the EXTI line
    FLASH               : InterruptVector = unhandled, // 4   FLASH global Interrupt
    RCC                 : InterruptVector = unhandled, // 5   RCC global Interrupt
    EXTI0               : InterruptVector = unhandled, // 6   EXTI Line0 Interrupt
    EXTI1               : InterruptVector = unhandled, // 7   EXTI Line1 Interrupt
    EXTI2               : InterruptVector = unhandled, // 8   EXTI Line2 Interrupt
    EXTI3               : InterruptVector = unhandled, // 9   EXTI Line3 Interrupt
    EXTI4               : InterruptVector = unhandled, // 10  EXTI Line4 Interrupt
    DMA1_Stream0        : InterruptVector = unhandled, // 11  DMA1 Stream 0 global Interrupt
    DMA1_Stream1        : InterruptVector = unhandled, // 12  DMA1 Stream 1 global Interrupt
    DMA1_Stream2        : InterruptVector = unhandled, // 13  DMA1 Stream 2 global Interrupt
    DMA1_Stream3        : InterruptVector = unhandled, // 14  DMA1 Stream 3 global Interrupt
    DMA1_Stream4        : InterruptVector = unhandled, // 15  DMA1 Stream 4 global Interrupt
    DMA1_Stream5        : InterruptVector = unhandled, // 16  DMA1 Stream 5 global Interrupt
    DMA1_Stream6        : InterruptVector = unhandled, // 17  DMA1 Stream 6 global Interrupt
    ADC                 : InterruptVector = unhandled, // 18  ADC1 ADC2 and ADC3 global Interrupts
    reserved_19_22      : [4]u32 = undefined,
    EXTI9_5             : InterruptVector = unhandled, // 23  External Line[9:5] Interrupts
    TIM1_BRK_TIM9       : InterruptVector = unhandled, // 24  TIM1 Break interrupt and TIM9 global interrupt
    TIM1_UP_TIM10       : InterruptVector = unhandled, // 25  TIM1 Update Interrupt and TIM10 global interrupt
    TIM1_TRG_COM_TIM11  : InterruptVector = unhandled, // 26  TIM1 Trigger and Commutation Interrupt and TIM11 global interrupt
    TIM1_CC             : InterruptVector = unhandled, // 27  TIM1 Capture Compare Interrupt
    TIM2                : InterruptVector = unhandled, // 28  TIM2 global Interrupt
    TIM3                : InterruptVector = unhandled, // 29  TIM3 global Interrupt
    TIM4                : InterruptVector = unhandled, // 30  TIM4 global Interrupt
    I2C1_EV             : InterruptVector = unhandled, // 31  I2C1 Event Interrupt
    I2C1_ER             : InterruptVector = unhandled, // 32  I2C1 Error Interrupt
    I2C2_EV             : InterruptVector = unhandled, // 33  I2C2 Event Interrupt
    I2C2_ER             : InterruptVector = unhandled, // 34  I2C2 Error Interrupt
    SPI1                : InterruptVector = unhandled, // 35  SPI1 global Interrupt
    SPI2                : InterruptVector = unhandled, // 36  SPI2 global Interrupt
    USART1              : InterruptVector = unhandled, // 37  USART1 global Interrupt
    USART2              : InterruptVector = unhandled, // 38  USART2 global Interrupt
    reserved_39_39      : [1]u32 = undefined,
    EXTI15_10           : InterruptVector = unhandled, // 40  External Line[15:10] Interrupts
    RTC_Alarm           : InterruptVector = unhandled, // 41  RTC Alarm (A and B) through EXTI Line Interrupt
    OTG_FS_WKUP         : InterruptVector = unhandled, // 42  USB OTG FS Wakeup through EXTI line interrupt
    reserved_43_46      : [4]u32 = undefined,
    DMA1_Stream7        : InterruptVector = unhandled, // 47  DMA1 Stream7 Interrupt
    reserved_48_48      : [1]u32 = undefined,
    SDIO                : InterruptVector = unhandled, // 49  SDIO global Interrupt
    TIM5                : InterruptVector = unhandled, // 50  TIM5 global Interrupt
    SPI3                : InterruptVector = unhandled, // 51  SPI3 global Interrupt
    reserved_52_55      : [4]u32 = undefined,
    DMA2_Stream0        : InterruptVector = unhandled, // 56  DMA2 Stream 0 global Interrupt
    DMA2_Stream1        : InterruptVector = unhandled, // 57  DMA2 Stream 1 global Interrupt
    DMA2_Stream2        : InterruptVector = unhandled, // 58  DMA2 Stream 2 global Interrupt
    DMA2_Stream3        : InterruptVector = unhandled, // 59  DMA2 Stream 3 global Interrupt
    DMA2_Stream4        : InterruptVector = unhandled, // 60  DMA2 Stream 4 global Interrupt
    reserved_61_66      : [6]u32 = undefined,
    OTG_FS              : InterruptVector = unhandled, // 67  USB OTG FS global Interrupt
    DMA2_Stream5        : InterruptVector = unhandled, // 68  DMA2 Stream 5 global interrupt
    DMA2_Stream6        : InterruptVector = unhandled, // 69  DMA2 Stream 6 global interrupt
    DMA2_Stream7        : InterruptVector = unhandled, // 70  DMA2 Stream 7 global interrupt
    USART6              : InterruptVector = unhandled, // 71  USART6 global interrupt
    I2C3_EV             : InterruptVector = unhandled, // 72  I2C3 event interrupt
    I2C3_ER             : InterruptVector = unhandled, // 73  I2C3 error interrupt
    reserved_74_80      : [7]u32 = undefined,
    FPU                 : InterruptVector = unhandled, // 81  FPU global interrupt
    reserved_82_83      : [2]u32 = undefined,
    SPI4                : InterruptVector = unhandled, // 84  SPI4 global Interrupt
    SPI5                : InterruptVector = unhandled, // 85  SPI5 global Interrupt
    // zig fmt: on
};

pub const InterruptVector = extern union {
    C: fn () callconv(.C) void,
    Naked: fn () callconv(.Naked) void,
    // Interrupt is not supported on arm
};

const unhandled = InterruptVector{
    .C = struct {
        fn tmp() callconv(.C) noreturn {
            @panic("unhandled interrupt");
        }
    }.tmp,
};
