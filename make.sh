#!/bin/bash
nasm boot_sector.asm -f bin -o boot_sector.bin
qemu --nographic boot_sector.bin