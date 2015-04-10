#!/bin/sh

sed -i "57s/\(^.\)/-- \1/g
58s/\(^.\)/-- \1/g
61s/^-- //g
62s/^-- //g" ~/.xmonad/xmonad.hs

killall trayer
killall dzen2
killall conky


~/.screenlayout/LaptopOnly.sh

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 9 --transparent true --alpha 1 --tint 0x1B1D1E --height 24 &

xmonad --recompile
xmonad --restart

