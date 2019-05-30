#!/bin/bash

apt update
apt install -y nginx
cat /var/www/html/index.nginx-debian.html | sudo tee /var/www/html/index.html
title="Welcome to nginx - $HOSTNAME"
sudo sed -i "s/Welcome to nginx/$title/g" /var/www/html/index.html
