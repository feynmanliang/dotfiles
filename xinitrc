#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# .Xresources
xrdb -merge ~/.Xresources &

# vmware wrapper
vmware-user-suid-wrapper &

# icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 6 --transparent true --alpha 1 --tint 0x1B1D1E --height 24 &

# set the cursor
xsetroot -cursor_name left_ptr

# hide inactive cursor
hhp &

# urxvt daemon
urxvtd -q -o -f

# swap caps lock and esc
xmodmap ~/.speedswapper

# screensaver
/usr/bin/xscreensaver -no-splash &

# compositing
compton --config ~/.compton.conf -b

# wallpaper
sh ~/.fehbg &

# start xmonad (dzen2 included)
exec xmonad
