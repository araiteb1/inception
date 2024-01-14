#!/bin/sh

echo "hey !!" 
mkdir /var/www
mkdir /var/www/html
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'yumee'@'%' IDENTIFIED WITH mysql_native_password BY 'yume';
GRANT ALL ON wordpress.* TO 'wordpressuser'@'%';
apt update;
apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip;