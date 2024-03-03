# Linux udev rules for EVGA XR1 capture card devices

## Basic usage

Install:

Run the `./install.sh` script with sudo or you can manually copy the rules files to the `/etc/udev/rules.d/` directory.

```sh
sudo ./install.sh
```

To manually install the udev rules:

```sh
sudo cp -v rules/85-evga-xr1-capture-dev.rules /etc/udev/rules.d/
```

Uninstall:

```sh
sudo ./uninstall.sh
```

## Creating additional rules

- [http://www.linux-usb.org/usb-ids.html](http://www.linux-usb.org/usb-ids.html)
- [Debian - How-to identify a USB device](https://wiki.debian.org/HowToIdentifyADevice/USB)

Retrieve device details:

```sh
lsusb -v | grep -E '\<(Bus|iProduct|bDeviceClass|bDeviceProtocol)' 2>/dev/null
```

OR

```sh
sudo cat /sys/kernel/debug/usb/devices | grep -E "^([TSPD]:.*|)$"
```

The following output is what we are interested in gathering:

```
...

Bus 002 Device 002: ID 3842:310a EVGA EVGA XR1 Lite Capture Box Video
Bus 002 Device 002: ID 3842:310b EVGA EVGA XR1 Pro Capture Box Video
```

From the above output, the vendor ID is 3842 and the product ID is 310a, 310b.

To find the usb.ids files on your system:

```sh
find / -name usb.ids -type f 2> /dev/null

..

/usr/share/hwdata/usb.ids
````

## Firmware updates

Visit [EVGA Downloads](https://www.evga.com/support/download/) and select:

```
'Other Products' > 'Capture Device' > 'All' > 'Firmware for XR1 lite'
```

## Related links

- [EVGA Forums for XR1 Capture Devices](https://forums.evga.com/EVGA-XR1-Capture-Devices-f115.aspx)
- [EVGA XR1 RGB Software](https://forums.evga.com/XR1-RGB-Software-Official-Release-m3137538.aspx)
- [OBS Certified Devices](https://obsproject.com/certified-devices)
- [EVGA XR1 Lite Amazon.com listing](https://www.amazon.com/EVGA-Capture-Certified-Nintendo-141-U1-CB20-LR/dp/B09D8VYLY7/)
- [EVGA XR1 Pro Amazon.com listing](https://www.amazon.com/EVGA-Capture-Certified-Nintendo-144-U1-CB21-LR/dp/B09N55K5FG/)
