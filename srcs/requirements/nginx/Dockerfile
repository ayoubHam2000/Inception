FROM debian

RUN apt update
RUN apt upgrade -y
RUN apt install nginx -y

RUN apt install openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt -subj "/C=MA/ST=BENGUERIR/L=BENGUERIR/O=1337, Inc./OU=IT/CN=aben-ham.42.fr"

RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default
RUN mkdir -p /var/www/aben-ham.42.fr/html
#RUN openssl dhparam -out /etc/nginx/dhparam.pem 4096

RUN apt install vim -y
RUN apt install wget -y
RUN apt install iputils-ping -y
RUN apt install iproute2


COPY ./conf/self-signed.conf /etc/nginx/snippets/
COPY ./conf/ssl-params.conf /etc/nginx/snippets/
COPY ./conf/aben-ham.42.fr /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/aben-ham.42.fr /etc/nginx/sites-enabled/aben-ham.42.fr

CMD service nginx start && /bin/bash

#docker run -it -p 80:80 --name mynginx --rm --network mynetwork -v /Users/aben-ham/.1337/projects/inception/srcs/requirements/wordpress/wordpress/:/var/www/aben-ham.42.fr/html nginx:1.0