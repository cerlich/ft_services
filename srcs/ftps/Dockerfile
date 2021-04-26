FROM	alpine:3.12

RUN     apk update && apk upgrade && apk add supervisor vsftpd openssl \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN     echo "root:root" | chpasswd
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/L=Kazan/O=42/OU=21/CN=Cerlich' -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key
COPY    ./start.sh .
COPY	./supervisor.conf /etc/supervisord.conf
COPY	./telegraf.conf /etc/telegraf.conf
COPY    ./vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE  21 30021

CMD sh start.sh