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
alias gap="git add --patch"
alias gb="git branch"
function gbg {
	git branch | grep $1 | sed 's/[* ]*//'
}
alias gc="git commit "
alias gca="git commit --amend --allow-empty --no-edit "
alias gcam="git commit --amend --allow-empty "
alias gce="git commit --allow-empty "
alias gcf="git commit --fixup "
alias gcm="git commit -m "
alias gd="git diff"
alias gdm="git diff master"
alias gdn="git diff --name-only"
alias gdns="git diff --name-status master | sort"
alias gds="git diff --staged"
alias gf="git fetch "
alias gl="git log --decorate --oneline --graph"
alias gla="git log --decorate --oneline --graph --all"
alias gp="git push origin"
function gba {
	git branch | grep "*" | cut -d ' ' -f 2
}
function gpa {
	git push origin `gba`
}
function gpfa {
	git push --force origin `gba`
}
alias gpf="git push --force origin"
alias gpm="git push origin master"
alias gra="git rebase -i --autosquash "
alias grc="git rebase --continue"
alias gri="git rebase -i "
alias grk="git rebase -i --keep-empty "
alias grr="git rebase -i --keep-empty --autosquash "
function grro {
	git rebase -i --keep-empty --autosquash origin/$1
}
alias grrm="git rebase -i --keep-empty --autosquash origin/master "
alias gs="git status"
function grm {
	git reset HEAD
	git checkout .
	git clean -df
}
alias gmm="git merge origin/master"
function gma {
	git merge origin/`gba`
}
alias gfa="git fetch --all "


################################################################################
# MAVEN ALIASES                                                                #
################################################################################
alias mrl="mvn clean install -D skipTests"
