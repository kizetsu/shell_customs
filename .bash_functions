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
    # Define the folder where your projects are in (without trailing slash at the end)
    # e.g. ${HOME}/Documents/Projects
    # e.g. /var/www/
    PROJECT_DIR="/var/www"
    case $1 in
        list)
            if [ $# -lt 2 ]; then
                command ls -alFh --color=auto ${PROJECT_DIR}
            else
                command ls -alFh --color=auto ${PROJECT_DIR}/${2,,}/$3
            fi
            ;;
        go)
            if [ $# -lt 2 ]; then
                command cd ${PROJECT_DIR}/${2,,}
            else
                command cd ${PROJECT_DIR}/${2,,}/$3
            fi
            ;;
        new)
            if [ $# -lt 2 ]; then
                command mkdir ${PROJECT_DIR}/${2,,}
            else
                command mkdir ${PROJECT_DIR}/${2,,}/$3
            fi
            ;;
        # @TODO:
        #git)
        #    case $2 in
        #        check-all|ca)
        #            # get all project folders in PROJECT_DIR
        #            # foreach project folder get git status of subfolders
        #            # => also get names from project folder/subfolder
        #            # rework everything like in git short-status
        #            # output
        #            ;;
        #        *)
        #            # atm. do nothing...
        #            # maybe for future uses like get status of specific project/subfolder
        #            # maybe you could do something like git add -p on every project or something
        #            # maybe baby.. but for the moment that's just future visions
        #            ;;
        #    esac
        #    ;;
        help|'')
            echo "usage: project {new|go|list} [NAME]"
            echo ""
            echo "new NAME          to create a new folder in projects"
            echo "go NAME           go to specific project folder"
            echo "list [NAME]       list all or specific project folders"
            ;;
        *)
            echo "did you mean: project go ${PROJECT_DIR}/${1}/${2} ? [y|n]"
            read yn
            if [ "${yn}" == y ]; then
                command cd ${PROJECT_DIR}/$1/$2
            fi
            ;;
    esac
}

clipdiff() {
    if [ $# -eq 0 ]; then
        echo "usage: clipdiff FILE"
        echo ""
        echo "diff between FILE and your clipboard"
    else
        if [ -f "/dev/clip" ]; then
            echo /dev/clip > /tmp/clpd
        elif [ -f "/dev/clipboard" ]; then
            echo /dev/clipboard > /tmp/clpd
        else
            echo "cant get clipboard contents"
            exit 1
        fi
        diff $1 /tmp/clpd
    fi
}