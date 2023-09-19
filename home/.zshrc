# If you come from bash you might have to change your $PATH.
export HOME="/home/sheep"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.roswell/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Language settings.
export LANG=en_US.UTF-8
export LC_CTYPE="zh_CN.UTF-8"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="my"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    colorize
    dotenv
    osx
    z
    zsh-syntax-highlighting
    # Development
    git docker jsontools
    # Java
    mvn npm
    # Ruby
    ruby rbenv bundler rake
    # Python
    pip
    # Elixir
    mix
    # Misc
    themes

)

source $ZSH/oh-my-zsh.sh

# User configuration

# Enable history-substring-search
DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# GPG
# To fix the famous issue of:
# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

# Environment setttings
#
# Javascript
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Golang
export GOPATH="$HOME/lib/golang"
export PATH="$PATH:$GOPATH/bin"

# Arduino
export ARDUINO_SKETCHBOOK="$HOME/lib/arduino"

# Android
export ANDROID_HOME="$HOME/android/sdk"
export PATH="$PATH:$HOME/android/flutter/bin"
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
 
# Rust
export RUST_CARGO_HOME="$HOME/.cargo"
PATH="$RUST_CARGO_HOME/bin:$PATH"

# OCaml - opam configuration
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx -- vt1;
fi

# if [[ -n $DISPLAY ]] && [[ -z "$TMUX" ]]; then
#     if [[ -z $(pgrep tmux) ]]; then
#         tmux
#     else
#         if [[ $(pgrep urxvt | wc -l) -lt 2 ]]; then
#             tmux a
#         fi
#     fi
# fi
