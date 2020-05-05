#!/bin/bash
nasm boot_sector.asm -f bin -o boot_sector.bin
qemu boot_sector.bin