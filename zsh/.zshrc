export ZDOTDIR=$HOME/.zsh

# Stash for environment vars
if [[ -a $ZDOTDIR/localrc ]]; then
	source $ZDOTDIR/localrc

else
	touch $ZDOTDIR/localrc
fi

# load config filenames into an array
typeset -U config_files
config_files=($ZDOTDIR/**/*.zsh)

# Load all config files except those named "completion.zsh"
for file in ${config_files}; do
	source $file
done

# Bootstrap zplug
export ZPLUG_HOME=$ZDOTDIR/.zplug
if [[ ! -d $ZPLUG_HOME ]] || [[ ! -f "$ZPLUG_HOME/init.zsh" ]]; then
	git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh

# Source ZSH plugins
# zplug
zplug "zplug/zplug"

# Pure prompt
zplug "mafredri/zsh-async", defer:0
zplug "sindresorhus/pure", as:theme, use:pure.zsh

# Docker completion
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Install missing plugins
if ! zplug check; then
	zplug install
fi

# Load plugins
zplug load
# Make fg/bg work again https://github.com/zplug/zplug/issues/322
setopt monitor
