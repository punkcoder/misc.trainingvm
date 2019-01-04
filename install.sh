#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Adding the PPAs
add-apt-repository ppa:openjdk-r/ppa -y

# Lets do an update
apt update
apt upgrade -y

# install dependencies
apt -y install xrdp xubuntu-desktop --no-install-recommends
apt -y install apache2 mysql-server php php-mysqli php-gd libapache2-mod-php

# Add training user
exists=$(grep -c "^training:" /etc/passwd)
if [ $exists -gt 0 ]; then
    echo "[!] Training User Already Exists"
else
    echo "[!] Creating the Training User"
    adduser --shell /bin/bash --home /home/training training --gecos "" --disabled-password -q
    echo -e "Training1234!\nTraining1234!" | passwd training
    sudo chmod +w /etc/sudoers
    echo "training  ALL=(ALL:ALL) ALL" >> /etc/sudoers
    sudo chmod -w /etc/sudoers
    echo "xfce4-session" > /home/training/.xsession    
fi

sh ./installdvwa.sh
sh ./installzap.sh
sh ./installtools.sh
sh ./installbwapp.sh

# Completing
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl enable mysql
sudo systemctl start mysql

mkdir /home/training/Desktop
cd /home/training/Desktop/
cp /home/jmckee/Desktop/* .
chown jmckee /home/jmckee -R
chgrp jmckee /home/jmckee -R
chown training /home/training -R
chgrp training /home/training -R