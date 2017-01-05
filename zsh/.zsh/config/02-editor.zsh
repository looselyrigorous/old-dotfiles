# Bits and pieces taken from prezto https://github.com/sorin-ionescu/prezto

# Variables
# Use human-friendly identifiers.
zmodload zsh/terminfo
typeset -A key
key=(
	'Delete'       "$terminfo[kdch1]"
	'F1'           "$terminfo[kf1]"
	'F2'           "$terminfo[kf2]"
	'F3'           "$terminfo[kf3]"
	'F4'           "$terminfo[kf4]"
	'F5'           "$terminfo[kf5]"
	'F6'           "$terminfo[kf6]"
	'F7'           "$terminfo[kf7]"
	'F8'           "$terminfo[kf8]"
	'F9'           "$terminfo[kf9]"
	'F10'          "$terminfo[kf10]"
	'F11'          "$terminfo[kf11]"
	'F12'          "$terminfo[kf12]"
	'Insert'       "$terminfo[kich1]"
	'Home'         "$terminfo[khome]"
	'PageUp'       "$terminfo[kpp]"
	'End'          "$terminfo[kend]"
	'PageDown'     "$terminfo[knp]"
	'Up'           "$terminfo[kcuu1]"
	'Left'         "$terminfo[kcub1]"
	'Down'         "$terminfo[kcud1]"
	'Right'        "$terminfo[kcuf1]"
	'BackTab'      "$terminfo[kcbt]"
)

# ZLE widgets

# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
# http://zshwiki.org/home/zle/bindkeys
if (( $+terminfo[smkx] )) && (( $+terminfo[rmkx] )); then
	function zle-line-init () {
		echoti smkx
	}
	function zle-line-finish () {
		echoti rmkx
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

# Make ^Z toggle between ^Z and fg
# https://github.com/Julian/dotfiles
function ctrlz() {
	if [[ $#BUFFER == 0 ]]; then
		fg >/dev/null 2>&1 && zle redisplay
	else
		zle push-input
	fi
}

zle -N ctrlz

# Key Bindings
bindkey -e
[[ -n "${key[Home]}"    ]] && bindkey "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]] && bindkey "${key[End]}"     end-of-line
[[ -n "${key[Delete]}"  ]] && bindkey "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]] && bindkey "${key[Up]}"      history-substring-search-up
[[ -n "${key[Down]}"    ]] && bindkey "${key[Down]}"    history-substring-search-down
[[ -n "${key[Left]}"    ]] && bindkey "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]] && bindkey "${key[Right]}"   forward-char
[[ -n "${key[BackTab]}" ]] && bindkey "${key[BackTab]}" reverse-menu-complete
bindkey "^Z" ctrlz
