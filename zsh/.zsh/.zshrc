# Stash for environment vars
if [[ -a $ZDOTDIR/localrc ]]; then
	source "$ZDOTDIR/localrc"
else
	touch "$ZDOTDIR/localrc"
fi

# load config filenames into an array
typeset -U config_files
config_files=("$ZDOTDIR"/**/*.zsh)

# Load all config files
for file in ${config_files}; do
	source "$file"
done

# Bootstrap zinit
if ! test -d "$HOME/.zsh/.zinit/";  then
	mkdir "$HOME/.zsh/.zinit/"
	git clone https://github.com/zdharma/zinit.git "$HOME/.zsh/.zinit/bin"
fi

# Source zinit
source "$HOME/.zsh/.zinit/bin/zinit.zsh"

mode="light"
plg_debug="${plg_debug:-false}"
if [[ "$plg_debug" == "true" ]]; then
	mode="load"
fi

# Prezto snippets
zinit ice wait"0" lucid svn blockf \
    atclone'git clone --depth 3 https://github.com/zsh-users/zsh-completions.git external'
zinit snippet PZT::modules/completion
zinit snippet PZT::modules/directory

# OMZ Snippets
zinit snippet OMZ::plugins/docker-compose

# Load Plugins
zinit ice pick"async.zsh" src"pure.zsh"
zinit "$mode" sindresorhus/pure

zinit "$mode" zsh-users/zsh-completions

zinit ice wait'1' atload'_zsh_autosuggest_start'
zinit "$mode" zsh-users/zsh-autosuggestions

zinit "$mode" hlissner/zsh-autopair
zinit "$mode" zdharma/fast-syntax-highlighting

# Autoloads
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -U zmv
