# Training VM Scripts

These are a set of scripts for building out virutal machines as part of the
Offensive Security Training course.  The scripts are designed to work against
Ubuntu 18.10. Currently the image that this builds is around 3.4gb and is
designed to be functional with 1 core and 2gb of ram.

## Included

* Xubuntu Desktop
* Firefox
* DVWA Vulnerable Application
* bWAPP Vulnerable Application
* Zed Attack Proxy
* SQL Map

## Usage

1. Install Ubuntu 18.10 Server selecting no additional item.
1. Clone the repository or ssh the files to the machine
1. Run: `sudo ./install.sh`
1. Reboot

## Known Issues

* Currently during the install process you have to approve the steps during the
  ZAP install