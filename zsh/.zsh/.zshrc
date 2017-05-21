# Stash for environment vars
if [[ -a $ZDOTDIR/localrc ]]; then
	source $ZDOTDIR/localrc

else
	touch $ZDOTDIR/localrc
fi

# load config filenames into an array
typeset -U config_files
config_files=($ZDOTDIR/**/*.zsh)

# Load all config files
for file in ${config_files}; do
	source $file
done

# Bootstrap and source antibody
if [[ ! -f "/usr/local/bin/antibody" ]]; then
	curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
fi
source <(antibody init)

# Source ZSH plugins
# Pure prompt
antibody bundle <<EOF
mafredri/zsh-async
sindresorhus/pure
zsh-users/zsh-completions
greymd/docker-zsh-completion
zsh-users/zsh-autosuggestions
hlissner/zsh-autopair
zdharma/fast-syntax-highlighting
zdharma/history-search-multi-word
EOF

# Autoloads
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -U zmv
