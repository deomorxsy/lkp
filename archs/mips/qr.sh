#!/bin/bash

export QEMU_AUDIO_DRV="none"

qemu-system-mipsel -M    malta \
    -m 256 \
    -kernel vmlinux \
    -nographic \
    -hda rootfs.ext2 \
    -net nic,model=e1000 \
    -net user, \
    hostfwd=tcp::2222-22, \
    hostfwd=tcp::9000-:9000 \
    -no-reboot \
    -append "root=/dev/hda console=uart0"
