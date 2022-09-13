# stm32

stm32 is a zig hal currently just for stm32f411


Code in [hal](hal.zig) folder should be chip or at least chip family agnostic. Should work for all chips or for all chips in family. There is nothing generated there.

In [chips](chips/stm32f411re.zig) folder code is mostly generated by scripts and data files from cgen folder.

Currently cgen is creating two version of registers files.
[Classic](chips/stm32f411re/registers.zig) one. Pretty much same as generated by [regz](https://github.com/ZigEmbeddedGroup/regz).

And the [enum based](stm32f411re/registers_with_enums.zig) one. I'm using information from svd file to create enums for each register field where that information exists. That hopefully makes code more readable and more secure. When using integer values it possible to set register to the value which is not necessary valid register value. Using enums it is not possible to set unsupported value. I also switched there to zig naming convention. Need to spend some more time working with it to get the sense about that approach.

Here is an example of classic:
```zig
regs.RCC.PLLCFGR.modify(.{
  .PLLSRC = 1, // hse
  .PLLP = 0b00, // 2
});                
regs.FLASH.ACR.modify(.{ .LATENCY = 0b0011 }); // Set flash latency wait states
regs.RCC.CFGR.modify(.{ .SW = 0b10 }); //Select PLL as clock      
```
and enum approach:
```zig
eregs.rcc.pllcfgr.modify(.{
  .pllsrc = .hse,
  .pllp = .div2,
});
eregs.flash.acr.modify(.{ .latency = .ws3 });
eregs.rcc.cfgr.modify(.{ .sw = .pll });
```

### gpio

<!--
gpio no checking wether alternate function exists
no checking wether port/pin exists
zig naming
-->

```zig
const led_pin = micro.Pin("PC13");
const led = micro.Gpio(led_pin, .{
  .mode = .output,
  .initial_state = .low,
});
led.init();
...
led.toggle();
```

```zig
pub const led = gpio.pa5.Output();
led.init(.{});
...
led.toggle();
```

```zig
gpio.pa15.usart1.tx(.{});
```
or:
```zig
gpio.usart1.tx.pa15(.{});
```

'classis'
with enums, zig naming convention
in modify is possible to pass any valid value for that type which is not necessary valid register value. Registers can have some unused bit combinations. Using enums it is not possible to set unsupported value. 

## Running code generator

```
$ scripts/cgen.sh
```

## Running examples

I'm using [Nucleo-F411RE](https://www.st.com/en/evaluation-tools/nucleo-f411re.html) board. Scripts for flashing board and debugging depends on [stlink tools](https://github.com/stlink-org/stlink). 

To flash example binary to the board use flash script: `scripts/flash.sh [example name]`:
```
$ scripts/flash.sh blink
$ scripts/flash.sh uart-interrupt
...
```

running with debugger `scripts/gdb.sh [example name]`:
```
$ scripts/gdb.sh blink
$ scripts/gdb.sh uart-interrupt
...
```

## Data sources 

* [stm32-data](https://github.com/embassy-rs/stm32-data) - svd files used in generating registers 
* [stm32-rs](https://github.com/stm32-rs/stm32-rs) - nice json chip descriptions used for gpio alternate function mapping, vector table generating


## Regenerating svd files

We are using patched svd files from the [stm32-rs](https://github.com/stm32-rs/stm32-rs) project. That project is added as submodule to the cgen folder. Makefile taken from [stm32-svd](https://github.com/tinygo-org/stm32-svd) creates svd files in the cgen/svd. It depends on the [svdtools](https://github.com/stm32-rs/svdtools) so that needs to be installed.

```
$ pip3 install --upgrade --user svdtools
```

Once we have svd in the path, regenerating svd files is accomplished by running make in the cgen folder:
```
$ cd cgen
$ make
```
