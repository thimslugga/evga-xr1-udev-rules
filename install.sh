#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

echo "copying the udev rule to the /etc/udev/rules.d directory.."
test ! -f /etc/udev/rules.d/85-evga-xr1-capture-dev.rules \
  && cp -v ./85-evga-xr1-capture-dev.rules /etc/udev/rules.d/

echo "reloading the udev rules.."
udevadm control --reload-rules && udevadm trigger

# verify
ls -lA /dev/evga-xr1-*

echo "done."
