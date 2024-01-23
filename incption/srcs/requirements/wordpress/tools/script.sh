#!/bin/sh


mkdir -p /var/www/html;
cd /var/www/html;
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html;
wp core download --allow-root;
# mv /var/www/wp-config.php /var/www/html;
# echo "Wordpress: creating config file";
# wp configcreate --allow-root --dbame=yume --dbpass=yumee --locale=yume;
# echo "Wordpress: creating user";
# wp core install --allow-root --url=`localhost` --title="inception" --admin_user="ahlam" --admin_email="ahlam@ahlam.com";
# wp user create --allow-root "ahlam" "ahlam@ahlam.com";
# echo "Wordpress: set up!";