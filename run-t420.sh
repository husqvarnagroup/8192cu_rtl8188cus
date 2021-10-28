#!/usr/bin/env bash
# shellcheck disable=SC2029

set -eu -o pipefail

readonly iface="wlx74da3826ba27"

scp /home/reto/code/Husqvarna/realtek-8192cu_rtl8188cus/8192cu.ko t420:8192cu.ko
ssh t420 "sudo dhclient -r ${iface} && sudo systemctl stop wpa_supplicant@${iface}; sudo rmmod rtl8xxxu rtl8192cu rtl8192c_common rtl_usb rtlwifi 8192cu 2>/dev/null || true"
ssh t420 "sudo insmod 8192cu.ko; echo -n 'module 8192cu +p' | sudo tee /sys/kernel/debug/dynamic_debug/control >/dev/null && sudo systemctl start wpa_supplicant@${iface} && sudo dhclient -i ${iface}"
