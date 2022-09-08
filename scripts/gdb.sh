#!/usr/bin/env bash
set -exm

# first argument binary to flash and debug
name="${1:-blink}"

git_root=$(git rev-parse --show-toplevel)

# kill st-util from last session, if still running
pkill st-util || true

# build and flash firmware
zig build
st-flash --reset write $git_root/zig-out/bin/$name.bin 0x08000000

cd $git_root
mkdir -p tmp
cd scripts
# start st-util debugger
st-util &> ../tmp/st-util.log &
# start gdb
arm-none-eabi-gdb -x gdb.conf $git_root/zig-out/bin/$name.elf --tui
# clanup
pkill st-util || true
