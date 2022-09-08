#!/usr/bin/env bash
#
# dump board registers into file in git_root/tmp folder

git_root=$(git rev-parse --show-toplevel)
file_name=$git_root/tmp/"${1:-regdump.log}"

/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin/STM32_Programmer_CLI \
    -c port=SWD mode=HOTPLUG -regdump $file_name choice=5
