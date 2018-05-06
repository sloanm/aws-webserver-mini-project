#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update
apt-get -y install nginx

sleep 15
sed 's/Welcome to nginx/Automation for the people/g'  /var/www/html/index.nginx-debian.html > /var/www/html/index1.html

sed 's/Thank you for using nginx/Thank you for using Stelligent/g'  /var/www/html/index1.html > /var/www/html/index.html

# make sure nginx is started
service nginx start

