FROM	alpine:3.12

RUN     apk update && apk upgrade && apk add supervisor vsftpd openssl
RUN     echo "root:root" | chpasswd
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/L=Kazan/O=42/OU=21/CN=Cerlich' -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key
COPY    ./start.sh .
COPY	./supervisor.conf /etc/supervisord.conf
COPY    ./vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE  21 30021

CMD sh start.sh