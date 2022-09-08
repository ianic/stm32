#!/usr/bin/env bash
set -e

git_root=$(git rev-parse --show-toplevel)
cd $git_root/cgen

if [[ ! -f regz/zig-out/bin/regz ]]; then
   cd regz
   zig build
   cd ..
fi

./gpio.rb 411re | zig fmt --stdin > ../chips/stm32f411re/gpio.zig

# TODO: have some modifications in generated file
# regz/zig-out/bin/regz ./data/STM32F411.svd > ../chips/stm32f411re/registers.zig
