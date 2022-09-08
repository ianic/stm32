#!/usr/bin/env bash
set -e

git_root=$(git rev-parse --show-toplevel)
cd $git_root/cgen

./gpio.rb 411re | zig fmt --stdin > ../chips/stm32f411re/gpio.zig
