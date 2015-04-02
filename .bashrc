# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF --block-size=M --color=auto'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#
# User Specificatons
#
export TERM=xterm-256color
export PROMPT_COMMAND=__prompt_command

#
# User specified Functions
#
function __prompt_command() {
  export ERR=$?
  ~/.prompt.py --right
  PS1=$(~/.prompt.py --left)
}
