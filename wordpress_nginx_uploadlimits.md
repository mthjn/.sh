#### edit php.ini
vim /etc/php5/fpm/php.ini  
  
upload_max_filesize = 100M  
post_max_size = 100M  
  
#### edit nginx conf
vim /etc/nginx/nginx.conf  
  
client_max_body_size 100m;  
  
#### reload services to activate  
  
service php5-fpm reload  
service nginx reload  
