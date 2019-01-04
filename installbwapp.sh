#!/bin/bash

cd ~
wget https://sourceforge.net/projects/bwapp/files/bWAPP/bWAPPv2.2/bWAPPv2.2.zip/download
mv download /var/www/html/bwapp.zip
cd /var/www/html/
mkdir documents
mv bWAPP_intro.pdf documents/bWAPP_intro.pdf
unzip bwapp.zip
rm bwapp.zip
rm *.xml
rm *.txt
cd bWAPP
chmod 777 passwords/
chmod 777 images/
chmod 777 documents/
mkdir logs
chmod 777 logs/
mysql -u root -e "grant all on bWAPP.* to bWAPP@localhost identified by 'p@ssw0rd';"
cd admin
cp settings.php settings.php.dist
sed -e "s/$db_username = \"root\";/$db_username = \"bWAPP\";/g" -e "s/$db_password = \"\";/$db_password = \"p@ssw0rd\";/g" settings.php.dist > settings.php
curl http://localhost/bWAPP/install.php?install=yes > /dev/null

cd ~
~/createUrlIcon.py --name bWAPP --url http://localhost/bWAPP