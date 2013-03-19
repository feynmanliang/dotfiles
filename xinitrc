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
xrdb -load ~/.Xresources &

# screen resolution
./.screenlayout/ViewSonicExternal.sh &

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent1 &

# urxvt daemon
urxvtd -q -o -f

# swap caps lock and esc
xmodmap ~/.speedswapper

# laptop fn keys
xbindkeys &

# set the cursor
xsetroot -cursor_name left_ptr

# hide inactive cursor
hhp &

# automount devices
devmon &

# screensaver
/usr/bin/xscreensaver -no-splash &

# compositing
compton --config ~/.compton.conf -b

# music
mpd ~/.mpdconf

# notificaitons (conflict's with dbus service)
# killall dunst
# dunst -config ~/.dunstrc

# icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 9 --transparent true --alpha 1 --tint 0x1B1D1E --height 24 &

# battery
batti &

# Dropbox
dropboxd &

# network manager
nm-applet --sm-disable &

# wallpaper
sh ~/.fehbg &

# screen dimming
redshiftgui &

# update dynamic dns
afraid-dyndns-uv &

# start xmonad (dzen2 included)
exec xmonad
