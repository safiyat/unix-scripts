test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias mysql="/usr/local/mysql/bin/mysql"
alias timeout=gtimeout
alias ls="gls --color=auto"
