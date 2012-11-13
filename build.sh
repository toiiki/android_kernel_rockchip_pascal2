#!/bin/bash -x
CYANOGENMOD=../../..

# Make mrproper
make mrproper

# Set config
make M712HC_defconfig
make menuconfig

# Make modules
nice -n 10 make -j16 modules

# Copy modules
find -name '*.ko' -exec cp -av {} $CYANOGENMOD/device/rockchip/rk2918/modules/ \;

# Build kernel
nice -n 10 make -j16 kernel.img
# Copy kernel
cp kernel.img $CYANOGENMOD/device/rockchip/rk2918/kernel

# Make mrproper
make mrproper

