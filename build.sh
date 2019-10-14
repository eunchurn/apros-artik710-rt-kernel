#!/bin/bash

wget https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/4.4/older/patches-4.4.113-rt128.tar.xz
cd linux-artik && git checkout A710-OS-18.05.00
xzcat ../patches-4.4.113-rt128.tar.xz | patch -p1
cp arch/arm64/configs/artik710_raptor_defconfig arch/arm64/configs/artik710_raptor_rt_defconfig
echo "CONFIG_PREEMPT_RCU=y
CONFIG_PREEMPT=y
CONFIG_PREEMPT_RT_BASE=y
CONFIG_HAVE_PREEMPT_LAZY=y
CONFIG_PREEMPT_LAZY=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT__LL is not set
# CONFIG_PREEMPT_RTB is not set
CONFIG_PREEMPT_RT_FULL=y
CONFIG_PREEMPT_COUNT=y
CONFIG_DEBUG_PREEMPT=y
# CONFIG_PREEMPT_TRACER is not set" >> arch/arm64/configs/artik710_raptor_rt_defconfig
make ARCH=arm64 artik710_raptor_rt_defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image -j4
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dtbs
mkdir usr/modules
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules -j4
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules_install INSTALL_MOD_PATH=usr/modules INSTALL_MOD_STRIP=1
make_ext4fs -b 4096 -L modules \
	-l 32M usr/modules.img \
	usr/modules/lib/modules/
rm -rf usr/modules
cd ..
mkdir build
cp linux-artik/arch/arm64/boot/Image build/
cp linux-artik/arch/arm64/boot/dts/nexell/*.dtb build/
cp linux-artik/usr/modules.img build/
echo "Kernel build complete\n"