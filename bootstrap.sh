#!/bin/bash

# Oh My ZSH
echo "Setting up ZSH..."
git clone git@github.com:/ohmyzsh/ohmyzsh ~/.oh-my-zsh
git clone git@github.com:/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
ln -s home/zshrc ~/.zshrc
ln -s home/tmux.conf ~/.tmux.conf
cp home/.oh-my-zsh/custom/themes/my.zsh-theme ~/.oh-my-zsh/custom/themes/

# Git
cp home/gitconfig ~/.gitconfig

# Xorg
ln -s home/xinitrc ~/.xinitrc
ln -s home/Xresources ~/.Xresources
stack install xmonad
stack install xmonad-extras

# Input method.
git clone git@github.com:/sheepduke/rime-wubi86 ~/projects/config/rime-wubi86
ln -s ~/projects/config/rime-wubi86 ~/.config/ibus/rime
rime_deployer --build ~/.config/ibus/rime

# Emacs.
git clone git@github.com:/sheepduke/emacs-settings ~/.emacs.d
cp ~/.emacs.d/settings/.emacs ~/
