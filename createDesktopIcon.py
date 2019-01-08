#!/usr/bin/python3

import os
import sys

appname = ""
appcmd = ""
appico = ""
appterm = False

for i in range(0,len(sys.argv)):
    if sys.argv[i] == "--name":
        appname = sys.argv[i+1]
    if sys.argv[i] == "--cmd":
        appcmd = sys.argv[i+1]
    if sys.argv[i] == "--ico":
        appico = sys.argv[i+1]
    if sys.argv[i] == "--term":
        appterm = True

if not os.path.isdir("/home/jmckee/Desktop"):
    os.mkdir("/home/jmckee/Desktop")

filename = "/home/jmckee/Desktop/{appname}.desktop".format(appname=appname)

f = open(filename,'w')
f.write("[Desktop Entry]\n")
f.write("Version=1.0\n")
f.write("Type=Application\n")
f.write("Name={appname}\n".format(appname=appname))
f.write("Comment=\n")
f.write("Exec={appexec}\n".format(appexec=appcmd))
f.write("Icon={icon}\n".format(icon=appico))
f.write("Path=\n")
if appterm:
    f.write("Terminal=true\n")
else:
    f.write("Terminal=false\n")
f.write("StartupNotify=true\n")
f.close()

os.chmod(filename, 0o775)
