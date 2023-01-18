FROM debian

RUN apt update
RUN apt upgrade -y
RUN apt install php-fpm -y

RUN apt install vim -y
RUN apt install wget -y
RUN apt install iputils-ping -y

COPY ./wordpress /home

# docker run -it --name myphpfpm --rm --network mynetwork -v /Users/aben-ham/.1337/projects/inception/srcs/requirements/wordpress/wordpress/:/var/www/html -e FPM_PORT=9000 wordpress:1.0