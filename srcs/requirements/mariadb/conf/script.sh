#!/bin/bash

killall -15 mysqld
killall -15 mysqld_safe

mysqld_safe --skip-grant-tables --skip-networking & (\
    sleep 3;
    
    mysql -u root -e "FLUSH PRIVILEGES;"

    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;"
    
    #mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    #GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%'"
    
    mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';\
    GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_ADMIN'@'%'"

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    
    killall -15 mysqld;
    killall -15 mysqld_safe;
    ) &> /dev/null;

echo "Starting mariadb ..."
wait
echo "Done."
mysqld_safe
