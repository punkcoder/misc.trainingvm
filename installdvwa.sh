#!/bin/bash

# Install DVWA
sudo rm /var/www/html/index.html
cd /var/www/html
wget https://github.com/ethicalhack3r/DVWA/archive/master.zip
unzip master.zip
rm master.zip
mv DVWA-master dvwa
cd dvwa
sed -e "s/= 'root'/= 'dvwa'/g" -e "s/= 'impossible'/= 'low'/g"  config/config.inc.php.dist > config/config.inc.php
cp /etc/php/7.2/apache2/php.ini /etc/php/7.2/apache2/php.ini.bak
chmod 777 /etc/php/7.2/apache2/php.ini
sed -e "s/allow_url_fopen = Off/allow_url_fopen = On/g" -e "s/allow_url_include = Off/allow_url_include = On/g" /etc/php/7.2/apache2/php.ini.bak > /etc/php/7.2/apache2/php.ini | grep /etc/php/7.2/apache2/php.ini -e "allow_url_fopen" -e "allow_url_include"
chmod 644 /etc/php/7.2/apache2/php.ini
chmod 777 /var/www/html/dvwa/hackable/uploads/
chmod 777 /var/www/html/dvwa/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
chmod 777 /var/www/html/dvwa/config/
mysql -u root -e "CREATE DATABASE dvwa;"
mysql -u root -e "grant all on dvwa.* to dvwa@localhost identified by 'p@ssw0rd';"

cd ~
~/createUrlIcon.py --name DVWA --url http://localhost/dvwa