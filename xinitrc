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

# vmware wrapper
vmware-user-suid-wrapper &

# .Xresources
xrdb -load ~/.Xresources &

# urxvt daemon
urxvtd -q -o -f

# gpg agent for caching keychain password
eval $(gpg-agent --daemon) &

# swap caps lock and esc
xmodmap ~/.speedswapper

# set the cursor
xsetroot -cursor_name left_ptr

# hide inactive cursor
hhp &

# synchronize clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# screensaver
/usr/bin/xscreensaver -no-splash &

# icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 6 --transparent true --alpha 1 --tint 0x1B1D1E --height 24 &

# compositing
compton --config ~/.compton.conf -b

sleep 3

# wallpaper
sh ~/.fehbg &

# start xmonad (dzen2 included)
exec xmonad
