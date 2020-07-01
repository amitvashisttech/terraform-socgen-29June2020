#!/bin/bash

apt update
apt install -y apache2
systemctl restart apache2.service
cp -a ./index.html /var/www/html/hello.html
