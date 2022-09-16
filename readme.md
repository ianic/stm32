# stm32

stm32 is an experiment in building zig hal for stm32 chips


Code in [hal](hal.zig) folder should be chip or at least chip family agnostic. Should work for all chips or for all chips in the family. There is nothing generated there.

In [chips](chips/stm32f411re.zig) folder code is mostly generated by scripts and data files from cgen folder.

Data for code generation is prepared by [svd parser](/cgen/svd_parser.rb), written in Ruby right now. There is zig svd parser and register file generator [regz](https://github.com/ZigEmbeddedGroup/regz) but I needed something more plastic to play with so step by step I build yet another svd parser. Code is then generated by using that data in erb template, like this one for [registers](cgen/registers.erb). 

### registers

Currently, cgen is creating two version of registers files.
[Classic](chips/stm32f411re/registers.zig) one. Pretty much same as generated by regz. 

And the [enum based](chips/stm32f411re/registers_with_enums.zig) one. I'm using information from svd file to create enums for each register field (where that information exists). That, hopefully, makes code more readable and more secure. When using integer values it is possible to set a register to the value which is not necessarily valid. Using enums it is not possible to set unsupported value. I also switched there to zig [naming style](https://ziglang.org/documentation/master/#Style-Guide). 

Here is an example of a classic:
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
regs.rcc.pllcfgr.modify(.{
  .pllsrc = .hse,
  .pllp = .div2,
});
regs.flash.acr.modify(.{ .latency = .ws3 });
regs.rcc.cfgr.modify(.{ .sw = .pll });
```

### gpio

We need two pieces of information for the gpio code generation:
* what ports/pins are available for the chip
* what alternate function has each pins

It doesn't meter whether we are creating that code it in advance or in with zig's compile time.

I started with the microzig gpio, with code something like:
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
Here we are defining pin as a string and doing compile time [check](https://github.com/ZigEmbeddedGroup/microzig/blob/4159581b4848bfb8bbdf91dabdebd15ecd503427/src/modules/chips/stm32f407/stm32f407.zig#L63) whether that is the valid pin.  

I tried to generate code in advance using the information about chip pins and pin alternate functions. [gpio](chips/stm32f411re/gpio.zig) has a definition for the pins supported by the chip. We are moving the check that pin exists from compile time to code writing time. My editor will, hopefully, list possible pins in port a when I write something like `gpio.pa`.   
```zig
pub const led = gpio.pa5.Output();
led.init(.{});
...
led.toggle();
```

Pin alternate function information is used to generate namespace for methods supported by that pin. For example, pin pa15 has alternate function 7 usart1 tx. To configure pin for that function I'm now writing: 
```zig
gpio.pa15.usart1.tx(.{});
```
or the in another direction starting from peripheral then to function and then to pin:
```zig
gpio.usart1.tx.pa15(.{});
```

## Running code generator

```
$ scripts/cgen.sh
```

## Running examples

I'm using [Nucleo-F411RE](https://www.st.com/en/evaluation-tools/nucleo-f411re.html) board. Scripts for flashing board and debugging depend on [stlink tools](https://github.com/stlink-org/stlink). 

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

We are using patched svd files from the [stm32-rs](https://github.com/stm32-rs/stm32-rs) project. That project is added as a submodule to the cgen folder. Makefile taken from [stm32-svd](https://github.com/tinygo-org/stm32-svd) creates svd files in the cgen/svd. It depends on the [svdtools](https://github.com/stm32-rs/svdtools) so that needs to be installed.

```
$ pip3 install --upgrade --user svdtools
```

Once we have svd in the path, regenerating svd files is accomplished by running make in the cgen folder:
```
$ cd cgen
$ make
```
