alias g="git"
alias gp="git push"
alias gl="git pull"
alias gs="git status -sb"
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="$aliases[glg] --all"
alias gd="git diff"
alias gds="$aliases[gd] --staged"
alias gc="git commit"
alias gcm="$aliases[gc] -m"
alias gco="git checkout"
alias ga="git add"
alias gap="$aliases[ga] -p"
alias gcl="git clone"
alias gm="git merge"
alias gst="git stash"

function grcd() {
	cd "$(git root)";
}

# GitIgnore.io
function gi() {
	curl -L -s https://www.gitignore.io/api/$@ ;
}
