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

# Bootstrap zplugin
if ! test -d "$HOME/.zsh/.zplugin/";  then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zplugin/master/doc/install.sh)"
fi

# Source zplugin
source "$HOME/.zsh/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

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
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin "$mode" sindresorhus/pure

zplugin "$mode" zsh-users/zsh-completions
zplugin "$mode" greymd/docker-zsh-completion

zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin "$mode" zsh-users/zsh-autosuggestions

zplugin "$mode" hlissner/zsh-autopair

zplugin ice compile"(hsmw-*|history-*)"
zplugin "$mode" zdharma/history-search-multi-word
zplugin "$mode" zdharma/fast-syntax-highlighting

# Autoloads
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -U zmv
