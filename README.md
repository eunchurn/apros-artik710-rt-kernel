# Linux Kernel for APROS ARTIK710 PREEMPT_RT

## 패치만 하는 경우

```
curl --insecure -o- -L https://raw.githubusercontent.com/eunchurn/apros-artik710-rt-kernel/master/imageonly.sh | bash
```

## 패치하고 커널 빌드 하는 경우

## Clone repository with recursive submodule

```bash
git clone --recursive https://github.com/eunchurn/apros-artik710-rt-kernel
```

or if you already cloned this repo

```bash
git submodule update --init --recursive
```

## PREEMP_RT patch and build script

```bash
./build.sh
```

## Deployment script

```bash
./deploy.sh {board_ip_address}
```
