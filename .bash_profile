export PATH=$PATH:$HOME/Documents/node/bin

export EDITOR="mate -wl1"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

EMK='\[\033[1;30m\]' # black
EMR='\[\033[1;31m\]' # red
EMG='\[\033[1;32m\]' # green
EMY='\[\033[1;33m\]' # yellow
EMB='\[\033[1;34m\]' # blue
EMM='\[\033[1;35m\]' # magenta
EMC='\[\033[1;36m\]' # cyan
EMW='\[\033[1;37m\]' # white

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="${EMR}\u@local${EMW}:${EMB}\w${EMW}\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \")${EMG}\$(parse_git_branch)${EMW}\$ "

alias ..="cd .."
alias ...="cd ../.."
alias g="git"
alias m="mate ."
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
