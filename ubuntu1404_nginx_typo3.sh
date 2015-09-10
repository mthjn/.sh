#!/bin/bash

# configure block afterwards
# dep mysql, php, nginx
# needs empty db
echo "starting........."
echo "creating dir structure......."
  cd /usr/share/nginx/html
  mkdir typo.test
  cd  typo.test
  mkdir www

  # apt-get install php-apc -y
  # for php-fpm as FastCGI deamon
  # service php5-fpm restart

echo "moving to ==========  /home/$USER"
cd /home/$USER
echo "getting ========= TYPO3 7.3.1"
  wget http://downloads.sourceforge.net/typo3/typo3_src-7.3.1.tar.gz
  tar xvfz typo3_src-7.3.1.tar.gz
echo "rsyncing src to nginx default dir ==============> /usr/share/nginx/html/typo.test/www/"
cd /usr/share/nginx/html/typo.test/www/

sudo rsync -avP /home/$USER/typo3_src-7.3.1/* ./


