#!/bin/bash

cd /var/www/aben-ham.42.fr/html
pwd

if ! test -f "wp-config.php"
then
while true
do
	if sudo -u aben-ham.42.fr wp config create --dbname="$MYSQL_DB_NAME" --dbuser="$MYSQL_ADMIN" --dbpass="$MYSQL_ADMIN_PASSWORD" --dbhost="mariadb" &> /dev/null; then
		break
	else
		echo "Waiting Data Base To Start ...";
		sleep 1;
	fi
done
sudo -u aben-ham.42.fr wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN" --admin_password="$WORDPRESS_PASS" --admin_email="$WORDPRESS_ADMIN_EMAIL"
fi

php-fpm7.3 -F -R 
