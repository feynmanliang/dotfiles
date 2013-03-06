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

# Gnome keyring
# source /etc/X11/xinit/xinitrc.d/30-dbus
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# synchronize clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# automount devices
devmon &

# screensaver
/usr/bin/xscreensaver -no-splash &

# compositing
compton --config ~/.compton.conf -b

# icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 6 --transparent true --alpha 1 --tint 0x1B1D1E --height 24 &

# battery
batti &

# music
mpd ~/.mpdconf

# notificaitons
# killall dunst
# dunst -config ~/.dunstrc

# Dropbox
dropboxd &

# network manager
nm-applet --sm-disable &

# wallpaper
sh ~/.fehbg &

# start xmonad (dzen2 included)
exec xmonad
