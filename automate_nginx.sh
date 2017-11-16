apt-get install -y nginx
echo $HOSTNAME | sudo tee -a /var/www/html/index.html
