export ZSH="/Users/colejcummins/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias mypy='mypy --disallow-incomplete-defs --check-untyped-defs'
alias python='python3'
alias pip='pip3'

function rmrf () find . -name $1 -type f -delete

function chpwd() {
    emulate -L zsh
    ls -a
}