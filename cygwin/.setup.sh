#/bin/bash
#
# Installing Bash files for cygwin

echo "This setup will remount your devices. OK? [yes, no]"
read device_decision

# get the User Name
USER=$(whoami)

if [ $device_decision == 'yes' ];then
    echo "start remounting"
    echo "remounting root: C:/slash"
    mount C:/slash /
    echo "remounting home: C:/Users"
    mount C:/Users /home
    echo "remounting user directory: C:/Users/${USER}"
    mount C:/Users/$USER /home/$USER
    echo "mounting / remounting mobaxterm directory: C:/Users${USER}"
    mount C:/Users/$USER /home/mobaxterm
elif [ $device_decision == 'no' ]; then
    echo "If you don't remount the functionallity can be decreased.."
    echo "Continue with [ENTER] or stop with [CTRL+C]"
    read anykey
else
    /bin/bash .setup.sh
    exit;
fi

echo "creating .bashrc file"
cp .bashrc ~/.bashrc
echo "creating .gitconfig file"
cp .gitconfig ~/.gitconfig
echo "creating ssh config"
mkdir ~/.ssh
echo "writing example ssh config to file"
touch ~/.ssh/config
echo "Host localHost"          >> ~/.ssh/config
echo "    Hostname 127.0.0.1"  >> ~/.ssh/config
echo "    Port 2222"           >> ~/.ssh/config
echo "    User ${USER}"        >> ~/.ssh/config

echo "installation successfull"
exit 0;
