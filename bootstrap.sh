#!/bin/bash

mkdir -p ~/projects/config/

# Oh My ZSH
echo "Setting up ZSH..."
git clone git@github.com:/ohmyzsh/ohmyzsh ~/.oh-my-zsh
ln home/zshrc ~/.zshrc
ln home/tmux.conf ~/.tmux.conf

# Git
ln home/gitconfig ~/.gitconfig

# Xorg
ln home/xinitrc ~/.xinitrc
ln home/Xresources ~/.Xresources


# Input method.
git clone git@github.com:/sheepduke/rime-wubi86 ~/projects/config/rime-wubi86
ln -s ~/projects/config/rime-wubi86 ~/.config/ibus/rime
rime_deployer --build ~/.config/ibus/rime

# Emacs.
git clone git@github.com:/sheepduke/emacs-settings ~/.emacs.d
cp ~/.emacs.d/settings/.emacs ~/
