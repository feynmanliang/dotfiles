#!/bin/sh
xrandr --output VGA1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
  --output LVDS1 --mode 1600x900 --pos 1920x180 --rotate normal \
  --output DP1 --off \
  --output HDMI1 --off
