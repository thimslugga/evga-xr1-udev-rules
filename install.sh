#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

echo "Installing the udev rules and reloading the udev rules.."
sudo cp -v ./85-evga-capture-devices.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger

ls -lA /dev/evga-xr1-*
