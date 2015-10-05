#!/bin/bash
k_lvl="/sys/class/leds/samsung::kbd_backlight/brightness"
value="$(cat $k_lvl)"
let value++
echo $value > $k_lvl
su -c "notify-send \"Keyboard Backlight: $value\"" fliang
