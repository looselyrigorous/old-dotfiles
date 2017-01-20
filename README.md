# dotfiles
My personal dotfiles.

## Installation
GNU Stow is used for deployment. dotfiles are expected to reside in ~/.dotfiles. Ergo:

	git clone https://github.com/looselyrigorous/dotfiles.git .dotfiles
	cd .dotfiles
	stow zsh
	stow vim
	stow git