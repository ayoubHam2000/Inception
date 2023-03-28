FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install vsftpd -y && \
    apt install curl -y


COPY ./config/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/server_ftp.sh /tmp

CMD bash /tmp/server_ftp.sh
