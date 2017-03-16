alias g="git"
alias gp="git push"
alias gl="git pull"
alias gln="$aliases[gl] --no-rebase"
alias gs="git status -sb"
alias glog="git log"
alias glg="$aliases[glog] --graph --decorate --oneline --abbrev-commit"
alias glga="$aliases[glg] --all"
alias gd="git diff"
alias gds="$aliases[gd] --staged"
alias gc="git commit"
alias gcm="$aliases[gc] -m"
alias gb="git branch"
alias gco="git checkout"
alias ga="git add"
alias gap="$aliases[ga] -p"
alias gcl="git clone"
alias gm="git merge"
alias gst="git stash"
alias gr="git reset"

function grcd() {
	cd "$(git root)";
}

# GitIgnore.io
function gi() {
	curl -L -s https://www.gitignore.io/api/$@ ;
}
