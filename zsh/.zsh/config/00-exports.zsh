#!/usr/bin/env bash
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

if (( $+commands[most] )); then
	export PAGER=most
else
	export PAGER=less
fi

if (( $+commands[nvim] )); then
	export MANPAGER="nvim -c 'set ft=man' -"
fi

export CLICOLOR=1
export BLOCK_SIZE=human-readable
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$ZDOTDIR/.zhistory"

# Enable GCC colored output by default (gcc >= 4.9)
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
