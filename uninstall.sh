#!/usr/bin/env bash
#set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
   printf "This script must be run as root.\n"
   exit 1
fi

if [ -f /etc/udev/rules.d/85-evga-xr1-capdev.rule ]; then
  printf 'Removing the /etc/udev/rules.d/85-evga-xr1-capdev.rule file..\n'
  test -f /etc/udev/rules.d/85-evga-xr1-capdev.rules \
    && rm -vf /etc/udev/rules.d/85-evga-xr1-capdev.rules
  printf 'Reloading the udev rules..\n'
  sudo udevadm control --reload-rules && sudo udevadm trigger
fi

printf 'Done.\n'
