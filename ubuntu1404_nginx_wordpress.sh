#!/bin/bash

###############################
#    default nginx block only #
###############################
# your server path here
NPATH=/usr/share/nginx/html/typo.test/www/wp
# name of wp for wget
WP=latest.tar.gz

echo '============================'
echo 'Your server path: '
echo $NPATH

# dep: mysql php nginx
# needs empty db
#   mysql -u root -p
#   create database db
#   create user user@localhost identified by 'pwd';
#   grant all privileges on db.* to user@localhost;
#   flush privileges;
#   exit
##################################################

cd ~
#check if root
sudo ls -lrt

rm -rf $WP

echo 'Getting latest wp into home'
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
echo 'getting dependencies'
sudo apt-get update
sudo apt-get install php5-gd libssh2-php -y
echo 'rsync to server'
cd $NPATH
pwd
sudo rsync -aqP ~/wordpress/ ./

echo 'changing ownership to www-data'
sudo chown -R $USER:www-data $NPATH

sudo mkdir -p $NPATH/wp-content/uploads
sudo chown -R :www-data $NPATH/wp-content/uploads
sudo chmod -R 755 $NPATH/wp-content/uploads

echo 'creating empty writable wp-config'
sudo touch $NPATH/wp-config.php
sudo chown :www-data $NPATH/wp-config.php
sudo chmod 755 $NPATH/wp-config.php

# avoid Connection information death
sudo usermod -s -G www-data $USER


echo 'Done, change the wp-config now, install ..'
