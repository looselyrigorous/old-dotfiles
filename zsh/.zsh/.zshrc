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

# Prezto snippets
#zinit ice wait"0" lucid svn blockf \
#    atclone'git clone --depth 3 https://github.com/zsh-users/zsh-completions.git external'
#zinit snippet PZT::modules/completion
zinit svn for \
    PZT::modules/editor \
    PZT::modules/directory \
    PZT::modules/docker

# OMZ Snippets
zinit snippet OMZ::plugins/docker-compose

#zinit "$mode" zsh-users/zsh-completions

zinit wait lucid light-mode for \
  atinit"zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' atload \
      zsh-users/zsh-completions

# Autoloads
autoload -U colors && colors
autoload -U zmv

# Load Starship
eval "$(starship init zsh)"

# Load FZF zsh integration
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
#export FZF_DEFAULT_COMMAND="fd --type f"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

