FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install sudo -y && \
    apt install php7.3-fpm php7.3-mysql -y

RUN apt install vim -y && \
    apt install wget -y && \
    apt install iputils-ping -y && \
    apt install curl -y && \
    apt install ffmpeg -y

RUN apt install mariadb-client -y

COPY ./conf/aben-ham.42.fr.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/php.ini /etc/php/7.3/fpm

RUN mkdir /run/php/ 
#Install wp-cli and Wordpress
WORKDIR /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar wp
RUN useradd aben-ham.42.fr
RUN mkdir /home/aben-ham.42.fr
RUN chown aben-ham.42.fr:aben-ham.42.fr /home/aben-ham.42.fr
RUN usermod -aG aben-ham.42.fr,www-data aben-ham.42.fr
RUN mkdir -p /var/www/aben-ham.42.fr/html
RUN chown aben-ham.42.fr:aben-ham.42.fr /var/www/aben-ham.42.fr
RUN chown aben-ham.42.fr:aben-ham.42.fr /var/www/aben-ham.42.fr/html
USER aben-ham.42.fr
WORKDIR /var/www/aben-ham.42.fr/html
RUN mkdir /var/www/aben-ham.42.fr/html/service
RUN wp core download
USER root
WORKDIR /



# sudo -u aben-ham.42.fr wp config create --dbname="$MYSQL_DB_NAME" --dbuser="$MYSQL_ADMIN" --dbpass="$MYSQL_ADMIN_PASSWORD" --dbhost="mariadb"
# sudo -u aben-ham.42.fr wp config create --dbname=wordpress --dbuser=zeus --dbpass=zeus_pass --dbhost=mariadb
# sudo -u aben-ham.42.fr wp core install --url=aben-ham.42.fr --title="Fox" --admin_user="aben-ham" --admin_password="123456" --admin_email="aben-ham@student.1337.ma"
# sudo -u aben-ham.42.fr wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN" --admin_password="$WORDPRESS_PASS" --admin_email="$WORDPRESS_ADMIN_EMAIL"
COPY ./tools/wordpress.sh /home
#CMD tail -f
CMD su aben-ham.42.fr -c '/bin/bash /home/wordpress.sh';php-fpm7.3 -F -R
