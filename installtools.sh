#!/bin/bash

apt install -y sqlmap firefox vim tmux curl wapiti chromium-browser

./createDesktopIcon.py --name "Firefox" --cmd "/usr/bin/firefox" --ico "firefox"
# TODO: need to check this one
./createDesktopIcon.py --name "Chromium" --cmd "/usr/bin/chromium-browser" --ico "chromium"
./createDesktopIcon.py --name "Terminal" --cmd "/usr/bin/gnome-terminal" --ico "utilities-terminal"
./createDesktopIcon.py --name "SQLMap" --cmd "sqlmap" --ico "utilities-terminal"