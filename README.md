# Linux udev rules for EVGA XR1 devices

Device details

```sh
lsusb -v

Bus 002 Device 002: ID 3842:310a EVGA EVGA XR1 Lite Capture Box Video
Bus 002 Device 002: ID 3842:310b EVGA EVGA XR1 Pro Capture Box Video
```

## Basic Usage

Run the `./install.sh` script with sudo or manually copy the rules files to the `/etc/udev/rules.d/` directory.

```sh
sudo ./install.sh
```

Or

```sh
sudo cp ./85-evga-xr1-capture-dev.rules /etc/udev/rules.d/
```

## Firmware Updates

Visit [EVGA Downloads](https://www.evga.com/support/download/) and select:

```
'Other Products' > 'Capture Device' > 'All' > 'Firmware for XR1 lite'
```

## Extras

- [EVGA Forums for XR1 Capture Devices](https://forums.evga.com/EVGA-XR1-Capture-Devices-f115.aspx)
- [EVGA XR1 RGB Software](https://forums.evga.com/XR1-RGB-Software-Official-Release-m3137538.aspx)
- [OBS Certified Devices](https://obsproject.com/certified-devices)
- [EVGA XR1 Lite Amazon.com listing](https://www.amazon.com/EVGA-Capture-Certified-Nintendo-141-U1-CB20-LR/dp/B09D8VYLY7/)
- [EVGA XR1 Pro Amazon.com listing](https://www.amazon.com/EVGA-Capture-Certified-Nintendo-144-U1-CB21-LR/dp/B09N55K5FG/)
