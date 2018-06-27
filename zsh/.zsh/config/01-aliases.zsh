#!/usr/bin/env bash
dnssr() {
	echo "$(date +"%Y%m%d")$1"
}

# https://github.com/dzervas/dotfiles
alias 8ping="ping 8.8.8.8"

if [[ "$OSTYPE" == darwin* ]]; then
	pfd() {
		osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'
	}

	pfs() {
		osascript -e 'tell application "Finder" to set the_selection to selection
		if the_selection is not {}
			set result to "" as text
			repeat with an_item in the_selection
			set result to result & POSIX path of (an_item as text) & linefeed
			end repeat
			return result
		end if'
	}

	cdf() {
		local target
		target="$(pfd)"
		if [ "$target" != "" ]; then
			cd "$target" || return; pwd
		else
			echo 'No Finder window found' >&2
		fi
	}

	cda() {
		if [ "$1" != "" ]; then
			local target
			target=$("$MYDOTDIR/scripts/resolve_alias.py" "$1")
			if [ -d "$target" ]; then
				cd "$target" || return; pwd
			fi
		fi
	}

	ql() {
		if (( $# > 0 )); then
			qlmanage -p "$@" &> /dev/null
		fi
	}

	alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
	alias rssi="airport -I | grep \"CtlRSSI\\|SSID\" | grep -v BSSID | sed -E 's/(^.*:) (.*)/\\2/g' | sed -E 'N;s/(.*)\\n(.*)/SSID: \\2 RSSI: \\1/'"
	alias o="open"

	virt-manager() {
		bash "$MYDOTDIR/scripts/macos-docker-virt-manager.sh"
	}

	if (( $+commands[gxargs] )); then
		GNU_XARGS="gxargs"
	fi
fi

if [[ "$OSTYPE" == linux* ]]; then
	GNU_XARGS="xargs"
	alias o="xdg-open"
	alias e="\$EDITOR"
	alias se="sudoedit"
fi

# Interactive mv, rm, cp
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Aliases for ls
if (( $+commands[exa] )); then
	alias ls="exa"
fi
alias l="ls -a"
alias ll="ls -lh"
alias la="ls -alh"

alias j="jobs"

if [ ! -z "$GNU_XARGS" ]; then
	ppgrep() {
		pgrep "$@" | $GNU_XARGS -r -- ps -fp
	}
fi

# Python
for ver in {,2,3}; do
	(( $+commands[python$ver] )) && alias py$ver=python$ver
done
unset ver

# https://coderwall.com/p/7wvx0g/syntax-highlighting-in-the-terminal-with-pygments
if (( $+commands[pygmentize] )); then
	pless() {
		if [ $# -eq 1 ] && [ -f "$1" ] ; then
			pygmentize -g -f 16m "$@" | less -R
		else
			echo "usage: $0 file"
		fi
	}
fi

(( $+commands[thefuck] )) && eval $(thefuck --alias)
(( $+commands[nvim] )) && alias vim="nvim"
if (( $+commands[nvim] )); then
	alias nvimrc="vim $HOME/.config/nvim/init.vim"
fi
if (( $+commands[vim] )); then
	[[ -f $HOME/.vimrc ]] && alias vimrc="vim $HOME/.vimrc"
	[[ -f $HOME/.vim/vimrc ]] && alias vimrc="vim $HOME/.vim/vimrc"
fi
