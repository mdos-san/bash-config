# Load bashrc from '~/.personal.bash'
# This is usefull to have a file that is not commited
# Exemple: $PATH configuration will likely never be the same accross computers
source ~/.personal.bashrc

# Reload .bashrc
alias rl="source ~/.bashrc"
# Edit .bashrc
alias brc="vim ~/.bashrc"
# Edit .vimrc
alias vrc="vim ~/.vimrc"
# Quick clear
alias c="clear"

################################################################################
# GIT ALIASES                                                                  #
################################################################################
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gdm="git diff master"
alias gdn="git diff --name-only"
alias gdns="git diff --name-status master | sort"
alias gds="git diff --staged"
alias gl="git log --decorate --oneline --graph --all"
alias gp="git push origin"
alias gpf="git push --force origin"
alias gs="git status"

