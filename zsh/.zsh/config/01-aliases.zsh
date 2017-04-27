#!/usr/bin/env zsh

dnssr() {
	echo $(date +"%Y%m%d")$1
}

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
		local target="$(pfd)"
		if [ "$target" != "" ]; then
			cd "$target"; pwd
		else
			echo 'No Finder window found' >&2
		fi
	}

	ql() {
		if (( $# > 0 )); then
			qlmanage -p "$@" &> /dev/null
		fi
	}

	alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
	alias rssi="airport -I | grep \"CtlRSSI\|SSID\" | grep -v BSSID | sed -E 's/(^.*:) (.*)/\2/g' | sed -E 'N;s/(.*)\n(.*)/SSID: \2 RSSI: \1/'"
	alias o="open"

	doorlock() {
			NETWORK="$(airport -I | grep SSID | grep -v BSSID | sed -E 's/(^.*:) (.*)/\2/g')"
			if [ "$NETWORK" != "toLABaki" ]; then
			ssh labaki1.csd.uoc.gr:6007 "doorlock"
		else
			ssh 10.176.4.46 "doorlock"
		fi
	}
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
if (( $+commands[python2] )); then
	alias py="python2"
	gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@" }
fi

if (( $+commands[python3] )); then
	alias py3="python3"
	gpip3() { PIP_REQUIRE_VIRTUALENV="" pip3 "$@" }
fi

# https://coderwall.com/p/7wvx0g/syntax-highlighting-in-the-terminal-with-pygments
if (( $+commands[pygmentize] )); then
	pless() { pygmentize -g -f 16m $* | less -R }
fi

(( $+commands[thefuck] )) && eval $(thefuck --alias)
(( $+commands[nvim] )) && alias vim="nvim"
if (( $+commands[nvim] )) then;
	alias nvimrc="vim $HOME/.config/nvim/init.vim"
fi
if (( $+commands[vim] )) then;
	[[ -f $HOME/.vimrc ]] && alias vimrc="vim $HOME/.vimrc"
	[[ -f $HOME/.vim/vimrc ]] && alias vimrc="vim $HOME/.vim/vimrc"
fi
