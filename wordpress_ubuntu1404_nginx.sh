#!bin/bash
###############################
#    no nginx blocks are used #
###############################
# dep: mysql php nginx
# needs empty db
#   mysql -u root -p
#   create database db
#   create user user@localhost identified by 'pwd';
#   grant all privileges on db.* to user@localhost;
#   flush privileges;
#   exit
cd ~
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo apt-get update
sudo apt-get install php5-gd libssh2-php -y
# change wp config now or later
sudo rsync -avP ~/wordpress/ ./
cd /var/www/html/
sudo chown -R $USER:www-data /var/www/html/*
sudo mkdir wordpress/wp-content/uploads
sudo chown -R :www-data wordpress/wp-content/uploads

# install ..
