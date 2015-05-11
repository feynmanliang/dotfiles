
#!/bin/sh

sed -i "57s/^-- //g
58s/^-- //g
61s/\(^.\)/-- \1/g
62s/\(^.\)/-- \1/g" ~/.xmonad/xmonad.hs

killall trayer
killall dzen2
killall conky


~/.screenlayout/ViewSonicExternal.sh

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 9 --transparent true --alpha 1 --tint 0x1B1D1E --height 24 &

xmonad --recompile
xmonad --restart

xmodmap ~/.speedswapper
