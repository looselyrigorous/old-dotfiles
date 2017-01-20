alias gp="git push"
alias gl="git pull"
alias gs="git status -sb"
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git commit"
alias gco="git checkout"
alias ga="git add"
alias gap="git add -p"
alias gcl="git clone"

# GitIgnore.io
function gi() {
	curl -L -s https://www.gitignore.io/api/$@ ;
}
