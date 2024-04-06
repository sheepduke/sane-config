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
# Input method.
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export XIM=ibus
export XIM_PROGRAM=ibus

# Daemons.
dunst &
ibus-daemon -drx
syncthing --no-browser &
clash &

# X settings.
setxkbmap -option "ctrl:nocaps"
xrdb -merge ~/.Xresources
# unclutter -display $DISPLAY -idle 1 &
# xkbcomp -I$HOME/.config/xkb $HOME/.config/xkb/keymap $DISPLAY

# Applications.
emacs &
firefox &
alacritty &
keepassxc &

exec /usr/bin/i3
