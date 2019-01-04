#!/usr/bin/python3

import os
import sys

appname = ""
appurl = ""
appico = "security-low"

for i in range(0,len(sys.argv)):
    if sys.argv[i] == "--name":
        appname = sys.argv[i+1]
    if sys.argv[i] == "--url":
        appurl = sys.argv[i+1]
    if sys.argv[i] == "--ico":
        appico = sys.argv[i+1]

if not os.path.isdir("Desktop"):
    os.mkdir("Desktop")

filename = "Desktop/{appname}.desktop".format(appname=appname)

f = open(filename,'w')
f.write("[Desktop Entry]\n")
f.write("Version=1.0\n")
f.write("Type=Link\n")
f.write("Name={appname}\n".format(appname=appname))
f.write("Comment=\n")
f.write("Icon={icon}\n".format(icon=appico))
f.write("URL={appurl}\n".format(appurl=appurl))
f.close()

os.chmod(filename, 0o775)
