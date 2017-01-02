if (( $+commands[nvim] )); then
	export VISUAL=nvim
	export EDITOR=nvim
elif (( $+commands[vim] )); then
	export VISUAL=vim
	export EDITOR=vim
elif (( $+commands[nano] )); then
	export VISUAL=nano
	export EDITOR=nano
fi

export PAGER=less

export CLICOLOR=1
export BLOCK_SIZE=human-readable
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$ZDOTDIR/.zhistory"
