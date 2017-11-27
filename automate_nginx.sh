apt-get install -y nginx
echo $HOSTNAME | tee -a /var/www/html/index.html
