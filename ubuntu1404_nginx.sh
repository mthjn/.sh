#!/bin/bash

# nginx on ubuntu 14.04
# sudo su 
# chmod 777

apt-get update
apt-get install nginx -y
sudo update-rc.d nginx defaults

#ext
apt-get install php5-fpm -y
apt-get install php5-gd -y
