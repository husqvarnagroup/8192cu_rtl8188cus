# 8192CU for RTL8188CUS

Main purpose of this project is to have a baseline to compare against when
developing the rtl8xxxu driver for the RTL8188CUS chip.

The code is based on the last release of the Realtek 8192cu driver
(v4.0.9_25039.20171107) and adapted to work on recent (5.10+) Linux versions
and use the cfg80211 and nl80211 subsystems.

## Compilation
* PC:
  * for currently running kernel: `make CONFIG_PLATFORM_I386_PC=y` (native)
  * out of tree: `make KSRC=<path to Linux build directory> CONFIG_PLATFORM_I386_PC=y`
* GARDENA smart gateway (ARMv5): `make CONFIG_PLATFORM_ARM_AT91SAM9G25=y`
