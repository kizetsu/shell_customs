#
# User Specificatons
#
# exports and other stuff


#
# User specified Aliasses
#
alias ..='cd ..'
alias ...='cd ../..'
alias cdr='cd /'
alias cdw='cd /var/www/'
alias cdh='cd ~'
alias cddoc='cd ~/Dokumente/'
alias cddown='cd ~/Downloads/'
alias mce='mc -e'
alias mcv='mc -v'
alias gitadd='git add ./'


#
# User specified Variables
#


#
# User specified Functions
#
vim(){
  if [ $# -ne 0 ]; then
    command vim $@
  else
    command vim ./
  fi
}

# rSync local
sync(){
  command rsync --stats --progress --numeric-ids -axAhHSPc $@
}

# rSync over SSH
rsync(){
  command rsync --stats --progress --numeric-ids -axAhHSPc -e "ssh -F ${HOME}/.ssh/config" $@
}



# get computer specific aliases
# post in this file everything that should not be synchronized
if [ -f ~/.bash_local_aliases ]; then
    . ~/.bash_local_aliases
fi
