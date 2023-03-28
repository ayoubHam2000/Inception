FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install sudo -y && \
    apt install mariadb-server -y

RUN apt install vim -y && \
    apt install wget -y && \
    apt install iputils-ping -y && \
    apt install curl -y && \
    apt install procps -y

COPY ./tools/script.sh /tmp
RUN chmod +x /tmp/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

CMD ./tmp/script.sh
