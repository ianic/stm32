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
./vector_table.rb 411re | zig fmt --stdin > ../chips/stm32f411re/vector_table.zig
./registers.rb 411re | zig fmt --stdin > ../chips/stm32f411re/registers.zig
./registers_with_enums.rb 411re | zig fmt --stdin > ../chips/stm32f411re/registers_with_enums.zig
