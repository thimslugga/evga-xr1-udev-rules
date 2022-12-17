#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

echo "removing the udev rule from the /etc/udev/rules.d directory.."
test -f /etc/udev/rules.d/85-evga-xr1-capture-dev.rules \
  && rm -vf /etc/udev/rules.d/85-evga-xr1-capture-dev.rules

echo "reloading the udev rules.."
udevadm control --reload-rules && udevadm trigger

echo "done."
