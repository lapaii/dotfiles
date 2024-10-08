#!/bin/sh

device="smc::kbd_backlight"
currentBrightness=$(brightnessctl --device=$device get)

brightnessByMax=$(awk -v var1=$currentBrightness -v var2=255 'BEGIN { print ( var1 / var2 ) }')

brightnessPercentage=$(awk -v var1=$brightnessByMax -v var2=100 'BEGIN { print ( var1 * var2 ) }')

brightness=$(awk -v var1=$brightnessPercentage 'BEGIN {print int(var1 + 0.5)}')

echo -e "{\"text\":\"$brightness%\"}"
