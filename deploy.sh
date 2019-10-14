#!/bin/bash

scp build/Image root@$1:/root
scp build/*dtb root@$1:/root
scp build/modules.img root@$1:/root

echo "## On your board run this script:
mount -o remount,rw /boot
cp /root/Image /boot
cp /root/*.dtb /boot
dd if=/root/modules.img of=/dev/mmcblk0p5
sync
reboot
"