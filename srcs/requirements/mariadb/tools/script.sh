#!/bin/bash
service mysql start
    
mysql -h localhost -u root -e "FLUSH PRIVILEGES;"

mysql -h localhost -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;"

#mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%'"

mysql -h localhost -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';\
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_ADMIN'@'%'"

mysql -h localhost -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    
pkill mysql

echo "Starting mariadb ... Done"

mysqld
