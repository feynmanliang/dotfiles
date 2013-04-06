#!/bin/bash
# Spotify Conky Now Playing
# adapted from the script by Paul Williams 
if [ ! -f ~/.cache/spotify-nowplaying ]
    then
        ~/bin/conky.spotify.nowplaying.sh > ~/.cache/spotify-nowplaying
fi
if [ ! -f ~/.cache/spotify-paused ]
    then
        echo "0" > ~/.cache/spotify-paused
fi

# Is the same song playing?
if [ "$(~/bin/conky.spotify.nowplaying.sh)" != "$(cat ~/.cache/spotify-nowplaying)" ]
    then
        ~/bin/conky.spotify.nowplaying.sh > ~/.cache/spotify-nowplaying
        ~/bin/conky.spotify.nowplaying.length.sh > ~/.cache/spotify-nowplaying-length
        length=$(cat ~/.cache/spotify-nowplaying-length)
        secs=$(($length/1000000))
        printf ""%d:%02d"\n" $(($secs%3600/60)) $(($secs%60)) > ~/.cache/spotify-nowplaying-length-pretty
        date +%s > ~/.cache/spotify-nowplaying-starttime
        # reset paused time.
        echo "0" > ~/.cache/spotify-paused
fi

## is it playing, or paused?
status=$(qdbus-qt4 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus)
if [ "$status" == "Paused" ]
    then
        pt=$(cat ~/.cache/spotify-paused)
        pt=$(($pt+1))
        echo "$pt" > ~/.cache/spotify-paused
#else
    #echo "0" > ~/.cache/spotify-paused
fi
pt=$(cat ~/.cache/spotify-paused)

# Work out time elapsed as a percentage of the total time.
timethen=$(cat ~/.cache/spotify-nowplaying-starttime)
timenow=$(date +%s)
# +1 to combat slight delay
elapsed=$((($timenow+1)-$timethen-$pt))
printf ""%d:%02d"\n" $(($elapsed%3600/60)) $(($elapsed%60)) > ~/.cache/spotify-nowplaying-elapsed-pretty

# Got the elapsed time, now percentage!
#totallength=$(cat ~/.cache/spotify-nowplaying-length)
#totallengthsecs=$(($totallength / 1000000))
#elapsedper="$elapsed / $totallengthsecs"
#elapsedperc=$(echo "scale=2; $elapsedper" | bc ;)
#elapsedperce="$elapsedper * 100"
#elapsedpercent=$(echo "scale=2; $elapsedperce" | bc ;)
#echo $elapsedpercent > ~/.cache/spotify-nowplaying-elapsed
chmod 777 ~/.cache/spotify-*
