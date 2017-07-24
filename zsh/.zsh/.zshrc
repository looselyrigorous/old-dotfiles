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

# Bootstrap zplugin
if ! test -d "$HOME/.zsh/.zplugin/";  then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zplugin/master/doc/install.sh)"
fi

# Source zplugin
source "$HOME/.zsh/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Load Plugins
zplugin load mafredri/zsh-async
zplugin load sindresorhus/pure

zplugin load zsh-users/zsh-completions
zplugin load greymd/docker-zsh-completion
zplugin load zsh-users/zsh-autosuggestions

zplugin load hlissner/zsh-autopair

zplugin load zdharma/fast-syntax-highlighting
zplugin load zdharma/history-search-multi-word

# Autoloads
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -U zmv
