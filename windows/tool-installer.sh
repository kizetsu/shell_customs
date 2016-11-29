#!/bin/bash
#
# @package tool-installer
# @author Ralph Dittrich <kizetsu.rd@googlemail.com>
# @description this file will install standard unix tools, libraries and some additional tools

function getMsys {
    # get actual path to return here later
    ACTPATH=$(pwd)
    echo "is your system 32-bit(1) or 64-bit(2) ?"
    read -r -n 1 -s system
    echo "trying to get msys installer.."
    command -v wget > /dev/null 2>&1
    chkwget = $?
    command -v curl > /dev/null 2>&1
    chkcurl = $?
    cd /tmp/
    if [ $system -eq 1 ]; then
        # 32-bit installation
        if [ $chkwget -eq 0 ]; then
            # use wget
            command wget "http://repo.msys2.org/distrib/i686/msys2-i686-20161025.exe"
        elif [ $chkcurl -eq 0 ]; then
            # use curl
            command curl -o msys2-i686-20161025.exe "http://repo.msys2.org/distrib/i686/msys2-i686-20161025.exe"
        else
            # manually download is required
            echo "could not get installer"
            echo "please manually download it from: https://msys2.github.io/"
            exit 1
        fi
        echo "please start tool-installer again after msys2 is installed"
        command ./msys2-i686-20161025.exe
    elif [ $system -eq 2 ]; then
        # 64-bit installation
        if [ $chkwget -eq 0 ]; then
            # use wget
            command wget "http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20161025.exe"
        elif [ $chkcurl -eq 0 ]; then
            # use curl
            command curl -o msys2-x86_64-20161025.exe "http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20161025.exe"
        else
            # manually download is required
            echo "could not get installer"
            echo "please manually download it from: https://msys2.github.io/"
            exit 1
        fi
        echo "please start tool-installer again after msys2 is installed"
        command ./msys2-x86_64-20161025.exe
    else
        echo "could not get installer. please try again or manually download it from: https://msys2.github.io/"
        exit 1
    fi
    cd $ACTPATH
    return 0
}

function main {
    # check if user is administrator
    command NET SESSION > /dev/null 2>&1
    if [ $? -eq 1 ]; then
        echo "installer must be run as administrator"
        exit 1
    fi

    # check if pacman is available (msys2 standard)
    command -v pacman > /dev/null 2>&1
    if [ $? -eq 1 ]; then
        echo "pacman is required";
        # maybe msys2 is not installed - try to install it
        echo "do you want to install msys2 for pacman support? [y|n]"
        read -r -n 1 -s answer
        if ( $answer == "y" ); then
            msysret = getMsys
        else
            exit 1
        fi
    fi

    # get actual path to return here later
    ACTPATH=$(pwd)

    # install tools
    echo "installing standard tools"
    command -v wget > /dev/null 2>&1   || { echo ".. installing wget";  pacman -S wget;  }
    command -v tar > /dev/null 2>&1    || { echo ".. installing tar";   pacman -S tar;   }
    command -v unzip > /dev/null 2>&1  || { echo ".. installing unzip"; pacman -S unzip; }
    command -v gcc > /dev/null 2>&1    || { echo ".. installing gcc";   pacman -S gcc;   }
    command -v rsync > /dev/null 2>&1  || { echo ".. installing rsync"; pacman -S rsync; }

    # install unix libraries
    # needed because most linux tools need ncurses
    # also some tools need other libs from that package
    echo "installing unix libraries"
    echo "please be patient. This may take several minutes"
    cd /tmp/
    echo ".. getting libraries"
    command wget "http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz"
    command tar -xzf ncurses-6.0.tar.gz
    command rm ncurses-6.0.tar.gz
    echo ".. installing"
    cd ncurses-6.0/
    command bash configure
    command make
    command make install
    if [ $? -eq 0 ]; then
        echo "Successfully installed unix libraries"
        cd  ..
        command rm -R ncurses-6.0/
    else 
        echo "Error - Please try again"
        exit 1
    fi

    # maybe get some extern tools?
    echo "installing additional tools"
    echo "please be patient. This may take several minutes"
    # https://github.com/mtoyoda/sl
    echo "..getting sl"
    command wget https://github.com/mtoyoda/sl/archive/master.zip
    command unzip master.zip
    command rm master.zip
    echo "..installing"
    cd sl-master/
    command make
    if [ $? -eq 1 ]; then
        echo "there was a problem with make command"
        exit 1
    else
        command mv sl.exe /usr/bin/sl.exe
        cd ..
        command rm -R sl-master/
        echo "success"
    fi

    echo "Successfully finished installation"

    cd $ACTPATH
    exit 0
}

main
exit
