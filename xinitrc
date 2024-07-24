#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# ==================================================================

# Change keyboard layout
setxkbmap fr

# Enable numlock
numlockx &

# Setup monitors
xrandr --output DP-0 --pos 0x0 --mode 2560x1440 --rate 165 --primary
xrandr --output DP-2 --pos 2560x200 --mode 1920x1080 --rate 165

# Set mouse speed
xinput set-prop "USB Gaming Mouse" "libinput Accel Speed" -0.8

# Launch i3
exec i3
