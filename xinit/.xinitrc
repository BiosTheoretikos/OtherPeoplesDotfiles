#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -load ~/.Xresources
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi

xset +fp ~/.local/share/fonts 
xset fp rehash 
xrdb -load ~/.Xresources
clipmenud &
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8 
urxvtd -q -o -f &
compton -b &

xset dpms 180 &
xss-lock -- slock &
#unclutter --root -reset -idle 1 -noevents &
slstatus &
~/.fehbg &
xbacklight = 5 &
pactl set-source-mute auto_null.monitor true &
#vpn &
xbindkeys &
redshift &
#~/.config/polybar/launch.sh &

exec dwm 2>/tmp/dwm.log
