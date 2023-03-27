FROM debian:buster

RUN apt update && \
    apt upgrade -y

RUN apt install vim -y && \
    apt install wget -y && \
    apt install iputils-ping -y && \
    apt install curl -y && \
    apt install procps -y

RUN apt install ffmpeg -y

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

RUN apt install nodejs -y
RUN npm install -g nodemon

COPY ./ConverterApp /var/www/ConverterApp
WORKDIR /var/www/ConverterApp/FrontEnd
RUN npm install
WORKDIR /var/www/ConverterApp/BackEnd
RUN npm install
WORKDIR /
COPY ./tools/run.sh /home
RUN chmod +x /home/run.sh

CMD /home/run.sh
