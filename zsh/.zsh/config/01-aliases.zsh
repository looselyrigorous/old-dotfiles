#!/usr/bin/env zsh

dnssr() {
	echo $(date +"%Y%m%d")$1
}

if [[ "$OSTYPE" == darwin* ]]; then
	alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
	alias rssi="airport -I | grep \"CtlRSSI\|SSID\" | grep -v BSSID | sed -E 's/(^.*:) (.*)/\2/g' | sed -E 'N;s/(.*)\n(.*)/SSID: \2 RSSI: \1/'"
	alias o="open"

	doorlock() {
			NETWORK=$(airport -I | grep SSID | grep -v BSSID | sed -E 's/(^.*:) (.*)/\2/g')
			if [ "$NETWORK" != 'toLABaki' ]; then
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
(( $+commands[thefuck] )) && eval $(thefuck --alias)
(( $+commands[nvim] )) && alias vim="nvim"
if (( $+commands[nvim] )) then;
	alias vimrc="vim $HOME/.config/nvim/init.vim"
elif (( $+commands[vim] )) then;
	[[ -f $HOME/.vimrc ]] && alias vimrc="vim $HOME/.vimrc"
	[[ -f $HOME/.vim/vimrc ]] && alias vimrc="vim $HOME/.vim/vimrc"
fi
