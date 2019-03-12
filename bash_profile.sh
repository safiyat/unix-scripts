export EDITOR="emacs"
export LC_ALL=C

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace

HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='$(date +%d\ %H:%M:%S) ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='$(date +%d\ %H:%M:%S) ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
which dircolors > /dev/null
if [ $? -eq 0 ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
. /etc/bash_completion
fi

alias tailf="tail -f"


if [ $(uname) == "Darwin" ]; then
    if [ -f ~/.bash_profile_mac ]; then
        . ~/.bash_profile_mac
    fi
fi

alias check_ssh="echo \"echo Hello World; exit\" | ssh -i ~/touchstone_key"

# Python virtualenv management aliases
alias s="source venv/bin/activate"
alias d="deactivate"
alias v="virtualenv venv"

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

alias emacs="/Users/safiyat/.emacs.d/emacs.sh"
export GPG_TTY=$(tty)
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

export BYOBU_PREFIX=/usr/local

# Vim pager tool
function vmore(){
    if [[ -e ~/.vimrc.more ]]; then
        vim -u ~/.vimrc.more - $@
    else
        echo "No .vimrc.more found in the HOME directory." > /dev/stderr
    fi
}

# git aliases
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gr="git reset"
alias gs="git status"

# PID / Process name based search
alias psg="ps aux | grep -v grep | grep --color=never -i -e VSZ -e"

# Aria aliases
alias aria="aria2c --quiet=true &"
function aria-web(){
    if [[ -e ${HOME}/.aria2/web-ui/node-server.js ]]; then
        cd ${HOME}/.aria2/web-ui/ && node node-server.js &
    else
        echo "No node-server.js found in ${HOME}/.aria2/web-ui/" > /dev/stderr
    fi
}
