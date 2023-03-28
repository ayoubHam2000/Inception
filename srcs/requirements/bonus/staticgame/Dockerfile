FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install python3 -y

COPY ./game /var/www/game

CMD python3 -m http.server 8000 --directory /var/www/game
