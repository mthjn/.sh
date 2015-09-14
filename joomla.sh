#!/bin/bash

# @link https://docs.joomla.org/nginx
# php config - # /etc/php5/fpm/php.ini

apt-get install nginx -y
apt-get install mysql-server -y
apt-get install php5 -y
apt-get install php5-curl -y
apt-get install php5-fpm -y
apt-get install php5-mysql
apt-get install php5-xmlrpc -y
apt-get install wget -y
apt-get install webmin -y

cd /home/$USER
wget http://joomlacode.org/gf/download/frsrelease/20021/162258/Joomla_3.4.1-Stable-Full_Package.zip

