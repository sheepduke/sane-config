#!bin/bash
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

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

## These shall be started via user-level services.
##
# syncthing --no-browser &
# pulseaudio --start &
# dunst &

setxkbmap -option "ctrl:nocaps"
xrdb -merge ~/.Xresources
# ibus-daemon &
fcitx5 &
unclutter -display $DISPLAY -idle 1 &
# xkbcomp -I$HOME/.config/xkb $HOME/.config/xkb/keymap $DISPLAY
dunst &
emacs &
firefox &
keepassxc &
urxvt &

exec i3
