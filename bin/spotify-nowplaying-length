#!/bin/bash

echo `dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 "length"|egrep -v "length"|egrep -v "array"|cut -b 43-|cut -d '"' -f 1|egrep -v ^$`
