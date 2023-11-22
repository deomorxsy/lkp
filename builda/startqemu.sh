#!/usr/bin/bash

KIMAGE="./mkmk/bzImage"

qemu-system-x86_64 \
    -s \
    -m 64M \
    -nographic \
    -kernel $KIMAGE \
    -append "console=tty$0 quiet loglevel=3 oops=panic panic=-1 pti=on nokaslr min_addr=4096" \
    -no-reboot \
    -cpu qemu64,+smep,+smap \
    -monitor /dev/null \
    -initrd "./initramfs.cpio" \
    -smp 2 \
    -smp cores=2 \
    -smp threads=1
