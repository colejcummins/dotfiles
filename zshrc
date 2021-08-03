alias mypy='mypy --disallow-incomplete-defs --check-untyped-defs'
alias python='python3'
alias pip='pip3'

function rmrf () find . -name $1 -type f -delete

function chpwd() {
    emulate -L zsh
    ls -a
}