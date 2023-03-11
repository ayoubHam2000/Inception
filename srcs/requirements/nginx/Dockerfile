FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install nginx -y

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
RUN apt install curl -y


COPY ./conf/self-signed.conf /etc/nginx/snippets/
COPY ./conf/ssl-params.conf /etc/nginx/snippets/
COPY ./conf/aben-ham.42.fr.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/aben-ham.42.fr.conf /etc/nginx/sites-enabled/aben-ham.42.fr.conf

CMD nginx -g 'daemon off;'
