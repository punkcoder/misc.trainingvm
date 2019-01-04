#!/bin/bash

apt install -y sqlmap firefox vim tmux curl wapiti

./createDesktopIcon.py --name "Firefox" --cmd "/usr/bin/firefox" --ico "firefox"
./createDesktopIcon.py --name "Terminal" --cmd "/usr/bin/gnome-terminal" --ico "utilities-terminal"
./createDesktopIcon.py --name "SQLMap" --cmd "sqlmap" --ico "utilities-terminal"