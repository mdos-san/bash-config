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

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

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

function port {
	netstat -anop | grep $1 | grep LISTEN | sed -e "s/\s\+/ /g" | cut -d ' ' -f 7 | cut -d '/' -f 1
}


function kport {
	kill -9 `port $1`
}


################################################################################
# MAVEN ALIASES                                                                #
################################################################################
alias mrl="mvn clean install -D skipTests"

alias notes="vim ~/notes"
alias todo="vim ~/todo.md"

function diff-by-name {
	git log master --oneline | cut -d ' ' -f 2- > /tmp/master
	git log $1 --oneline | cut -d ' ' -f 2- > /tmp/branch
	diff /tmp/branch /tmp/master | cut -d ' ' -f 2- | sort | uniq -u
}

function lint-java {
	export BRANCH=$(git branch | grep "*" | cut -d ' ' -f 2)
	export FIRST_COMMIT=$(git log origin/master.. --oneline | tail -n 1 | cut -d ' ' -f 1)

  run.sh pmd -d . -R rulesets/java/quickstart.xml > /tmp/branch
  git checkout $FIRST_COMMIT^
  run.sh pmd -d . -R rulesets/java/quickstart.xml > /tmp/master
	git checkout $BRANCH
  cat /tmp/master | sed -e "s/:[0-9]*://g" > /tmp/master-line
  cat /tmp/branch | sed -e "s/:[0-9]*://g" > /tmp/branch-line
	diff /tmp/master-line /tmp/branch-line > /tmp/diff
	cat /tmp/diff
}

function lint-java-import {
	echo "### Files with useless imports: "
	cat /tmp/diff | grep -e "^>.*imports.*" | sed -n "s/^.*\/\(.*\.java\).*/  - \1/p" | uniq
}

# Color for TTY
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi
