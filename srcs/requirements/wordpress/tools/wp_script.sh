#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

echo "Creating Folder html . . ."
mkdir -p /var/www/html
echo "Installing WP CLI . . ."

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html;
echo "DOWNLOADING WP CORE . . ." 
wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/;
wp theme install twentytwenty --path=/var/www/html/ --allow-root  --activate;
wp core install --allow-root --url=localhost --title='Inception' --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL;

echo "Wordpress: creating user";

wp user create --allow-root $WP_USER $WP_EMAIL --user_pass=$WP_PASSUSER; 

echo "Wordpress: set up!";

exec "$@"