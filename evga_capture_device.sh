#!/bin/sh

vendorId=3842

pid=$$
terminate()
{
  pkill -9 -P "$pid"
};
trap terminate 1 2 3 9 15 0

videoDev=$(for file in /sys/bus/usb/devices/*/idVendor; do
  if grep -q "$vendorId" "$file" 2>/dev/null; then
    ls "$(echo "$file" | sed 's/idVendor/*/')"/video4linux;
  fi;
done | sort |head -1)

command -v pactl >/dev/null 2>&1 || { echo "Require pactl but it's not installed.  Aborting." >&2; exit 1; }
audioDev=$(pactl list sources | grep -E 'Name:|device.vendor.id.' | grep -B1 "$vendorId" | head -1 | sed 's/^.*Name: //')

pacat -r --device="$audioDev" --latency-msec=1 | pacat -p --latency-msec=1 &

command -v mplayer >/dev/null 2>&1 || { echo "Require mplayer but it's not installed.  Aborting." >&2; exit 1; }
mplayer -ao pulse tv:// -tv driver=v4l2:device=/dev/"$videoDev":width=1920:height=1080
#mplayer -ao pulse tv:// -tv driver=v4l2:device=/dev/$VIDEODEV:width=1280:height=720
