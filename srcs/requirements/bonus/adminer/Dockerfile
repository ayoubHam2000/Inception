FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install php7.3-fpm php7.3-mysql -y

RUN apt install curl -y

RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/adminer.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN mkdir /run/php/ 

CMD php-fpm7.3 -F -R 
#CMD tail -f
