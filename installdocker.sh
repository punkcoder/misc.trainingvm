#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# adduser jmckee
# apt install git sudo 
# usermod -aG sudo jmckee

apt update
apt upgrade -y
apt-get install -y software-properties-common sudo git wget python python3

