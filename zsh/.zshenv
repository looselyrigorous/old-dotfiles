# Setup MYDOTDIR
export MYDOTDIR=$HOME/.dotfiles

# Bits and pieces taken from prezto https://github.com/sorin-ionescu/prezto
export ZDOTDIR=$HOME/.zsh

# History settings
export HISTFILE=$ZDOTDIR/.zhistory
export HISTSIZE=10000 # 500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftime format
export HISTCONTROL=ignoreboth # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"

# Set up XDG user dirs
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"

# Set up XDG base dirs
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Use XDG_CACHE_HOME for ICEauthority
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

# Use XDG_CACHE_HOME for less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# Use XDG_CONFIG_HOME for ipython
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter

# Use XDG_CACHE_HOME for pylint cache
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

# Use XDG_DATA_HOME for rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Use XDG_DATA_HOME for node
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Add flutter to PATH
export PATH="$PATH:$XDG_DATA_HOME/flutter/bin"
