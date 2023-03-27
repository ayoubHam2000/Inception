FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install redis-server -y

COPY ./conf/redis.conf /etc/redis/

CMD redis-server --protected-mode no
