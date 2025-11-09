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
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export XIM=fcitx
export XIM_PROGRAM=fcitx
export GLFW_IM_MODULE=fcitx

# Daemons.
dunst &
fcitx5 &
syncthing --no-browser &
silver-brain &
Snipaste &
nm-applet &

# X settings.
setxkbmap -option "ctrl:nocaps"
xrdb -merge ~/.Xresources
# unclutter -display $DISPLAY -idle 1 &
# xkbcomp -I$HOME/.config/xkb $HOME/.config/xkb/keymap $DISPLAY

# Applications.
emacs &
vivaldi &
keepassxc &

exec /usr/bin/i3
