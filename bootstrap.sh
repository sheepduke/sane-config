#!/bin/bash

cd ~/

# TODO
# Design the usage of this script, especially the PWD.

mkdir -p ~/projects/config/

# Oh My ZSH.
git clone git@github.com:/ohmyzsh/ohmyzsh .oh-my-zsh
# TODO fix path problem.
cp .zshrc ~/
cp .tmux.conf ~/

# StumpWM.
git clone git@github.com:/sheepduke/stumpwm-settings ~/projects/config/stumpwm-settings
git clone git@github.com:/stumpwm/stumpwm-contrib ~/.stumpwm.d/modules
# TODO fix path problem.
cp .xinitrc .Xresource ~/

# Input method.
git clone git@github.com:/sheepduke/rime-wubi86 ~/projects/config/rime-wubi86
ln -s ~/projects/config/rime-wubi86 ~/.config/ibus/rime
cd ~/.config/ibus/rime ; rime_deployer --build . ; cd ~/

# Emacs.
git clone git@github.com:/sheepduke/emacs-settings ~/.emacs.d
cp ~/.emacs.d/settings/.emacs ~/

# Common Lisp.
git clone git@github.com:/sheepduke/silver-brain ~/projects/lisp/silver-brain
