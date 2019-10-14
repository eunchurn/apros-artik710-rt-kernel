#!/bin/bash

wget https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/build/Image
wget https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/build/modules.img
wget https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/build/s5p6818-artik710-explorer.dtb
wget https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/build/s5p6818-artik710-raptor-rev00.dtb
wget https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/build/s5p6818-artik710-raptor-rev01.dtb
wget https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/build/s5p6818-artik710-raptor-rev03.dtb

mount -o remount,rw /boot
cp /root/Image /boot
cp /root/*.dtb /boot
dd if=/root/modules.img of=/dev/mmcblk0p5
sync
rm -rf *
reboot
