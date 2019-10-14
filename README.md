# Linux Kernel for APROS ARTIK710 PREEMPT_RT

## Configuration add

- PREEMPT_RT configuration adding

```bash
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
```

- Kernel configuration

```bash
make ARCH=arm artik530_raptor_rt_defconfig
```
