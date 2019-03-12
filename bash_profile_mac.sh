test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

alias mysql="/usr/local/opt/mysql@5.7/bin/mysql -uroot -pT0uchStone_123 touchstone"
alias timeout=gtimeout
alias ls="gls --color=auto"
alias readlink=greadlink

alias mysqlstart="sudo /usr/local/opt/mysql@5.7/bin/mysql.server start"
alias mysqlstop="sudo /usr/local/opt/mysql@5.7/bin/mysql.server stop"
alias mysqlproclist="/usr/local/opt/mysql@5.7/bin/mysqladmin -uroot -pT0uchStone_123 -i1 processlist"

alias cdte="cd /Users/safiyat/VoerEir/Code/touchstone-engine"
alias cdtc="cd /Users/safiyat/VoerEir/Code/touchstone-common"
alias cdtcm="cd /Users/safiyat/VoerEir/Code/touchstone-common/touchstone_common/db/migration"
alias cdtC="cd /Users/safiyat/VoerEir/Code/touchstone-CLI"
alias cdta="cd /Users/safiyat/VoerEir/Code/touchstone-api"
alias cdtA="cd /Users/safiyat/VoerEir/Code/touchstone-agent-webservice"
alias cdtp="cd /Users/safiyat/VoerEir/Code/touchstone-package"
alias cdtw="cd /Users/safiyat/VoerEir/Code/touchstone-web"
alias cdtd="cd /Users/safiyat/VoerEir/Code/touchstone-doc"
alias cdtE="cd /Users/safiyat/VoerEir/Code/touchstone-externals"
alias cdt="cd /Users/safiyat/VoerEir/Code/"
alias cdT="cd /Users/safiyat/VoerEir/Code/Tools"
alias cds="cd /Users/safiyat/VoerEir/Code/scripts"
alias cdo="cd /Users/safiyat/VoerEir/openRCs"


alias t="bpython -i /Users/safiyat/VoerEir/Code/scripts/testEngine.py"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

function dmidecode()
{
    # set -x
    # echo "PARAMS: $@"
    val=$(/usr/local/bin/dmidecode $@ 2> /tmp/dmidecode_stderr)
    if grep -q '8754EC0F-6210-5E19-BB27-D5C4B42FC8F7' <<< $val; then
        echo 8754EC0F-6210-5E19-BB27-D5C4B42FC8F7
    else
        /usr/local/bin/dmidecode $@
    fi
    # set +x
    echo -n
}
