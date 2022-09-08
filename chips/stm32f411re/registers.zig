pub const registers = struct {
    /// System Control Space
    pub const SCS = struct {
        pub const base_address = 0xe000e000;

        /// System Tick Timer
        pub const SysTick = struct {
            /// address: 0xe000e010
            /// SysTick Control and Status Register
            pub const CTRL = @intToPtr(*volatile Mmio(32, packed struct {
                ENABLE: u1,
                TICKINT: u1,
                CLKSOURCE: u1,
                reserved0: u1,
                reserved1: u1,
                reserved2: u1,
                reserved3: u1,
                reserved4: u1,
                reserved5: u1,
                reserved6: u1,
                reserved7: u1,
                reserved8: u1,
                reserved9: u1,
                reserved10: u1,
                reserved11: u1,
                reserved12: u1,
                COUNTFLAG: u1,
                padding0: u1,
                padding1: u1,
                padding2: u1,
                padding3: u1,
                padding4: u1,
                padding5: u1,
                padding6: u1,
                padding7: u1,
                padding8: u1,
                padding9: u1,
                padding10: u1,
                padding11: u1,
                padding12: u1,
                padding13: u1,
                padding14: u1,
            }), base_address + 0x10);

            /// address: 0xe000e014
            /// SysTick Reload Value Register
            pub const LOAD = @intToPtr(*volatile Mmio(32, packed struct {
                RELOAD: u24,
                padding0: u1,
                padding1: u1,
                padding2: u1,
                padding3: u1,
                padding4: u1,
                padding5: u1,
                padding6: u1,
                padding7: u1,
            }), base_address + 0x14);

            /// address: 0xe000e018
            /// SysTick Current Value Register
            pub const VAL = @intToPtr(*volatile Mmio(32, packed struct {
                CURRENT: u24,
                padding0: u1,
                padding1: u1,
                padding2: u1,
                padding3: u1,
                padding4: u1,
                padding5: u1,
                padding6: u1,
                padding7: u1,
            }), base_address + 0x18);

            /// address: 0xe000e01c
            /// SysTick Calibration Register
            pub const CALIB = @intToPtr(*volatile Mmio(32, packed struct {
                TENMS: u24,
                reserved0: u1,
                reserved1: u1,
                reserved2: u1,
                reserved3: u1,
                reserved4: u1,
                reserved5: u1,
                SKEW: u1,
                NOREF: u1,
            }), base_address + 0x1c);
        };
    };

    /// ADC common registers
    pub const ADC_Common = struct {
        pub const base_address = 0x40012300;

        /// address: 0x40012300
        /// ADC Common status register
        pub const CSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Analog watchdog flag of ADC
            /// 1
            AWD1: u1,
            /// End of conversion of ADC 1
            EOC1: u1,
            /// Injected channel end of conversion of
            /// ADC 1
            JEOC1: u1,
            /// Injected channel Start flag of ADC
            /// 1
            JSTRT1: u1,
            /// Regular channel Start flag of ADC
            /// 1
            STRT1: u1,
            /// Overrun flag of ADC 1
            OVR1: u1,
            reserved0: u1,
            reserved1: u1,
            /// Analog watchdog flag of ADC
            /// 2
            AWD2: u1,
            /// End of conversion of ADC 2
            EOC2: u1,
            /// Injected channel end of conversion of
            /// ADC 2
            JEOC2: u1,
            /// Injected channel Start flag of ADC
            /// 2
            JSTRT2: u1,
            /// Regular channel Start flag of ADC
            /// 2
            STRT2: u1,
            /// Overrun flag of ADC 2
            OVR2: u1,
            reserved2: u1,
            reserved3: u1,
            /// Analog watchdog flag of ADC
            /// 3
            AWD3: u1,
            /// End of conversion of ADC 3
            EOC3: u1,
            /// Injected channel end of conversion of
            /// ADC 3
            JEOC3: u1,
            /// Injected channel Start flag of ADC
            /// 3
            JSTRT3: u1,
            /// Regular channel Start flag of ADC
            /// 3
            STRT3: u1,
            /// Overrun flag of ADC3
            OVR3: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
        }), base_address + 0x0);

        /// address: 0x40012304
        /// ADC common control register
        pub const CCR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            /// Delay between 2 sampling
            /// phases
            DELAY: u4,
            reserved8: u1,
            /// DMA disable selection for multi-ADC
            /// mode
            DDS: u1,
            /// Direct memory access mode for multi ADC
            /// mode
            DMA: u2,
            /// ADC prescaler
            ADCPRE: u2,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            /// VBAT enable
            VBATE: u1,
            /// Temperature sensor and VREFINT
            /// enable
            TSVREFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x4);
    };

    /// Analog-to-digital converter
    pub const ADC1 = struct {
        pub const base_address = 0x40012000;

        /// address: 0x40012000
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Analog watchdog flag
            AWD: u1,
            /// Regular channel end of
            /// conversion
            EOC: u1,
            /// Injected channel end of
            /// conversion
            JEOC: u1,
            /// Injected channel start
            /// flag
            JSTRT: u1,
            /// Regular channel start flag
            STRT: u1,
            /// Overrun
            OVR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
        }), base_address + 0x0);

        /// address: 0x40012004
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Analog watchdog channel select
            /// bits
            AWDCH: u5,
            /// Interrupt enable for EOC
            EOCIE: u1,
            /// Analog watchdog interrupt
            /// enable
            AWDIE: u1,
            /// Interrupt enable for injected
            /// channels
            JEOCIE: u1,
            /// Scan mode
            SCAN: u1,
            /// Enable the watchdog on a single channel
            /// in scan mode
            AWDSGL: u1,
            /// Automatic injected group
            /// conversion
            JAUTO: u1,
            /// Discontinuous mode on regular
            /// channels
            DISCEN: u1,
            /// Discontinuous mode on injected
            /// channels
            JDISCEN: u1,
            /// Discontinuous mode channel
            /// count
            DISCNUM: u3,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Analog watchdog enable on injected
            /// channels
            JAWDEN: u1,
            /// Analog watchdog enable on regular
            /// channels
            AWDEN: u1,
            /// Resolution
            RES: u2,
            /// Overrun interrupt enable
            OVRIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
        }), base_address + 0x4);

        /// address: 0x40012008
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// A/D Converter ON / OFF
            ADON: u1,
            /// Continuous conversion
            CONT: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Direct memory access mode (for single
            /// ADC mode)
            DMA: u1,
            /// DMA disable selection (for single ADC
            /// mode)
            DDS: u1,
            /// End of conversion
            /// selection
            EOCS: u1,
            /// Data alignment
            ALIGN: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            /// External event select for injected
            /// group
            JEXTSEL: u4,
            /// External trigger enable for injected
            /// channels
            JEXTEN: u2,
            /// Start conversion of injected
            /// channels
            JSWSTART: u1,
            reserved10: u1,
            /// External event select for regular
            /// group
            EXTSEL: u4,
            /// External trigger enable for regular
            /// channels
            EXTEN: u2,
            /// Start conversion of regular
            /// channels
            SWSTART: u1,
            padding0: u1,
        }), base_address + 0x8);

        /// address: 0x4001200c
        /// sample time register 1
        pub const SMPR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Sample time bits
            ///  Channel x sampling time selection
            SMP10: u3,
            SMP11: u3,
            SMP12: u3,
            SMP13: u3,
            SMP14: u3,
            SMP15: u3,
            SMP16: u3,
            SMP17: u3,
            SMP18: u3,
            padding: u5,
        }), base_address + 0xc);

        /// address: 0x40012010
        /// sample time register 2
        pub const SMPR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Sample time bits
            ///  Channel x sampling time selection
            SMP0: u3,
            SMP1: u3,
            SMP2: u3,
            SMP3: u3,
            SMP4: u3,
            SMP5: u3,
            SMP6: u3,
            SMP7: u3,
            SMP8: u3,
            SMP9: u3,
            padding: u2,
        }), base_address + 0x10);

        /// address: 0x40012014
        /// injected channel data offset register
        /// x
        pub const JOFR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data offset for injected channel
            /// x
            JOFFSET1: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x14);

        /// address: 0x40012018
        /// injected channel data offset register
        /// x
        pub const JOFR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data offset for injected channel
            /// x
            JOFFSET2: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x18);

        /// address: 0x4001201c
        /// injected channel data offset register
        /// x
        pub const JOFR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data offset for injected channel
            /// x
            JOFFSET3: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40012020
        /// injected channel data offset register
        /// x
        pub const JOFR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data offset for injected channel
            /// x
            JOFFSET4: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x20);

        /// address: 0x40012024
        /// watchdog higher threshold
        /// register
        pub const HTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Analog watchdog higher
            /// threshold
            HT: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x24);

        /// address: 0x40012028
        /// watchdog lower threshold
        /// register
        pub const LTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Analog watchdog lower
            /// threshold
            LT: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x28);

        /// address: 0x4001202c
        /// regular sequence register 1
        pub const SQR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// 13th conversion in regular
            /// sequence
            SQ13: u5,
            /// 14th conversion in regular
            /// sequence
            SQ14: u5,
            /// 15th conversion in regular
            /// sequence
            SQ15: u5,
            /// 16th conversion in regular
            /// sequence
            SQ16: u5,
            /// Regular channel sequence
            /// length
            L: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x2c);

        /// address: 0x40012030
        /// regular sequence register 2
        pub const SQR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// 7th conversion in regular
            /// sequence
            SQ7: u5,
            /// 8th conversion in regular
            /// sequence
            SQ8: u5,
            /// 9th conversion in regular
            /// sequence
            SQ9: u5,
            /// 10th conversion in regular
            /// sequence
            SQ10: u5,
            /// 11th conversion in regular
            /// sequence
            SQ11: u5,
            /// 12th conversion in regular
            /// sequence
            SQ12: u5,
            padding0: u1,
            padding1: u1,
        }), base_address + 0x30);

        /// address: 0x40012034
        /// regular sequence register 3
        pub const SQR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// 1st conversion in regular
            /// sequence
            SQ1: u5,
            /// 2nd conversion in regular
            /// sequence
            SQ2: u5,
            /// 3rd conversion in regular
            /// sequence
            SQ3: u5,
            /// 4th conversion in regular
            /// sequence
            SQ4: u5,
            /// 5th conversion in regular
            /// sequence
            SQ5: u5,
            /// 6th conversion in regular
            /// sequence
            SQ6: u5,
            padding0: u1,
            padding1: u1,
        }), base_address + 0x34);

        /// address: 0x40012038
        /// injected sequence register
        pub const JSQR = @intToPtr(*volatile Mmio(32, packed struct {
            /// 1st conversion in injected
            /// sequence
            JSQ1: u5,
            /// 2nd conversion in injected
            /// sequence
            JSQ2: u5,
            /// 3rd conversion in injected
            /// sequence
            JSQ3: u5,
            /// 4th conversion in injected
            /// sequence
            JSQ4: u5,
            /// Injected sequence length
            JL: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
        }), base_address + 0x38);

        /// address: 0x4001203c
        /// injected data register x
        pub const JDR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Injected data
            JDATA: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x3c);

        /// address: 0x40012040
        /// injected data register x
        pub const JDR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Injected data
            JDATA: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x40);

        /// address: 0x40012044
        /// injected data register x
        pub const JDR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Injected data
            JDATA: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x44);

        /// address: 0x40012048
        /// injected data register x
        pub const JDR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Injected data
            JDATA: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x48);

        /// address: 0x4001204c
        /// regular data register
        pub const DR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Regular data
            DATA: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);
    };

    /// Cryptographic processor
    pub const CRC = struct {
        pub const base_address = 0x40023000;

        /// address: 0x40023000
        /// Data register
        pub const DR = @intToPtr(*volatile u32, base_address + 0x0);

        /// address: 0x40023004
        /// Independent Data register
        pub const IDR = @intToPtr(*volatile MmioInt(32, u8), base_address + 0x4);

        /// address: 0x40023008
        /// Control register
        pub const CR = @intToPtr(*volatile MmioInt(32, u1), base_address + 0x8);
    };

    /// Debug support
    pub const DBG = struct {
        pub const base_address = 0xe0042000;

        /// address: 0xe0042000
        /// IDCODE
        pub const DBGMCU_IDCODE = @intToPtr(*volatile Mmio(32, packed struct {
            /// DEV_ID
            DEV_ID: u12,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// REV_ID
            REV_ID: u16,
        }), base_address + 0x0);

        /// address: 0xe0042004
        /// Control Register
        pub const DBGMCU_CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DBG_SLEEP
            DBG_SLEEP: u1,
            /// DBG_STOP
            DBG_STOP: u1,
            /// DBG_STANDBY
            DBG_STANDBY: u1,
            reserved0: u1,
            reserved1: u1,
            /// TRACE_IOEN
            TRACE_IOEN: u1,
            /// TRACE_MODE
            TRACE_MODE: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0xe0042008
        /// Debug MCU APB1 Freeze registe
        pub const DBGMCU_APB1_FZ = @intToPtr(*volatile Mmio(32, packed struct {
            /// DBG_TIM2_STOP
            DBG_TIM2_STOP: u1,
            /// DBG_TIM3 _STOP
            DBG_TIM3_STOP: u1,
            /// DBG_TIM4_STOP
            DBG_TIM4_STOP: u1,
            /// DBG_TIM5_STOP
            DBG_TIM5_STOP: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// RTC stopped when Core is
            /// halted
            DBG_RTC_Stop: u1,
            /// DBG_WWDG_STOP
            DBG_WWDG_STOP: u1,
            /// DBG_IWDEG_STOP
            DBG_IWDEG_STOP: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            /// DBG_J2C1_SMBUS_TIMEOUT
            DBG_I2C1_SMBUS_TIMEOUT: u1,
            /// DBG_J2C2_SMBUS_TIMEOUT
            DBG_I2C2_SMBUS_TIMEOUT: u1,
            /// DBG_J2C3SMBUS_TIMEOUT
            DBG_I2C3SMBUS_TIMEOUT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x8);

        /// address: 0xe004200c
        /// Debug MCU APB2 Freeze registe
        pub const DBGMCU_APB2_FZ = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM1 counter stopped when core is
            /// halted
            DBG_TIM1_STOP: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            /// TIM9 counter stopped when core is
            /// halted
            DBG_TIM9_STOP: u1,
            /// TIM10 counter stopped when core is
            /// halted
            DBG_TIM10_STOP: u1,
            /// TIM11 counter stopped when core is
            /// halted
            DBG_TIM11_STOP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0xc);
    };

    /// External interrupt/event
    /// controller
    pub const EXTI = struct {
        pub const base_address = 0x40013c00;

        /// address: 0x40013c00
        /// Interrupt mask register
        /// (EXTI_IMR)
        pub const IMR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Interrupt Mask on line 0
            MR0: u1,
            /// Interrupt Mask on line 1
            MR1: u1,
            /// Interrupt Mask on line 2
            MR2: u1,
            /// Interrupt Mask on line 3
            MR3: u1,
            /// Interrupt Mask on line 4
            MR4: u1,
            /// Interrupt Mask on line 5
            MR5: u1,
            /// Interrupt Mask on line 6
            MR6: u1,
            /// Interrupt Mask on line 7
            MR7: u1,
            /// Interrupt Mask on line 8
            MR8: u1,
            /// Interrupt Mask on line 9
            MR9: u1,
            /// Interrupt Mask on line 10
            MR10: u1,
            /// Interrupt Mask on line 11
            MR11: u1,
            /// Interrupt Mask on line 12
            MR12: u1,
            /// Interrupt Mask on line 13
            MR13: u1,
            /// Interrupt Mask on line 14
            MR14: u1,
            /// Interrupt Mask on line 15
            MR15: u1,
            /// Interrupt Mask on line 16
            MR16: u1,
            /// Interrupt Mask on line 17
            MR17: u1,
            /// Interrupt Mask on line 18
            MR18: u1,
            /// Interrupt Mask on line 19
            MR19: u1,
            /// Interrupt Mask on line 20
            MR20: u1,
            /// Interrupt Mask on line 21
            MR21: u1,
            /// Interrupt Mask on line 22
            MR22: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x0);

        /// address: 0x40013c04
        /// Event mask register (EXTI_EMR)
        pub const EMR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Event Mask on line 0
            MR0: u1,
            /// Event Mask on line 1
            MR1: u1,
            /// Event Mask on line 2
            MR2: u1,
            /// Event Mask on line 3
            MR3: u1,
            /// Event Mask on line 4
            MR4: u1,
            /// Event Mask on line 5
            MR5: u1,
            /// Event Mask on line 6
            MR6: u1,
            /// Event Mask on line 7
            MR7: u1,
            /// Event Mask on line 8
            MR8: u1,
            /// Event Mask on line 9
            MR9: u1,
            /// Event Mask on line 10
            MR10: u1,
            /// Event Mask on line 11
            MR11: u1,
            /// Event Mask on line 12
            MR12: u1,
            /// Event Mask on line 13
            MR13: u1,
            /// Event Mask on line 14
            MR14: u1,
            /// Event Mask on line 15
            MR15: u1,
            /// Event Mask on line 16
            MR16: u1,
            /// Event Mask on line 17
            MR17: u1,
            /// Event Mask on line 18
            MR18: u1,
            /// Event Mask on line 19
            MR19: u1,
            /// Event Mask on line 20
            MR20: u1,
            /// Event Mask on line 21
            MR21: u1,
            /// Event Mask on line 22
            MR22: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x4);

        /// address: 0x40013c08
        /// Rising Trigger selection register
        /// (EXTI_RTSR)
        pub const RTSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rising trigger event configuration of
            /// line 0
            TR0: u1,
            /// Rising trigger event configuration of
            /// line 1
            TR1: u1,
            /// Rising trigger event configuration of
            /// line 2
            TR2: u1,
            /// Rising trigger event configuration of
            /// line 3
            TR3: u1,
            /// Rising trigger event configuration of
            /// line 4
            TR4: u1,
            /// Rising trigger event configuration of
            /// line 5
            TR5: u1,
            /// Rising trigger event configuration of
            /// line 6
            TR6: u1,
            /// Rising trigger event configuration of
            /// line 7
            TR7: u1,
            /// Rising trigger event configuration of
            /// line 8
            TR8: u1,
            /// Rising trigger event configuration of
            /// line 9
            TR9: u1,
            /// Rising trigger event configuration of
            /// line 10
            TR10: u1,
            /// Rising trigger event configuration of
            /// line 11
            TR11: u1,
            /// Rising trigger event configuration of
            /// line 12
            TR12: u1,
            /// Rising trigger event configuration of
            /// line 13
            TR13: u1,
            /// Rising trigger event configuration of
            /// line 14
            TR14: u1,
            /// Rising trigger event configuration of
            /// line 15
            TR15: u1,
            /// Rising trigger event configuration of
            /// line 16
            TR16: u1,
            /// Rising trigger event configuration of
            /// line 17
            TR17: u1,
            /// Rising trigger event configuration of
            /// line 18
            TR18: u1,
            /// Rising trigger event configuration of
            /// line 19
            TR19: u1,
            /// Rising trigger event configuration of
            /// line 20
            TR20: u1,
            /// Rising trigger event configuration of
            /// line 21
            TR21: u1,
            /// Rising trigger event configuration of
            /// line 22
            TR22: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x8);

        /// address: 0x40013c0c
        /// Falling Trigger selection register
        /// (EXTI_FTSR)
        pub const FTSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Falling trigger event configuration of
            /// line 0
            TR0: u1,
            /// Falling trigger event configuration of
            /// line 1
            TR1: u1,
            /// Falling trigger event configuration of
            /// line 2
            TR2: u1,
            /// Falling trigger event configuration of
            /// line 3
            TR3: u1,
            /// Falling trigger event configuration of
            /// line 4
            TR4: u1,
            /// Falling trigger event configuration of
            /// line 5
            TR5: u1,
            /// Falling trigger event configuration of
            /// line 6
            TR6: u1,
            /// Falling trigger event configuration of
            /// line 7
            TR7: u1,
            /// Falling trigger event configuration of
            /// line 8
            TR8: u1,
            /// Falling trigger event configuration of
            /// line 9
            TR9: u1,
            /// Falling trigger event configuration of
            /// line 10
            TR10: u1,
            /// Falling trigger event configuration of
            /// line 11
            TR11: u1,
            /// Falling trigger event configuration of
            /// line 12
            TR12: u1,
            /// Falling trigger event configuration of
            /// line 13
            TR13: u1,
            /// Falling trigger event configuration of
            /// line 14
            TR14: u1,
            /// Falling trigger event configuration of
            /// line 15
            TR15: u1,
            /// Falling trigger event configuration of
            /// line 16
            TR16: u1,
            /// Falling trigger event configuration of
            /// line 17
            TR17: u1,
            /// Falling trigger event configuration of
            /// line 18
            TR18: u1,
            /// Falling trigger event configuration of
            /// line 19
            TR19: u1,
            /// Falling trigger event configuration of
            /// line 20
            TR20: u1,
            /// Falling trigger event configuration of
            /// line 21
            TR21: u1,
            /// Falling trigger event configuration of
            /// line 22
            TR22: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0xc);

        /// address: 0x40013c10
        /// Software interrupt event register
        /// (EXTI_SWIER)
        pub const SWIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Software Interrupt on line
            /// 0
            SWIER0: u1,
            /// Software Interrupt on line
            /// 1
            SWIER1: u1,
            /// Software Interrupt on line
            /// 2
            SWIER2: u1,
            /// Software Interrupt on line
            /// 3
            SWIER3: u1,
            /// Software Interrupt on line
            /// 4
            SWIER4: u1,
            /// Software Interrupt on line
            /// 5
            SWIER5: u1,
            /// Software Interrupt on line
            /// 6
            SWIER6: u1,
            /// Software Interrupt on line
            /// 7
            SWIER7: u1,
            /// Software Interrupt on line
            /// 8
            SWIER8: u1,
            /// Software Interrupt on line
            /// 9
            SWIER9: u1,
            /// Software Interrupt on line
            /// 10
            SWIER10: u1,
            /// Software Interrupt on line
            /// 11
            SWIER11: u1,
            /// Software Interrupt on line
            /// 12
            SWIER12: u1,
            /// Software Interrupt on line
            /// 13
            SWIER13: u1,
            /// Software Interrupt on line
            /// 14
            SWIER14: u1,
            /// Software Interrupt on line
            /// 15
            SWIER15: u1,
            /// Software Interrupt on line
            /// 16
            SWIER16: u1,
            /// Software Interrupt on line
            /// 17
            SWIER17: u1,
            /// Software Interrupt on line
            /// 18
            SWIER18: u1,
            /// Software Interrupt on line
            /// 19
            SWIER19: u1,
            /// Software Interrupt on line
            /// 20
            SWIER20: u1,
            /// Software Interrupt on line
            /// 21
            SWIER21: u1,
            /// Software Interrupt on line
            /// 22
            SWIER22: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x10);

        /// address: 0x40013c14
        /// Pending register (EXTI_PR)
        pub const PR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Pending bit 0
            PR0: u1,
            /// Pending bit 1
            PR1: u1,
            /// Pending bit 2
            PR2: u1,
            /// Pending bit 3
            PR3: u1,
            /// Pending bit 4
            PR4: u1,
            /// Pending bit 5
            PR5: u1,
            /// Pending bit 6
            PR6: u1,
            /// Pending bit 7
            PR7: u1,
            /// Pending bit 8
            PR8: u1,
            /// Pending bit 9
            PR9: u1,
            /// Pending bit 10
            PR10: u1,
            /// Pending bit 11
            PR11: u1,
            /// Pending bit 12
            PR12: u1,
            /// Pending bit 13
            PR13: u1,
            /// Pending bit 14
            PR14: u1,
            /// Pending bit 15
            PR15: u1,
            /// Pending bit 16
            PR16: u1,
            /// Pending bit 17
            PR17: u1,
            /// Pending bit 18
            PR18: u1,
            /// Pending bit 19
            PR19: u1,
            /// Pending bit 20
            PR20: u1,
            /// Pending bit 21
            PR21: u1,
            /// Pending bit 22
            PR22: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x14);
    };

    /// FLASH
    pub const FLASH = struct {
        pub const base_address = 0x40023c00;

        /// address: 0x40023c00
        /// Flash access control register
        pub const ACR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Latency
            LATENCY: u3,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Prefetch enable
            PRFTEN: u1,
            /// Instruction cache enable
            ICEN: u1,
            /// Data cache enable
            DCEN: u1,
            /// Instruction cache reset
            ICRST: u1,
            /// Data cache reset
            DCRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x0);

        /// address: 0x40023c04
        /// Flash key register
        pub const KEYR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FPEC key
            KEY: u32,
        }), base_address + 0x4);

        /// address: 0x40023c08
        /// Flash option key register
        pub const OPTKEYR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Option byte key
            OPTKEY: u32,
        }), base_address + 0x8);

        /// address: 0x40023c0c
        /// Status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// End of operation
            EOP: u1,
            /// Operation error
            OPERR: u1,
            reserved0: u1,
            reserved1: u1,
            /// Write protection error
            WRPERR: u1,
            /// Programming alignment
            /// error
            PGAERR: u1,
            /// Programming parallelism
            /// error
            PGPERR: u1,
            /// Programming sequence error
            PGSERR: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            /// Busy
            BSY: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0xc);

        /// address: 0x40023c10
        /// Control register
        pub const CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Programming
            PG: u1,
            /// Sector Erase
            SER: u1,
            /// Mass Erase
            MER: u1,
            /// Sector number
            SNB: u4,
            reserved0: u1,
            /// Program size
            PSIZE: u2,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Start
            STRT: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            /// End of operation interrupt
            /// enable
            EOPIE: u1,
            /// Error interrupt enable
            ERRIE: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            /// Lock
            LOCK: u1,
        }), base_address + 0x10);

        /// address: 0x40023c14
        /// Flash option control register
        pub const OPTCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Option lock
            OPTLOCK: u1,
            /// Option start
            OPTSTRT: u1,
            /// BOR reset Level
            BOR_LEV: u2,
            reserved0: u1,
            /// WDG_SW User option bytes
            WDG_SW: u1,
            /// nRST_STOP User option
            /// bytes
            nRST_STOP: u1,
            /// nRST_STDBY User option
            /// bytes
            nRST_STDBY: u1,
            /// Read protect
            RDP: u8,
            /// Not write protect
            nWRP: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x14);
    };

    /// Independent watchdog
    pub const IWDG = struct {
        pub const base_address = 0x40003000;

        /// address: 0x40003000
        /// Key register
        pub const KR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Key value
            KEY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40003004
        /// Prescaler register
        pub const PR = @intToPtr(*volatile MmioInt(32, u3), base_address + 0x4);

        /// address: 0x40003008
        /// Reload register
        pub const RLR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Watchdog counter reload
            /// value
            RL: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x8);

        /// address: 0x4000300c
        /// Status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Watchdog prescaler value
            /// update
            PVU: u1,
            /// Watchdog counter reload value
            /// update
            RVU: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0xc);
    };

    /// USB on the go full speed
    pub const OTG_FS_DEVICE = struct {
        pub const base_address = 0x50000800;

        /// address: 0x50000800
        /// OTG_FS device configuration register
        /// (OTG_FS_DCFG)
        pub const FS_DCFG = @intToPtr(*volatile Mmio(32, packed struct {
            /// Device speed
            DSPD: u2,
            /// Non-zero-length status OUT
            /// handshake
            NZLSOHSK: u1,
            reserved0: u1,
            /// Device address
            DAD: u7,
            /// Periodic frame interval
            PFIVL: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x0);

        /// address: 0x50000804
        /// OTG_FS device control register
        /// (OTG_FS_DCTL)
        pub const FS_DCTL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Remote wakeup signaling
            RWUSIG: u1,
            /// Soft disconnect
            SDIS: u1,
            /// Global IN NAK status
            GINSTS: u1,
            /// Global OUT NAK status
            GONSTS: u1,
            /// Test control
            TCTL: u3,
            /// Set global IN NAK
            SGINAK: u1,
            /// Clear global IN NAK
            CGINAK: u1,
            /// Set global OUT NAK
            SGONAK: u1,
            /// Clear global OUT NAK
            CGONAK: u1,
            /// Power-on programming done
            POPRGDNE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x4);

        /// address: 0x50000808
        /// OTG_FS device status register
        /// (OTG_FS_DSTS)
        pub const FS_DSTS = @intToPtr(*volatile Mmio(32, packed struct {
            /// Suspend status
            SUSPSTS: u1,
            /// Enumerated speed
            ENUMSPD: u2,
            /// Erratic error
            EERR: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// Frame number of the received
            /// SOF
            FNSOF: u14,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
        }), base_address + 0x8);

        /// address: 0x50000810
        /// OTG_FS device IN endpoint common interrupt
        /// mask register (OTG_FS_DIEPMSK)
        pub const FS_DIEPMSK = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed interrupt
            /// mask
            XFRCM: u1,
            /// Endpoint disabled interrupt
            /// mask
            EPDM: u1,
            reserved0: u1,
            /// Timeout condition mask (Non-isochronous
            /// endpoints)
            TOM: u1,
            /// IN token received when TxFIFO empty
            /// mask
            ITTXFEMSK: u1,
            /// IN token received with EP mismatch
            /// mask
            INEPNMM: u1,
            /// IN endpoint NAK effective
            /// mask
            INEPNEM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x10);

        /// address: 0x50000814
        /// OTG_FS device OUT endpoint common interrupt
        /// mask register (OTG_FS_DOEPMSK)
        pub const FS_DOEPMSK = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed interrupt
            /// mask
            XFRCM: u1,
            /// Endpoint disabled interrupt
            /// mask
            EPDM: u1,
            reserved0: u1,
            /// SETUP phase done mask
            STUPM: u1,
            /// OUT token received when endpoint
            /// disabled mask
            OTEPDM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
        }), base_address + 0x14);

        /// address: 0x50000818
        /// OTG_FS device all endpoints interrupt
        /// register (OTG_FS_DAINT)
        pub const FS_DAINT = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint interrupt bits
            IEPINT: u16,
            /// OUT endpoint interrupt
            /// bits
            OEPINT: u16,
        }), base_address + 0x18);

        /// address: 0x5000081c
        /// OTG_FS all endpoints interrupt mask register
        /// (OTG_FS_DAINTMSK)
        pub const FS_DAINTMSK = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN EP interrupt mask bits
            IEPM: u16,
            /// OUT endpoint interrupt
            /// bits
            OEPINT: u16,
        }), base_address + 0x1c);

        /// address: 0x50000828
        /// OTG_FS device VBUS discharge time
        /// register
        pub const DVBUSDIS = @intToPtr(*volatile Mmio(32, packed struct {
            /// Device VBUS discharge time
            VBUSDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x28);

        /// address: 0x5000082c
        /// OTG_FS device VBUS pulsing time
        /// register
        pub const DVBUSPULSE = @intToPtr(*volatile Mmio(32, packed struct {
            /// Device VBUS pulsing time
            DVBUSP: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x2c);

        /// address: 0x50000834
        /// OTG_FS device IN endpoint FIFO empty
        /// interrupt mask register
        pub const DIEPEMPMSK = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN EP Tx FIFO empty interrupt mask
            /// bits
            INEPTXFEM: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x34);

        /// address: 0x50000900
        /// OTG_FS device control IN endpoint 0 control
        /// register (OTG_FS_DIEPCTL0)
        pub const FS_DIEPCTL0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u2,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            /// USB active endpoint
            USBAEP: u1,
            reserved13: u1,
            /// NAK status
            NAKSTS: u1,
            /// Endpoint type
            EPTYP: u2,
            reserved14: u1,
            /// STALL handshake
            STALL: u1,
            /// TxFIFO number
            TXFNUM: u4,
            /// Clear NAK
            CNAK: u1,
            /// Set NAK
            SNAK: u1,
            reserved15: u1,
            reserved16: u1,
            /// Endpoint disable
            EPDIS: u1,
            /// Endpoint enable
            EPENA: u1,
        }), base_address + 0x100);

        /// address: 0x50000920
        /// OTG device endpoint-1 control
        /// register
        pub const DIEPCTL1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u11,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// USBAEP
            USBAEP: u1,
            /// EONUM/DPID
            EONUM_DPID: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            reserved4: u1,
            /// Stall
            Stall: u1,
            /// TXFNUM
            TXFNUM: u4,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            /// SD0PID/SEVNFRM
            SD0PID_SEVNFRM: u1,
            /// SODDFRM/SD1PID
            SODDFRM_SD1PID: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x120);

        /// address: 0x50000940
        /// OTG device endpoint-2 control
        /// register
        pub const DIEPCTL2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u11,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// USBAEP
            USBAEP: u1,
            /// EONUM/DPID
            EONUM_DPID: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            reserved4: u1,
            /// Stall
            Stall: u1,
            /// TXFNUM
            TXFNUM: u4,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            /// SD0PID/SEVNFRM
            SD0PID_SEVNFRM: u1,
            /// SODDFRM
            SODDFRM: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x140);

        /// address: 0x50000960
        /// OTG device endpoint-3 control
        /// register
        pub const DIEPCTL3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u11,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// USBAEP
            USBAEP: u1,
            /// EONUM/DPID
            EONUM_DPID: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            reserved4: u1,
            /// Stall
            Stall: u1,
            /// TXFNUM
            TXFNUM: u4,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            /// SD0PID/SEVNFRM
            SD0PID_SEVNFRM: u1,
            /// SODDFRM
            SODDFRM: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x160);

        /// address: 0x50000b00
        /// device endpoint-0 control
        /// register
        pub const DOEPCTL0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u2,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            /// USBAEP
            USBAEP: u1,
            reserved13: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            /// SNPM
            SNPM: u1,
            /// Stall
            Stall: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            reserved18: u1,
            reserved19: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x300);

        /// address: 0x50000b20
        /// device endpoint-1 control
        /// register
        pub const DOEPCTL1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u11,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// USBAEP
            USBAEP: u1,
            /// EONUM/DPID
            EONUM_DPID: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            /// SNPM
            SNPM: u1,
            /// Stall
            Stall: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            /// SD0PID/SEVNFRM
            SD0PID_SEVNFRM: u1,
            /// SODDFRM
            SODDFRM: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x320);

        /// address: 0x50000b40
        /// device endpoint-2 control
        /// register
        pub const DOEPCTL2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u11,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// USBAEP
            USBAEP: u1,
            /// EONUM/DPID
            EONUM_DPID: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            /// SNPM
            SNPM: u1,
            /// Stall
            Stall: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            /// SD0PID/SEVNFRM
            SD0PID_SEVNFRM: u1,
            /// SODDFRM
            SODDFRM: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x340);

        /// address: 0x50000b60
        /// device endpoint-3 control
        /// register
        pub const DOEPCTL3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPSIZ
            MPSIZ: u11,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// USBAEP
            USBAEP: u1,
            /// EONUM/DPID
            EONUM_DPID: u1,
            /// NAKSTS
            NAKSTS: u1,
            /// EPTYP
            EPTYP: u2,
            /// SNPM
            SNPM: u1,
            /// Stall
            Stall: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            /// CNAK
            CNAK: u1,
            /// SNAK
            SNAK: u1,
            /// SD0PID/SEVNFRM
            SD0PID_SEVNFRM: u1,
            /// SODDFRM
            SODDFRM: u1,
            /// EPDIS
            EPDIS: u1,
            /// EPENA
            EPENA: u1,
        }), base_address + 0x360);

        /// address: 0x50000908
        /// device endpoint-x interrupt
        /// register
        pub const DIEPINT0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// TOC
            TOC: u1,
            /// ITTXFE
            ITTXFE: u1,
            reserved1: u1,
            /// INEPNE
            INEPNE: u1,
            /// TXFE
            TXFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x108);

        /// address: 0x50000928
        /// device endpoint-1 interrupt
        /// register
        pub const DIEPINT1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// TOC
            TOC: u1,
            /// ITTXFE
            ITTXFE: u1,
            reserved1: u1,
            /// INEPNE
            INEPNE: u1,
            /// TXFE
            TXFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x128);

        /// address: 0x50000948
        /// device endpoint-2 interrupt
        /// register
        pub const DIEPINT2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// TOC
            TOC: u1,
            /// ITTXFE
            ITTXFE: u1,
            reserved1: u1,
            /// INEPNE
            INEPNE: u1,
            /// TXFE
            TXFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x148);

        /// address: 0x50000968
        /// device endpoint-3 interrupt
        /// register
        pub const DIEPINT3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// TOC
            TOC: u1,
            /// ITTXFE
            ITTXFE: u1,
            reserved1: u1,
            /// INEPNE
            INEPNE: u1,
            /// TXFE
            TXFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x168);

        /// address: 0x50000b08
        /// device endpoint-0 interrupt
        /// register
        pub const DOEPINT0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// STUP
            STUP: u1,
            /// OTEPDIS
            OTEPDIS: u1,
            reserved1: u1,
            /// B2BSTUP
            B2BSTUP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x308);

        /// address: 0x50000b28
        /// device endpoint-1 interrupt
        /// register
        pub const DOEPINT1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// STUP
            STUP: u1,
            /// OTEPDIS
            OTEPDIS: u1,
            reserved1: u1,
            /// B2BSTUP
            B2BSTUP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x328);

        /// address: 0x50000b48
        /// device endpoint-2 interrupt
        /// register
        pub const DOEPINT2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// STUP
            STUP: u1,
            /// OTEPDIS
            OTEPDIS: u1,
            reserved1: u1,
            /// B2BSTUP
            B2BSTUP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x348);

        /// address: 0x50000b68
        /// device endpoint-3 interrupt
        /// register
        pub const DOEPINT3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// XFRC
            XFRC: u1,
            /// EPDISD
            EPDISD: u1,
            reserved0: u1,
            /// STUP
            STUP: u1,
            /// OTEPDIS
            OTEPDIS: u1,
            reserved1: u1,
            /// B2BSTUP
            B2BSTUP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x368);

        /// address: 0x50000910
        /// device endpoint-0 transfer size
        /// register
        pub const DIEPTSIZ0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u7,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            /// Packet count
            PKTCNT: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
        }), base_address + 0x110);

        /// address: 0x50000b10
        /// device OUT endpoint-0 transfer size
        /// register
        pub const DOEPTSIZ0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u7,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            /// Packet count
            PKTCNT: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            reserved20: u1,
            /// SETUP packet count
            STUPCNT: u2,
            padding0: u1,
        }), base_address + 0x310);

        /// address: 0x50000930
        /// device endpoint-1 transfer size
        /// register
        pub const DIEPTSIZ1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Multi count
            MCNT: u2,
            padding0: u1,
        }), base_address + 0x130);

        /// address: 0x50000950
        /// device endpoint-2 transfer size
        /// register
        pub const DIEPTSIZ2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Multi count
            MCNT: u2,
            padding0: u1,
        }), base_address + 0x150);

        /// address: 0x50000970
        /// device endpoint-3 transfer size
        /// register
        pub const DIEPTSIZ3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Multi count
            MCNT: u2,
            padding0: u1,
        }), base_address + 0x170);

        /// address: 0x50000918
        /// OTG_FS device IN endpoint transmit FIFO
        /// status register
        pub const DTXFSTS0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint TxFIFO space
            /// available
            INEPTFSAV: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x118);

        /// address: 0x50000938
        /// OTG_FS device IN endpoint transmit FIFO
        /// status register
        pub const DTXFSTS1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint TxFIFO space
            /// available
            INEPTFSAV: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x138);

        /// address: 0x50000958
        /// OTG_FS device IN endpoint transmit FIFO
        /// status register
        pub const DTXFSTS2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint TxFIFO space
            /// available
            INEPTFSAV: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x158);

        /// address: 0x50000978
        /// OTG_FS device IN endpoint transmit FIFO
        /// status register
        pub const DTXFSTS3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint TxFIFO space
            /// available
            INEPTFSAV: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x178);

        /// address: 0x50000b30
        /// device OUT endpoint-1 transfer size
        /// register
        pub const DOEPTSIZ1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Received data PID/SETUP packet
            /// count
            RXDPID_STUPCNT: u2,
            padding0: u1,
        }), base_address + 0x330);

        /// address: 0x50000b50
        /// device OUT endpoint-2 transfer size
        /// register
        pub const DOEPTSIZ2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Received data PID/SETUP packet
            /// count
            RXDPID_STUPCNT: u2,
            padding0: u1,
        }), base_address + 0x350);

        /// address: 0x50000b70
        /// device OUT endpoint-3 transfer size
        /// register
        pub const DOEPTSIZ3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Received data PID/SETUP packet
            /// count
            RXDPID_STUPCNT: u2,
            padding0: u1,
        }), base_address + 0x370);
    };

    /// USB on the go full speed
    pub const OTG_FS_GLOBAL = struct {
        pub const base_address = 0x50000000;

        /// address: 0x50000000
        /// OTG_FS control and status register
        /// (OTG_FS_GOTGCTL)
        pub const FS_GOTGCTL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Session request success
            SRQSCS: u1,
            /// Session request
            SRQ: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Host negotiation success
            HNGSCS: u1,
            /// HNP request
            HNPRQ: u1,
            /// Host set HNP enable
            HSHNPEN: u1,
            /// Device HNP enabled
            DHNPEN: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            /// Connector ID status
            CIDSTS: u1,
            /// Long/short debounce time
            DBCT: u1,
            /// A-session valid
            ASVLD: u1,
            /// B-session valid
            BSVLD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
        }), base_address + 0x0);

        /// address: 0x50000004
        /// OTG_FS interrupt register
        /// (OTG_FS_GOTGINT)
        pub const FS_GOTGINT = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            /// Session end detected
            SEDET: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Session request success status
            /// change
            SRSSCHG: u1,
            /// Host negotiation success status
            /// change
            HNSSCHG: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            /// Host negotiation detected
            HNGDET: u1,
            /// A-device timeout change
            ADTOCHG: u1,
            /// Debounce done
            DBCDNE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
        }), base_address + 0x4);

        /// address: 0x50000008
        /// OTG_FS AHB configuration register
        /// (OTG_FS_GAHBCFG)
        pub const FS_GAHBCFG = @intToPtr(*volatile Mmio(32, packed struct {
            /// Global interrupt mask
            GINT: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// TxFIFO empty level
            TXFELVL: u1,
            /// Periodic TxFIFO empty
            /// level
            PTXFELVL: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x5000000c
        /// OTG_FS USB configuration register
        /// (OTG_FS_GUSBCFG)
        pub const FS_GUSBCFG = @intToPtr(*volatile Mmio(32, packed struct {
            /// FS timeout calibration
            TOCAL: u3,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Full Speed serial transceiver
            /// select
            PHYSEL: u1,
            reserved3: u1,
            /// SRP-capable
            SRPCAP: u1,
            /// HNP-capable
            HNPCAP: u1,
            /// USB turnaround time
            TRDT: u4,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            /// Force host mode
            FHMOD: u1,
            /// Force device mode
            FDMOD: u1,
            /// Corrupt Tx packet
            CTXPKT: u1,
        }), base_address + 0xc);

        /// address: 0x50000010
        /// OTG_FS reset register
        /// (OTG_FS_GRSTCTL)
        pub const FS_GRSTCTL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Core soft reset
            CSRST: u1,
            /// HCLK soft reset
            HSRST: u1,
            /// Host frame counter reset
            FCRST: u1,
            reserved0: u1,
            /// RxFIFO flush
            RXFFLSH: u1,
            /// TxFIFO flush
            TXFFLSH: u1,
            /// TxFIFO number
            TXFNUM: u5,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            reserved20: u1,
            /// AHB master idle
            AHBIDL: u1,
        }), base_address + 0x10);

        /// address: 0x50000014
        /// OTG_FS core interrupt register
        /// (OTG_FS_GINTSTS)
        pub const FS_GINTSTS = @intToPtr(*volatile Mmio(32, packed struct {
            /// Current mode of operation
            CMOD: u1,
            /// Mode mismatch interrupt
            MMIS: u1,
            /// OTG interrupt
            OTGINT: u1,
            /// Start of frame
            SOF: u1,
            /// RxFIFO non-empty
            RXFLVL: u1,
            /// Non-periodic TxFIFO empty
            NPTXFE: u1,
            /// Global IN non-periodic NAK
            /// effective
            GINAKEFF: u1,
            /// Global OUT NAK effective
            GOUTNAKEFF: u1,
            reserved0: u1,
            reserved1: u1,
            /// Early suspend
            ESUSP: u1,
            /// USB suspend
            USBSUSP: u1,
            /// USB reset
            USBRST: u1,
            /// Enumeration done
            ENUMDNE: u1,
            /// Isochronous OUT packet dropped
            /// interrupt
            ISOODRP: u1,
            /// End of periodic frame
            /// interrupt
            EOPF: u1,
            reserved2: u1,
            reserved3: u1,
            /// IN endpoint interrupt
            IEPINT: u1,
            /// OUT endpoint interrupt
            OEPINT: u1,
            /// Incomplete isochronous IN
            /// transfer
            IISOIXFR: u1,
            /// Incomplete periodic transfer(Host
            /// mode)/Incomplete isochronous OUT transfer(Device
            /// mode)
            IPXFR_INCOMPISOOUT: u1,
            reserved4: u1,
            reserved5: u1,
            /// Host port interrupt
            HPRTINT: u1,
            /// Host channels interrupt
            HCINT: u1,
            /// Periodic TxFIFO empty
            PTXFE: u1,
            reserved6: u1,
            /// Connector ID status change
            CIDSCHG: u1,
            /// Disconnect detected
            /// interrupt
            DISCINT: u1,
            /// Session request/new session detected
            /// interrupt
            SRQINT: u1,
            /// Resume/remote wakeup detected
            /// interrupt
            WKUPINT: u1,
        }), base_address + 0x14);

        /// address: 0x50000018
        /// OTG_FS interrupt mask register
        /// (OTG_FS_GINTMSK)
        pub const FS_GINTMSK = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            /// Mode mismatch interrupt
            /// mask
            MMISM: u1,
            /// OTG interrupt mask
            OTGINT: u1,
            /// Start of frame mask
            SOFM: u1,
            /// Receive FIFO non-empty
            /// mask
            RXFLVLM: u1,
            /// Non-periodic TxFIFO empty
            /// mask
            NPTXFEM: u1,
            /// Global non-periodic IN NAK effective
            /// mask
            GINAKEFFM: u1,
            /// Global OUT NAK effective
            /// mask
            GONAKEFFM: u1,
            reserved1: u1,
            reserved2: u1,
            /// Early suspend mask
            ESUSPM: u1,
            /// USB suspend mask
            USBSUSPM: u1,
            /// USB reset mask
            USBRST: u1,
            /// Enumeration done mask
            ENUMDNEM: u1,
            /// Isochronous OUT packet dropped interrupt
            /// mask
            ISOODRPM: u1,
            /// End of periodic frame interrupt
            /// mask
            EOPFM: u1,
            reserved3: u1,
            /// Endpoint mismatch interrupt
            /// mask
            EPMISM: u1,
            /// IN endpoints interrupt
            /// mask
            IEPINT: u1,
            /// OUT endpoints interrupt
            /// mask
            OEPINT: u1,
            /// Incomplete isochronous IN transfer
            /// mask
            IISOIXFRM: u1,
            /// Incomplete periodic transfer mask(Host
            /// mode)/Incomplete isochronous OUT transfer mask(Device
            /// mode)
            IPXFRM_IISOOXFRM: u1,
            reserved4: u1,
            reserved5: u1,
            /// Host port interrupt mask
            PRTIM: u1,
            /// Host channels interrupt
            /// mask
            HCIM: u1,
            /// Periodic TxFIFO empty mask
            PTXFEM: u1,
            reserved6: u1,
            /// Connector ID status change
            /// mask
            CIDSCHGM: u1,
            /// Disconnect detected interrupt
            /// mask
            DISCINT: u1,
            /// Session request/new session detected
            /// interrupt mask
            SRQIM: u1,
            /// Resume/remote wakeup detected interrupt
            /// mask
            WUIM: u1,
        }), base_address + 0x18);

        /// address: 0x5000001c
        /// OTG_FS Receive status debug read(Device
        /// mode)
        pub const FS_GRXSTSR_Device = @intToPtr(*volatile Mmio(32, packed struct {
            /// Endpoint number
            EPNUM: u4,
            /// Byte count
            BCNT: u11,
            /// Data PID
            DPID: u2,
            /// Packet status
            PKTSTS: u4,
            /// Frame number
            FRMNUM: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
        }), base_address + 0x1c);

        /// address: 0x5000001c
        /// OTG_FS Receive status debug read(Host
        /// mode)
        pub const FS_GRXSTSR_Host = @intToPtr(*volatile Mmio(32, packed struct {
            /// Endpoint number
            EPNUM: u4,
            /// Byte count
            BCNT: u11,
            /// Data PID
            DPID: u2,
            /// Packet status
            PKTSTS: u4,
            /// Frame number
            FRMNUM: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
        }), base_address + 0x1c);

        /// address: 0x50000024
        /// OTG_FS Receive FIFO size register
        /// (OTG_FS_GRXFSIZ)
        pub const FS_GRXFSIZ = @intToPtr(*volatile Mmio(32, packed struct {
            /// RxFIFO depth
            RXFD: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x24);

        /// address: 0x50000028
        /// OTG_FS non-periodic transmit FIFO size
        /// register (Device mode)
        pub const FS_GNPTXFSIZ_Device = @intToPtr(*volatile Mmio(32, packed struct {
            /// Endpoint 0 transmit RAM start
            /// address
            TX0FSA: u16,
            /// Endpoint 0 TxFIFO depth
            TX0FD: u16,
        }), base_address + 0x28);

        /// address: 0x50000028
        /// OTG_FS non-periodic transmit FIFO size
        /// register (Host mode)
        pub const FS_GNPTXFSIZ_Host = @intToPtr(*volatile Mmio(32, packed struct {
            /// Non-periodic transmit RAM start
            /// address
            NPTXFSA: u16,
            /// Non-periodic TxFIFO depth
            NPTXFD: u16,
        }), base_address + 0x28);

        /// address: 0x5000002c
        /// OTG_FS non-periodic transmit FIFO/queue
        /// status register (OTG_FS_GNPTXSTS)
        pub const FS_GNPTXSTS = @intToPtr(*volatile Mmio(32, packed struct {
            /// Non-periodic TxFIFO space
            /// available
            NPTXFSAV: u16,
            /// Non-periodic transmit request queue
            /// space available
            NPTQXSAV: u8,
            /// Top of the non-periodic transmit request
            /// queue
            NPTXQTOP: u7,
            padding0: u1,
        }), base_address + 0x2c);

        /// address: 0x50000038
        /// OTG_FS general core configuration register
        /// (OTG_FS_GCCFG)
        pub const FS_GCCFG = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            /// Power down
            PWRDWN: u1,
            reserved16: u1,
            /// Enable the VBUS sensing
            /// device
            VBUSASEN: u1,
            /// Enable the VBUS sensing
            /// device
            VBUSBSEN: u1,
            /// SOF output enable
            SOFOUTEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
        }), base_address + 0x38);

        /// address: 0x5000003c
        /// core ID register
        pub const FS_CID = @intToPtr(*volatile Mmio(32, packed struct {
            /// Product ID field
            PRODUCT_ID: u32,
        }), base_address + 0x3c);

        /// address: 0x50000100
        /// OTG_FS Host periodic transmit FIFO size
        /// register (OTG_FS_HPTXFSIZ)
        pub const FS_HPTXFSIZ = @intToPtr(*volatile Mmio(32, packed struct {
            /// Host periodic TxFIFO start
            /// address
            PTXSA: u16,
            /// Host periodic TxFIFO depth
            PTXFSIZ: u16,
        }), base_address + 0x100);

        /// address: 0x50000104
        /// OTG_FS device IN endpoint transmit FIFO size
        /// register (OTG_FS_DIEPTXF2)
        pub const FS_DIEPTXF1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint FIFO2 transmit RAM start
            /// address
            INEPTXSA: u16,
            /// IN endpoint TxFIFO depth
            INEPTXFD: u16,
        }), base_address + 0x104);

        /// address: 0x50000108
        /// OTG_FS device IN endpoint transmit FIFO size
        /// register (OTG_FS_DIEPTXF3)
        pub const FS_DIEPTXF2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint FIFO3 transmit RAM start
            /// address
            INEPTXSA: u16,
            /// IN endpoint TxFIFO depth
            INEPTXFD: u16,
        }), base_address + 0x108);

        /// address: 0x5000010c
        /// OTG_FS device IN endpoint transmit FIFO size
        /// register (OTG_FS_DIEPTXF4)
        pub const FS_DIEPTXF3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IN endpoint FIFO4 transmit RAM start
            /// address
            INEPTXSA: u16,
            /// IN endpoint TxFIFO depth
            INEPTXFD: u16,
        }), base_address + 0x10c);
    };

    /// USB on the go full speed
    pub const OTG_FS_HOST = struct {
        pub const base_address = 0x50000400;

        /// address: 0x50000400
        /// OTG_FS host configuration register
        /// (OTG_FS_HCFG)
        pub const FS_HCFG = @intToPtr(*volatile Mmio(32, packed struct {
            /// FS/LS PHY clock select
            FSLSPCS: u2,
            /// FS- and LS-only support
            FSLSS: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
        }), base_address + 0x0);

        /// address: 0x50000404
        /// OTG_FS Host frame interval
        /// register
        pub const HFIR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Frame interval
            FRIVL: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x50000408
        /// OTG_FS host frame number/frame time
        /// remaining register (OTG_FS_HFNUM)
        pub const FS_HFNUM = @intToPtr(*volatile Mmio(32, packed struct {
            /// Frame number
            FRNUM: u16,
            /// Frame time remaining
            FTREM: u16,
        }), base_address + 0x8);

        /// address: 0x50000410
        /// OTG_FS_Host periodic transmit FIFO/queue
        /// status register (OTG_FS_HPTXSTS)
        pub const FS_HPTXSTS = @intToPtr(*volatile Mmio(32, packed struct {
            /// Periodic transmit data FIFO space
            /// available
            PTXFSAVL: u16,
            /// Periodic transmit request queue space
            /// available
            PTXQSAV: u8,
            /// Top of the periodic transmit request
            /// queue
            PTXQTOP: u8,
        }), base_address + 0x10);

        /// address: 0x50000414
        /// OTG_FS Host all channels interrupt
        /// register
        pub const HAINT = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x14);

        /// address: 0x50000418
        /// OTG_FS host all channels interrupt mask
        /// register
        pub const HAINTMSK = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel interrupt mask
            HAINTM: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x50000440
        /// OTG_FS host port control and status register
        /// (OTG_FS_HPRT)
        pub const FS_HPRT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port connect status
            PCSTS: u1,
            /// Port connect detected
            PCDET: u1,
            /// Port enable
            PENA: u1,
            /// Port enable/disable change
            PENCHNG: u1,
            /// Port overcurrent active
            POCA: u1,
            /// Port overcurrent change
            POCCHNG: u1,
            /// Port resume
            PRES: u1,
            /// Port suspend
            PSUSP: u1,
            /// Port reset
            PRST: u1,
            reserved0: u1,
            /// Port line status
            PLSTS: u2,
            /// Port power
            PPWR: u1,
            /// Port test control
            PTCTL: u4,
            /// Port speed
            PSPD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0x40);

        /// address: 0x50000500
        /// OTG_FS host channel-0 characteristics
        /// register (OTG_FS_HCCHAR0)
        pub const FS_HCCHAR0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x100);

        /// address: 0x50000520
        /// OTG_FS host channel-1 characteristics
        /// register (OTG_FS_HCCHAR1)
        pub const FS_HCCHAR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x120);

        /// address: 0x50000540
        /// OTG_FS host channel-2 characteristics
        /// register (OTG_FS_HCCHAR2)
        pub const FS_HCCHAR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x140);

        /// address: 0x50000560
        /// OTG_FS host channel-3 characteristics
        /// register (OTG_FS_HCCHAR3)
        pub const FS_HCCHAR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x160);

        /// address: 0x50000580
        /// OTG_FS host channel-4 characteristics
        /// register (OTG_FS_HCCHAR4)
        pub const FS_HCCHAR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x180);

        /// address: 0x500005a0
        /// OTG_FS host channel-5 characteristics
        /// register (OTG_FS_HCCHAR5)
        pub const FS_HCCHAR5 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x1a0);

        /// address: 0x500005c0
        /// OTG_FS host channel-6 characteristics
        /// register (OTG_FS_HCCHAR6)
        pub const FS_HCCHAR6 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x1c0);

        /// address: 0x500005e0
        /// OTG_FS host channel-7 characteristics
        /// register (OTG_FS_HCCHAR7)
        pub const FS_HCCHAR7 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Maximum packet size
            MPSIZ: u11,
            /// Endpoint number
            EPNUM: u4,
            /// Endpoint direction
            EPDIR: u1,
            reserved0: u1,
            /// Low-speed device
            LSDEV: u1,
            /// Endpoint type
            EPTYP: u2,
            /// Multicount
            MCNT: u2,
            /// Device address
            DAD: u7,
            /// Odd frame
            ODDFRM: u1,
            /// Channel disable
            CHDIS: u1,
            /// Channel enable
            CHENA: u1,
        }), base_address + 0x1e0);

        /// address: 0x50000508
        /// OTG_FS host channel-0 interrupt register
        /// (OTG_FS_HCINT0)
        pub const FS_HCINT0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x108);

        /// address: 0x50000528
        /// OTG_FS host channel-1 interrupt register
        /// (OTG_FS_HCINT1)
        pub const FS_HCINT1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x128);

        /// address: 0x50000548
        /// OTG_FS host channel-2 interrupt register
        /// (OTG_FS_HCINT2)
        pub const FS_HCINT2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x148);

        /// address: 0x50000568
        /// OTG_FS host channel-3 interrupt register
        /// (OTG_FS_HCINT3)
        pub const FS_HCINT3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x168);

        /// address: 0x50000588
        /// OTG_FS host channel-4 interrupt register
        /// (OTG_FS_HCINT4)
        pub const FS_HCINT4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x188);

        /// address: 0x500005a8
        /// OTG_FS host channel-5 interrupt register
        /// (OTG_FS_HCINT5)
        pub const FS_HCINT5 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x1a8);

        /// address: 0x500005c8
        /// OTG_FS host channel-6 interrupt register
        /// (OTG_FS_HCINT6)
        pub const FS_HCINT6 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x1c8);

        /// address: 0x500005e8
        /// OTG_FS host channel-7 interrupt register
        /// (OTG_FS_HCINT7)
        pub const FS_HCINT7 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed
            XFRC: u1,
            /// Channel halted
            CHH: u1,
            reserved0: u1,
            /// STALL response received
            /// interrupt
            STALL: u1,
            /// NAK response received
            /// interrupt
            NAK: u1,
            /// ACK response received/transmitted
            /// interrupt
            ACK: u1,
            reserved1: u1,
            /// Transaction error
            TXERR: u1,
            /// Babble error
            BBERR: u1,
            /// Frame overrun
            FRMOR: u1,
            /// Data toggle error
            DTERR: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x1e8);

        /// address: 0x5000050c
        /// OTG_FS host channel-0 mask register
        /// (OTG_FS_HCINTMSK0)
        pub const FS_HCINTMSK0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x10c);

        /// address: 0x5000052c
        /// OTG_FS host channel-1 mask register
        /// (OTG_FS_HCINTMSK1)
        pub const FS_HCINTMSK1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x12c);

        /// address: 0x5000054c
        /// OTG_FS host channel-2 mask register
        /// (OTG_FS_HCINTMSK2)
        pub const FS_HCINTMSK2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x14c);

        /// address: 0x5000056c
        /// OTG_FS host channel-3 mask register
        /// (OTG_FS_HCINTMSK3)
        pub const FS_HCINTMSK3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x16c);

        /// address: 0x5000058c
        /// OTG_FS host channel-4 mask register
        /// (OTG_FS_HCINTMSK4)
        pub const FS_HCINTMSK4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x18c);

        /// address: 0x500005ac
        /// OTG_FS host channel-5 mask register
        /// (OTG_FS_HCINTMSK5)
        pub const FS_HCINTMSK5 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x1ac);

        /// address: 0x500005cc
        /// OTG_FS host channel-6 mask register
        /// (OTG_FS_HCINTMSK6)
        pub const FS_HCINTMSK6 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x1cc);

        /// address: 0x500005ec
        /// OTG_FS host channel-7 mask register
        /// (OTG_FS_HCINTMSK7)
        pub const FS_HCINTMSK7 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer completed mask
            XFRCM: u1,
            /// Channel halted mask
            CHHM: u1,
            reserved0: u1,
            /// STALL response received interrupt
            /// mask
            STALLM: u1,
            /// NAK response received interrupt
            /// mask
            NAKM: u1,
            /// ACK response received/transmitted
            /// interrupt mask
            ACKM: u1,
            /// response received interrupt
            /// mask
            NYET: u1,
            /// Transaction error mask
            TXERRM: u1,
            /// Babble error mask
            BBERRM: u1,
            /// Frame overrun mask
            FRMORM: u1,
            /// Data toggle error mask
            DTERRM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x1ec);

        /// address: 0x50000510
        /// OTG_FS host channel-0 transfer size
        /// register
        pub const FS_HCTSIZ0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x110);

        /// address: 0x50000530
        /// OTG_FS host channel-1 transfer size
        /// register
        pub const FS_HCTSIZ1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x130);

        /// address: 0x50000550
        /// OTG_FS host channel-2 transfer size
        /// register
        pub const FS_HCTSIZ2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x150);

        /// address: 0x50000570
        /// OTG_FS host channel-3 transfer size
        /// register
        pub const FS_HCTSIZ3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x170);

        /// address: 0x50000590
        /// OTG_FS host channel-x transfer size
        /// register
        pub const FS_HCTSIZ4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x190);

        /// address: 0x500005b0
        /// OTG_FS host channel-5 transfer size
        /// register
        pub const FS_HCTSIZ5 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x1b0);

        /// address: 0x500005d0
        /// OTG_FS host channel-6 transfer size
        /// register
        pub const FS_HCTSIZ6 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x1d0);

        /// address: 0x500005f0
        /// OTG_FS host channel-7 transfer size
        /// register
        pub const FS_HCTSIZ7 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Transfer size
            XFRSIZ: u19,
            /// Packet count
            PKTCNT: u10,
            /// Data PID
            DPID: u2,
            padding0: u1,
        }), base_address + 0x1f0);
    };

    /// USB on the go full speed
    pub const OTG_FS_PWRCLK = struct {
        pub const base_address = 0x50000e00;

        /// address: 0x50000e00
        /// OTG_FS power and clock gating control
        /// register
        pub const FS_PCGCCTL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stop PHY clock
            STPPCLK: u1,
            /// Gate HCLK
            GATEHCLK: u1,
            reserved0: u1,
            reserved1: u1,
            /// PHY Suspended
            PHYSUSP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
        }), base_address + 0x0);
    };

    /// Power control
    pub const PWR = struct {
        pub const base_address = 0x40007000;

        /// address: 0x40007000
        /// power control register
        pub const CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low-power deep sleep
            LPDS: u1,
            /// Power down deepsleep
            PDDS: u1,
            /// Clear wakeup flag
            CWUF: u1,
            /// Clear standby flag
            CSBF: u1,
            /// Power voltage detector
            /// enable
            PVDE: u1,
            /// PVD level selection
            PLS: u3,
            /// Disable backup domain write
            /// protection
            DBP: u1,
            /// Flash power down in Stop
            /// mode
            FPDS: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// ADCDC1
            ADCDC1: u1,
            /// Regulator voltage scaling output
            /// selection
            VOS: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40007004
        /// power control/status register
        pub const CSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Wakeup flag
            WUF: u1,
            /// Standby flag
            SBF: u1,
            /// PVD output
            PVDO: u1,
            /// Backup regulator ready
            BRR: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// Enable WKUP pin
            EWUP: u1,
            /// Backup regulator enable
            BRE: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            /// Regulator voltage scaling output
            /// selection ready bit
            VOSRDY: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x4);
    };

    /// Reset and clock control
    pub const RCC = struct {
        pub const base_address = 0x40023800;

        /// address: 0x40023800
        /// clock control register
        pub const CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Internal high-speed clock
            /// enable
            HSION: u1,
            /// Internal high-speed clock ready
            /// flag
            HSIRDY: u1,
            reserved0: u1,
            /// Internal high-speed clock
            /// trimming
            HSITRIM: u5,
            /// Internal high-speed clock
            /// calibration
            HSICAL: u8,
            /// HSE clock enable
            HSEON: u1,
            /// HSE clock ready flag
            HSERDY: u1,
            /// HSE clock bypass
            HSEBYP: u1,
            /// Clock security system
            /// enable
            CSSON: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Main PLL (PLL) enable
            PLLON: u1,
            /// Main PLL (PLL) clock ready
            /// flag
            PLLRDY: u1,
            /// PLLI2S enable
            PLLI2SON: u1,
            /// PLLI2S clock ready flag
            PLLI2SRDY: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x0);

        /// address: 0x40023804
        /// PLL configuration register
        pub const PLLCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Division factor for the main PLL (PLL)
            /// and audio PLL (PLLI2S) input clock
            PLLM0: u1,
            /// Division factor for the main PLL (PLL)
            /// and audio PLL (PLLI2S) input clock
            PLLM1: u1,
            /// Division factor for the main PLL (PLL)
            /// and audio PLL (PLLI2S) input clock
            PLLM2: u1,
            /// Division factor for the main PLL (PLL)
            /// and audio PLL (PLLI2S) input clock
            PLLM3: u1,
            /// Division factor for the main PLL (PLL)
            /// and audio PLL (PLLI2S) input clock
            PLLM4: u1,
            /// Division factor for the main PLL (PLL)
            /// and audio PLL (PLLI2S) input clock
            PLLM5: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN0: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN1: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN2: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN3: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN4: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN5: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN6: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN7: u1,
            /// Main PLL (PLL) multiplication factor for
            /// VCO
            PLLN8: u1,
            reserved0: u1,
            /// Main PLL (PLL) division factor for main
            /// system clock
            PLLP0: u1,
            /// Main PLL (PLL) division factor for main
            /// system clock
            PLLP1: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Main PLL(PLL) and audio PLL (PLLI2S)
            /// entry clock source
            PLLSRC: u1,
            reserved5: u1,
            /// Main PLL (PLL) division factor for USB
            /// OTG FS, SDIO and random number generator
            /// clocks
            PLLQ0: u1,
            /// Main PLL (PLL) division factor for USB
            /// OTG FS, SDIO and random number generator
            /// clocks
            PLLQ1: u1,
            /// Main PLL (PLL) division factor for USB
            /// OTG FS, SDIO and random number generator
            /// clocks
            PLLQ2: u1,
            /// Main PLL (PLL) division factor for USB
            /// OTG FS, SDIO and random number generator
            /// clocks
            PLLQ3: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x4);

        /// address: 0x40023808
        /// clock configuration register
        pub const CFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// System clock switch
            SW0: u1,
            /// System clock switch
            SW1: u1,
            /// System clock switch status
            SWS0: u1,
            /// System clock switch status
            SWS1: u1,
            /// AHB prescaler
            HPRE: u4,
            reserved0: u1,
            reserved1: u1,
            /// APB Low speed prescaler
            /// (APB1)
            PPRE1: u3,
            /// APB high-speed prescaler
            /// (APB2)
            PPRE2: u3,
            /// HSE division factor for RTC
            /// clock
            RTCPRE: u5,
            /// Microcontroller clock output
            /// 1
            MCO1: u2,
            /// I2S clock selection
            I2SSRC: u1,
            /// MCO1 prescaler
            MCO1PRE: u3,
            /// MCO2 prescaler
            MCO2PRE: u3,
            /// Microcontroller clock output
            /// 2
            MCO2: u2,
        }), base_address + 0x8);

        /// address: 0x4002380c
        /// clock interrupt register
        pub const CIR = @intToPtr(*volatile Mmio(32, packed struct {
            /// LSI ready interrupt flag
            LSIRDYF: u1,
            /// LSE ready interrupt flag
            LSERDYF: u1,
            /// HSI ready interrupt flag
            HSIRDYF: u1,
            /// HSE ready interrupt flag
            HSERDYF: u1,
            /// Main PLL (PLL) ready interrupt
            /// flag
            PLLRDYF: u1,
            /// PLLI2S ready interrupt
            /// flag
            PLLI2SRDYF: u1,
            reserved0: u1,
            /// Clock security system interrupt
            /// flag
            CSSF: u1,
            /// LSI ready interrupt enable
            LSIRDYIE: u1,
            /// LSE ready interrupt enable
            LSERDYIE: u1,
            /// HSI ready interrupt enable
            HSIRDYIE: u1,
            /// HSE ready interrupt enable
            HSERDYIE: u1,
            /// Main PLL (PLL) ready interrupt
            /// enable
            PLLRDYIE: u1,
            /// PLLI2S ready interrupt
            /// enable
            PLLI2SRDYIE: u1,
            reserved1: u1,
            reserved2: u1,
            /// LSI ready interrupt clear
            LSIRDYC: u1,
            /// LSE ready interrupt clear
            LSERDYC: u1,
            /// HSI ready interrupt clear
            HSIRDYC: u1,
            /// HSE ready interrupt clear
            HSERDYC: u1,
            /// Main PLL(PLL) ready interrupt
            /// clear
            PLLRDYC: u1,
            /// PLLI2S ready interrupt
            /// clear
            PLLI2SRDYC: u1,
            reserved3: u1,
            /// Clock security system interrupt
            /// clear
            CSSC: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0xc);

        /// address: 0x40023810
        /// AHB1 peripheral reset register
        pub const AHB1RSTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// IO port A reset
            GPIOARST: u1,
            /// IO port B reset
            GPIOBRST: u1,
            /// IO port C reset
            GPIOCRST: u1,
            /// IO port D reset
            GPIODRST: u1,
            /// IO port E reset
            GPIOERST: u1,
            reserved0: u1,
            reserved1: u1,
            /// IO port H reset
            GPIOHRST: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// CRC reset
            CRCRST: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            /// DMA2 reset
            DMA1RST: u1,
            /// DMA2 reset
            DMA2RST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x10);

        /// address: 0x40023814
        /// AHB2 peripheral reset register
        pub const AHB2RSTR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// USB OTG FS module reset
            OTGFSRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x14);

        /// address: 0x40023820
        /// APB1 peripheral reset register
        pub const APB1RSTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM2 reset
            TIM2RST: u1,
            /// TIM3 reset
            TIM3RST: u1,
            /// TIM4 reset
            TIM4RST: u1,
            /// TIM5 reset
            TIM5RST: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Window watchdog reset
            WWDGRST: u1,
            reserved7: u1,
            reserved8: u1,
            /// SPI 2 reset
            SPI2RST: u1,
            /// SPI 3 reset
            SPI3RST: u1,
            reserved9: u1,
            /// USART 2 reset
            UART2RST: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            /// I2C 1 reset
            I2C1RST: u1,
            /// I2C 2 reset
            I2C2RST: u1,
            /// I2C3 reset
            I2C3RST: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            /// Power interface reset
            PWRRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
        }), base_address + 0x20);

        /// address: 0x40023824
        /// APB2 peripheral reset register
        pub const APB2RSTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM1 reset
            TIM1RST: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// USART1 reset
            USART1RST: u1,
            /// USART6 reset
            USART6RST: u1,
            reserved3: u1,
            reserved4: u1,
            /// ADC interface reset (common to all
            /// ADCs)
            ADCRST: u1,
            reserved5: u1,
            reserved6: u1,
            /// SDIO reset
            SDIORST: u1,
            /// SPI 1 reset
            SPI1RST: u1,
            reserved7: u1,
            /// System configuration controller
            /// reset
            SYSCFGRST: u1,
            reserved8: u1,
            /// TIM9 reset
            TIM9RST: u1,
            /// TIM10 reset
            TIM10RST: u1,
            /// TIM11 reset
            TIM11RST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0x24);

        /// address: 0x40023830
        /// AHB1 peripheral clock register
        pub const AHB1ENR = @intToPtr(*volatile Mmio(32, packed struct {
            /// IO port A clock enable
            GPIOAEN: u1,
            /// IO port B clock enable
            GPIOBEN: u1,
            /// IO port C clock enable
            GPIOCEN: u1,
            /// IO port D clock enable
            GPIODEN: u1,
            /// IO port E clock enable
            GPIOEEN: u1,
            reserved0: u1,
            reserved1: u1,
            /// IO port H clock enable
            GPIOHEN: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// CRC clock enable
            CRCEN: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            /// DMA1 clock enable
            DMA1EN: u1,
            /// DMA2 clock enable
            DMA2EN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x30);

        /// address: 0x40023834
        /// AHB2 peripheral clock enable
        /// register
        pub const AHB2ENR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// USB OTG FS clock enable
            OTGFSEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x34);

        /// address: 0x40023840
        /// APB1 peripheral clock enable
        /// register
        pub const APB1ENR = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM2 clock enable
            TIM2EN: u1,
            /// TIM3 clock enable
            TIM3EN: u1,
            /// TIM4 clock enable
            TIM4EN: u1,
            /// TIM5 clock enable
            TIM5EN: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Window watchdog clock
            /// enable
            WWDGEN: u1,
            reserved7: u1,
            reserved8: u1,
            /// SPI2 clock enable
            SPI2EN: u1,
            /// SPI3 clock enable
            SPI3EN: u1,
            reserved9: u1,
            /// USART 2 clock enable
            USART2EN: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            /// I2C1 clock enable
            I2C1EN: u1,
            /// I2C2 clock enable
            I2C2EN: u1,
            /// I2C3 clock enable
            I2C3EN: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            /// Power interface clock
            /// enable
            PWREN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
        }), base_address + 0x40);

        /// address: 0x40023844
        /// APB2 peripheral clock enable
        /// register
        pub const APB2ENR = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM1 clock enable
            TIM1EN: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// USART1 clock enable
            USART1EN: u1,
            /// USART6 clock enable
            USART6EN: u1,
            reserved3: u1,
            reserved4: u1,
            /// ADC1 clock enable
            ADC1EN: u1,
            reserved5: u1,
            reserved6: u1,
            /// SDIO clock enable
            SDIOEN: u1,
            /// SPI1 clock enable
            SPI1EN: u1,
            /// SPI4 clock enable
            SPI4EN: u1,
            /// System configuration controller clock
            /// enable
            SYSCFGEN: u1,
            reserved7: u1,
            /// TIM9 clock enable
            TIM9EN: u1,
            /// TIM10 clock enable
            TIM10EN: u1,
            /// TIM11 clock enable
            TIM11EN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0x44);

        /// address: 0x40023850
        /// AHB1 peripheral clock enable in low power
        /// mode register
        pub const AHB1LPENR = @intToPtr(*volatile Mmio(32, packed struct {
            /// IO port A clock enable during sleep
            /// mode
            GPIOALPEN: u1,
            /// IO port B clock enable during Sleep
            /// mode
            GPIOBLPEN: u1,
            /// IO port C clock enable during Sleep
            /// mode
            GPIOCLPEN: u1,
            /// IO port D clock enable during Sleep
            /// mode
            GPIODLPEN: u1,
            /// IO port E clock enable during Sleep
            /// mode
            GPIOELPEN: u1,
            reserved0: u1,
            reserved1: u1,
            /// IO port H clock enable during Sleep
            /// mode
            GPIOHLPEN: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// CRC clock enable during Sleep
            /// mode
            CRCLPEN: u1,
            reserved6: u1,
            reserved7: u1,
            /// Flash interface clock enable during
            /// Sleep mode
            FLITFLPEN: u1,
            /// SRAM 1interface clock enable during
            /// Sleep mode
            SRAM1LPEN: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            /// DMA1 clock enable during Sleep
            /// mode
            DMA1LPEN: u1,
            /// DMA2 clock enable during Sleep
            /// mode
            DMA2LPEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x50);

        /// address: 0x40023854
        /// AHB2 peripheral clock enable in low power
        /// mode register
        pub const AHB2LPENR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// USB OTG FS clock enable during Sleep
            /// mode
            OTGFSLPEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x54);

        /// address: 0x40023860
        /// APB1 peripheral clock enable in low power
        /// mode register
        pub const APB1LPENR = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM2 clock enable during Sleep
            /// mode
            TIM2LPEN: u1,
            /// TIM3 clock enable during Sleep
            /// mode
            TIM3LPEN: u1,
            /// TIM4 clock enable during Sleep
            /// mode
            TIM4LPEN: u1,
            /// TIM5 clock enable during Sleep
            /// mode
            TIM5LPEN: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Window watchdog clock enable during
            /// Sleep mode
            WWDGLPEN: u1,
            reserved7: u1,
            reserved8: u1,
            /// SPI2 clock enable during Sleep
            /// mode
            SPI2LPEN: u1,
            /// SPI3 clock enable during Sleep
            /// mode
            SPI3LPEN: u1,
            reserved9: u1,
            /// USART2 clock enable during Sleep
            /// mode
            USART2LPEN: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            /// I2C1 clock enable during Sleep
            /// mode
            I2C1LPEN: u1,
            /// I2C2 clock enable during Sleep
            /// mode
            I2C2LPEN: u1,
            /// I2C3 clock enable during Sleep
            /// mode
            I2C3LPEN: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            /// Power interface clock enable during
            /// Sleep mode
            PWRLPEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
        }), base_address + 0x60);

        /// address: 0x40023864
        /// APB2 peripheral clock enabled in low power
        /// mode register
        pub const APB2LPENR = @intToPtr(*volatile Mmio(32, packed struct {
            /// TIM1 clock enable during Sleep
            /// mode
            TIM1LPEN: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// USART1 clock enable during Sleep
            /// mode
            USART1LPEN: u1,
            /// USART6 clock enable during Sleep
            /// mode
            USART6LPEN: u1,
            reserved3: u1,
            reserved4: u1,
            /// ADC1 clock enable during Sleep
            /// mode
            ADC1LPEN: u1,
            reserved5: u1,
            reserved6: u1,
            /// SDIO clock enable during Sleep
            /// mode
            SDIOLPEN: u1,
            /// SPI 1 clock enable during Sleep
            /// mode
            SPI1LPEN: u1,
            /// SPI4 clock enable during Sleep
            /// mode
            SPI4LPEN: u1,
            /// System configuration controller clock
            /// enable during Sleep mode
            SYSCFGLPEN: u1,
            reserved7: u1,
            /// TIM9 clock enable during sleep
            /// mode
            TIM9LPEN: u1,
            /// TIM10 clock enable during Sleep
            /// mode
            TIM10LPEN: u1,
            /// TIM11 clock enable during Sleep
            /// mode
            TIM11LPEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0x64);

        /// address: 0x40023870
        /// Backup domain control register
        pub const BDCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// External low-speed oscillator
            /// enable
            LSEON: u1,
            /// External low-speed oscillator
            /// ready
            LSERDY: u1,
            /// External low-speed oscillator
            /// bypass
            LSEBYP: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// RTC clock source selection
            RTCSEL0: u1,
            /// RTC clock source selection
            RTCSEL1: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            /// RTC clock enable
            RTCEN: u1,
            /// Backup domain software
            /// reset
            BDRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x70);

        /// address: 0x40023874
        /// clock control & status
        /// register
        pub const CSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Internal low-speed oscillator
            /// enable
            LSION: u1,
            /// Internal low-speed oscillator
            /// ready
            LSIRDY: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            reserved20: u1,
            reserved21: u1,
            /// Remove reset flag
            RMVF: u1,
            /// BOR reset flag
            BORRSTF: u1,
            /// PIN reset flag
            PADRSTF: u1,
            /// POR/PDR reset flag
            PORRSTF: u1,
            /// Software reset flag
            SFTRSTF: u1,
            /// Independent watchdog reset
            /// flag
            WDGRSTF: u1,
            /// Window watchdog reset flag
            WWDGRSTF: u1,
            /// Low-power reset flag
            LPWRRSTF: u1,
        }), base_address + 0x74);

        /// address: 0x40023880
        /// spread spectrum clock generation
        /// register
        pub const SSCGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Modulation period
            MODPER: u13,
            /// Incrementation step
            INCSTEP: u15,
            reserved0: u1,
            reserved1: u1,
            /// Spread Select
            SPREADSEL: u1,
            /// Spread spectrum modulation
            /// enable
            SSCGEN: u1,
        }), base_address + 0x80);

        /// address: 0x40023884
        /// PLLI2S configuration register
        pub const PLLI2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// PLLI2S multiplication factor for
            /// VCO
            PLLI2SNx: u9,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            /// PLLI2S division factor for I2S
            /// clocks
            PLLI2SRx: u3,
            padding0: u1,
        }), base_address + 0x84);
    };

    /// Real-time clock
    pub const RTC = struct {
        pub const base_address = 0x40002800;

        /// address: 0x40002800
        /// time register
        pub const TR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Second units in BCD format
            SU: u4,
            /// Second tens in BCD format
            ST: u3,
            reserved0: u1,
            /// Minute units in BCD format
            MNU: u4,
            /// Minute tens in BCD format
            MNT: u3,
            reserved1: u1,
            /// Hour units in BCD format
            HU: u4,
            /// Hour tens in BCD format
            HT: u2,
            /// AM/PM notation
            PM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x0);

        /// address: 0x40002804
        /// date register
        pub const DR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Date units in BCD format
            DU: u4,
            /// Date tens in BCD format
            DT: u2,
            reserved0: u1,
            reserved1: u1,
            /// Month units in BCD format
            MU: u4,
            /// Month tens in BCD format
            MT: u1,
            /// Week day units
            WDU: u3,
            /// Year units in BCD format
            YU: u4,
            /// Year tens in BCD format
            YT: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x4);

        /// address: 0x40002808
        /// control register
        pub const CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Wakeup clock selection
            WCKSEL: u3,
            /// Time-stamp event active
            /// edge
            TSEDGE: u1,
            /// Reference clock detection enable (50 or
            /// 60 Hz)
            REFCKON: u1,
            /// Bypass the shadow
            /// registers
            BYPSHAD: u1,
            /// Hour format
            FMT: u1,
            /// Coarse digital calibration
            /// enable
            DCE: u1,
            /// Alarm A enable
            ALRAE: u1,
            /// Alarm B enable
            ALRBE: u1,
            /// Wakeup timer enable
            WUTE: u1,
            /// Time stamp enable
            TSE: u1,
            /// Alarm A interrupt enable
            ALRAIE: u1,
            /// Alarm B interrupt enable
            ALRBIE: u1,
            /// Wakeup timer interrupt
            /// enable
            WUTIE: u1,
            /// Time-stamp interrupt
            /// enable
            TSIE: u1,
            /// Add 1 hour (summer time
            /// change)
            ADD1H: u1,
            /// Subtract 1 hour (winter time
            /// change)
            SUB1H: u1,
            /// Backup
            BKP: u1,
            /// Calibration Output
            /// selection
            COSEL: u1,
            /// Output polarity
            POL: u1,
            /// Output selection
            OSEL: u2,
            /// Calibration output enable
            COE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x8);

        /// address: 0x4000280c
        /// initialization and status
        /// register
        pub const ISR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alarm A write flag
            ALRAWF: u1,
            /// Alarm B write flag
            ALRBWF: u1,
            /// Wakeup timer write flag
            WUTWF: u1,
            /// Shift operation pending
            SHPF: u1,
            /// Initialization status flag
            INITS: u1,
            /// Registers synchronization
            /// flag
            RSF: u1,
            /// Initialization flag
            INITF: u1,
            /// Initialization mode
            INIT: u1,
            /// Alarm A flag
            ALRAF: u1,
            /// Alarm B flag
            ALRBF: u1,
            /// Wakeup timer flag
            WUTF: u1,
            /// Time-stamp flag
            TSF: u1,
            /// Time-stamp overflow flag
            TSOVF: u1,
            /// Tamper detection flag
            TAMP1F: u1,
            /// TAMPER2 detection flag
            TAMP2F: u1,
            reserved0: u1,
            /// Recalibration pending Flag
            RECALPF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0xc);

        /// address: 0x40002810
        /// prescaler register
        pub const PRER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Synchronous prescaler
            /// factor
            PREDIV_S: u15,
            reserved0: u1,
            /// Asynchronous prescaler
            /// factor
            PREDIV_A: u7,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x10);

        /// address: 0x40002814
        /// wakeup timer register
        pub const WUTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Wakeup auto-reload value
            /// bits
            WUT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40002818
        /// calibration register
        pub const CALIBR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Digital calibration
            DC: u5,
            reserved0: u1,
            reserved1: u1,
            /// Digital calibration sign
            DCS: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x18);

        /// address: 0x4000281c
        /// alarm A register
        pub const ALRMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Second units in BCD format
            SU: u4,
            /// Second tens in BCD format
            ST: u3,
            /// Alarm A seconds mask
            MSK1: u1,
            /// Minute units in BCD format
            MNU: u4,
            /// Minute tens in BCD format
            MNT: u3,
            /// Alarm A minutes mask
            MSK2: u1,
            /// Hour units in BCD format
            HU: u4,
            /// Hour tens in BCD format
            HT: u2,
            /// AM/PM notation
            PM: u1,
            /// Alarm A hours mask
            MSK3: u1,
            /// Date units or day in BCD
            /// format
            DU: u4,
            /// Date tens in BCD format
            DT: u2,
            /// Week day selection
            WDSEL: u1,
            /// Alarm A date mask
            MSK4: u1,
        }), base_address + 0x1c);

        /// address: 0x40002820
        /// alarm B register
        pub const ALRMBR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Second units in BCD format
            SU: u4,
            /// Second tens in BCD format
            ST: u3,
            /// Alarm B seconds mask
            MSK1: u1,
            /// Minute units in BCD format
            MNU: u4,
            /// Minute tens in BCD format
            MNT: u3,
            /// Alarm B minutes mask
            MSK2: u1,
            /// Hour units in BCD format
            HU: u4,
            /// Hour tens in BCD format
            HT: u2,
            /// AM/PM notation
            PM: u1,
            /// Alarm B hours mask
            MSK3: u1,
            /// Date units or day in BCD
            /// format
            DU: u4,
            /// Date tens in BCD format
            DT: u2,
            /// Week day selection
            WDSEL: u1,
            /// Alarm B date mask
            MSK4: u1,
        }), base_address + 0x20);

        /// address: 0x40002824
        /// write protection register
        pub const WPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Write protection key
            KEY: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x24);

        /// address: 0x40002828
        /// sub second register
        pub const SSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Sub second value
            SS: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x28);

        /// address: 0x4000282c
        /// shift control register
        pub const SHIFTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Subtract a fraction of a
            /// second
            SUBFS: u15,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            /// Add one second
            ADD1S: u1,
        }), base_address + 0x2c);

        /// address: 0x40002830
        /// time stamp time register
        pub const TSTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Second units in BCD format
            SU: u4,
            /// Second tens in BCD format
            ST: u3,
            reserved0: u1,
            /// Minute units in BCD format
            MNU: u4,
            /// Minute tens in BCD format
            MNT: u3,
            reserved1: u1,
            /// Hour units in BCD format
            HU: u4,
            /// Hour tens in BCD format
            HT: u2,
            /// AM/PM notation
            PM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
        }), base_address + 0x30);

        /// address: 0x40002834
        /// time stamp date register
        pub const TSDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Date units in BCD format
            DU: u4,
            /// Date tens in BCD format
            DT: u2,
            reserved0: u1,
            reserved1: u1,
            /// Month units in BCD format
            MU: u4,
            /// Month tens in BCD format
            MT: u1,
            /// Week day units
            WDU: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x34);

        /// address: 0x40002838
        /// timestamp sub second register
        pub const TSSSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Sub second value
            SS: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x38);

        /// address: 0x4000283c
        /// calibration register
        pub const CALR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Calibration minus
            CALM: u9,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// Use a 16-second calibration cycle
            /// period
            CALW16: u1,
            /// Use an 8-second calibration cycle
            /// period
            CALW8: u1,
            /// Increase frequency of RTC by 488.5
            /// ppm
            CALP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x3c);

        /// address: 0x40002840
        /// tamper and alternate function configuration
        /// register
        pub const TAFCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tamper 1 detection enable
            TAMP1E: u1,
            /// Active level for tamper 1
            TAMP1TRG: u1,
            /// Tamper interrupt enable
            TAMPIE: u1,
            /// Tamper 2 detection enable
            TAMP2E: u1,
            /// Active level for tamper 2
            TAMP2TRG: u1,
            reserved0: u1,
            reserved1: u1,
            /// Activate timestamp on tamper detection
            /// event
            TAMPTS: u1,
            /// Tamper sampling frequency
            TAMPFREQ: u3,
            /// Tamper filter count
            TAMPFLT: u2,
            /// Tamper precharge duration
            TAMPPRCH: u2,
            /// TAMPER pull-up disable
            TAMPPUDIS: u1,
            /// TAMPER1 mapping
            TAMP1INSEL: u1,
            /// TIMESTAMP mapping
            TSINSEL: u1,
            /// AFO_ALARM output type
            ALARMOUTTYPE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0x40);

        /// address: 0x40002844
        /// alarm A sub second register
        pub const ALRMASSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Sub seconds value
            SS: u15,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            /// Mask the most-significant bits starting
            /// at this bit
            MASKSS: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x44);

        /// address: 0x40002848
        /// alarm B sub second register
        pub const ALRMBSSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Sub seconds value
            SS: u15,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            /// Mask the most-significant bits starting
            /// at this bit
            MASKSS: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x48);

        /// address: 0x40002850
        /// backup register
        pub const BKP0R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x50);

        /// address: 0x40002854
        /// backup register
        pub const BKP1R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x54);

        /// address: 0x40002858
        /// backup register
        pub const BKP2R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x58);

        /// address: 0x4000285c
        /// backup register
        pub const BKP3R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x5c);

        /// address: 0x40002860
        /// backup register
        pub const BKP4R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x60);

        /// address: 0x40002864
        /// backup register
        pub const BKP5R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x64);

        /// address: 0x40002868
        /// backup register
        pub const BKP6R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x68);

        /// address: 0x4000286c
        /// backup register
        pub const BKP7R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x6c);

        /// address: 0x40002870
        /// backup register
        pub const BKP8R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x70);

        /// address: 0x40002874
        /// backup register
        pub const BKP9R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x74);

        /// address: 0x40002878
        /// backup register
        pub const BKP10R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x78);

        /// address: 0x4000287c
        /// backup register
        pub const BKP11R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x7c);

        /// address: 0x40002880
        /// backup register
        pub const BKP12R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x80);

        /// address: 0x40002884
        /// backup register
        pub const BKP13R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x84);

        /// address: 0x40002888
        /// backup register
        pub const BKP14R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x88);

        /// address: 0x4000288c
        /// backup register
        pub const BKP15R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x8c);

        /// address: 0x40002890
        /// backup register
        pub const BKP16R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x90);

        /// address: 0x40002894
        /// backup register
        pub const BKP17R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x94);

        /// address: 0x40002898
        /// backup register
        pub const BKP18R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x98);

        /// address: 0x4000289c
        /// backup register
        pub const BKP19R = @intToPtr(*volatile Mmio(32, packed struct {
            /// BKP
            BKP: u32,
        }), base_address + 0x9c);
    };

    /// Secure digital input/output
    /// interface
    pub const SDIO = struct {
        pub const base_address = 0x40012c00;

        /// address: 0x40012c00
        /// power control register
        pub const POWER = @intToPtr(*volatile Mmio(32, packed struct {
            /// PWRCTRL
            PWRCTRL: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0x0);

        /// address: 0x40012c04
        /// SDI clock control register
        pub const CLKCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock divide factor
            CLKDIV: u8,
            /// Clock enable bit
            CLKEN: u1,
            /// Power saving configuration
            /// bit
            PWRSAV: u1,
            /// Clock divider bypass enable
            /// bit
            BYPASS: u1,
            /// Wide bus mode enable bit
            WIDBUS: u2,
            /// SDIO_CK dephasing selection
            /// bit
            NEGEDGE: u1,
            /// HW Flow Control enable
            HWFC_EN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x4);

        /// address: 0x40012c08
        /// argument register
        pub const ARG = @intToPtr(*volatile Mmio(32, packed struct {
            /// Command argument
            CMDARG: u32,
        }), base_address + 0x8);

        /// address: 0x40012c0c
        /// command register
        pub const CMD = @intToPtr(*volatile Mmio(32, packed struct {
            /// Command index
            CMDINDEX: u6,
            /// Wait for response bits
            WAITRESP: u2,
            /// CPSM waits for interrupt
            /// request
            WAITINT: u1,
            /// CPSM Waits for ends of data transfer
            /// (CmdPend internal signal).
            WAITPEND: u1,
            /// Command path state machine (CPSM) Enable
            /// bit
            CPSMEN: u1,
            /// SD I/O suspend command
            SDIOSuspend: u1,
            /// Enable CMD completion
            ENCMDcompl: u1,
            /// not Interrupt Enable
            nIEN: u1,
            /// CE-ATA command
            CE_ATACMD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40012c10
        /// command response register
        pub const RESPCMD = @intToPtr(*volatile MmioInt(32, u6), base_address + 0x10);

        /// address: 0x40012c14
        /// response 1..4 register
        pub const RESP1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Card Status
            CARDSTATUS1: u32,
        }), base_address + 0x14);

        /// address: 0x40012c18
        /// response 1..4 register
        pub const RESP2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Card Status
            CARDSTATUS2: u32,
        }), base_address + 0x18);

        /// address: 0x40012c1c
        /// response 1..4 register
        pub const RESP3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Card Status
            CARDSTATUS3: u32,
        }), base_address + 0x1c);

        /// address: 0x40012c20
        /// response 1..4 register
        pub const RESP4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Card Status
            CARDSTATUS4: u32,
        }), base_address + 0x20);

        /// address: 0x40012c24
        /// data timer register
        pub const DTIMER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data timeout period
            DATATIME: u32,
        }), base_address + 0x24);

        /// address: 0x40012c28
        /// data length register
        pub const DLEN = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data length value
            DATALENGTH: u25,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
        }), base_address + 0x28);

        /// address: 0x40012c2c
        /// data control register
        pub const DCTRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// DTEN
            DTEN: u1,
            /// Data transfer direction
            /// selection
            DTDIR: u1,
            /// Data transfer mode selection 1: Stream
            /// or SDIO multibyte data transfer.
            DTMODE: u1,
            /// DMA enable bit
            DMAEN: u1,
            /// Data block size
            DBLOCKSIZE: u4,
            /// Read wait start
            RWSTART: u1,
            /// Read wait stop
            RWSTOP: u1,
            /// Read wait mode
            RWMOD: u1,
            /// SD I/O enable functions
            SDIOEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x2c);

        /// address: 0x40012c30
        /// data counter register
        pub const DCOUNT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Data count value
            DATACOUNT: u25,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
        }), base_address + 0x30);

        /// address: 0x40012c34
        /// status register
        pub const STA = @intToPtr(*volatile Mmio(32, packed struct {
            /// Command response received (CRC check
            /// failed)
            CCRCFAIL: u1,
            /// Data block sent/received (CRC check
            /// failed)
            DCRCFAIL: u1,
            /// Command response timeout
            CTIMEOUT: u1,
            /// Data timeout
            DTIMEOUT: u1,
            /// Transmit FIFO underrun
            /// error
            TXUNDERR: u1,
            /// Received FIFO overrun
            /// error
            RXOVERR: u1,
            /// Command response received (CRC check
            /// passed)
            CMDREND: u1,
            /// Command sent (no response
            /// required)
            CMDSENT: u1,
            /// Data end (data counter, SDIDCOUNT, is
            /// zero)
            DATAEND: u1,
            /// Start bit not detected on all data
            /// signals in wide bus mode
            STBITERR: u1,
            /// Data block sent/received (CRC check
            /// passed)
            DBCKEND: u1,
            /// Command transfer in
            /// progress
            CMDACT: u1,
            /// Data transmit in progress
            TXACT: u1,
            /// Data receive in progress
            RXACT: u1,
            /// Transmit FIFO half empty: at least 8
            /// words can be written into the FIFO
            TXFIFOHE: u1,
            /// Receive FIFO half full: there are at
            /// least 8 words in the FIFO
            RXFIFOHF: u1,
            /// Transmit FIFO full
            TXFIFOF: u1,
            /// Receive FIFO full
            RXFIFOF: u1,
            /// Transmit FIFO empty
            TXFIFOE: u1,
            /// Receive FIFO empty
            RXFIFOE: u1,
            /// Data available in transmit
            /// FIFO
            TXDAVL: u1,
            /// Data available in receive
            /// FIFO
            RXDAVL: u1,
            /// SDIO interrupt received
            SDIOIT: u1,
            /// CE-ATA command completion signal
            /// received for CMD61
            CEATAEND: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x34);

        /// address: 0x40012c38
        /// interrupt clear register
        pub const ICR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CCRCFAIL flag clear bit
            CCRCFAILC: u1,
            /// DCRCFAIL flag clear bit
            DCRCFAILC: u1,
            /// CTIMEOUT flag clear bit
            CTIMEOUTC: u1,
            /// DTIMEOUT flag clear bit
            DTIMEOUTC: u1,
            /// TXUNDERR flag clear bit
            TXUNDERRC: u1,
            /// RXOVERR flag clear bit
            RXOVERRC: u1,
            /// CMDREND flag clear bit
            CMDRENDC: u1,
            /// CMDSENT flag clear bit
            CMDSENTC: u1,
            /// DATAEND flag clear bit
            DATAENDC: u1,
            /// STBITERR flag clear bit
            STBITERRC: u1,
            /// DBCKEND flag clear bit
            DBCKENDC: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            /// SDIOIT flag clear bit
            SDIOITC: u1,
            /// CEATAEND flag clear bit
            CEATAENDC: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x38);

        /// address: 0x40012c3c
        /// mask register
        pub const MASK = @intToPtr(*volatile Mmio(32, packed struct {
            /// Command CRC fail interrupt
            /// enable
            CCRCFAILIE: u1,
            /// Data CRC fail interrupt
            /// enable
            DCRCFAILIE: u1,
            /// Command timeout interrupt
            /// enable
            CTIMEOUTIE: u1,
            /// Data timeout interrupt
            /// enable
            DTIMEOUTIE: u1,
            /// Tx FIFO underrun error interrupt
            /// enable
            TXUNDERRIE: u1,
            /// Rx FIFO overrun error interrupt
            /// enable
            RXOVERRIE: u1,
            /// Command response received interrupt
            /// enable
            CMDRENDIE: u1,
            /// Command sent interrupt
            /// enable
            CMDSENTIE: u1,
            /// Data end interrupt enable
            DATAENDIE: u1,
            /// Start bit error interrupt
            /// enable
            STBITERRIE: u1,
            /// Data block end interrupt
            /// enable
            DBCKENDIE: u1,
            /// Command acting interrupt
            /// enable
            CMDACTIE: u1,
            /// Data transmit acting interrupt
            /// enable
            TXACTIE: u1,
            /// Data receive acting interrupt
            /// enable
            RXACTIE: u1,
            /// Tx FIFO half empty interrupt
            /// enable
            TXFIFOHEIE: u1,
            /// Rx FIFO half full interrupt
            /// enable
            RXFIFOHFIE: u1,
            /// Tx FIFO full interrupt
            /// enable
            TXFIFOFIE: u1,
            /// Rx FIFO full interrupt
            /// enable
            RXFIFOFIE: u1,
            /// Tx FIFO empty interrupt
            /// enable
            TXFIFOEIE: u1,
            /// Rx FIFO empty interrupt
            /// enable
            RXFIFOEIE: u1,
            /// Data available in Tx FIFO interrupt
            /// enable
            TXDAVLIE: u1,
            /// Data available in Rx FIFO interrupt
            /// enable
            RXDAVLIE: u1,
            /// SDIO mode interrupt received interrupt
            /// enable
            SDIOITIE: u1,
            /// CE-ATA command completion signal
            /// received interrupt enable
            CEATAENDIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x3c);

        /// address: 0x40012c48
        /// FIFO counter register
        pub const FIFOCNT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Remaining number of words to be written
            /// to or read from the FIFO.
            FIFOCOUNT: u24,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x48);

        /// address: 0x40012c80
        /// data FIFO register
        pub const FIFO = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive and transmit FIFO
            /// data
            FIFOData: u32,
        }), base_address + 0x80);
    };

    /// System configuration controller
    pub const SYSCFG = struct {
        pub const base_address = 0x40013800;

        /// address: 0x40013800
        /// memory remap register
        pub const MEMRM = @intToPtr(*volatile Mmio(32, packed struct {
            /// MEM_MODE
            MEM_MODE: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0x0);

        /// address: 0x40013804
        /// peripheral mode configuration
        /// register
        pub const PMC = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            /// ADC1DC2
            ADC1DC2: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x4);

        /// address: 0x40013808
        /// external interrupt configuration register
        /// 1
        pub const EXTICR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// EXTI x configuration (x = 0 to
            /// 3)
            EXTI0: u4,
            /// EXTI x configuration (x = 0 to
            /// 3)
            EXTI1: u4,
            /// EXTI x configuration (x = 0 to
            /// 3)
            EXTI2: u4,
            /// EXTI x configuration (x = 0 to
            /// 3)
            EXTI3: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4001380c
        /// external interrupt configuration register
        /// 2
        pub const EXTICR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// EXTI x configuration (x = 4 to
            /// 7)
            EXTI4: u4,
            /// EXTI x configuration (x = 4 to
            /// 7)
            EXTI5: u4,
            /// EXTI x configuration (x = 4 to
            /// 7)
            EXTI6: u4,
            /// EXTI x configuration (x = 4 to
            /// 7)
            EXTI7: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xc);

        /// address: 0x40013810
        /// external interrupt configuration register
        /// 3
        pub const EXTICR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// EXTI x configuration (x = 8 to
            /// 11)
            EXTI8: u4,
            /// EXTI x configuration (x = 8 to
            /// 11)
            EXTI9: u4,
            /// EXTI10
            EXTI10: u4,
            /// EXTI x configuration (x = 8 to
            /// 11)
            EXTI11: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40013814
        /// external interrupt configuration register
        /// 4
        pub const EXTICR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// EXTI x configuration (x = 12 to
            /// 15)
            EXTI12: u4,
            /// EXTI x configuration (x = 12 to
            /// 15)
            EXTI13: u4,
            /// EXTI x configuration (x = 12 to
            /// 15)
            EXTI14: u4,
            /// EXTI x configuration (x = 12 to
            /// 15)
            EXTI15: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40013820
        /// Compensation cell control
        /// register
        pub const CMPCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Compensation cell
            /// power-down
            CMP_PD: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// READY
            READY: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x20);
    };

    /// Advanced-timers
    pub const TIM1 = struct {
        pub const base_address = 0x40010000;

        /// address: 0x40010000
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            /// Direction
            DIR: u1,
            /// Center-aligned mode
            /// selection
            CMS: u2,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40010004
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare preloaded
            /// control
            CCPC: u1,
            reserved0: u1,
            /// Capture/compare control update
            /// selection
            CCUS: u1,
            /// Capture/compare DMA
            /// selection
            CCDS: u1,
            /// Master mode selection
            MMS: u3,
            /// TI1 selection
            TI1S: u1,
            /// Output Idle state 1
            OIS1: u1,
            /// Output Idle state 1
            OIS1N: u1,
            /// Output Idle state 2
            OIS2: u1,
            /// Output Idle state 2
            OIS2N: u1,
            /// Output Idle state 3
            OIS3: u1,
            /// Output Idle state 3
            OIS3N: u1,
            /// Output Idle state 4
            OIS4: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x4);

        /// address: 0x40010008
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            /// External trigger filter
            ETF: u4,
            /// External trigger prescaler
            ETPS: u2,
            /// External clock enable
            ECE: u1,
            /// External trigger polarity
            ETP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4001000c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            /// Capture/Compare 3 interrupt
            /// enable
            CC3IE: u1,
            /// Capture/Compare 4 interrupt
            /// enable
            CC4IE: u1,
            /// COM interrupt enable
            COMIE: u1,
            /// Trigger interrupt enable
            TIE: u1,
            /// Break interrupt enable
            BIE: u1,
            /// Update DMA request enable
            UDE: u1,
            /// Capture/Compare 1 DMA request
            /// enable
            CC1DE: u1,
            /// Capture/Compare 2 DMA request
            /// enable
            CC2DE: u1,
            /// Capture/Compare 3 DMA request
            /// enable
            CC3DE: u1,
            /// Capture/Compare 4 DMA request
            /// enable
            CC4DE: u1,
            /// COM DMA request enable
            COMDE: u1,
            /// Trigger DMA request enable
            TDE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40010010
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            /// Capture/Compare 3 interrupt
            /// flag
            CC3IF: u1,
            /// Capture/Compare 4 interrupt
            /// flag
            CC4IF: u1,
            /// COM interrupt flag
            COMIF: u1,
            /// Trigger interrupt flag
            TIF: u1,
            /// Break interrupt flag
            BIF: u1,
            reserved0: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            /// Capture/Compare 3 overcapture
            /// flag
            CC3OF: u1,
            /// Capture/Compare 4 overcapture
            /// flag
            CC4OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x10);

        /// address: 0x40010014
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            /// Capture/compare 3
            /// generation
            CC3G: u1,
            /// Capture/compare 4
            /// generation
            CC4G: u1,
            /// Capture/Compare control update
            /// generation
            COMG: u1,
            /// Trigger generation
            TG: u1,
            /// Break generation
            BG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x14);

        /// address: 0x40010018
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Output Compare 1 fast
            /// enable
            OC1FE: u1,
            /// Output Compare 1 preload
            /// enable
            OC1PE: u1,
            /// Output Compare 1 mode
            OC1M: u3,
            /// Output Compare 1 clear
            /// enable
            OC1CE: u1,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Output Compare 2 fast
            /// enable
            OC2FE: u1,
            /// Output Compare 2 preload
            /// enable
            OC2PE: u1,
            /// Output Compare 2 mode
            OC2M: u3,
            /// Output Compare 2 clear
            /// enable
            OC2CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40010018
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4001001c
        /// capture/compare mode register 2 (output
        /// mode)
        pub const CCMR2_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 3
            /// selection
            CC3S: u2,
            /// Output compare 3 fast
            /// enable
            OC3FE: u1,
            /// Output compare 3 preload
            /// enable
            OC3PE: u1,
            /// Output compare 3 mode
            OC3M: u3,
            /// Output compare 3 clear
            /// enable
            OC3CE: u1,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Output compare 4 fast
            /// enable
            OC4FE: u1,
            /// Output compare 4 preload
            /// enable
            OC4PE: u1,
            /// Output compare 4 mode
            OC4M: u3,
            /// Output compare 4 clear
            /// enable
            OC4CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x4001001c
        /// capture/compare mode register 2 (input
        /// mode)
        pub const CCMR2_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare 3
            /// selection
            CC3S: u2,
            /// Input capture 3 prescaler
            IC3PSC: u2,
            /// Input capture 3 filter
            IC3F: u4,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Input capture 4 prescaler
            IC4PSC: u2,
            /// Input capture 4 filter
            IC4F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40010020
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            /// Capture/Compare 1 complementary output
            /// enable
            CC1NE: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            /// Capture/Compare 2 complementary output
            /// enable
            CC2NE: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            /// Capture/Compare 3 output
            /// enable
            CC3E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3P: u1,
            /// Capture/Compare 3 complementary output
            /// enable
            CC3NE: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3NP: u1,
            /// Capture/Compare 4 output
            /// enable
            CC4E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC4P: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
        }), base_address + 0x20);

        /// address: 0x40010024
        /// counter
        pub const CNT = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x24);

        /// address: 0x40010028
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4001002c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x2c);

        /// address: 0x40010034
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x34);

        /// address: 0x40010038
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x38);

        /// address: 0x4001003c
        /// capture/compare register 3
        pub const CCR3 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x3c);

        /// address: 0x40010040
        /// capture/compare register 4
        pub const CCR4 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x40);

        /// address: 0x40010048
        /// DMA control register
        pub const DCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA base address
            DBA: u5,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// DMA burst length
            DBL: u5,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x48);

        /// address: 0x4001004c
        /// DMA address for full transfer
        pub const DMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA register for burst
            /// accesses
            DMAB: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);

        /// address: 0x40010030
        /// repetition counter register
        pub const RCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Repetition counter value
            REP: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x30);

        /// address: 0x40010044
        /// break and dead-time register
        pub const BDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Dead-time generator setup
            DTG: u8,
            /// Lock configuration
            LOCK: u2,
            /// Off-state selection for Idle
            /// mode
            OSSI: u1,
            /// Off-state selection for Run
            /// mode
            OSSR: u1,
            /// Break enable
            BKE: u1,
            /// Break polarity
            BKP: u1,
            /// Automatic output enable
            AOE: u1,
            /// Main output enable
            MOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x44);
    };
    pub const TIM8 = struct {
        pub const base_address = 0x40010400;

        /// address: 0x40010400
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            /// Direction
            DIR: u1,
            /// Center-aligned mode
            /// selection
            CMS: u2,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40010404
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare preloaded
            /// control
            CCPC: u1,
            reserved0: u1,
            /// Capture/compare control update
            /// selection
            CCUS: u1,
            /// Capture/compare DMA
            /// selection
            CCDS: u1,
            /// Master mode selection
            MMS: u3,
            /// TI1 selection
            TI1S: u1,
            /// Output Idle state 1
            OIS1: u1,
            /// Output Idle state 1
            OIS1N: u1,
            /// Output Idle state 2
            OIS2: u1,
            /// Output Idle state 2
            OIS2N: u1,
            /// Output Idle state 3
            OIS3: u1,
            /// Output Idle state 3
            OIS3N: u1,
            /// Output Idle state 4
            OIS4: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x4);

        /// address: 0x40010408
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            /// External trigger filter
            ETF: u4,
            /// External trigger prescaler
            ETPS: u2,
            /// External clock enable
            ECE: u1,
            /// External trigger polarity
            ETP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4001040c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            /// Capture/Compare 3 interrupt
            /// enable
            CC3IE: u1,
            /// Capture/Compare 4 interrupt
            /// enable
            CC4IE: u1,
            /// COM interrupt enable
            COMIE: u1,
            /// Trigger interrupt enable
            TIE: u1,
            /// Break interrupt enable
            BIE: u1,
            /// Update DMA request enable
            UDE: u1,
            /// Capture/Compare 1 DMA request
            /// enable
            CC1DE: u1,
            /// Capture/Compare 2 DMA request
            /// enable
            CC2DE: u1,
            /// Capture/Compare 3 DMA request
            /// enable
            CC3DE: u1,
            /// Capture/Compare 4 DMA request
            /// enable
            CC4DE: u1,
            /// COM DMA request enable
            COMDE: u1,
            /// Trigger DMA request enable
            TDE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40010410
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            /// Capture/Compare 3 interrupt
            /// flag
            CC3IF: u1,
            /// Capture/Compare 4 interrupt
            /// flag
            CC4IF: u1,
            /// COM interrupt flag
            COMIF: u1,
            /// Trigger interrupt flag
            TIF: u1,
            /// Break interrupt flag
            BIF: u1,
            reserved0: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            /// Capture/Compare 3 overcapture
            /// flag
            CC3OF: u1,
            /// Capture/Compare 4 overcapture
            /// flag
            CC4OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x10);

        /// address: 0x40010414
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            /// Capture/compare 3
            /// generation
            CC3G: u1,
            /// Capture/compare 4
            /// generation
            CC4G: u1,
            /// Capture/Compare control update
            /// generation
            COMG: u1,
            /// Trigger generation
            TG: u1,
            /// Break generation
            BG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x14);

        /// address: 0x40010418
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Output Compare 1 fast
            /// enable
            OC1FE: u1,
            /// Output Compare 1 preload
            /// enable
            OC1PE: u1,
            /// Output Compare 1 mode
            OC1M: u3,
            /// Output Compare 1 clear
            /// enable
            OC1CE: u1,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Output Compare 2 fast
            /// enable
            OC2FE: u1,
            /// Output Compare 2 preload
            /// enable
            OC2PE: u1,
            /// Output Compare 2 mode
            OC2M: u3,
            /// Output Compare 2 clear
            /// enable
            OC2CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40010418
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4001041c
        /// capture/compare mode register 2 (output
        /// mode)
        pub const CCMR2_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 3
            /// selection
            CC3S: u2,
            /// Output compare 3 fast
            /// enable
            OC3FE: u1,
            /// Output compare 3 preload
            /// enable
            OC3PE: u1,
            /// Output compare 3 mode
            OC3M: u3,
            /// Output compare 3 clear
            /// enable
            OC3CE: u1,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Output compare 4 fast
            /// enable
            OC4FE: u1,
            /// Output compare 4 preload
            /// enable
            OC4PE: u1,
            /// Output compare 4 mode
            OC4M: u3,
            /// Output compare 4 clear
            /// enable
            OC4CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x4001041c
        /// capture/compare mode register 2 (input
        /// mode)
        pub const CCMR2_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare 3
            /// selection
            CC3S: u2,
            /// Input capture 3 prescaler
            IC3PSC: u2,
            /// Input capture 3 filter
            IC3F: u4,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Input capture 4 prescaler
            IC4PSC: u2,
            /// Input capture 4 filter
            IC4F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40010420
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            /// Capture/Compare 1 complementary output
            /// enable
            CC1NE: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            /// Capture/Compare 2 complementary output
            /// enable
            CC2NE: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            /// Capture/Compare 3 output
            /// enable
            CC3E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3P: u1,
            /// Capture/Compare 3 complementary output
            /// enable
            CC3NE: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3NP: u1,
            /// Capture/Compare 4 output
            /// enable
            CC4E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC4P: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
        }), base_address + 0x20);

        /// address: 0x40010424
        /// counter
        pub const CNT = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x24);

        /// address: 0x40010428
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4001042c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x2c);

        /// address: 0x40010434
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x34);

        /// address: 0x40010438
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x38);

        /// address: 0x4001043c
        /// capture/compare register 3
        pub const CCR3 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x3c);

        /// address: 0x40010440
        /// capture/compare register 4
        pub const CCR4 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x40);

        /// address: 0x40010448
        /// DMA control register
        pub const DCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA base address
            DBA: u5,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// DMA burst length
            DBL: u5,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x48);

        /// address: 0x4001044c
        /// DMA address for full transfer
        pub const DMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA register for burst
            /// accesses
            DMAB: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);

        /// address: 0x40010430
        /// repetition counter register
        pub const RCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Repetition counter value
            REP: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x30);

        /// address: 0x40010444
        /// break and dead-time register
        pub const BDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Dead-time generator setup
            DTG: u8,
            /// Lock configuration
            LOCK: u2,
            /// Off-state selection for Idle
            /// mode
            OSSI: u1,
            /// Off-state selection for Run
            /// mode
            OSSR: u1,
            /// Break enable
            BKE: u1,
            /// Break polarity
            BKP: u1,
            /// Automatic output enable
            AOE: u1,
            /// Main output enable
            MOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x44);
    };

    /// General-purpose-timers
    pub const TIM10 = struct {
        pub const base_address = 0x40014400;

        /// address: 0x40014400
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x4001440c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0xc);

        /// address: 0x40014410
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x10);

        /// address: 0x40014414
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0x14);

        /// address: 0x40014418
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Output Compare 1 fast
            /// enable
            OC1FE: u1,
            /// Output Compare 1 preload
            /// enable
            OC1PE: u1,
            /// Output Compare 1 mode
            OC1M: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x18);

        /// address: 0x40014418
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x18);

        /// address: 0x40014420
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
        }), base_address + 0x20);

        /// address: 0x40014424
        /// counter
        pub const CNT = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x24);

        /// address: 0x40014428
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4001442c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x2c);

        /// address: 0x40014434
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x34);
    };

    /// General-purpose-timers
    pub const TIM11 = struct {
        pub const base_address = 0x40014800;

        /// address: 0x40014800
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x4001480c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0xc);

        /// address: 0x40014810
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x10);

        /// address: 0x40014814
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0x14);

        /// address: 0x40014818
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Output Compare 1 fast
            /// enable
            OC1FE: u1,
            /// Output Compare 1 preload
            /// enable
            OC1PE: u1,
            /// Output Compare 1 mode
            OC1M: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x18);

        /// address: 0x40014818
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x18);

        /// address: 0x40014820
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
        }), base_address + 0x20);

        /// address: 0x40014824
        /// counter
        pub const CNT = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x24);

        /// address: 0x40014828
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4001482c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x2c);

        /// address: 0x40014834
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x34);

        /// address: 0x40014850
        /// option register
        pub const OR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Input 1 remapping
            /// capability
            RMP: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
        }), base_address + 0x50);
    };

    /// General purpose timers
    pub const TIM2 = struct {
        pub const base_address = 0x40000000;

        /// address: 0x40000000
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            /// Direction
            DIR: u1,
            /// Center-aligned mode
            /// selection
            CMS: u2,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40000004
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/compare DMA
            /// selection
            CCDS: u1,
            /// Master mode selection
            MMS: u3,
            /// TI1 selection
            TI1S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40000008
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            /// External trigger filter
            ETF: u4,
            /// External trigger prescaler
            ETPS: u2,
            /// External clock enable
            ECE: u1,
            /// External trigger polarity
            ETP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4000000c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            /// Capture/Compare 3 interrupt
            /// enable
            CC3IE: u1,
            /// Capture/Compare 4 interrupt
            /// enable
            CC4IE: u1,
            reserved0: u1,
            /// Trigger interrupt enable
            TIE: u1,
            reserved1: u1,
            /// Update DMA request enable
            UDE: u1,
            /// Capture/Compare 1 DMA request
            /// enable
            CC1DE: u1,
            /// Capture/Compare 2 DMA request
            /// enable
            CC2DE: u1,
            /// Capture/Compare 3 DMA request
            /// enable
            CC3DE: u1,
            /// Capture/Compare 4 DMA request
            /// enable
            CC4DE: u1,
            reserved2: u1,
            /// Trigger DMA request enable
            TDE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40000010
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            /// Capture/Compare 3 interrupt
            /// flag
            CC3IF: u1,
            /// Capture/Compare 4 interrupt
            /// flag
            CC4IF: u1,
            reserved0: u1,
            /// Trigger interrupt flag
            TIF: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            /// Capture/Compare 3 overcapture
            /// flag
            CC3OF: u1,
            /// Capture/Compare 4 overcapture
            /// flag
            CC4OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x10);

        /// address: 0x40000014
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            /// Capture/compare 3
            /// generation
            CC3G: u1,
            /// Capture/compare 4
            /// generation
            CC4G: u1,
            reserved0: u1,
            /// Trigger generation
            TG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x14);

        /// address: 0x40000018
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC1S
            CC1S: u2,
            /// OC1FE
            OC1FE: u1,
            /// OC1PE
            OC1PE: u1,
            /// OC1M
            OC1M: u3,
            /// OC1CE
            OC1CE: u1,
            /// CC2S
            CC2S: u2,
            /// OC2FE
            OC2FE: u1,
            /// OC2PE
            OC2PE: u1,
            /// OC2M
            OC2M: u3,
            /// OC2CE
            OC2CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40000018
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000001c
        /// capture/compare mode register 2 (output
        /// mode)
        pub const CCMR2_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC3S
            CC3S: u2,
            /// OC3FE
            OC3FE: u1,
            /// OC3PE
            OC3PE: u1,
            /// OC3M
            OC3M: u3,
            /// OC3CE
            OC3CE: u1,
            /// CC4S
            CC4S: u2,
            /// OC4FE
            OC4FE: u1,
            /// OC4PE
            OC4PE: u1,
            /// OC4M
            OC4M: u3,
            /// O24CE
            O24CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x4000001c
        /// capture/compare mode register 2 (input
        /// mode)
        pub const CCMR2_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare 3
            /// selection
            CC3S: u2,
            /// Input capture 3 prescaler
            IC3PSC: u2,
            /// Input capture 3 filter
            IC3F: u4,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Input capture 4 prescaler
            IC4PSC: u2,
            /// Input capture 4 filter
            IC4F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40000020
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            reserved1: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            /// Capture/Compare 3 output
            /// enable
            CC3E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3P: u1,
            reserved2: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3NP: u1,
            /// Capture/Compare 4 output
            /// enable
            CC4E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC4P: u1,
            reserved3: u1,
            /// Capture/Compare 4 output
            /// Polarity
            CC4NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x20);

        /// address: 0x40000024
        /// counter
        pub const CNT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low counter value
            CNT_L: u16,
            /// High counter value
            CNT_H: u16,
        }), base_address + 0x24);

        /// address: 0x40000028
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4000002c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Auto-reload value
            ARR_L: u16,
            /// High Auto-reload value
            ARR_H: u16,
        }), base_address + 0x2c);

        /// address: 0x40000034
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 1
            /// value
            CCR1_L: u16,
            /// High Capture/Compare 1
            /// value
            CCR1_H: u16,
        }), base_address + 0x34);

        /// address: 0x40000038
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 2
            /// value
            CCR2_L: u16,
            /// High Capture/Compare 2
            /// value
            CCR2_H: u16,
        }), base_address + 0x38);

        /// address: 0x4000003c
        /// capture/compare register 3
        pub const CCR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR3_L: u16,
            /// High Capture/Compare value
            CCR3_H: u16,
        }), base_address + 0x3c);

        /// address: 0x40000040
        /// capture/compare register 4
        pub const CCR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR4_L: u16,
            /// High Capture/Compare value
            CCR4_H: u16,
        }), base_address + 0x40);

        /// address: 0x40000048
        /// DMA control register
        pub const DCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA base address
            DBA: u5,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// DMA burst length
            DBL: u5,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x48);

        /// address: 0x4000004c
        /// DMA address for full transfer
        pub const DMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA register for burst
            /// accesses
            DMAB: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);

        /// address: 0x40000050
        /// TIM5 option register
        pub const OR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            /// Timer Input 4 remap
            ITR1_RMP: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x50);
    };

    /// General purpose timers
    pub const TIM3 = struct {
        pub const base_address = 0x40000400;

        /// address: 0x40000400
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            /// Direction
            DIR: u1,
            /// Center-aligned mode
            /// selection
            CMS: u2,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40000404
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/compare DMA
            /// selection
            CCDS: u1,
            /// Master mode selection
            MMS: u3,
            /// TI1 selection
            TI1S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40000408
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            /// External trigger filter
            ETF: u4,
            /// External trigger prescaler
            ETPS: u2,
            /// External clock enable
            ECE: u1,
            /// External trigger polarity
            ETP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4000040c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            /// Capture/Compare 3 interrupt
            /// enable
            CC3IE: u1,
            /// Capture/Compare 4 interrupt
            /// enable
            CC4IE: u1,
            reserved0: u1,
            /// Trigger interrupt enable
            TIE: u1,
            reserved1: u1,
            /// Update DMA request enable
            UDE: u1,
            /// Capture/Compare 1 DMA request
            /// enable
            CC1DE: u1,
            /// Capture/Compare 2 DMA request
            /// enable
            CC2DE: u1,
            /// Capture/Compare 3 DMA request
            /// enable
            CC3DE: u1,
            /// Capture/Compare 4 DMA request
            /// enable
            CC4DE: u1,
            reserved2: u1,
            /// Trigger DMA request enable
            TDE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40000410
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            /// Capture/Compare 3 interrupt
            /// flag
            CC3IF: u1,
            /// Capture/Compare 4 interrupt
            /// flag
            CC4IF: u1,
            reserved0: u1,
            /// Trigger interrupt flag
            TIF: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            /// Capture/Compare 3 overcapture
            /// flag
            CC3OF: u1,
            /// Capture/Compare 4 overcapture
            /// flag
            CC4OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x10);

        /// address: 0x40000414
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            /// Capture/compare 3
            /// generation
            CC3G: u1,
            /// Capture/compare 4
            /// generation
            CC4G: u1,
            reserved0: u1,
            /// Trigger generation
            TG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x14);

        /// address: 0x40000418
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC1S
            CC1S: u2,
            /// OC1FE
            OC1FE: u1,
            /// OC1PE
            OC1PE: u1,
            /// OC1M
            OC1M: u3,
            /// OC1CE
            OC1CE: u1,
            /// CC2S
            CC2S: u2,
            /// OC2FE
            OC2FE: u1,
            /// OC2PE
            OC2PE: u1,
            /// OC2M
            OC2M: u3,
            /// OC2CE
            OC2CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40000418
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000041c
        /// capture/compare mode register 2 (output
        /// mode)
        pub const CCMR2_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC3S
            CC3S: u2,
            /// OC3FE
            OC3FE: u1,
            /// OC3PE
            OC3PE: u1,
            /// OC3M
            OC3M: u3,
            /// OC3CE
            OC3CE: u1,
            /// CC4S
            CC4S: u2,
            /// OC4FE
            OC4FE: u1,
            /// OC4PE
            OC4PE: u1,
            /// OC4M
            OC4M: u3,
            /// O24CE
            O24CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x4000041c
        /// capture/compare mode register 2 (input
        /// mode)
        pub const CCMR2_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare 3
            /// selection
            CC3S: u2,
            /// Input capture 3 prescaler
            IC3PSC: u2,
            /// Input capture 3 filter
            IC3F: u4,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Input capture 4 prescaler
            IC4PSC: u2,
            /// Input capture 4 filter
            IC4F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40000420
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            reserved1: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            /// Capture/Compare 3 output
            /// enable
            CC3E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3P: u1,
            reserved2: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3NP: u1,
            /// Capture/Compare 4 output
            /// enable
            CC4E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC4P: u1,
            reserved3: u1,
            /// Capture/Compare 4 output
            /// Polarity
            CC4NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x20);

        /// address: 0x40000424
        /// counter
        pub const CNT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low counter value
            CNT_L: u16,
            /// High counter value
            CNT_H: u16,
        }), base_address + 0x24);

        /// address: 0x40000428
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4000042c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Auto-reload value
            ARR_L: u16,
            /// High Auto-reload value
            ARR_H: u16,
        }), base_address + 0x2c);

        /// address: 0x40000434
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 1
            /// value
            CCR1_L: u16,
            /// High Capture/Compare 1
            /// value
            CCR1_H: u16,
        }), base_address + 0x34);

        /// address: 0x40000438
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 2
            /// value
            CCR2_L: u16,
            /// High Capture/Compare 2
            /// value
            CCR2_H: u16,
        }), base_address + 0x38);

        /// address: 0x4000043c
        /// capture/compare register 3
        pub const CCR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR3_L: u16,
            /// High Capture/Compare value
            CCR3_H: u16,
        }), base_address + 0x3c);

        /// address: 0x40000440
        /// capture/compare register 4
        pub const CCR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR4_L: u16,
            /// High Capture/Compare value
            CCR4_H: u16,
        }), base_address + 0x40);

        /// address: 0x40000448
        /// DMA control register
        pub const DCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA base address
            DBA: u5,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// DMA burst length
            DBL: u5,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x48);

        /// address: 0x4000044c
        /// DMA address for full transfer
        pub const DMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA register for burst
            /// accesses
            DMAB: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);
    };
    pub const TIM4 = struct {
        pub const base_address = 0x40000800;

        /// address: 0x40000800
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            /// Direction
            DIR: u1,
            /// Center-aligned mode
            /// selection
            CMS: u2,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40000804
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/compare DMA
            /// selection
            CCDS: u1,
            /// Master mode selection
            MMS: u3,
            /// TI1 selection
            TI1S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40000808
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            /// External trigger filter
            ETF: u4,
            /// External trigger prescaler
            ETPS: u2,
            /// External clock enable
            ECE: u1,
            /// External trigger polarity
            ETP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4000080c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            /// Capture/Compare 3 interrupt
            /// enable
            CC3IE: u1,
            /// Capture/Compare 4 interrupt
            /// enable
            CC4IE: u1,
            reserved0: u1,
            /// Trigger interrupt enable
            TIE: u1,
            reserved1: u1,
            /// Update DMA request enable
            UDE: u1,
            /// Capture/Compare 1 DMA request
            /// enable
            CC1DE: u1,
            /// Capture/Compare 2 DMA request
            /// enable
            CC2DE: u1,
            /// Capture/Compare 3 DMA request
            /// enable
            CC3DE: u1,
            /// Capture/Compare 4 DMA request
            /// enable
            CC4DE: u1,
            reserved2: u1,
            /// Trigger DMA request enable
            TDE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40000810
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            /// Capture/Compare 3 interrupt
            /// flag
            CC3IF: u1,
            /// Capture/Compare 4 interrupt
            /// flag
            CC4IF: u1,
            reserved0: u1,
            /// Trigger interrupt flag
            TIF: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            /// Capture/Compare 3 overcapture
            /// flag
            CC3OF: u1,
            /// Capture/Compare 4 overcapture
            /// flag
            CC4OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x10);

        /// address: 0x40000814
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            /// Capture/compare 3
            /// generation
            CC3G: u1,
            /// Capture/compare 4
            /// generation
            CC4G: u1,
            reserved0: u1,
            /// Trigger generation
            TG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x14);

        /// address: 0x40000818
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC1S
            CC1S: u2,
            /// OC1FE
            OC1FE: u1,
            /// OC1PE
            OC1PE: u1,
            /// OC1M
            OC1M: u3,
            /// OC1CE
            OC1CE: u1,
            /// CC2S
            CC2S: u2,
            /// OC2FE
            OC2FE: u1,
            /// OC2PE
            OC2PE: u1,
            /// OC2M
            OC2M: u3,
            /// OC2CE
            OC2CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40000818
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000081c
        /// capture/compare mode register 2 (output
        /// mode)
        pub const CCMR2_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC3S
            CC3S: u2,
            /// OC3FE
            OC3FE: u1,
            /// OC3PE
            OC3PE: u1,
            /// OC3M
            OC3M: u3,
            /// OC3CE
            OC3CE: u1,
            /// CC4S
            CC4S: u2,
            /// OC4FE
            OC4FE: u1,
            /// OC4PE
            OC4PE: u1,
            /// OC4M
            OC4M: u3,
            /// O24CE
            O24CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x4000081c
        /// capture/compare mode register 2 (input
        /// mode)
        pub const CCMR2_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare 3
            /// selection
            CC3S: u2,
            /// Input capture 3 prescaler
            IC3PSC: u2,
            /// Input capture 3 filter
            IC3F: u4,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Input capture 4 prescaler
            IC4PSC: u2,
            /// Input capture 4 filter
            IC4F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40000820
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            reserved1: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            /// Capture/Compare 3 output
            /// enable
            CC3E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3P: u1,
            reserved2: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3NP: u1,
            /// Capture/Compare 4 output
            /// enable
            CC4E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC4P: u1,
            reserved3: u1,
            /// Capture/Compare 4 output
            /// Polarity
            CC4NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x20);

        /// address: 0x40000824
        /// counter
        pub const CNT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low counter value
            CNT_L: u16,
            /// High counter value
            CNT_H: u16,
        }), base_address + 0x24);

        /// address: 0x40000828
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4000082c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Auto-reload value
            ARR_L: u16,
            /// High Auto-reload value
            ARR_H: u16,
        }), base_address + 0x2c);

        /// address: 0x40000834
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 1
            /// value
            CCR1_L: u16,
            /// High Capture/Compare 1
            /// value
            CCR1_H: u16,
        }), base_address + 0x34);

        /// address: 0x40000838
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 2
            /// value
            CCR2_L: u16,
            /// High Capture/Compare 2
            /// value
            CCR2_H: u16,
        }), base_address + 0x38);

        /// address: 0x4000083c
        /// capture/compare register 3
        pub const CCR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR3_L: u16,
            /// High Capture/Compare value
            CCR3_H: u16,
        }), base_address + 0x3c);

        /// address: 0x40000840
        /// capture/compare register 4
        pub const CCR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR4_L: u16,
            /// High Capture/Compare value
            CCR4_H: u16,
        }), base_address + 0x40);

        /// address: 0x40000848
        /// DMA control register
        pub const DCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA base address
            DBA: u5,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// DMA burst length
            DBL: u5,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x48);

        /// address: 0x4000084c
        /// DMA address for full transfer
        pub const DMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA register for burst
            /// accesses
            DMAB: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);
    };

    /// General-purpose-timers
    pub const TIM5 = struct {
        pub const base_address = 0x40000c00;

        /// address: 0x40000c00
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            /// Direction
            DIR: u1,
            /// Center-aligned mode
            /// selection
            CMS: u2,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40000c04
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/compare DMA
            /// selection
            CCDS: u1,
            /// Master mode selection
            MMS: u3,
            /// TI1 selection
            TI1S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40000c08
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            /// External trigger filter
            ETF: u4,
            /// External trigger prescaler
            ETPS: u2,
            /// External clock enable
            ECE: u1,
            /// External trigger polarity
            ETP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x40000c0c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            /// Capture/Compare 3 interrupt
            /// enable
            CC3IE: u1,
            /// Capture/Compare 4 interrupt
            /// enable
            CC4IE: u1,
            reserved0: u1,
            /// Trigger interrupt enable
            TIE: u1,
            reserved1: u1,
            /// Update DMA request enable
            UDE: u1,
            /// Capture/Compare 1 DMA request
            /// enable
            CC1DE: u1,
            /// Capture/Compare 2 DMA request
            /// enable
            CC2DE: u1,
            /// Capture/Compare 3 DMA request
            /// enable
            CC3DE: u1,
            /// Capture/Compare 4 DMA request
            /// enable
            CC4DE: u1,
            reserved2: u1,
            /// Trigger DMA request enable
            TDE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0xc);

        /// address: 0x40000c10
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            /// Capture/Compare 3 interrupt
            /// flag
            CC3IF: u1,
            /// Capture/Compare 4 interrupt
            /// flag
            CC4IF: u1,
            reserved0: u1,
            /// Trigger interrupt flag
            TIF: u1,
            reserved1: u1,
            reserved2: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            /// Capture/Compare 3 overcapture
            /// flag
            CC3OF: u1,
            /// Capture/Compare 4 overcapture
            /// flag
            CC4OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x10);

        /// address: 0x40000c14
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            /// Capture/compare 3
            /// generation
            CC3G: u1,
            /// Capture/compare 4
            /// generation
            CC4G: u1,
            reserved0: u1,
            /// Trigger generation
            TG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x14);

        /// address: 0x40000c18
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC1S
            CC1S: u2,
            /// OC1FE
            OC1FE: u1,
            /// OC1PE
            OC1PE: u1,
            /// OC1M
            OC1M: u3,
            /// OC1CE
            OC1CE: u1,
            /// CC2S
            CC2S: u2,
            /// OC2FE
            OC2FE: u1,
            /// OC2PE
            OC2PE: u1,
            /// OC2M
            OC2M: u3,
            /// OC2CE
            OC2CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40000c18
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u4,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40000c1c
        /// capture/compare mode register 2 (output
        /// mode)
        pub const CCMR2_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// CC3S
            CC3S: u2,
            /// OC3FE
            OC3FE: u1,
            /// OC3PE
            OC3PE: u1,
            /// OC3M
            OC3M: u3,
            /// OC3CE
            OC3CE: u1,
            /// CC4S
            CC4S: u2,
            /// OC4FE
            OC4FE: u1,
            /// OC4PE
            OC4PE: u1,
            /// OC4M
            OC4M: u3,
            /// O24CE
            O24CE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40000c1c
        /// capture/compare mode register 2 (input
        /// mode)
        pub const CCMR2_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/compare 3
            /// selection
            CC3S: u2,
            /// Input capture 3 prescaler
            IC3PSC: u2,
            /// Input capture 3 filter
            IC3F: u4,
            /// Capture/Compare 4
            /// selection
            CC4S: u2,
            /// Input capture 4 prescaler
            IC4PSC: u2,
            /// Input capture 4 filter
            IC4F: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40000c20
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            reserved1: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            /// Capture/Compare 3 output
            /// enable
            CC3E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3P: u1,
            reserved2: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC3NP: u1,
            /// Capture/Compare 4 output
            /// enable
            CC4E: u1,
            /// Capture/Compare 3 output
            /// Polarity
            CC4P: u1,
            reserved3: u1,
            /// Capture/Compare 4 output
            /// Polarity
            CC4NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x20);

        /// address: 0x40000c24
        /// counter
        pub const CNT = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low counter value
            CNT_L: u16,
            /// High counter value
            CNT_H: u16,
        }), base_address + 0x24);

        /// address: 0x40000c28
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x40000c2c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Auto-reload value
            ARR_L: u16,
            /// High Auto-reload value
            ARR_H: u16,
        }), base_address + 0x2c);

        /// address: 0x40000c34
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 1
            /// value
            CCR1_L: u16,
            /// High Capture/Compare 1
            /// value
            CCR1_H: u16,
        }), base_address + 0x34);

        /// address: 0x40000c38
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare 2
            /// value
            CCR2_L: u16,
            /// High Capture/Compare 2
            /// value
            CCR2_H: u16,
        }), base_address + 0x38);

        /// address: 0x40000c3c
        /// capture/compare register 3
        pub const CCR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR3_L: u16,
            /// High Capture/Compare value
            CCR3_H: u16,
        }), base_address + 0x3c);

        /// address: 0x40000c40
        /// capture/compare register 4
        pub const CCR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Low Capture/Compare value
            CCR4_L: u16,
            /// High Capture/Compare value
            CCR4_H: u16,
        }), base_address + 0x40);

        /// address: 0x40000c48
        /// DMA control register
        pub const DCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA base address
            DBA: u5,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// DMA burst length
            DBL: u5,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x48);

        /// address: 0x40000c4c
        /// DMA address for full transfer
        pub const DMAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// DMA register for burst
            /// accesses
            DMAB: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4c);

        /// address: 0x40000c50
        /// TIM5 option register
        pub const OR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Timer Input 4 remap
            IT4_RMP: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x50);
    };

    /// General purpose timers
    pub const TIM9 = struct {
        pub const base_address = 0x40014000;

        /// address: 0x40014000
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Counter enable
            CEN: u1,
            /// Update disable
            UDIS: u1,
            /// Update request source
            URS: u1,
            /// One-pulse mode
            OPM: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Auto-reload preload enable
            ARPE: u1,
            /// Clock division
            CKD: u2,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40014004
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// Master mode selection
            MMS: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x4);

        /// address: 0x40014008
        /// slave mode control register
        pub const SMCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Slave mode selection
            SMS: u3,
            reserved0: u1,
            /// Trigger selection
            TS: u3,
            /// Master/Slave mode
            MSM: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x8);

        /// address: 0x4001400c
        /// DMA/Interrupt enable register
        pub const DIER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt enable
            UIE: u1,
            /// Capture/Compare 1 interrupt
            /// enable
            CC1IE: u1,
            /// Capture/Compare 2 interrupt
            /// enable
            CC2IE: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Trigger interrupt enable
            TIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0xc);

        /// address: 0x40014010
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update interrupt flag
            UIF: u1,
            /// Capture/compare 1 interrupt
            /// flag
            CC1IF: u1,
            /// Capture/Compare 2 interrupt
            /// flag
            CC2IF: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Trigger interrupt flag
            TIF: u1,
            reserved3: u1,
            reserved4: u1,
            /// Capture/Compare 1 overcapture
            /// flag
            CC1OF: u1,
            /// Capture/compare 2 overcapture
            /// flag
            CC2OF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
        }), base_address + 0x10);

        /// address: 0x40014014
        /// event generation register
        pub const EGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Update generation
            UG: u1,
            /// Capture/compare 1
            /// generation
            CC1G: u1,
            /// Capture/compare 2
            /// generation
            CC2G: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Trigger generation
            TG: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
        }), base_address + 0x14);

        /// address: 0x40014018
        /// capture/compare mode register 1 (output
        /// mode)
        pub const CCMR1_Output = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Output Compare 1 fast
            /// enable
            OC1FE: u1,
            /// Output Compare 1 preload
            /// enable
            OC1PE: u1,
            /// Output Compare 1 mode
            OC1M: u3,
            reserved0: u1,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Output Compare 2 fast
            /// enable
            OC2FE: u1,
            /// Output Compare 2 preload
            /// enable
            OC2PE: u1,
            /// Output Compare 2 mode
            OC2M: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x18);

        /// address: 0x40014018
        /// capture/compare mode register 1 (input
        /// mode)
        pub const CCMR1_Input = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1
            /// selection
            CC1S: u2,
            /// Input capture 1 prescaler
            ICPCS: u2,
            /// Input capture 1 filter
            IC1F: u3,
            reserved0: u1,
            /// Capture/Compare 2
            /// selection
            CC2S: u2,
            /// Input capture 2 prescaler
            IC2PCS: u2,
            /// Input capture 2 filter
            IC2F: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x18);

        /// address: 0x40014020
        /// capture/compare enable
        /// register
        pub const CCER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Capture/Compare 1 output
            /// enable
            CC1E: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1P: u1,
            reserved0: u1,
            /// Capture/Compare 1 output
            /// Polarity
            CC1NP: u1,
            /// Capture/Compare 2 output
            /// enable
            CC2E: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2P: u1,
            reserved1: u1,
            /// Capture/Compare 2 output
            /// Polarity
            CC2NP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x20);

        /// address: 0x40014024
        /// counter
        pub const CNT = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x24);

        /// address: 0x40014028
        /// prescaler
        pub const PSC = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x28);

        /// address: 0x4001402c
        /// auto-reload register
        pub const ARR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x2c);

        /// address: 0x40014034
        /// capture/compare register 1
        pub const CCR1 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x34);

        /// address: 0x40014038
        /// capture/compare register 2
        pub const CCR2 = @intToPtr(*volatile MmioInt(32, u16), base_address + 0x38);
    };

    /// Universal synchronous asynchronous receiver
    /// transmitter
    pub const USART1 = struct {
        pub const base_address = 0x40011000;

        /// address: 0x40011000
        /// Status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Parity error
            PE: u1,
            /// Framing error
            FE: u1,
            /// Noise detected flag
            NF: u1,
            /// Overrun error
            ORE: u1,
            /// IDLE line detected
            IDLE: u1,
            /// Read data register not
            /// empty
            RXNE: u1,
            /// Transmission complete
            TC: u1,
            /// Transmit data register
            /// empty
            TXE: u1,
            /// LIN break detection flag
            LBD: u1,
            /// CTS flag
            CTS: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40011004
        /// Data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u9), base_address + 0x4);

        /// address: 0x40011008
        /// Baud rate register
        pub const BRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// fraction of USARTDIV
            DIV_Fraction: u4,
            /// mantissa of USARTDIV
            DIV_Mantissa: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4001100c
        /// Control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Send break
            SBK: u1,
            /// Receiver wakeup
            RWU: u1,
            /// Receiver enable
            RE: u1,
            /// Transmitter enable
            TE: u1,
            /// IDLE interrupt enable
            IDLEIE: u1,
            /// RXNE interrupt enable
            RXNEIE: u1,
            /// Transmission complete interrupt
            /// enable
            TCIE: u1,
            /// TXE interrupt enable
            TXEIE: u1,
            /// PE interrupt enable
            PEIE: u1,
            /// Parity selection
            PS: u1,
            /// Parity control enable
            PCE: u1,
            /// Wakeup method
            WAKE: u1,
            /// Word length
            M: u1,
            /// USART enable
            UE: u1,
            reserved0: u1,
            /// Oversampling mode
            OVER8: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xc);

        /// address: 0x40011010
        /// Control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Address of the USART node
            ADD: u4,
            reserved0: u1,
            /// lin break detection length
            LBDL: u1,
            /// LIN break detection interrupt
            /// enable
            LBDIE: u1,
            reserved1: u1,
            /// Last bit clock pulse
            LBCL: u1,
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Clock enable
            CLKEN: u1,
            /// STOP bits
            STOP: u2,
            /// LIN mode enable
            LINEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x10);

        /// address: 0x40011014
        /// Control register 3
        pub const CR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Error interrupt enable
            EIE: u1,
            /// IrDA mode enable
            IREN: u1,
            /// IrDA low-power
            IRLP: u1,
            /// Half-duplex selection
            HDSEL: u1,
            /// Smartcard NACK enable
            NACK: u1,
            /// Smartcard mode enable
            SCEN: u1,
            /// DMA enable receiver
            DMAR: u1,
            /// DMA enable transmitter
            DMAT: u1,
            /// RTS enable
            RTSE: u1,
            /// CTS enable
            CTSE: u1,
            /// CTS interrupt enable
            CTSIE: u1,
            /// One sample bit method
            /// enable
            ONEBIT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x14);

        /// address: 0x40011018
        /// Guard time and prescaler
        /// register
        pub const GTPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Prescaler value
            PSC: u8,
            /// Guard time value
            GT: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);
    };
    pub const USART2 = struct {
        pub const base_address = 0x40004400;

        /// address: 0x40004400
        /// Status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Parity error
            PE: u1,
            /// Framing error
            FE: u1,
            /// Noise detected flag
            NF: u1,
            /// Overrun error
            ORE: u1,
            /// IDLE line detected
            IDLE: u1,
            /// Read data register not
            /// empty
            RXNE: u1,
            /// Transmission complete
            TC: u1,
            /// Transmit data register
            /// empty
            TXE: u1,
            /// LIN break detection flag
            LBD: u1,
            /// CTS flag
            CTS: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40004404
        /// Data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u9), base_address + 0x4);

        /// address: 0x40004408
        /// Baud rate register
        pub const BRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// fraction of USARTDIV
            DIV_Fraction: u4,
            /// mantissa of USARTDIV
            DIV_Mantissa: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4000440c
        /// Control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Send break
            SBK: u1,
            /// Receiver wakeup
            RWU: u1,
            /// Receiver enable
            RE: u1,
            /// Transmitter enable
            TE: u1,
            /// IDLE interrupt enable
            IDLEIE: u1,
            /// RXNE interrupt enable
            RXNEIE: u1,
            /// Transmission complete interrupt
            /// enable
            TCIE: u1,
            /// TXE interrupt enable
            TXEIE: u1,
            /// PE interrupt enable
            PEIE: u1,
            /// Parity selection
            PS: u1,
            /// Parity control enable
            PCE: u1,
            /// Wakeup method
            WAKE: u1,
            /// Word length
            M: u1,
            /// USART enable
            UE: u1,
            reserved0: u1,
            /// Oversampling mode
            OVER8: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xc);

        /// address: 0x40004410
        /// Control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Address of the USART node
            ADD: u4,
            reserved0: u1,
            /// lin break detection length
            LBDL: u1,
            /// LIN break detection interrupt
            /// enable
            LBDIE: u1,
            reserved1: u1,
            /// Last bit clock pulse
            LBCL: u1,
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Clock enable
            CLKEN: u1,
            /// STOP bits
            STOP: u2,
            /// LIN mode enable
            LINEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x10);

        /// address: 0x40004414
        /// Control register 3
        pub const CR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Error interrupt enable
            EIE: u1,
            /// IrDA mode enable
            IREN: u1,
            /// IrDA low-power
            IRLP: u1,
            /// Half-duplex selection
            HDSEL: u1,
            /// Smartcard NACK enable
            NACK: u1,
            /// Smartcard mode enable
            SCEN: u1,
            /// DMA enable receiver
            DMAR: u1,
            /// DMA enable transmitter
            DMAT: u1,
            /// RTS enable
            RTSE: u1,
            /// CTS enable
            CTSE: u1,
            /// CTS interrupt enable
            CTSIE: u1,
            /// One sample bit method
            /// enable
            ONEBIT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x14);

        /// address: 0x40004418
        /// Guard time and prescaler
        /// register
        pub const GTPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Prescaler value
            PSC: u8,
            /// Guard time value
            GT: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);
    };
    pub const USART6 = struct {
        pub const base_address = 0x40011400;

        /// address: 0x40011400
        /// Status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Parity error
            PE: u1,
            /// Framing error
            FE: u1,
            /// Noise detected flag
            NF: u1,
            /// Overrun error
            ORE: u1,
            /// IDLE line detected
            IDLE: u1,
            /// Read data register not
            /// empty
            RXNE: u1,
            /// Transmission complete
            TC: u1,
            /// Transmit data register
            /// empty
            TXE: u1,
            /// LIN break detection flag
            LBD: u1,
            /// CTS flag
            CTS: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);

        /// address: 0x40011404
        /// Data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u9), base_address + 0x4);

        /// address: 0x40011408
        /// Baud rate register
        pub const BRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// fraction of USARTDIV
            DIV_Fraction: u4,
            /// mantissa of USARTDIV
            DIV_Mantissa: u12,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4001140c
        /// Control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Send break
            SBK: u1,
            /// Receiver wakeup
            RWU: u1,
            /// Receiver enable
            RE: u1,
            /// Transmitter enable
            TE: u1,
            /// IDLE interrupt enable
            IDLEIE: u1,
            /// RXNE interrupt enable
            RXNEIE: u1,
            /// Transmission complete interrupt
            /// enable
            TCIE: u1,
            /// TXE interrupt enable
            TXEIE: u1,
            /// PE interrupt enable
            PEIE: u1,
            /// Parity selection
            PS: u1,
            /// Parity control enable
            PCE: u1,
            /// Wakeup method
            WAKE: u1,
            /// Word length
            M: u1,
            /// USART enable
            UE: u1,
            reserved0: u1,
            /// Oversampling mode
            OVER8: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xc);

        /// address: 0x40011410
        /// Control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Address of the USART node
            ADD: u4,
            reserved0: u1,
            /// lin break detection length
            LBDL: u1,
            /// LIN break detection interrupt
            /// enable
            LBDIE: u1,
            reserved1: u1,
            /// Last bit clock pulse
            LBCL: u1,
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Clock enable
            CLKEN: u1,
            /// STOP bits
            STOP: u2,
            /// LIN mode enable
            LINEN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
        }), base_address + 0x10);

        /// address: 0x40011414
        /// Control register 3
        pub const CR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Error interrupt enable
            EIE: u1,
            /// IrDA mode enable
            IREN: u1,
            /// IrDA low-power
            IRLP: u1,
            /// Half-duplex selection
            HDSEL: u1,
            /// Smartcard NACK enable
            NACK: u1,
            /// Smartcard mode enable
            SCEN: u1,
            /// DMA enable receiver
            DMAR: u1,
            /// DMA enable transmitter
            DMAT: u1,
            /// RTS enable
            RTSE: u1,
            /// CTS enable
            CTSE: u1,
            /// CTS interrupt enable
            CTSIE: u1,
            /// One sample bit method
            /// enable
            ONEBIT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x14);

        /// address: 0x40011418
        /// Guard time and prescaler
        /// register
        pub const GTPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Prescaler value
            PSC: u8,
            /// Guard time value
            GT: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);
    };

    /// Window watchdog
    pub const WWDG = struct {
        pub const base_address = 0x40002c00;

        /// address: 0x40002c00
        /// Control register
        pub const CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// 7-bit counter (MSB to LSB)
            T: u7,
            /// Activation bit
            WDGA: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x0);

        /// address: 0x40002c04
        /// Configuration register
        pub const CFR = @intToPtr(*volatile Mmio(32, packed struct {
            /// 7-bit window value
            W: u7,
            /// Timer base
            WDGTB0: u1,
            /// Timer base
            WDGTB1: u1,
            /// Early wakeup interrupt
            EWI: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x4);

        /// address: 0x40002c08
        /// Status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Early wakeup interrupt
            /// flag
            EWIF: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
            padding29: u1,
            padding30: u1,
        }), base_address + 0x8);
    };

    /// DMA controller
    pub const DMA2 = struct {
        pub const base_address = 0x40026400;

        /// address: 0x40026400
        /// low interrupt status register
        pub const LISR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF0: u1,
            reserved0: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF0: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF0: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF0: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF0: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF1: u1,
            reserved1: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF1: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF1: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF1: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF2: u1,
            reserved6: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF2: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF2: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF2: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF2: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF3: u1,
            reserved7: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF3: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF3: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF3: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF3: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x0);

        /// address: 0x40026404
        /// high interrupt status register
        pub const HISR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF4: u1,
            reserved0: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF4: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF4: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF4: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF4: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF5: u1,
            reserved1: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF5: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF5: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF5: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF5: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF6: u1,
            reserved6: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF6: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF6: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF6: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF6: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF7: u1,
            reserved7: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF7: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF7: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF7: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF7: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x4);

        /// address: 0x40026408
        /// low interrupt flag clear
        /// register
        pub const LIFCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF0: u1,
            reserved0: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF0: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF0: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF0: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF0: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF1: u1,
            reserved1: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF1: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF1: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF1: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF2: u1,
            reserved6: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF2: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF2: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF2: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF2: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF3: u1,
            reserved7: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF3: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF3: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF3: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF3: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x8);

        /// address: 0x4002640c
        /// high interrupt flag clear
        /// register
        pub const HIFCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF4: u1,
            reserved0: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF4: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF4: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF4: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF4: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF5: u1,
            reserved1: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF5: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF5: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF5: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF5: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF6: u1,
            reserved6: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF6: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF6: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF6: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF6: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF7: u1,
            reserved7: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF7: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF7: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF7: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF7: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0xc);

        /// address: 0x40026410
        /// stream x configuration
        /// register
        pub const S0CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            reserved0: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x10);

        /// address: 0x40026414
        /// stream x number of data
        /// register
        pub const S0NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40026418
        /// stream x peripheral address
        /// register
        pub const S0PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x18);

        /// address: 0x4002641c
        /// stream x memory 0 address
        /// register
        pub const S0M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x1c);

        /// address: 0x40026420
        /// stream x memory 1 address
        /// register
        pub const S0M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x20);

        /// address: 0x40026424
        /// stream x FIFO control register
        pub const S0FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x24);

        /// address: 0x40026428
        /// stream x configuration
        /// register
        pub const S1CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x28);

        /// address: 0x4002642c
        /// stream x number of data
        /// register
        pub const S1NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x2c);

        /// address: 0x40026430
        /// stream x peripheral address
        /// register
        pub const S1PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x30);

        /// address: 0x40026434
        /// stream x memory 0 address
        /// register
        pub const S1M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x34);

        /// address: 0x40026438
        /// stream x memory 1 address
        /// register
        pub const S1M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x38);

        /// address: 0x4002643c
        /// stream x FIFO control register
        pub const S1FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x3c);

        /// address: 0x40026440
        /// stream x configuration
        /// register
        pub const S2CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x40);

        /// address: 0x40026444
        /// stream x number of data
        /// register
        pub const S2NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x44);

        /// address: 0x40026448
        /// stream x peripheral address
        /// register
        pub const S2PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x48);

        /// address: 0x4002644c
        /// stream x memory 0 address
        /// register
        pub const S2M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x4c);

        /// address: 0x40026450
        /// stream x memory 1 address
        /// register
        pub const S2M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x50);

        /// address: 0x40026454
        /// stream x FIFO control register
        pub const S2FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x54);

        /// address: 0x40026458
        /// stream x configuration
        /// register
        pub const S3CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x58);

        /// address: 0x4002645c
        /// stream x number of data
        /// register
        pub const S3NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x5c);

        /// address: 0x40026460
        /// stream x peripheral address
        /// register
        pub const S3PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x60);

        /// address: 0x40026464
        /// stream x memory 0 address
        /// register
        pub const S3M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x64);

        /// address: 0x40026468
        /// stream x memory 1 address
        /// register
        pub const S3M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x68);

        /// address: 0x4002646c
        /// stream x FIFO control register
        pub const S3FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x6c);

        /// address: 0x40026470
        /// stream x configuration
        /// register
        pub const S4CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x70);

        /// address: 0x40026474
        /// stream x number of data
        /// register
        pub const S4NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x74);

        /// address: 0x40026478
        /// stream x peripheral address
        /// register
        pub const S4PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x78);

        /// address: 0x4002647c
        /// stream x memory 0 address
        /// register
        pub const S4M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x7c);

        /// address: 0x40026480
        /// stream x memory 1 address
        /// register
        pub const S4M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x80);

        /// address: 0x40026484
        /// stream x FIFO control register
        pub const S4FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x84);

        /// address: 0x40026488
        /// stream x configuration
        /// register
        pub const S5CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x88);

        /// address: 0x4002648c
        /// stream x number of data
        /// register
        pub const S5NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8c);

        /// address: 0x40026490
        /// stream x peripheral address
        /// register
        pub const S5PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x90);

        /// address: 0x40026494
        /// stream x memory 0 address
        /// register
        pub const S5M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x94);

        /// address: 0x40026498
        /// stream x memory 1 address
        /// register
        pub const S5M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x98);

        /// address: 0x4002649c
        /// stream x FIFO control register
        pub const S5FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x9c);

        /// address: 0x400264a0
        /// stream x configuration
        /// register
        pub const S6CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0xa0);

        /// address: 0x400264a4
        /// stream x number of data
        /// register
        pub const S6NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xa4);

        /// address: 0x400264a8
        /// stream x peripheral address
        /// register
        pub const S6PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0xa8);

        /// address: 0x400264ac
        /// stream x memory 0 address
        /// register
        pub const S6M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0xac);

        /// address: 0x400264b0
        /// stream x memory 1 address
        /// register
        pub const S6M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0xb0);

        /// address: 0x400264b4
        /// stream x FIFO control register
        pub const S6FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xb4);

        /// address: 0x400264b8
        /// stream x configuration
        /// register
        pub const S7CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0xb8);

        /// address: 0x400264bc
        /// stream x number of data
        /// register
        pub const S7NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xbc);

        /// address: 0x400264c0
        /// stream x peripheral address
        /// register
        pub const S7PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0xc0);

        /// address: 0x400264c4
        /// stream x memory 0 address
        /// register
        pub const S7M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0xc4);

        /// address: 0x400264c8
        /// stream x memory 1 address
        /// register
        pub const S7M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0xc8);

        /// address: 0x400264cc
        /// stream x FIFO control register
        pub const S7FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xcc);
    };
    pub const DMA1 = struct {
        pub const base_address = 0x40026000;

        /// address: 0x40026000
        /// low interrupt status register
        pub const LISR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF0: u1,
            reserved0: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF0: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF0: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF0: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF0: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF1: u1,
            reserved1: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF1: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF1: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF1: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF2: u1,
            reserved6: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF2: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF2: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF2: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF2: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=3..0)
            FEIF3: u1,
            reserved7: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=3..0)
            DMEIF3: u1,
            /// Stream x transfer error interrupt flag
            /// (x=3..0)
            TEIF3: u1,
            /// Stream x half transfer interrupt flag
            /// (x=3..0)
            HTIF3: u1,
            /// Stream x transfer complete interrupt
            /// flag (x = 3..0)
            TCIF3: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x0);

        /// address: 0x40026004
        /// high interrupt status register
        pub const HISR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF4: u1,
            reserved0: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF4: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF4: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF4: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF4: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF5: u1,
            reserved1: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF5: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF5: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF5: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF5: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF6: u1,
            reserved6: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF6: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF6: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF6: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF6: u1,
            /// Stream x FIFO error interrupt flag
            /// (x=7..4)
            FEIF7: u1,
            reserved7: u1,
            /// Stream x direct mode error interrupt
            /// flag (x=7..4)
            DMEIF7: u1,
            /// Stream x transfer error interrupt flag
            /// (x=7..4)
            TEIF7: u1,
            /// Stream x half transfer interrupt flag
            /// (x=7..4)
            HTIF7: u1,
            /// Stream x transfer complete interrupt
            /// flag (x=7..4)
            TCIF7: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x4);

        /// address: 0x40026008
        /// low interrupt flag clear
        /// register
        pub const LIFCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF0: u1,
            reserved0: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF0: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF0: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF0: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF0: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF1: u1,
            reserved1: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF1: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF1: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF1: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF2: u1,
            reserved6: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF2: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF2: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF2: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF2: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 3..0)
            CFEIF3: u1,
            reserved7: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 3..0)
            CDMEIF3: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 3..0)
            CTEIF3: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 3..0)
            CHTIF3: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 3..0)
            CTCIF3: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x8);

        /// address: 0x4002600c
        /// high interrupt flag clear
        /// register
        pub const HIFCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF4: u1,
            reserved0: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF4: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF4: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF4: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF4: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF5: u1,
            reserved1: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF5: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF5: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF5: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF5: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF6: u1,
            reserved6: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF6: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF6: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF6: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF6: u1,
            /// Stream x clear FIFO error interrupt flag
            /// (x = 7..4)
            CFEIF7: u1,
            reserved7: u1,
            /// Stream x clear direct mode error
            /// interrupt flag (x = 7..4)
            CDMEIF7: u1,
            /// Stream x clear transfer error interrupt
            /// flag (x = 7..4)
            CTEIF7: u1,
            /// Stream x clear half transfer interrupt
            /// flag (x = 7..4)
            CHTIF7: u1,
            /// Stream x clear transfer complete
            /// interrupt flag (x = 7..4)
            CTCIF7: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0xc);

        /// address: 0x40026010
        /// stream x configuration
        /// register
        pub const S0CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            reserved0: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x10);

        /// address: 0x40026014
        /// stream x number of data
        /// register
        pub const S0NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40026018
        /// stream x peripheral address
        /// register
        pub const S0PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x18);

        /// address: 0x4002601c
        /// stream x memory 0 address
        /// register
        pub const S0M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x1c);

        /// address: 0x40026020
        /// stream x memory 1 address
        /// register
        pub const S0M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x20);

        /// address: 0x40026024
        /// stream x FIFO control register
        pub const S0FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x24);

        /// address: 0x40026028
        /// stream x configuration
        /// register
        pub const S1CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x28);

        /// address: 0x4002602c
        /// stream x number of data
        /// register
        pub const S1NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x2c);

        /// address: 0x40026030
        /// stream x peripheral address
        /// register
        pub const S1PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x30);

        /// address: 0x40026034
        /// stream x memory 0 address
        /// register
        pub const S1M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x34);

        /// address: 0x40026038
        /// stream x memory 1 address
        /// register
        pub const S1M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x38);

        /// address: 0x4002603c
        /// stream x FIFO control register
        pub const S1FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x3c);

        /// address: 0x40026040
        /// stream x configuration
        /// register
        pub const S2CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x40);

        /// address: 0x40026044
        /// stream x number of data
        /// register
        pub const S2NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x44);

        /// address: 0x40026048
        /// stream x peripheral address
        /// register
        pub const S2PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x48);

        /// address: 0x4002604c
        /// stream x memory 0 address
        /// register
        pub const S2M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x4c);

        /// address: 0x40026050
        /// stream x memory 1 address
        /// register
        pub const S2M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x50);

        /// address: 0x40026054
        /// stream x FIFO control register
        pub const S2FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x54);

        /// address: 0x40026058
        /// stream x configuration
        /// register
        pub const S3CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x58);

        /// address: 0x4002605c
        /// stream x number of data
        /// register
        pub const S3NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x5c);

        /// address: 0x40026060
        /// stream x peripheral address
        /// register
        pub const S3PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x60);

        /// address: 0x40026064
        /// stream x memory 0 address
        /// register
        pub const S3M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x64);

        /// address: 0x40026068
        /// stream x memory 1 address
        /// register
        pub const S3M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x68);

        /// address: 0x4002606c
        /// stream x FIFO control register
        pub const S3FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x6c);

        /// address: 0x40026070
        /// stream x configuration
        /// register
        pub const S4CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x70);

        /// address: 0x40026074
        /// stream x number of data
        /// register
        pub const S4NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x74);

        /// address: 0x40026078
        /// stream x peripheral address
        /// register
        pub const S4PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x78);

        /// address: 0x4002607c
        /// stream x memory 0 address
        /// register
        pub const S4M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x7c);

        /// address: 0x40026080
        /// stream x memory 1 address
        /// register
        pub const S4M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x80);

        /// address: 0x40026084
        /// stream x FIFO control register
        pub const S4FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x84);

        /// address: 0x40026088
        /// stream x configuration
        /// register
        pub const S5CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0x88);

        /// address: 0x4002608c
        /// stream x number of data
        /// register
        pub const S5NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8c);

        /// address: 0x40026090
        /// stream x peripheral address
        /// register
        pub const S5PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0x90);

        /// address: 0x40026094
        /// stream x memory 0 address
        /// register
        pub const S5M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0x94);

        /// address: 0x40026098
        /// stream x memory 1 address
        /// register
        pub const S5M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0x98);

        /// address: 0x4002609c
        /// stream x FIFO control register
        pub const S5FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x9c);

        /// address: 0x400260a0
        /// stream x configuration
        /// register
        pub const S6CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0xa0);

        /// address: 0x400260a4
        /// stream x number of data
        /// register
        pub const S6NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xa4);

        /// address: 0x400260a8
        /// stream x peripheral address
        /// register
        pub const S6PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0xa8);

        /// address: 0x400260ac
        /// stream x memory 0 address
        /// register
        pub const S6M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0xac);

        /// address: 0x400260b0
        /// stream x memory 1 address
        /// register
        pub const S6M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0xb0);

        /// address: 0x400260b4
        /// stream x FIFO control register
        pub const S6FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xb4);

        /// address: 0x400260b8
        /// stream x configuration
        /// register
        pub const S7CR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Stream enable / flag stream ready when
            /// read low
            EN: u1,
            /// Direct mode error interrupt
            /// enable
            DMEIE: u1,
            /// Transfer error interrupt
            /// enable
            TEIE: u1,
            /// Half transfer interrupt
            /// enable
            HTIE: u1,
            /// Transfer complete interrupt
            /// enable
            TCIE: u1,
            /// Peripheral flow controller
            PFCTRL: u1,
            /// Data transfer direction
            DIR: u2,
            /// Circular mode
            CIRC: u1,
            /// Peripheral increment mode
            PINC: u1,
            /// Memory increment mode
            MINC: u1,
            /// Peripheral data size
            PSIZE: u2,
            /// Memory data size
            MSIZE: u2,
            /// Peripheral increment offset
            /// size
            PINCOS: u1,
            /// Priority level
            PL: u2,
            /// Double buffer mode
            DBM: u1,
            /// Current target (only in double buffer
            /// mode)
            CT: u1,
            /// ACK
            ACK: u1,
            /// Peripheral burst transfer
            /// configuration
            PBURST: u2,
            /// Memory burst transfer
            /// configuration
            MBURST: u2,
            /// Channel selection
            CHSEL: u3,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
        }), base_address + 0xb8);

        /// address: 0x400260bc
        /// stream x number of data
        /// register
        pub const S7NDTR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Number of data items to
            /// transfer
            NDT: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0xbc);

        /// address: 0x400260c0
        /// stream x peripheral address
        /// register
        pub const S7PAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral address
            PA: u32,
        }), base_address + 0xc0);

        /// address: 0x400260c4
        /// stream x memory 0 address
        /// register
        pub const S7M0AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 0 address
            M0A: u32,
        }), base_address + 0xc4);

        /// address: 0x400260c8
        /// stream x memory 1 address
        /// register
        pub const S7M1AR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory 1 address (used in case of Double
            /// buffer mode)
            M1A: u32,
        }), base_address + 0xc8);

        /// address: 0x400260cc
        /// stream x FIFO control register
        pub const S7FCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// FIFO threshold selection
            FTH: u2,
            /// Direct mode disable
            DMDIS: u1,
            /// FIFO status
            FS: u3,
            reserved0: u1,
            /// FIFO error interrupt
            /// enable
            FEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xcc);
    };

    /// General-purpose I/Os
    pub const GPIOH = struct {
        pub const base_address = 0x40021c00;

        /// address: 0x40021c00
        /// GPIO port mode register
        pub const MODER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            MODER0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER15: u2,
        }), base_address + 0x0);

        /// address: 0x40021c04
        /// GPIO port output type register
        pub const OTYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OT0: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT1: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT2: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT3: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT4: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT5: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT6: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT7: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT8: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT9: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT10: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT11: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT12: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT13: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT14: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x40021c08
        /// GPIO port output speed
        /// register
        pub const OSPEEDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR15: u2,
        }), base_address + 0x8);

        /// address: 0x40021c0c
        /// GPIO port pull-up/pull-down
        /// register
        pub const PUPDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR15: u2,
        }), base_address + 0xc);

        /// address: 0x40021c10
        /// GPIO port input data register
        pub const IDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port input data (y =
            /// 0..15)
            IDR0: u1,
            /// Port input data (y =
            /// 0..15)
            IDR1: u1,
            /// Port input data (y =
            /// 0..15)
            IDR2: u1,
            /// Port input data (y =
            /// 0..15)
            IDR3: u1,
            /// Port input data (y =
            /// 0..15)
            IDR4: u1,
            /// Port input data (y =
            /// 0..15)
            IDR5: u1,
            /// Port input data (y =
            /// 0..15)
            IDR6: u1,
            /// Port input data (y =
            /// 0..15)
            IDR7: u1,
            /// Port input data (y =
            /// 0..15)
            IDR8: u1,
            /// Port input data (y =
            /// 0..15)
            IDR9: u1,
            /// Port input data (y =
            /// 0..15)
            IDR10: u1,
            /// Port input data (y =
            /// 0..15)
            IDR11: u1,
            /// Port input data (y =
            /// 0..15)
            IDR12: u1,
            /// Port input data (y =
            /// 0..15)
            IDR13: u1,
            /// Port input data (y =
            /// 0..15)
            IDR14: u1,
            /// Port input data (y =
            /// 0..15)
            IDR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40021c14
        /// GPIO port output data register
        pub const ODR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port output data (y =
            /// 0..15)
            ODR0: u1,
            /// Port output data (y =
            /// 0..15)
            ODR1: u1,
            /// Port output data (y =
            /// 0..15)
            ODR2: u1,
            /// Port output data (y =
            /// 0..15)
            ODR3: u1,
            /// Port output data (y =
            /// 0..15)
            ODR4: u1,
            /// Port output data (y =
            /// 0..15)
            ODR5: u1,
            /// Port output data (y =
            /// 0..15)
            ODR6: u1,
            /// Port output data (y =
            /// 0..15)
            ODR7: u1,
            /// Port output data (y =
            /// 0..15)
            ODR8: u1,
            /// Port output data (y =
            /// 0..15)
            ODR9: u1,
            /// Port output data (y =
            /// 0..15)
            ODR10: u1,
            /// Port output data (y =
            /// 0..15)
            ODR11: u1,
            /// Port output data (y =
            /// 0..15)
            ODR12: u1,
            /// Port output data (y =
            /// 0..15)
            ODR13: u1,
            /// Port output data (y =
            /// 0..15)
            ODR14: u1,
            /// Port output data (y =
            /// 0..15)
            ODR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40021c18
        /// GPIO port bit set/reset
        /// register
        pub const BSRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x set bit y (y=
            /// 0..15)
            BS0: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS1: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS2: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS3: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS4: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS5: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS6: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS7: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS8: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS9: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS10: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS11: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS12: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS13: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS14: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS15: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BR0: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR1: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR2: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR3: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR4: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR5: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR6: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR7: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR8: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR9: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR10: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR11: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR12: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR13: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR14: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR15: u1,
        }), base_address + 0x18);

        /// address: 0x40021c1c
        /// GPIO port configuration lock
        /// register
        pub const LCKR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x lock bit y (y=
            /// 0..15)
            LCK0: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK1: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK2: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK3: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK4: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK5: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK6: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK7: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK8: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK9: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK10: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK11: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK12: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK13: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK14: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK15: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCKK: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x1c);

        /// address: 0x40021c20
        /// GPIO alternate function low
        /// register
        pub const AFRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL0: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL1: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL2: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL3: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL4: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL5: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL6: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL7: u4,
        }), base_address + 0x20);

        /// address: 0x40021c24
        /// GPIO alternate function high
        /// register
        pub const AFRH = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH8: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH9: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH10: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH11: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH12: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH13: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH14: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH15: u4,
        }), base_address + 0x24);
    };
    pub const GPIOE = struct {
        pub const base_address = 0x40021000;

        /// address: 0x40021000
        /// GPIO port mode register
        pub const MODER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            MODER0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER15: u2,
        }), base_address + 0x0);

        /// address: 0x40021004
        /// GPIO port output type register
        pub const OTYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OT0: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT1: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT2: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT3: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT4: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT5: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT6: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT7: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT8: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT9: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT10: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT11: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT12: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT13: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT14: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x40021008
        /// GPIO port output speed
        /// register
        pub const OSPEEDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR15: u2,
        }), base_address + 0x8);

        /// address: 0x4002100c
        /// GPIO port pull-up/pull-down
        /// register
        pub const PUPDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR15: u2,
        }), base_address + 0xc);

        /// address: 0x40021010
        /// GPIO port input data register
        pub const IDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port input data (y =
            /// 0..15)
            IDR0: u1,
            /// Port input data (y =
            /// 0..15)
            IDR1: u1,
            /// Port input data (y =
            /// 0..15)
            IDR2: u1,
            /// Port input data (y =
            /// 0..15)
            IDR3: u1,
            /// Port input data (y =
            /// 0..15)
            IDR4: u1,
            /// Port input data (y =
            /// 0..15)
            IDR5: u1,
            /// Port input data (y =
            /// 0..15)
            IDR6: u1,
            /// Port input data (y =
            /// 0..15)
            IDR7: u1,
            /// Port input data (y =
            /// 0..15)
            IDR8: u1,
            /// Port input data (y =
            /// 0..15)
            IDR9: u1,
            /// Port input data (y =
            /// 0..15)
            IDR10: u1,
            /// Port input data (y =
            /// 0..15)
            IDR11: u1,
            /// Port input data (y =
            /// 0..15)
            IDR12: u1,
            /// Port input data (y =
            /// 0..15)
            IDR13: u1,
            /// Port input data (y =
            /// 0..15)
            IDR14: u1,
            /// Port input data (y =
            /// 0..15)
            IDR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40021014
        /// GPIO port output data register
        pub const ODR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port output data (y =
            /// 0..15)
            ODR0: u1,
            /// Port output data (y =
            /// 0..15)
            ODR1: u1,
            /// Port output data (y =
            /// 0..15)
            ODR2: u1,
            /// Port output data (y =
            /// 0..15)
            ODR3: u1,
            /// Port output data (y =
            /// 0..15)
            ODR4: u1,
            /// Port output data (y =
            /// 0..15)
            ODR5: u1,
            /// Port output data (y =
            /// 0..15)
            ODR6: u1,
            /// Port output data (y =
            /// 0..15)
            ODR7: u1,
            /// Port output data (y =
            /// 0..15)
            ODR8: u1,
            /// Port output data (y =
            /// 0..15)
            ODR9: u1,
            /// Port output data (y =
            /// 0..15)
            ODR10: u1,
            /// Port output data (y =
            /// 0..15)
            ODR11: u1,
            /// Port output data (y =
            /// 0..15)
            ODR12: u1,
            /// Port output data (y =
            /// 0..15)
            ODR13: u1,
            /// Port output data (y =
            /// 0..15)
            ODR14: u1,
            /// Port output data (y =
            /// 0..15)
            ODR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40021018
        /// GPIO port bit set/reset
        /// register
        pub const BSRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x set bit y (y=
            /// 0..15)
            BS0: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS1: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS2: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS3: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS4: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS5: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS6: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS7: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS8: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS9: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS10: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS11: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS12: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS13: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS14: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS15: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BR0: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR1: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR2: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR3: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR4: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR5: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR6: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR7: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR8: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR9: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR10: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR11: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR12: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR13: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR14: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR15: u1,
        }), base_address + 0x18);

        /// address: 0x4002101c
        /// GPIO port configuration lock
        /// register
        pub const LCKR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x lock bit y (y=
            /// 0..15)
            LCK0: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK1: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK2: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK3: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK4: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK5: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK6: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK7: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK8: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK9: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK10: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK11: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK12: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK13: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK14: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK15: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCKK: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x1c);

        /// address: 0x40021020
        /// GPIO alternate function low
        /// register
        pub const AFRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL0: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL1: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL2: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL3: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL4: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL5: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL6: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL7: u4,
        }), base_address + 0x20);

        /// address: 0x40021024
        /// GPIO alternate function high
        /// register
        pub const AFRH = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH8: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH9: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH10: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH11: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH12: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH13: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH14: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH15: u4,
        }), base_address + 0x24);
    };
    pub const GPIOD = struct {
        pub const base_address = 0x40020c00;

        /// address: 0x40020c00
        /// GPIO port mode register
        pub const MODER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            MODER0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER15: u2,
        }), base_address + 0x0);

        /// address: 0x40020c04
        /// GPIO port output type register
        pub const OTYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OT0: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT1: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT2: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT3: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT4: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT5: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT6: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT7: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT8: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT9: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT10: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT11: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT12: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT13: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT14: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x40020c08
        /// GPIO port output speed
        /// register
        pub const OSPEEDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR15: u2,
        }), base_address + 0x8);

        /// address: 0x40020c0c
        /// GPIO port pull-up/pull-down
        /// register
        pub const PUPDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR15: u2,
        }), base_address + 0xc);

        /// address: 0x40020c10
        /// GPIO port input data register
        pub const IDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port input data (y =
            /// 0..15)
            IDR0: u1,
            /// Port input data (y =
            /// 0..15)
            IDR1: u1,
            /// Port input data (y =
            /// 0..15)
            IDR2: u1,
            /// Port input data (y =
            /// 0..15)
            IDR3: u1,
            /// Port input data (y =
            /// 0..15)
            IDR4: u1,
            /// Port input data (y =
            /// 0..15)
            IDR5: u1,
            /// Port input data (y =
            /// 0..15)
            IDR6: u1,
            /// Port input data (y =
            /// 0..15)
            IDR7: u1,
            /// Port input data (y =
            /// 0..15)
            IDR8: u1,
            /// Port input data (y =
            /// 0..15)
            IDR9: u1,
            /// Port input data (y =
            /// 0..15)
            IDR10: u1,
            /// Port input data (y =
            /// 0..15)
            IDR11: u1,
            /// Port input data (y =
            /// 0..15)
            IDR12: u1,
            /// Port input data (y =
            /// 0..15)
            IDR13: u1,
            /// Port input data (y =
            /// 0..15)
            IDR14: u1,
            /// Port input data (y =
            /// 0..15)
            IDR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40020c14
        /// GPIO port output data register
        pub const ODR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port output data (y =
            /// 0..15)
            ODR0: u1,
            /// Port output data (y =
            /// 0..15)
            ODR1: u1,
            /// Port output data (y =
            /// 0..15)
            ODR2: u1,
            /// Port output data (y =
            /// 0..15)
            ODR3: u1,
            /// Port output data (y =
            /// 0..15)
            ODR4: u1,
            /// Port output data (y =
            /// 0..15)
            ODR5: u1,
            /// Port output data (y =
            /// 0..15)
            ODR6: u1,
            /// Port output data (y =
            /// 0..15)
            ODR7: u1,
            /// Port output data (y =
            /// 0..15)
            ODR8: u1,
            /// Port output data (y =
            /// 0..15)
            ODR9: u1,
            /// Port output data (y =
            /// 0..15)
            ODR10: u1,
            /// Port output data (y =
            /// 0..15)
            ODR11: u1,
            /// Port output data (y =
            /// 0..15)
            ODR12: u1,
            /// Port output data (y =
            /// 0..15)
            ODR13: u1,
            /// Port output data (y =
            /// 0..15)
            ODR14: u1,
            /// Port output data (y =
            /// 0..15)
            ODR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40020c18
        /// GPIO port bit set/reset
        /// register
        pub const BSRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x set bit y (y=
            /// 0..15)
            BS0: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS1: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS2: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS3: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS4: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS5: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS6: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS7: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS8: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS9: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS10: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS11: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS12: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS13: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS14: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS15: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BR0: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR1: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR2: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR3: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR4: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR5: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR6: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR7: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR8: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR9: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR10: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR11: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR12: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR13: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR14: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR15: u1,
        }), base_address + 0x18);

        /// address: 0x40020c1c
        /// GPIO port configuration lock
        /// register
        pub const LCKR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x lock bit y (y=
            /// 0..15)
            LCK0: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK1: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK2: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK3: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK4: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK5: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK6: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK7: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK8: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK9: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK10: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK11: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK12: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK13: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK14: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK15: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCKK: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x1c);

        /// address: 0x40020c20
        /// GPIO alternate function low
        /// register
        pub const AFRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL0: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL1: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL2: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL3: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL4: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL5: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL6: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL7: u4,
        }), base_address + 0x20);

        /// address: 0x40020c24
        /// GPIO alternate function high
        /// register
        pub const AFRH = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH8: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH9: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH10: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH11: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH12: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH13: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH14: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH15: u4,
        }), base_address + 0x24);
    };
    pub const GPIOC = struct {
        pub const base_address = 0x40020800;

        /// address: 0x40020800
        /// GPIO port mode register
        pub const MODER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            MODER0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER15: u2,
        }), base_address + 0x0);

        /// address: 0x40020804
        /// GPIO port output type register
        pub const OTYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OT0: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT1: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT2: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT3: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT4: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT5: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT6: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT7: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT8: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT9: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT10: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT11: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT12: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT13: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT14: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x40020808
        /// GPIO port output speed
        /// register
        pub const OSPEEDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR15: u2,
        }), base_address + 0x8);

        /// address: 0x4002080c
        /// GPIO port pull-up/pull-down
        /// register
        pub const PUPDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR15: u2,
        }), base_address + 0xc);

        /// address: 0x40020810
        /// GPIO port input data register
        pub const IDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port input data (y =
            /// 0..15)
            IDR0: u1,
            /// Port input data (y =
            /// 0..15)
            IDR1: u1,
            /// Port input data (y =
            /// 0..15)
            IDR2: u1,
            /// Port input data (y =
            /// 0..15)
            IDR3: u1,
            /// Port input data (y =
            /// 0..15)
            IDR4: u1,
            /// Port input data (y =
            /// 0..15)
            IDR5: u1,
            /// Port input data (y =
            /// 0..15)
            IDR6: u1,
            /// Port input data (y =
            /// 0..15)
            IDR7: u1,
            /// Port input data (y =
            /// 0..15)
            IDR8: u1,
            /// Port input data (y =
            /// 0..15)
            IDR9: u1,
            /// Port input data (y =
            /// 0..15)
            IDR10: u1,
            /// Port input data (y =
            /// 0..15)
            IDR11: u1,
            /// Port input data (y =
            /// 0..15)
            IDR12: u1,
            /// Port input data (y =
            /// 0..15)
            IDR13: u1,
            /// Port input data (y =
            /// 0..15)
            IDR14: u1,
            /// Port input data (y =
            /// 0..15)
            IDR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40020814
        /// GPIO port output data register
        pub const ODR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port output data (y =
            /// 0..15)
            ODR0: u1,
            /// Port output data (y =
            /// 0..15)
            ODR1: u1,
            /// Port output data (y =
            /// 0..15)
            ODR2: u1,
            /// Port output data (y =
            /// 0..15)
            ODR3: u1,
            /// Port output data (y =
            /// 0..15)
            ODR4: u1,
            /// Port output data (y =
            /// 0..15)
            ODR5: u1,
            /// Port output data (y =
            /// 0..15)
            ODR6: u1,
            /// Port output data (y =
            /// 0..15)
            ODR7: u1,
            /// Port output data (y =
            /// 0..15)
            ODR8: u1,
            /// Port output data (y =
            /// 0..15)
            ODR9: u1,
            /// Port output data (y =
            /// 0..15)
            ODR10: u1,
            /// Port output data (y =
            /// 0..15)
            ODR11: u1,
            /// Port output data (y =
            /// 0..15)
            ODR12: u1,
            /// Port output data (y =
            /// 0..15)
            ODR13: u1,
            /// Port output data (y =
            /// 0..15)
            ODR14: u1,
            /// Port output data (y =
            /// 0..15)
            ODR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40020818
        /// GPIO port bit set/reset
        /// register
        pub const BSRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x set bit y (y=
            /// 0..15)
            BS0: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS1: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS2: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS3: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS4: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS5: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS6: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS7: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS8: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS9: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS10: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS11: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS12: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS13: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS14: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS15: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BR0: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR1: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR2: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR3: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR4: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR5: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR6: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR7: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR8: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR9: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR10: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR11: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR12: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR13: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR14: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR15: u1,
        }), base_address + 0x18);

        /// address: 0x4002081c
        /// GPIO port configuration lock
        /// register
        pub const LCKR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x lock bit y (y=
            /// 0..15)
            LCK0: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK1: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK2: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK3: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK4: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK5: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK6: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK7: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK8: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK9: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK10: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK11: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK12: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK13: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK14: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK15: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCKK: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x1c);

        /// address: 0x40020820
        /// GPIO alternate function low
        /// register
        pub const AFRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL0: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL1: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL2: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL3: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL4: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL5: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL6: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL7: u4,
        }), base_address + 0x20);

        /// address: 0x40020824
        /// GPIO alternate function high
        /// register
        pub const AFRH = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH8: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH9: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH10: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH11: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH12: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH13: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH14: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH15: u4,
        }), base_address + 0x24);
    };

    /// General-purpose I/Os
    pub const GPIOB = struct {
        pub const base_address = 0x40020400;

        /// address: 0x40020400
        /// GPIO port mode register
        pub const MODER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            MODER0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER15: u2,
        }), base_address + 0x0);

        /// address: 0x40020404
        /// GPIO port output type register
        pub const OTYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OT0: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT1: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT2: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT3: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT4: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT5: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT6: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT7: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT8: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT9: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT10: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT11: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT12: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT13: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT14: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x40020408
        /// GPIO port output speed
        /// register
        pub const OSPEEDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR15: u2,
        }), base_address + 0x8);

        /// address: 0x4002040c
        /// GPIO port pull-up/pull-down
        /// register
        pub const PUPDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR15: u2,
        }), base_address + 0xc);

        /// address: 0x40020410
        /// GPIO port input data register
        pub const IDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port input data (y =
            /// 0..15)
            IDR0: u1,
            /// Port input data (y =
            /// 0..15)
            IDR1: u1,
            /// Port input data (y =
            /// 0..15)
            IDR2: u1,
            /// Port input data (y =
            /// 0..15)
            IDR3: u1,
            /// Port input data (y =
            /// 0..15)
            IDR4: u1,
            /// Port input data (y =
            /// 0..15)
            IDR5: u1,
            /// Port input data (y =
            /// 0..15)
            IDR6: u1,
            /// Port input data (y =
            /// 0..15)
            IDR7: u1,
            /// Port input data (y =
            /// 0..15)
            IDR8: u1,
            /// Port input data (y =
            /// 0..15)
            IDR9: u1,
            /// Port input data (y =
            /// 0..15)
            IDR10: u1,
            /// Port input data (y =
            /// 0..15)
            IDR11: u1,
            /// Port input data (y =
            /// 0..15)
            IDR12: u1,
            /// Port input data (y =
            /// 0..15)
            IDR13: u1,
            /// Port input data (y =
            /// 0..15)
            IDR14: u1,
            /// Port input data (y =
            /// 0..15)
            IDR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40020414
        /// GPIO port output data register
        pub const ODR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port output data (y =
            /// 0..15)
            ODR0: u1,
            /// Port output data (y =
            /// 0..15)
            ODR1: u1,
            /// Port output data (y =
            /// 0..15)
            ODR2: u1,
            /// Port output data (y =
            /// 0..15)
            ODR3: u1,
            /// Port output data (y =
            /// 0..15)
            ODR4: u1,
            /// Port output data (y =
            /// 0..15)
            ODR5: u1,
            /// Port output data (y =
            /// 0..15)
            ODR6: u1,
            /// Port output data (y =
            /// 0..15)
            ODR7: u1,
            /// Port output data (y =
            /// 0..15)
            ODR8: u1,
            /// Port output data (y =
            /// 0..15)
            ODR9: u1,
            /// Port output data (y =
            /// 0..15)
            ODR10: u1,
            /// Port output data (y =
            /// 0..15)
            ODR11: u1,
            /// Port output data (y =
            /// 0..15)
            ODR12: u1,
            /// Port output data (y =
            /// 0..15)
            ODR13: u1,
            /// Port output data (y =
            /// 0..15)
            ODR14: u1,
            /// Port output data (y =
            /// 0..15)
            ODR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40020418
        /// GPIO port bit set/reset
        /// register
        pub const BSRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x set bit y (y=
            /// 0..15)
            BS0: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS1: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS2: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS3: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS4: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS5: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS6: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS7: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS8: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS9: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS10: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS11: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS12: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS13: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS14: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS15: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BR0: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR1: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR2: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR3: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR4: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR5: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR6: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR7: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR8: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR9: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR10: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR11: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR12: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR13: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR14: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR15: u1,
        }), base_address + 0x18);

        /// address: 0x4002041c
        /// GPIO port configuration lock
        /// register
        pub const LCKR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x lock bit y (y=
            /// 0..15)
            LCK0: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK1: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK2: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK3: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK4: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK5: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK6: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK7: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK8: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK9: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK10: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK11: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK12: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK13: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK14: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK15: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCKK: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x1c);

        /// address: 0x40020420
        /// GPIO alternate function low
        /// register
        pub const AFRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL0: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL1: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL2: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL3: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL4: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL5: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL6: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL7: u4,
        }), base_address + 0x20);

        /// address: 0x40020424
        /// GPIO alternate function high
        /// register
        pub const AFRH = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH8: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH9: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH10: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH11: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH12: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH13: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH14: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH15: u4,
        }), base_address + 0x24);
    };

    /// General-purpose I/Os
    pub const GPIOA = struct {
        pub const base_address = 0x40020000;

        /// address: 0x40020000
        /// GPIO port mode register
        pub const MODER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            MODER0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            MODER15: u2,
        }), base_address + 0x0);

        /// address: 0x40020004
        /// GPIO port output type register
        pub const OTYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OT0: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT1: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT2: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT3: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT4: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT5: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT6: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT7: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT8: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT9: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT10: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT11: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT12: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT13: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT14: u1,
            /// Port x configuration bits (y =
            /// 0..15)
            OT15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x4);

        /// address: 0x40020008
        /// GPIO port output speed
        /// register
        pub const OSPEEDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            OSPEEDR15: u2,
        }), base_address + 0x8);

        /// address: 0x4002000c
        /// GPIO port pull-up/pull-down
        /// register
        pub const PUPDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR0: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR1: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR2: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR3: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR4: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR5: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR6: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR7: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR8: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR9: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR10: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR11: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR12: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR13: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR14: u2,
            /// Port x configuration bits (y =
            /// 0..15)
            PUPDR15: u2,
        }), base_address + 0xc);

        /// address: 0x40020010
        /// GPIO port input data register
        pub const IDR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port input data (y =
            /// 0..15)
            IDR0: u1,
            /// Port input data (y =
            /// 0..15)
            IDR1: u1,
            /// Port input data (y =
            /// 0..15)
            IDR2: u1,
            /// Port input data (y =
            /// 0..15)
            IDR3: u1,
            /// Port input data (y =
            /// 0..15)
            IDR4: u1,
            /// Port input data (y =
            /// 0..15)
            IDR5: u1,
            /// Port input data (y =
            /// 0..15)
            IDR6: u1,
            /// Port input data (y =
            /// 0..15)
            IDR7: u1,
            /// Port input data (y =
            /// 0..15)
            IDR8: u1,
            /// Port input data (y =
            /// 0..15)
            IDR9: u1,
            /// Port input data (y =
            /// 0..15)
            IDR10: u1,
            /// Port input data (y =
            /// 0..15)
            IDR11: u1,
            /// Port input data (y =
            /// 0..15)
            IDR12: u1,
            /// Port input data (y =
            /// 0..15)
            IDR13: u1,
            /// Port input data (y =
            /// 0..15)
            IDR14: u1,
            /// Port input data (y =
            /// 0..15)
            IDR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40020014
        /// GPIO port output data register
        pub const ODR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port output data (y =
            /// 0..15)
            ODR0: u1,
            /// Port output data (y =
            /// 0..15)
            ODR1: u1,
            /// Port output data (y =
            /// 0..15)
            ODR2: u1,
            /// Port output data (y =
            /// 0..15)
            ODR3: u1,
            /// Port output data (y =
            /// 0..15)
            ODR4: u1,
            /// Port output data (y =
            /// 0..15)
            ODR5: u1,
            /// Port output data (y =
            /// 0..15)
            ODR6: u1,
            /// Port output data (y =
            /// 0..15)
            ODR7: u1,
            /// Port output data (y =
            /// 0..15)
            ODR8: u1,
            /// Port output data (y =
            /// 0..15)
            ODR9: u1,
            /// Port output data (y =
            /// 0..15)
            ODR10: u1,
            /// Port output data (y =
            /// 0..15)
            ODR11: u1,
            /// Port output data (y =
            /// 0..15)
            ODR12: u1,
            /// Port output data (y =
            /// 0..15)
            ODR13: u1,
            /// Port output data (y =
            /// 0..15)
            ODR14: u1,
            /// Port output data (y =
            /// 0..15)
            ODR15: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40020018
        /// GPIO port bit set/reset
        /// register
        pub const BSRR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x set bit y (y=
            /// 0..15)
            BS0: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS1: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS2: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS3: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS4: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS5: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS6: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS7: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS8: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS9: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS10: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS11: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS12: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS13: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS14: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BS15: u1,
            /// Port x set bit y (y=
            /// 0..15)
            BR0: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR1: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR2: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR3: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR4: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR5: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR6: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR7: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR8: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR9: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR10: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR11: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR12: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR13: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR14: u1,
            /// Port x reset bit y (y =
            /// 0..15)
            BR15: u1,
        }), base_address + 0x18);

        /// address: 0x4002001c
        /// GPIO port configuration lock
        /// register
        pub const LCKR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Port x lock bit y (y=
            /// 0..15)
            LCK0: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK1: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK2: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK3: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK4: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK5: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK6: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK7: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK8: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK9: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK10: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK11: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK12: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK13: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK14: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCK15: u1,
            /// Port x lock bit y (y=
            /// 0..15)
            LCKK: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
        }), base_address + 0x1c);

        /// address: 0x40020020
        /// GPIO alternate function low
        /// register
        pub const AFRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL0: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL1: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL2: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL3: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL4: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL5: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL6: u4,
            /// Alternate function selection for port x
            /// bit y (y = 0..7)
            AFRL7: u4,
        }), base_address + 0x20);

        /// address: 0x40020024
        /// GPIO alternate function high
        /// register
        pub const AFRH = @intToPtr(*volatile Mmio(32, packed struct {
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH8: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH9: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH10: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH11: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH12: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH13: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH14: u4,
            /// Alternate function selection for port x
            /// bit y (y = 8..15)
            AFRH15: u4,
        }), base_address + 0x24);
    };

    /// Inter-integrated circuit
    pub const I2C3 = struct {
        pub const base_address = 0x40005c00;

        /// address: 0x40005c00
        /// Control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral enable
            PE: u1,
            /// SMBus mode
            SMBUS: u1,
            reserved0: u1,
            /// SMBus type
            SMBTYPE: u1,
            /// ARP enable
            ENARP: u1,
            /// PEC enable
            ENPEC: u1,
            /// General call enable
            ENGC: u1,
            /// Clock stretching disable (Slave
            /// mode)
            NOSTRETCH: u1,
            /// Start generation
            START: u1,
            /// Stop generation
            STOP: u1,
            /// Acknowledge enable
            ACK: u1,
            /// Acknowledge/PEC Position (for data
            /// reception)
            POS: u1,
            /// Packet error checking
            PEC: u1,
            /// SMBus alert
            ALERT: u1,
            reserved1: u1,
            /// Software reset
            SWRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40005c04
        /// Control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral clock frequency
            FREQ: u6,
            reserved0: u1,
            reserved1: u1,
            /// Error interrupt enable
            ITERREN: u1,
            /// Event interrupt enable
            ITEVTEN: u1,
            /// Buffer interrupt enable
            ITBUFEN: u1,
            /// DMA requests enable
            DMAEN: u1,
            /// DMA last transfer
            LAST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x4);

        /// address: 0x40005c08
        /// Own address register 1
        pub const OAR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Interface address
            ADD0: u1,
            /// Interface address
            ADD7: u7,
            /// Interface address
            ADD10: u2,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Addressing mode (slave
            /// mode)
            ADDMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x40005c0c
        /// Own address register 2
        pub const OAR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Dual addressing mode
            /// enable
            ENDUAL: u1,
            /// Interface address
            ADD2: u7,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xc);

        /// address: 0x40005c10
        /// Data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u8), base_address + 0x10);

        /// address: 0x40005c14
        /// Status register 1
        pub const SR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Start bit (Master mode)
            SB: u1,
            /// Address sent (master mode)/matched
            /// (slave mode)
            ADDR: u1,
            /// Byte transfer finished
            BTF: u1,
            /// 10-bit header sent (Master
            /// mode)
            ADD10: u1,
            /// Stop detection (slave
            /// mode)
            STOPF: u1,
            reserved0: u1,
            /// Data register not empty
            /// (receivers)
            RxNE: u1,
            /// Data register empty
            /// (transmitters)
            TxE: u1,
            /// Bus error
            BERR: u1,
            /// Arbitration lost (master
            /// mode)
            ARLO: u1,
            /// Acknowledge failure
            AF: u1,
            /// Overrun/Underrun
            OVR: u1,
            /// PEC Error in reception
            PECERR: u1,
            reserved1: u1,
            /// Timeout or Tlow error
            TIMEOUT: u1,
            /// SMBus alert
            SMBALERT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40005c18
        /// Status register 2
        pub const SR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Master/slave
            MSL: u1,
            /// Bus busy
            BUSY: u1,
            /// Transmitter/receiver
            TRA: u1,
            reserved0: u1,
            /// General call address (Slave
            /// mode)
            GENCALL: u1,
            /// SMBus device default address (Slave
            /// mode)
            SMBDEFAULT: u1,
            /// SMBus host header (Slave
            /// mode)
            SMBHOST: u1,
            /// Dual flag (Slave mode)
            DUALF: u1,
            /// acket error checking
            /// register
            PEC: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40005c1c
        /// Clock control register
        pub const CCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock control register in Fast/Standard
            /// mode (Master mode)
            CCR: u12,
            reserved0: u1,
            reserved1: u1,
            /// Fast mode duty cycle
            DUTY: u1,
            /// I2C master mode selection
            F_S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40005c20
        /// TRISE register
        pub const TRISE = @intToPtr(*volatile MmioInt(32, u6), base_address + 0x20);
    };
    pub const I2C2 = struct {
        pub const base_address = 0x40005800;

        /// address: 0x40005800
        /// Control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral enable
            PE: u1,
            /// SMBus mode
            SMBUS: u1,
            reserved0: u1,
            /// SMBus type
            SMBTYPE: u1,
            /// ARP enable
            ENARP: u1,
            /// PEC enable
            ENPEC: u1,
            /// General call enable
            ENGC: u1,
            /// Clock stretching disable (Slave
            /// mode)
            NOSTRETCH: u1,
            /// Start generation
            START: u1,
            /// Stop generation
            STOP: u1,
            /// Acknowledge enable
            ACK: u1,
            /// Acknowledge/PEC Position (for data
            /// reception)
            POS: u1,
            /// Packet error checking
            PEC: u1,
            /// SMBus alert
            ALERT: u1,
            reserved1: u1,
            /// Software reset
            SWRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40005804
        /// Control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral clock frequency
            FREQ: u6,
            reserved0: u1,
            reserved1: u1,
            /// Error interrupt enable
            ITERREN: u1,
            /// Event interrupt enable
            ITEVTEN: u1,
            /// Buffer interrupt enable
            ITBUFEN: u1,
            /// DMA requests enable
            DMAEN: u1,
            /// DMA last transfer
            LAST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x4);

        /// address: 0x40005808
        /// Own address register 1
        pub const OAR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Interface address
            ADD0: u1,
            /// Interface address
            ADD7: u7,
            /// Interface address
            ADD10: u2,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Addressing mode (slave
            /// mode)
            ADDMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4000580c
        /// Own address register 2
        pub const OAR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Dual addressing mode
            /// enable
            ENDUAL: u1,
            /// Interface address
            ADD2: u7,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xc);

        /// address: 0x40005810
        /// Data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u8), base_address + 0x10);

        /// address: 0x40005814
        /// Status register 1
        pub const SR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Start bit (Master mode)
            SB: u1,
            /// Address sent (master mode)/matched
            /// (slave mode)
            ADDR: u1,
            /// Byte transfer finished
            BTF: u1,
            /// 10-bit header sent (Master
            /// mode)
            ADD10: u1,
            /// Stop detection (slave
            /// mode)
            STOPF: u1,
            reserved0: u1,
            /// Data register not empty
            /// (receivers)
            RxNE: u1,
            /// Data register empty
            /// (transmitters)
            TxE: u1,
            /// Bus error
            BERR: u1,
            /// Arbitration lost (master
            /// mode)
            ARLO: u1,
            /// Acknowledge failure
            AF: u1,
            /// Overrun/Underrun
            OVR: u1,
            /// PEC Error in reception
            PECERR: u1,
            reserved1: u1,
            /// Timeout or Tlow error
            TIMEOUT: u1,
            /// SMBus alert
            SMBALERT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40005818
        /// Status register 2
        pub const SR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Master/slave
            MSL: u1,
            /// Bus busy
            BUSY: u1,
            /// Transmitter/receiver
            TRA: u1,
            reserved0: u1,
            /// General call address (Slave
            /// mode)
            GENCALL: u1,
            /// SMBus device default address (Slave
            /// mode)
            SMBDEFAULT: u1,
            /// SMBus host header (Slave
            /// mode)
            SMBHOST: u1,
            /// Dual flag (Slave mode)
            DUALF: u1,
            /// acket error checking
            /// register
            PEC: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000581c
        /// Clock control register
        pub const CCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock control register in Fast/Standard
            /// mode (Master mode)
            CCR: u12,
            reserved0: u1,
            reserved1: u1,
            /// Fast mode duty cycle
            DUTY: u1,
            /// I2C master mode selection
            F_S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40005820
        /// TRISE register
        pub const TRISE = @intToPtr(*volatile MmioInt(32, u6), base_address + 0x20);
    };
    pub const I2C1 = struct {
        pub const base_address = 0x40005400;

        /// address: 0x40005400
        /// Control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral enable
            PE: u1,
            /// SMBus mode
            SMBUS: u1,
            reserved0: u1,
            /// SMBus type
            SMBTYPE: u1,
            /// ARP enable
            ENARP: u1,
            /// PEC enable
            ENPEC: u1,
            /// General call enable
            ENGC: u1,
            /// Clock stretching disable (Slave
            /// mode)
            NOSTRETCH: u1,
            /// Start generation
            START: u1,
            /// Stop generation
            STOP: u1,
            /// Acknowledge enable
            ACK: u1,
            /// Acknowledge/PEC Position (for data
            /// reception)
            POS: u1,
            /// Packet error checking
            PEC: u1,
            /// SMBus alert
            ALERT: u1,
            reserved1: u1,
            /// Software reset
            SWRST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40005404
        /// Control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Peripheral clock frequency
            FREQ: u6,
            reserved0: u1,
            reserved1: u1,
            /// Error interrupt enable
            ITERREN: u1,
            /// Event interrupt enable
            ITEVTEN: u1,
            /// Buffer interrupt enable
            ITBUFEN: u1,
            /// DMA requests enable
            DMAEN: u1,
            /// DMA last transfer
            LAST: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
        }), base_address + 0x4);

        /// address: 0x40005408
        /// Own address register 1
        pub const OAR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Interface address
            ADD0: u1,
            /// Interface address
            ADD7: u7,
            /// Interface address
            ADD10: u2,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Addressing mode (slave
            /// mode)
            ADDMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x8);

        /// address: 0x4000540c
        /// Own address register 2
        pub const OAR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Dual addressing mode
            /// enable
            ENDUAL: u1,
            /// Interface address
            ADD2: u7,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0xc);

        /// address: 0x40005410
        /// Data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u8), base_address + 0x10);

        /// address: 0x40005414
        /// Status register 1
        pub const SR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Start bit (Master mode)
            SB: u1,
            /// Address sent (master mode)/matched
            /// (slave mode)
            ADDR: u1,
            /// Byte transfer finished
            BTF: u1,
            /// 10-bit header sent (Master
            /// mode)
            ADD10: u1,
            /// Stop detection (slave
            /// mode)
            STOPF: u1,
            reserved0: u1,
            /// Data register not empty
            /// (receivers)
            RxNE: u1,
            /// Data register empty
            /// (transmitters)
            TxE: u1,
            /// Bus error
            BERR: u1,
            /// Arbitration lost (master
            /// mode)
            ARLO: u1,
            /// Acknowledge failure
            AF: u1,
            /// Overrun/Underrun
            OVR: u1,
            /// PEC Error in reception
            PECERR: u1,
            reserved1: u1,
            /// Timeout or Tlow error
            TIMEOUT: u1,
            /// SMBus alert
            SMBALERT: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40005418
        /// Status register 2
        pub const SR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Master/slave
            MSL: u1,
            /// Bus busy
            BUSY: u1,
            /// Transmitter/receiver
            TRA: u1,
            reserved0: u1,
            /// General call address (Slave
            /// mode)
            GENCALL: u1,
            /// SMBus device default address (Slave
            /// mode)
            SMBDEFAULT: u1,
            /// SMBus host header (Slave
            /// mode)
            SMBHOST: u1,
            /// Dual flag (Slave mode)
            DUALF: u1,
            /// acket error checking
            /// register
            PEC: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000541c
        /// Clock control register
        pub const CCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock control register in Fast/Standard
            /// mode (Master mode)
            CCR: u12,
            reserved0: u1,
            reserved1: u1,
            /// Fast mode duty cycle
            DUTY: u1,
            /// I2C master mode selection
            F_S: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x1c);

        /// address: 0x40005420
        /// TRISE register
        pub const TRISE = @intToPtr(*volatile MmioInt(32, u6), base_address + 0x20);
    };

    /// Serial peripheral interface
    pub const I2S2ext = struct {
        pub const base_address = 0x40003400;

        /// address: 0x40003400
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40003404
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40003408
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x4000340c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40003410
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40003414
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40003418
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000341c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40003420
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };
    pub const I2S3ext = struct {
        pub const base_address = 0x40004000;

        /// address: 0x40004000
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40004004
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40004008
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x4000400c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40004010
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40004014
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40004018
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000401c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40004020
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };
    pub const SPI1 = struct {
        pub const base_address = 0x40013000;

        /// address: 0x40013000
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40013004
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40013008
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x4001300c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40013010
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40013014
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40013018
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4001301c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40013020
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };
    pub const SPI2 = struct {
        pub const base_address = 0x40003800;

        /// address: 0x40003800
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40003804
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40003808
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x4000380c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40003810
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40003814
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40003818
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4000381c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40003820
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };
    pub const SPI3 = struct {
        pub const base_address = 0x40003c00;

        /// address: 0x40003c00
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40003c04
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40003c08
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x40003c0c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40003c10
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40003c14
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40003c18
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x40003c1c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40003c20
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };
    pub const SPI4 = struct {
        pub const base_address = 0x40013400;

        /// address: 0x40013400
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40013404
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40013408
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x4001340c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40013410
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40013414
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40013418
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4001341c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40013420
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };
    pub const SPI5 = struct {
        pub const base_address = 0x40015000;

        /// address: 0x40015000
        /// control register 1
        pub const CR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Clock phase
            CPHA: u1,
            /// Clock polarity
            CPOL: u1,
            /// Master selection
            MSTR: u1,
            /// Baud rate control
            BR: u3,
            /// SPI enable
            SPE: u1,
            /// Frame format
            LSBFIRST: u1,
            /// Internal slave select
            SSI: u1,
            /// Software slave management
            SSM: u1,
            /// Receive only
            RXONLY: u1,
            /// Data frame format
            DFF: u1,
            /// CRC transfer next
            CRCNEXT: u1,
            /// Hardware CRC calculation
            /// enable
            CRCEN: u1,
            /// Output enable in bidirectional
            /// mode
            BIDIOE: u1,
            /// Bidirectional data mode
            /// enable
            BIDIMODE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x0);

        /// address: 0x40015004
        /// control register 2
        pub const CR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx buffer DMA enable
            RXDMAEN: u1,
            /// Tx buffer DMA enable
            TXDMAEN: u1,
            /// SS output enable
            SSOE: u1,
            reserved0: u1,
            /// Frame format
            FRF: u1,
            /// Error interrupt enable
            ERRIE: u1,
            /// RX buffer not empty interrupt
            /// enable
            RXNEIE: u1,
            /// Tx buffer empty interrupt
            /// enable
            TXEIE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x4);

        /// address: 0x40015008
        /// status register
        pub const SR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Receive buffer not empty
            RXNE: u1,
            /// Transmit buffer empty
            TXE: u1,
            /// Channel side
            CHSIDE: u1,
            /// Underrun flag
            UDR: u1,
            /// CRC error flag
            CRCERR: u1,
            /// Mode fault
            MODF: u1,
            /// Overrun flag
            OVR: u1,
            /// Busy flag
            BSY: u1,
            /// TI frame format error
            TIFRFE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x8);

        /// address: 0x4001500c
        /// data register
        pub const DR = @intToPtr(*volatile MmioInt(32, u16), base_address + 0xc);

        /// address: 0x40015010
        /// CRC polynomial register
        pub const CRCPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// CRC polynomial register
            CRCPOLY: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x10);

        /// address: 0x40015014
        /// RX CRC register
        pub const RXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Rx CRC register
            RxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x14);

        /// address: 0x40015018
        /// TX CRC register
        pub const TXCRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Tx CRC register
            TxCRC: u16,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
        }), base_address + 0x18);

        /// address: 0x4001501c
        /// I2S configuration register
        pub const I2SCFGR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Channel length (number of bits per audio
            /// channel)
            CHLEN: u1,
            /// Data length to be
            /// transferred
            DATLEN: u2,
            /// Steady state clock
            /// polarity
            CKPOL: u1,
            /// I2S standard selection
            I2SSTD: u2,
            reserved0: u1,
            /// PCM frame synchronization
            PCMSYNC: u1,
            /// I2S configuration mode
            I2SCFG: u2,
            /// I2S Enable
            I2SE: u1,
            /// I2S mode selection
            I2SMOD: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
        }), base_address + 0x1c);

        /// address: 0x40015020
        /// I2S prescaler register
        pub const I2SPR = @intToPtr(*volatile Mmio(32, packed struct {
            /// I2S Linear prescaler
            I2SDIV: u8,
            /// Odd factor for the
            /// prescaler
            ODD: u1,
            /// Master clock output enable
            MCKOE: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x20);
    };

    /// Nested Vectored Interrupt
    /// Controller
    pub const NVIC = struct {
        pub const base_address = 0xe000e100;

        /// address: 0xe000e100
        /// Interrupt Set-Enable Register
        pub const ISER0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// SETENA
            SETENA: u32,
        }), base_address + 0x0);

        /// address: 0xe000e104
        /// Interrupt Set-Enable Register
        pub const ISER1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// SETENA
            SETENA: u32,
        }), base_address + 0x4);

        /// address: 0xe000e108
        /// Interrupt Set-Enable Register
        pub const ISER2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// SETENA
            SETENA: u32,
        }), base_address + 0x8);

        /// address: 0xe000e180
        /// Interrupt Clear-Enable
        /// Register
        pub const ICER0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// CLRENA
            CLRENA: u32,
        }), base_address + 0x80);

        /// address: 0xe000e184
        /// Interrupt Clear-Enable
        /// Register
        pub const ICER1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// CLRENA
            CLRENA: u32,
        }), base_address + 0x84);

        /// address: 0xe000e188
        /// Interrupt Clear-Enable
        /// Register
        pub const ICER2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// CLRENA
            CLRENA: u32,
        }), base_address + 0x88);

        /// address: 0xe000e200
        /// Interrupt Set-Pending Register
        pub const ISPR0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// SETPEND
            SETPEND: u32,
        }), base_address + 0x100);

        /// address: 0xe000e204
        /// Interrupt Set-Pending Register
        pub const ISPR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// SETPEND
            SETPEND: u32,
        }), base_address + 0x104);

        /// address: 0xe000e208
        /// Interrupt Set-Pending Register
        pub const ISPR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// SETPEND
            SETPEND: u32,
        }), base_address + 0x108);

        /// address: 0xe000e280
        /// Interrupt Clear-Pending
        /// Register
        pub const ICPR0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// CLRPEND
            CLRPEND: u32,
        }), base_address + 0x180);

        /// address: 0xe000e284
        /// Interrupt Clear-Pending
        /// Register
        pub const ICPR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// CLRPEND
            CLRPEND: u32,
        }), base_address + 0x184);

        /// address: 0xe000e288
        /// Interrupt Clear-Pending
        /// Register
        pub const ICPR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// CLRPEND
            CLRPEND: u32,
        }), base_address + 0x188);

        /// address: 0xe000e300
        /// Interrupt Active Bit Register
        pub const IABR0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// ACTIVE
            ACTIVE: u32,
        }), base_address + 0x200);

        /// address: 0xe000e304
        /// Interrupt Active Bit Register
        pub const IABR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// ACTIVE
            ACTIVE: u32,
        }), base_address + 0x204);

        /// address: 0xe000e308
        /// Interrupt Active Bit Register
        pub const IABR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// ACTIVE
            ACTIVE: u32,
        }), base_address + 0x208);

        /// address: 0xe000e400
        /// Interrupt Priority Register
        pub const IPR0 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x300);

        /// address: 0xe000e404
        /// Interrupt Priority Register
        pub const IPR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x304);

        /// address: 0xe000e408
        /// Interrupt Priority Register
        pub const IPR2 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x308);

        /// address: 0xe000e40c
        /// Interrupt Priority Register
        pub const IPR3 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x30c);

        /// address: 0xe000e410
        /// Interrupt Priority Register
        pub const IPR4 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x310);

        /// address: 0xe000e414
        /// Interrupt Priority Register
        pub const IPR5 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x314);

        /// address: 0xe000e418
        /// Interrupt Priority Register
        pub const IPR6 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x318);

        /// address: 0xe000e41c
        /// Interrupt Priority Register
        pub const IPR7 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x31c);

        /// address: 0xe000e420
        /// Interrupt Priority Register
        pub const IPR8 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x320);

        /// address: 0xe000e424
        /// Interrupt Priority Register
        pub const IPR9 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x324);

        /// address: 0xe000e428
        /// Interrupt Priority Register
        pub const IPR10 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x328);

        /// address: 0xe000e42c
        /// Interrupt Priority Register
        pub const IPR11 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x32c);

        /// address: 0xe000e430
        /// Interrupt Priority Register
        pub const IPR12 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x330);

        /// address: 0xe000e434
        /// Interrupt Priority Register
        pub const IPR13 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x334);

        /// address: 0xe000e438
        /// Interrupt Priority Register
        pub const IPR14 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x338);

        /// address: 0xe000e43c
        /// Interrupt Priority Register
        pub const IPR15 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x33c);

        /// address: 0xe000e440
        /// Interrupt Priority Register
        pub const IPR16 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x340);

        /// address: 0xe000e444
        /// Interrupt Priority Register
        pub const IPR17 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x344);

        /// address: 0xe000e448
        /// Interrupt Priority Register
        pub const IPR18 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x348);

        /// address: 0xe000e44c
        /// Interrupt Priority Register
        pub const IPR19 = @intToPtr(*volatile Mmio(32, packed struct {
            /// IPR_N0
            IPR_N0: u8,
            /// IPR_N1
            IPR_N1: u8,
            /// IPR_N2
            IPR_N2: u8,
            /// IPR_N3
            IPR_N3: u8,
        }), base_address + 0x34c);
    };

    /// Floting point unit
    pub const FPU = struct {
        pub const base_address = 0xe000ef34;

        /// address: 0xe000ef34
        /// Floating-point context control
        /// register
        pub const FPCCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// LSPACT
            LSPACT: u1,
            /// USER
            USER: u1,
            reserved0: u1,
            /// THREAD
            THREAD: u1,
            /// HFRDY
            HFRDY: u1,
            /// MMRDY
            MMRDY: u1,
            /// BFRDY
            BFRDY: u1,
            reserved1: u1,
            /// MONRDY
            MONRDY: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            reserved20: u1,
            reserved21: u1,
            reserved22: u1,
            /// LSPEN
            LSPEN: u1,
            /// ASPEN
            ASPEN: u1,
        }), base_address + 0x0);

        /// address: 0xe000ef38
        /// Floating-point context address
        /// register
        pub const FPCAR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            /// Location of unpopulated
            /// floating-point
            ADDRESS: u29,
        }), base_address + 0x4);

        /// address: 0xe000ef3c
        /// Floating-point status control
        /// register
        pub const FPSCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Invalid operation cumulative exception
            /// bit
            IOC: u1,
            /// Division by zero cumulative exception
            /// bit.
            DZC: u1,
            /// Overflow cumulative exception
            /// bit
            OFC: u1,
            /// Underflow cumulative exception
            /// bit
            UFC: u1,
            /// Inexact cumulative exception
            /// bit
            IXC: u1,
            reserved0: u1,
            reserved1: u1,
            /// Input denormal cumulative exception
            /// bit.
            IDC: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            /// Rounding Mode control
            /// field
            RMode: u2,
            /// Flush-to-zero mode control
            /// bit:
            FZ: u1,
            /// Default NaN mode control
            /// bit
            DN: u1,
            /// Alternative half-precision control
            /// bit
            AHP: u1,
            reserved16: u1,
            /// Overflow condition code
            /// flag
            V: u1,
            /// Carry condition code flag
            C: u1,
            /// Zero condition code flag
            Z: u1,
            /// Negative condition code
            /// flag
            N: u1,
        }), base_address + 0x8);
    };

    /// Memory protection unit
    pub const MPU = struct {
        pub const base_address = 0xe000ed90;

        /// address: 0xe000ed90
        /// MPU type register
        pub const MPU_TYPER = @intToPtr(*volatile Mmio(32, packed struct {
            /// Separate flag
            SEPARATE: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            /// Number of MPU data regions
            DREGION: u8,
            /// Number of MPU instruction
            /// regions
            IREGION: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x0);

        /// address: 0xe000ed94
        /// MPU control register
        pub const MPU_CTRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// Enables the MPU
            ENABLE: u1,
            /// Enables the operation of MPU during hard
            /// fault
            HFNMIENA: u1,
            /// Enable priviliged software access to
            /// default memory map
            PRIVDEFENA: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
            padding27: u1,
            padding28: u1,
        }), base_address + 0x4);

        /// address: 0xe000ed98
        /// MPU region number register
        pub const MPU_RNR = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPU region
            REGION: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
        }), base_address + 0x8);

        /// address: 0xe000ed9c
        /// MPU region base address
        /// register
        pub const MPU_RBAR = @intToPtr(*volatile Mmio(32, packed struct {
            /// MPU region field
            REGION: u4,
            /// MPU region number valid
            VALID: u1,
            /// Region base address field
            ADDR: u27,
        }), base_address + 0xc);

        /// address: 0xe000eda0
        /// MPU region attribute and size
        /// register
        pub const MPU_RASR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Region enable bit.
            ENABLE: u1,
            /// Size of the MPU protection
            /// region
            SIZE: u5,
            reserved0: u1,
            reserved1: u1,
            /// Subregion disable bits
            SRD: u8,
            /// memory attribute
            B: u1,
            /// memory attribute
            C: u1,
            /// Shareable memory attribute
            S: u1,
            /// memory attribute
            TEX: u3,
            reserved2: u1,
            reserved3: u1,
            /// Access permission
            AP: u3,
            reserved4: u1,
            /// Instruction access disable
            /// bit
            XN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
        }), base_address + 0x10);
    };

    /// SysTick timer
    pub const STK = struct {
        pub const base_address = 0xe000e010;
    };

    /// System control block
    pub const SCB = struct {
        pub const base_address = 0xe000ed00;

        /// address: 0xe000ed00
        /// CPUID base register
        pub const CPUID = @intToPtr(*volatile Mmio(32, packed struct {
            /// Revision number
            Revision: u4,
            /// Part number of the
            /// processor
            PartNo: u12,
            /// Reads as 0xF
            Constant: u4,
            /// Variant number
            Variant: u4,
            /// Implementer code
            Implementer: u8,
        }), base_address + 0x0);

        /// address: 0xe000ed04
        /// Interrupt control and state
        /// register
        pub const ICSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Active vector
            VECTACTIVE: u9,
            reserved0: u1,
            reserved1: u1,
            /// Return to base level
            RETTOBASE: u1,
            /// Pending vector
            VECTPENDING: u7,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// Interrupt pending flag
            ISRPENDING: u1,
            reserved5: u1,
            reserved6: u1,
            /// SysTick exception clear-pending
            /// bit
            PENDSTCLR: u1,
            /// SysTick exception set-pending
            /// bit
            PENDSTSET: u1,
            /// PendSV clear-pending bit
            PENDSVCLR: u1,
            /// PendSV set-pending bit
            PENDSVSET: u1,
            reserved7: u1,
            reserved8: u1,
            /// NMI set-pending bit.
            NMIPENDSET: u1,
        }), base_address + 0x4);

        /// address: 0xe000ed08
        /// Vector table offset register
        pub const VTOR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            /// Vector table base offset
            /// field
            TBLOFF: u21,
            padding0: u1,
            padding1: u1,
        }), base_address + 0x8);

        /// address: 0xe000ed0c
        /// Application interrupt and reset control
        /// register
        pub const AIRCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// VECTRESET
            VECTRESET: u1,
            /// VECTCLRACTIVE
            VECTCLRACTIVE: u1,
            /// SYSRESETREQ
            SYSRESETREQ: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// PRIGROUP
            PRIGROUP: u3,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            /// ENDIANESS
            ENDIANESS: u1,
            /// Register key
            VECTKEYSTAT: u16,
        }), base_address + 0xc);

        /// address: 0xe000ed10
        /// System control register
        pub const SCR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            /// SLEEPONEXIT
            SLEEPONEXIT: u1,
            /// SLEEPDEEP
            SLEEPDEEP: u1,
            reserved1: u1,
            /// Send Event on Pending bit
            SEVEONPEND: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
            padding23: u1,
            padding24: u1,
            padding25: u1,
            padding26: u1,
        }), base_address + 0x10);

        /// address: 0xe000ed14
        /// Configuration and control
        /// register
        pub const CCR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Configures how the processor enters
            /// Thread mode
            NONBASETHRDENA: u1,
            /// USERSETMPEND
            USERSETMPEND: u1,
            reserved0: u1,
            /// UNALIGN_ TRP
            UNALIGN__TRP: u1,
            /// DIV_0_TRP
            DIV_0_TRP: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// BFHFNMIGN
            BFHFNMIGN: u1,
            /// STKALIGN
            STKALIGN: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x14);

        /// address: 0xe000ed18
        /// System handler priority
        /// registers
        pub const SHPR1 = @intToPtr(*volatile Mmio(32, packed struct {
            /// Priority of system handler
            /// 4
            PRI_4: u8,
            /// Priority of system handler
            /// 5
            PRI_5: u8,
            /// Priority of system handler
            /// 6
            PRI_6: u8,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x18);

        /// address: 0xe000ed1c
        /// System handler priority
        /// registers
        pub const SHPR2 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            reserved20: u1,
            reserved21: u1,
            reserved22: u1,
            reserved23: u1,
            /// Priority of system handler
            /// 11
            PRI_11: u8,
        }), base_address + 0x1c);

        /// address: 0xe000ed20
        /// System handler priority
        /// registers
        pub const SHPR3 = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            /// Priority of system handler
            /// 14
            PRI_14: u8,
            /// Priority of system handler
            /// 15
            PRI_15: u8,
        }), base_address + 0x20);

        /// address: 0xe000ed24
        /// System handler control and state
        /// register
        pub const SHCRS = @intToPtr(*volatile Mmio(32, packed struct {
            /// Memory management fault exception active
            /// bit
            MEMFAULTACT: u1,
            /// Bus fault exception active
            /// bit
            BUSFAULTACT: u1,
            reserved0: u1,
            /// Usage fault exception active
            /// bit
            USGFAULTACT: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            /// SVC call active bit
            SVCALLACT: u1,
            /// Debug monitor active bit
            MONITORACT: u1,
            reserved4: u1,
            /// PendSV exception active
            /// bit
            PENDSVACT: u1,
            /// SysTick exception active
            /// bit
            SYSTICKACT: u1,
            /// Usage fault exception pending
            /// bit
            USGFAULTPENDED: u1,
            /// Memory management fault exception
            /// pending bit
            MEMFAULTPENDED: u1,
            /// Bus fault exception pending
            /// bit
            BUSFAULTPENDED: u1,
            /// SVC call pending bit
            SVCALLPENDED: u1,
            /// Memory management fault enable
            /// bit
            MEMFAULTENA: u1,
            /// Bus fault enable bit
            BUSFAULTENA: u1,
            /// Usage fault enable bit
            USGFAULTENA: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
        }), base_address + 0x24);

        /// address: 0xe000ed28
        /// Configurable fault status
        /// register
        pub const CFSR_UFSR_BFSR_MMFSR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            /// Instruction access violation
            /// flag
            IACCVIOL: u1,
            reserved1: u1,
            /// Memory manager fault on unstacking for a
            /// return from exception
            MUNSTKERR: u1,
            /// Memory manager fault on stacking for
            /// exception entry.
            MSTKERR: u1,
            /// MLSPERR
            MLSPERR: u1,
            reserved2: u1,
            /// Memory Management Fault Address Register
            /// (MMAR) valid flag
            MMARVALID: u1,
            /// Instruction bus error
            IBUSERR: u1,
            /// Precise data bus error
            PRECISERR: u1,
            /// Imprecise data bus error
            IMPRECISERR: u1,
            /// Bus fault on unstacking for a return
            /// from exception
            UNSTKERR: u1,
            /// Bus fault on stacking for exception
            /// entry
            STKERR: u1,
            /// Bus fault on floating-point lazy state
            /// preservation
            LSPERR: u1,
            reserved3: u1,
            /// Bus Fault Address Register (BFAR) valid
            /// flag
            BFARVALID: u1,
            /// Undefined instruction usage
            /// fault
            UNDEFINSTR: u1,
            /// Invalid state usage fault
            INVSTATE: u1,
            /// Invalid PC load usage
            /// fault
            INVPC: u1,
            /// No coprocessor usage
            /// fault.
            NOCP: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            /// Unaligned access usage
            /// fault
            UNALIGNED: u1,
            /// Divide by zero usage fault
            DIVBYZERO: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
        }), base_address + 0x28);

        /// address: 0xe000ed2c
        /// Hard fault status register
        pub const HFSR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            /// Vector table hard fault
            VECTTBL: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            reserved20: u1,
            reserved21: u1,
            reserved22: u1,
            reserved23: u1,
            reserved24: u1,
            reserved25: u1,
            reserved26: u1,
            reserved27: u1,
            reserved28: u1,
            /// Forced hard fault
            FORCED: u1,
            /// Reserved for Debug use
            DEBUG_VT: u1,
        }), base_address + 0x2c);

        /// address: 0xe000ed34
        /// Memory management fault address
        /// register
        pub const MMFAR = @intToPtr(*volatile u32, base_address + 0x34);

        /// address: 0xe000ed38
        /// Bus fault address register
        pub const BFAR = @intToPtr(*volatile u32, base_address + 0x38);

        /// address: 0xe000ed3c
        /// Auxiliary fault status
        /// register
        pub const AFSR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Implementation defined
            IMPDEF: u32,
        }), base_address + 0x3c);
    };

    /// Nested vectored interrupt
    /// controller
    pub const NVIC_STIR = struct {
        pub const base_address = 0xe000ef00;

        /// address: 0xe000ef00
        /// Software trigger interrupt
        /// register
        pub const STIR = @intToPtr(*volatile Mmio(32, packed struct {
            /// Software generated interrupt
            /// ID
            INTID: u9,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
            padding22: u1,
        }), base_address + 0x0);
    };

    /// Floating point unit CPACR
    pub const FPU_CPACR = struct {
        pub const base_address = 0xe000ed88;

        /// address: 0xe000ed88
        /// Coprocessor access control
        /// register
        pub const CPACR = @intToPtr(*volatile Mmio(32, packed struct {
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            reserved5: u1,
            reserved6: u1,
            reserved7: u1,
            reserved8: u1,
            reserved9: u1,
            reserved10: u1,
            reserved11: u1,
            reserved12: u1,
            reserved13: u1,
            reserved14: u1,
            reserved15: u1,
            reserved16: u1,
            reserved17: u1,
            reserved18: u1,
            reserved19: u1,
            /// CP
            CP: u4,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
        }), base_address + 0x0);
    };

    /// System control block ACTLR
    pub const SCB_ACTRL = struct {
        pub const base_address = 0xe000e008;

        /// address: 0xe000e008
        /// Auxiliary control register
        pub const ACTRL = @intToPtr(*volatile Mmio(32, packed struct {
            /// DISMCYCINT
            DISMCYCINT: u1,
            /// DISDEFWBUF
            DISDEFWBUF: u1,
            /// DISFOLD
            DISFOLD: u1,
            reserved0: u1,
            reserved1: u1,
            reserved2: u1,
            reserved3: u1,
            reserved4: u1,
            /// DISFPCA
            DISFPCA: u1,
            /// DISOOFP
            DISOOFP: u1,
            padding0: u1,
            padding1: u1,
            padding2: u1,
            padding3: u1,
            padding4: u1,
            padding5: u1,
            padding6: u1,
            padding7: u1,
            padding8: u1,
            padding9: u1,
            padding10: u1,
            padding11: u1,
            padding12: u1,
            padding13: u1,
            padding14: u1,
            padding15: u1,
            padding16: u1,
            padding17: u1,
            padding18: u1,
            padding19: u1,
            padding20: u1,
            padding21: u1,
        }), base_address + 0x0);
    };
};

const std = @import("std");

pub fn mmio(addr: usize, comptime size: u8, comptime PackedT: type) *volatile Mmio(size, PackedT) {
    return @intToPtr(*volatile Mmio(size, PackedT), addr);
}

pub fn Mmio(comptime size: u8, comptime PackedT: type) type {
    if ((size % 8) != 0)
        @compileError("size must be divisible by 8!");

    if (!std.math.isPowerOfTwo(size / 8))
        @compileError("size must encode a power of two number of bytes!");

    const IntT = std.meta.Int(.unsigned, size);

    if (@sizeOf(PackedT) != (size / 8))
        @compileError(std.fmt.comptimePrint("IntT and PackedT must have the same size!, they are {} and {} bytes respectively", .{ size / 8, @sizeOf(PackedT) }));

    return extern struct {
        const Self = @This();

        raw: IntT,

        pub const underlying_type = PackedT;

        pub inline fn read(addr: *volatile Self) PackedT {
            return @bitCast(PackedT, addr.raw);
        }

        pub inline fn write(addr: *volatile Self, val: PackedT) void {
            // This is a workaround for a compiler bug related to miscompilation
            // If the tmp var is not used, result location will fuck things up
            var tmp = @bitCast(IntT, val);
            addr.raw = tmp;
        }

        pub inline fn modify(addr: *volatile Self, fields: anytype) void {
            var val = read(addr);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, field.name) = @field(fields, field.name);
            }
            write(addr, val);
        }

        pub inline fn toggle(addr: *volatile Self, fields: anytype) void {
            var val = read(addr);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, @tagName(field.default_value.?)) = !@field(val, @tagName(field.default_value.?));
            }
            write(addr, val);
        }

        pub inline fn set(self: *volatile Self, comptime field: anytype, value: anytype) void {
            var temp = self.read();
            @field(temp, field) = value;
            self.write(temp);
        }
    };
}

pub fn MmioInt(comptime size: u8, comptime T: type) type {
    return extern struct {
        const Self = @This();

        raw: std.meta.Int(.unsigned, size),

        pub inline fn read(addr: *volatile Self) T {
            return @truncate(T, addr.raw);
        }

        pub inline fn modify(addr: *volatile Self, val: T) void {
            const Int = std.meta.Int(.unsigned, size);
            const mask = ~@as(Int, (1 << @bitSizeOf(T)) - 1);

            var tmp = addr.raw;
            addr.raw = (tmp & mask) | val;
        }
    };
}

pub fn mmioInt(addr: usize, comptime size: usize, comptime T: type) *volatile MmioInt(size, T) {
    return @intToPtr(*volatile MmioInt(size, T), addr);
}
