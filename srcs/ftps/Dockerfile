FROM	alpine:3.12

RUN     apk update && apk upgrade && apk add supervisor vsftpd openssl \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN     echo "root:root" | chpasswd

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/L=Kazan/O=42/OU=21/CN=Cerlich' -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key

COPY    ./start.sh .
COPY	supervisor.conf /etc/supervisord.conf
COPY	telegraf.conf /etc/telegraf/
COPY	vsftpd.conf /etc/vsftpd/
COPY    ./vsftpd.conf /etc/vsftpd/

EXPOSE  21 30021

CMD sh start.sh

#FROM alpine:3.12
#
#RUN apk update
#RUN apk upgrade
#RUN apk add vsftpd openssl supervisor sudo\
#	telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
#RUN echo "root:scolen" | chpasswd
#
#RUN openssl req -x509 -nodes -days 365 \
#        -newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=scolen/CN=localhost" \
#		-keyout /etc/ssl/private/vsftpd.key \
#		-out /etc/ssl/certs/vsftpd.crt
#
#RUN mkdir -p home/user/
#RUN sudo chmod -R 755 home/user/
#COPY supervisor.conf /etc/supervisord.conf
#COPY telegraf.conf /etc/telegraf/
#COPY vsftpd.conf /etc/vsftpd/
#COPY start.sh .
#
#EXPOSE	21 30021
#RUN chmod +x start.sh
#CMD sh start.sh