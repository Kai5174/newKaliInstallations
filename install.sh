#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "APT-GET UPDATING..."
apt-get update -y
apt-get upgrade -y

echo "SETUP UTILITIES"
echo "setxkbmap -option caps:swapescape" >> ~/.bashrc
echo 'set completion-ignore-case On' >> ~/.inputrc

echo "SETUP VIRTUALBOX"
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
apt-get install virtualbox virtualbox-dkms -y

echo "SETUP VIRTUALENV"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py 
python3 get-pip.py 
pip3 install virtualenv virtualenvwrapper
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

source ~/.bashrc

echo "SETUP SSH"
apt-get install ssh


