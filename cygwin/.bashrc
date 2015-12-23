# activate terminal colors - not really needed on CygWin
export TERM=xterm-256color

# color settings
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color:auto'
alias grep='grep ---color:auto'
alias fgrep='fgrep --color:auto'
alias egrep='egrep --color=auto'

# ls settings
alias ll='ls -alFh --color=auto'
alias la='ls -A'
alias l='ls -CF'

# cd settings
alias ..='cd ..'
alias ...='cd ../..'
alias cdr='cd /'
alias cdh='cd ~'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'


# console mods
#PS1="\[\033[1;37m\][\[\033[0;32m\]\u\[\033[1;37m\]@\[\033[1;36m\]\h\[\033[1;37m\]]\[\033[0;32m\]\w \[\033[1;37m\]\$ \[\033[1;35m\]\033[s\033[1;\$"
#
# there was a problem on my terminal I couldn't find
# I will fix this in the future if I can find a proper way


# git commands
gadd() {
  if [ $# -ne 0 ];then
    command git add $@
  else
    command git add --all
  fi
}

gclone() {
  if [ $# -ne 0 ];then
    command git clone $@
  else
    echo "usage: gitclone [GITPATH (http://github.com/kizetsu/shell_customs)]"
  fi
}

#
# User specified Functions
#
vim() {
  if [ $# -ne 0 ]; then
    command vim $@
  else
    command vim ./
  fi
}

cdl() {
    if [ $# -eq 1 ];then
        command cd $1
        command ls -alFh --color=auto
    fi
}

# get specific file list from server
sshls() {
  if [ $# -ne 0 ]; then
    ssh $1 "ls $2"
  else
    echo "usage: sshls [SERVER] [PATH]"
  fi
}

# rSync local
lsync() {
  command rsync --stats --progress --numeric-ids -axAhHSPc $@
}

# rSync over SSH
# hint: you have to add a config file at ~/.shh/config
# you can find an example for the ssh config file in ssh_config.bsp (text file)
rsync() {
  command rsync --stats --progress --numeric-ids -axAhHSPc -e "ssh -F ${HOME}/.ssh/config" $@
}
