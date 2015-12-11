#!/bin/zsh
sshinfofile="/home/fliang/.secrets/ssh-feynmanliang.gpg"
address=`gpg -q --no-tty -d --use-agent $sshinfofile`
ssh -ND 4711 $address
