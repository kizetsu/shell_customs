#!/bin/bash
#
# @name gitlab-conf
# @package shell_customs
# @subpackage git
# @author Ralph Dittrich <kizetsu.rd@googlemail.com>
# @created 28.01.2016
#

getNameMail() {
    echo "Enter Your Name"
    read name
    echo "Enter Your Mailaddress"
    read mail
    echo ""
    echo "Name: ${name} | Mail: ${mail}"
    echo "Is this correct?"
    read first_choice
    if [ $first_choice == 'nein' ] || [ $first_choice == 'no' ] || [ $first_choice == 'n' ]; then
        name_mail = getNameMail()
    else
        name_mail['name'] = name
        name_mail['mail'] = mail
    fi
    return name_mail
}

main() {
    name_mail = getNameMail()

    touch ~/.gitconfig || (echo "could not create file. try using sudo" && exit 1)

    confFile = "~./.gitconfig"

    echo "" > $confFile

    case $1 in
        default)
            echo "[user]" > $confFile
            echo "  name = ${name_mail['name']}" >> $confFile
            echo "  email = ${name_mail['mail']}" >> $confFile
            echo "[core]" >> $confFile
            echo "  excludefile = ~/.gitignore" >> $confFile
            echo "[push]" >> $confFile
            echo "  default = simple" >> $confFile
            echo "[color]" >> $confFile
            echo "  ui = true" >> $confFile
            ;;
        smart)
            echo "[user]" > $confFile
            echo "  name = ${name_mail['name']}" >> $confFile
            echo "  email = ${name_mail['mail']}" >> $confFile
            echo "[core]" >> $confFile
            echo "  editor = vim" >> $confFile
            echo "  autocrlf = false" >> $confFile
            echo "  excludefile = ~/.gitignore" >> $confFile
            echo "[merge]" >> $confFile
            echo "  ff = false" >> $confFile
            echo "[push]" >> $confFile
            echo "  default = simple" >> $confFile
            echo "[color]" >> $confFile
            echo "  ui = true" >> $confFile
            echo "[alias]" >> $confFile
            echo "  list = log --format=\"%Cgreen%ad%Creset %C(cyan)%<(20)%an%Creset %C(auto)%h%Creset%C(auto)%d%Creset %s\" --date=short -20" >> $confFile
            echo "  last = log -1" >> $confFile
            echo "  short = log --format=\"%Cgreen%ad%Creset %C(cyan)%<(20)%an%Creset %C(auto)%h%Creset%C(auto)%d%Creset %s\" --date=short -5" >> $confFile
            echo "  remote = branch -r" >> $confFile
            echo "  all = branch -av" >> $confFile
            ;;
        *)
            # actually do nothing..
            echo "usage:"
            echo "  gitlab-conf [default|smart]"
            echo ""
            echo "defaul      create a default gitconfig"
            echo "smart       create a gitconfig with some smart configurations"
            echo ""
            echo "all .gitconfig files created with this tool are supposed to work with gitlab / github"
            ;;
    esac
}
