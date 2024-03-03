#!/usr/bin/env bash
#set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
   printf 'This script must be run as root.\n'
   exit 1
fi

if [ ! -f /etc/udev/rules.d/85-evga-xr1-capdev.rules ]; then
  printf 'Copying the udev rule to the /etc/udev/rules.d directory..\n'
  test -f rules/85-evga-xr1-capdev.rules \
    && sudo cp -v rules/85-evga-xr1-capdev.rules /etc/udev/rules.d/
fi

if [ -f /etc/udev/rules.d/85-evga-xr1-capdev.rule ]; then
  printf 'Reloading the udev rules..\n'
  sudo udevadm control --reload-rules && sudo udevadm trigger
fi

# verify
#ls -lA /dev/evga-xr1*
test -f /dev/evga-xr1-lite && printf 'Found EVGA XR1 Lite capture card device.\n'
test -f /dev/evga-xr1 && printf 'Found EVGA XR1 capture card device.\n'
test -f /dev/evga-xr1-pro && printf 'Found EVGA XR1 Pro capture card device.\n'

printf 'Done.\n'
