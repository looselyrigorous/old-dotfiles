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
