#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt update
apt upgrade -y
apt-get install -y software-properties-common sudo git
