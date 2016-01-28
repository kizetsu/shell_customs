# @name bash_functions
# @package shell_customs
# @author Ralph Dittrich <kizetsu.rd@googlemail.com>
# @created 28.01.2016
#

# let you start vim in folder view if you want to
vim() {
    if [ $# -ne 0 ]; then
        command vim $@
    else
        command vim ./
    fi
}

# change dir to folder and list contents
cdl() {
    if [ $# -eq 1 ]; then
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
# you can find the syntax for the ssh config file in ssh_config.bsp (text file)
rsync() {
    command rsync --stats --progress --numeric-ids -axAhHSPc -e "ssh -F ${HOME}/.ssh/config" $@
}



# project functions
project() {
    PROJECT_DIR="${HOME}/Documents/Projects"
    case $1 in
        list)
            if [ $# -lt 2 ]; then
                command ls -alFh --color=auto ${PROJECT_DIR}
            else
                command ls -alFh --color=auto ${PROJECT_DIR}/$2/$3
            fi
            ;;
        go)
            command cd ${PROJECT_DIR}/$2
            ;;
        new)
            command mkdir ${PROJECT_DIR}/$2
            ;;
        help|'')
            echo "usage: project {new|go|list} [NAME]"
            echo ""
            echo "new NAME          to create a new folder in projects"
            echo "go NAME           go to specific project folder"
            echo "list [NAME]       list all or specific project folders"
            ;;
    esac
}