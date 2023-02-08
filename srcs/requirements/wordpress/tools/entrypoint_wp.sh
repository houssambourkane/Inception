#!/bin/bash

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

mkdir -p /var/www;
mkdir -p /var/www/html;
if [ -f /var/www/wp-config.php ]; then
	echo "WPCONFIG EXISTS";
fi
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
php wp-cli.phar --info;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
wp --info;
cd /var/www/html;
wp --allow-root core download 2> /dev/null;
echo "Config creation.........";
if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Creating a new wp-config.php..."
	wp --allow-root config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$MYSQL_HOST;
else
	echo "wp-config.php already exists !"
fi
echo "Installing the core..."
wp --allow-root core install --url=$WP_URL --title=$WP_TITLE --admin_email=$WP_ADMIN_EMAIL --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD;
#wp --allow-root plugin install redis-cache --activate;
echo "Creating user..."
wp --allow-root user create $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD 2> /dev/null;
if [ $? -eq 1 ]; then
	echo "User already exists !";
fi
sed -i "40i define( 'WP_REDIS_HOST', 'redis' );" wp-config.php
sed -i "41i define( 'WP_REDIS_PORT', 6379 );" wp-config.php
sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );" wp-config.php
sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );" wp-config.php
sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n" wp-config.php
chown -R www-data:www-data /var/www/html
exec "$@"
