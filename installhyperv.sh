#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt install xserver-xorg-video-fbdev linux-azure -y