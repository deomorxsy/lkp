cd ../../assets/busybox/
make defconfig
echo "CONFIG_STATIC=y" >> ./.config
