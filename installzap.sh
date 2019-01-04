#!/bin/bash

apt install openjdk-8-jdk -y

# install ZAP
cd ~/Downloads
wget https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2_7_0_unix.sh
chmod +x ZAP_2_7_0_unix.sh
./ZAP_2_7_0_unix.sh

./createDesktopIcon.py --name "OWASP ZAP" --cmd "/usr/local/bin/zap.sh" --ico "/usr/local/zaproxy/zap.ico"