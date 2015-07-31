#!/bin/bash
sudo mkdir -p /var/www/example.com/html
sudo chown -R $USER:$USER /var/www/example.com/html
sudo chmod -R 755 /var/www

cd /var/www/example.com/html/
sudo touch index.html

sudo cat >> index.html << EOF
<h1>Success!  The example.com server block is working!</h1>
EOF

cd /etc/nginx/sites-available/
sudo touch example.com

sudo cat >> example.com << EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /var/www/example.com/html;
    index index.html index.htm;

    server_name example.com www.example.com;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default

# sudo vim /etc/nginx/nginx.conf
# uncomment
# server_names_hash_bucket_size 64;

sudo service nginx restart

# sudo vim /etc/hosts
