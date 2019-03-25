# Load bashrc from '~/.personal.bash'
# This is usefull to have a file that is not commited
# Exemple: $PATH configuration will likely never be the same accross computers
source ~/.personal.bashrc

# Edit .bashrc
function brc {
	cd $BASH_CONFIG_HOME
	vim .bashrc
	bash setup.bash
	cd -
}
# Go to bashrc directory
alias cdbrc="cd $BASH_CONFIG_HOME"

# Edit .vimrc
function vrc {
	cd $VIM_CONFIG_HOME
	vim .vimrc
	bash setup.bash
	cd -
}
# Go to vimrc directory
alias cdvrc="cd $VIM_CONFIG_HOME"

# Reload .bashrc
alias rl="source ~/.bashrc"
# Quick clear
alias c="clear"
# Ls with color
alias ls="ls --color=tty"

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

