#!/bin/bash

#this script is executed by aben-ham.42.fr user

echo "Wordpress"
cd /var/www/aben-ham.42.fr/html
pwd

if ! test -f "wp-config.php"
then
while true
do
	if wp config create --dbname="$MYSQL_DB_NAME" --dbuser="$MYSQL_ADMIN" --dbpass="$MYSQL_ADMIN_PASSWORD" --dbhost="mariadb" &> /dev/null; then
		break
	else
		echo "Waiting Data Base To Start ...";
		sleep 1;
	fi
done
wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL"
wp user create "$WORDPRESS_USER" "$WORDPRESS_USER_EMAIL" --role=author --user_pass="$WORDPRESS_USER_PASSWORD"
wp plugin install redis-cache --activate
wp redis enable
fi

wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT "6379"

#php-fpm7.3 -F -R
