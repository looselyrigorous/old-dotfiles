#!/usr/bin/env bash
# iTerm Shell Integration
if [[ "$OSTYPE" == darwin* ]]; then
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi
