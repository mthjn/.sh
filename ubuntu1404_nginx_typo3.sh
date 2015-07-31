#!/bin/bash

# configure block afterwards
# dep mysql, php, nginx
# needs empty db

# dir struct
cd /var/www/
sudo su
mkdir -p typo.test/www

apt-get install php-apc
# for php-fpm as FastCGI deamon
service php5-fpm restart

cd /home/$USER
wget http://downloads.sourceforge.net/typo3/typo3_src-7.3.1.tar.gz
tar xvfz typo3_src-7.3.1.tar.gz
cd /var/www/typo.test/www/
sudo rsync -avP /home/$USER/typo3_src-7.3.1/* ./
