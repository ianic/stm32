#!/usr/bin/env bash
set -e
name="${1:-?}"
git_root=$(git rev-parse --show-toplevel)

bin_file=$git_root/zig-out/bin/$name.bin

if [[ ! -f $bin_file ]]; then
    echo "File not found $bin_file"
    echo ""
    echo "Usage flash [filename]"
    echo "For filename use one of:"
    for f in $git_root/zig-out/bin/*.bin ; do
        filename=$(basename -- $f)
        filename="${filename%.*}"
        echo "    $filename"
    done
    exit
fi

st-flash --reset write $bin_file 0x08000000
